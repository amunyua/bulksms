<?php

namespace App\Http\Controllers;

use App\Jobs\SendSms;
use App\Journal;
use App\Sms;
use App\SmsCredit;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Yajra\Datatables\Datatables;

class SmsCreditController extends Controller
{
    public function index(){
        $sms = SmsCredit::all();
        return view('SmsCredits.smscredits',array(
            'credits'=>$sms
        ));
    }

    public function mastersSmsIndex(){

        return view('SmsCredits.master_sms');
    }

    public function loadSmsBundle(){
        $bundle = Sms::all();
        return Datatables::of($bundle)->make(true);
    }

    public function updateMasterSms(Request $request){
        $validate = array(
          'number_of_sms'=>'required'
        );
        $this->validate($request,$validate);

        DB::transaction(function (){
            $available = Sms::first()->bundle;
            if($available != null){
                $new_number = $available + Input::get('number_of_sms');
            }else{
                $new_number = Input::get('number_of_sms');
            }
           $master_sms = Sms::first();
           $master_sms->bundle = $new_number;
           $master_sms->save();

           $journal = new Journal();
           $journal->particulars = 'Bought master sms';
           $journal->quantity = Input::get('number_of_sms');
           $journal->amount = Input::get('number_of_sms')* 0.8;
           $journal->created_by = $this->user()->mf_id;
           try{
               $journal->save();
               Session::flash('success','The sms bundles have been updated');
           }catch (QueryException $e){
               $this->handleException2($e);
           }

        });

        return redirect()->back();
    }

//    public function loadClientSmsBundles(){
//        return Datatables::of(SmsCredit::all())
//            ->editColumn('mf_id','
//            @if(!empty($mf_id))
//                <?php $user = App\Masterfile::find($mf_id);
//                 echo $user->surname." ".$user->firstname." ".$user->middlename;
//
//
//                    @endif
//            ')
//            ->editColumn('purchase_sms','
//            @if(!empty($purchase_sms))
//            {{<a href="#purchase-sms" data-toggle="modal" purchase-id="" class="btn btn-success"><i class="fa fa-money"> Purchase Sms</i></a>
//            @endif
//            ')
//            ->make(true);
//    }


    public function purchaseSmsClient(Request $request){
        $this->validate($request,array(
            'sms_quantity'=>'required',
            'credit_id'=>'required'
        ));

        $available_master_sms = Sms::first()->bundle;
        if ($request->sms_quantity > $available_master_sms){
            Session::flash('warning','You don\'t have enough credits to perform this transaction, The remaining sms are ('.$available_master_sms.')');
            return redirect('sms-credits');
        }else{
            DB::transaction(function (){
                // update the client sms
               $sms_credits = SmsCredit::find(Input::get('credit_id'));
               $new_remaining_balance = $sms_credits->remaining_sms + Input::get('sms_quantity');
               $sms_credits->remaining_sms = $new_remaining_balance;
               $sms_credits->save();

               //subtract the number of sms from the master sms
                $master_sms = Sms::first();
                $new_available_master = $master_sms->bundle - Input::get('sms_quantity');
                $master_sms->bundle = $new_available_master;
                $master_sms->save();

                // save the record to journals

                Session::flash('success','The sms purchase transaction has been recorded, remaining sms are ('.$new_available_master.')');
                return redirect('sms-credits');
            });
        }
        Session::flash('error','Encountered an error');
        return redirect('sms-credits');
    }
    public function sendSms(){
        echo 'here';
        $member = '254715862938';
        $message = 'This is a test message that will be queued';
        $job = (new SendSMS($member, $message))->delay(60);
        $this->dispatch($job);

    }
}
