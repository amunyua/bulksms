<?php

namespace App\Http\Controllers;

use App\Broadcast;
use App\Client;
use App\ClientGroup;
use App\CustomerMessage;
use App\SmsCredit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Session;
use Yajra\Datatables\Facades\Datatables;
use App\Jobs\SendSms;


class BroadCastController extends Controller
{
    private $user;
    private $_request;
    public function __construct()
    {
        $this->middleware('auth');
        $this->user = new Library();
    }

    public function index(){
        if($this->user->getUserRole()== 'SYS_ADMIN'){
            $client_groups = ClientGroup::all();
        }else{
            $client_groups = ClientGroup::where('created_by',$this->user->User()->mf_id)->get();
        }
        return view('broadcasts.index',array(
            'client_groups'=>$client_groups
        ));
    }

    public function loadBroadcasts(){
        if($this->user->getUserRole()== 'SYS_ADMIN'){
            $broadcasts = Broadcast::all();
        }else{
            $broadcasts = Broadcast::where('created_by',$this->user->User()->mf_id)->get();
        }
        return \Yajra\Datatables\Datatables::of($broadcasts)->make(true);
    }

    public function loadComposePage(){
        if($this->user->getUserRole()== 'SYS_ADMIN'){
            $client_groups = ClientGroup::all();
            $individuals = Client::all();
        }else{
            $individuals = Client::where('created_by',$this->user->User()->mf_id)->get();
            $client_groups = ClientGroup::where('created_by',$this->user->User()->mf_id)->get();
        }
        return view('broadcasts.email-compose',array(
            'client_groups'=>$client_groups,
            'individuals'=>$individuals
        ));
    }

    //hundle send message
    public function processBroadcast(Request $request){
        $this->_request = $request;
        $this->validate($request,array(
            'message_body'=>'required',
//            'recipients'=>'required',
//            'client_group'=>'required'
        ));
//        var_dump($_POST);

        if(!empty(Input::get('client_group'))){
        }
        DB::transaction(function (){
            //check broadcast type
            if(Input::get('client_group') == 'individuals'){
                $this->validate($this->_request,array(
                    'individual_recipients'=>'required'
                ));
                $message_type = 'individuals';
                $all_recipients = Input::get('individual_recipients');
                $message_count = count(Input::get('individual_recipients'));
                $customer_to_message = $all_recipients;
            }else{
                $this->validate($this->_request,array(
                    'group_recipients'=>'required'
                ));
                $message_type = 'client-groups';
                $all_recipients = Input::get('group_recipients');
                $message_count = 0;
                $customer_to_message = array();
                foreach (Input::get('group_recipients') as $group){
                    $clients = Client::where('client_group',$group)->get();
                    $message_count = + count($clients);
                    if(count($clients)){
                        foreach ($clients as $client){
                            $customer_to_message[] = $client->id;
                        }
                    }
                }
            }

            //check whether the client has enough credits to complete the request
            $credits = SmsCredit::where('mf_id',$this->user->user()->mf_id)->get();
            if(count($credits)){
//                    return true;
                if ($credits[0]->remaining_sms == 0){
//                                            print_r($credits);die;
                    Session::flash('failed','Sorry, You don\'t have sufficient credits to send sms\' s, your current balance is (0) please contact Alex (0715862938) ' );
                    return false;
                }
//                var_dump( $credits[0]->remaining_sms);die;
                if($credits[0]->remaining_sms < $message_count){
                    $credit_message = " Although Some messages were not sent due to lack of sufficient credits. You chose to send to ( ".$message_count." ) recipients while you had ( ".$credits[0]->remaining_sms." ) credits remaining. Please contact Alex (0715 862 938)";
                }else{
                    $credit_message = '';
                }
            }else{
                Session::flash('failed','You don\'t have sufficient credits to send sms\'s. Please contact Alex( 0715 862938)  ');
                return false;
            }

            $broadcast = new Broadcast();
            $broadcast->message_body = Input::get('message_body');
            $broadcast->created_by = $this->user->user()->mf_id;
            $broadcast->recipients = json_encode($all_recipients);
            $broadcast->message_type = $message_type;
            $broadcast->message_body = Input::get('message_body');
            $broadcast->recipient_count = $message_count;
            $broadcast->estimated_cost = $message_count;
            $broadcast->save();
            $broadcast_id = $broadcast->id;
//                print_r($customer_to_message);die;
            foreach ($customer_to_message as $customer){
                $customer_message = new CustomerMessage();
                $customer_message->message_id = $broadcast_id;
                $customer_message->isSent = false;
                $customer_message->isDelivered = false;
                $customer_message->client_id = $customer;
                $customer_message->save();
            }
            $this->sendMessage($customer_to_message,Input::get('message_body'),'VoomSms',$message_count,$credits[0]->remaining_sms);
            Session::flash('success','The broadcast Has been sent'.$credit_message);
        });
        return redirect('broadcasts');
    }

    public function sendMessage($customer_to_message, $message_body, $from, $message_count, $remaining_sms){
        $count = $remaining_sms;
        foreach($customer_to_message as $customer){
            $client_pnumber = Client::find($customer)->phone_number;
            if($count > 0 == true){

                $this->dispatch(new SendSMS($client_pnumber,$message_body,$from));
                Log::info('dispatched');
                $count = $count - 1;
            }

        }
//        echo $count;
        $sms_credits = SmsCredit::where('mf_id',$this->user->user()->mf_id)->first();
        $sms_credits_u = SmsCredit::find($sms_credits->id);
        $sms_credits_u->remaining_sms = $count;
        $sms_credits_u->save();
//         die;

    }

    public function messageList(){
        return view('broadcasts.email-list');
    }



}
