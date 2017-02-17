<?php

namespace App\Http\Controllers;

use App\Contact;
use App\ContactTypes;
use App\County;
use App\Masterfile;
use App\Role;
use App\Form;
use App\RoleUser;
use App\SmsCredit;
use App\Stream;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Session;
use Yajra\Datatables\Datatables;
use App\User;

class MasterfileController extends Controller
{

    public function __construct(){
        $this->middleware('auth');
    }

    public function index(){

//        $streams = Stream::where('stream_status', 1)->get();
       $user_roles = Role::all();

        return view('registration.index', array(
            'user_roles' => $user_roles
        ));
    }

    public function storeMasterfile(Request $request){
//        var_dump($_POST);die;
        $rules = array(
            'role' => 'required',
//            'id_no' => 'required|max:8|unique:masterfiles,id_no',
            'firstname' => 'required',
            'surname' => 'required',
            'gender' => 'required',
//            'phone_number'=>'required',
//            'email'=>'required|unique:contacts,email'
//            'regdate' => 'required'
        );
        $this->validate($request, $rules);

        DB::transaction(function(){
//            $role = Role::where('role_code', Input::get('role'))->first();

            // create registration
            if(!empty(Input::get('depends_on'))){
                $depends_on = Input::get('depends_on');
            }else{
                $depends_on = 0;
            }
            if(Input::get('role') != 'Staff'){
                $b_role = Input::get('role');
            }else{
                $b_role = Input::get('business_role');
            }
                $reg = new Masterfile();
                $reg->surname = Input::get('surname');
                $reg->firstname = Input::get('firstname');
                $reg->middlename = Input::get('middlename');
                $reg->id_no = Input::get('id_no');
                $reg->user_role = Input::get('role');
                $reg->b_role = $b_role;
                $reg->depends_on = $depends_on;

                $reg->save();
                $reg_id = $reg->id;

                 // create contact
                $contact = new Contact();
                $contact->city = Input::get('city');
                $contact->postal_address =  Input::get('postal_address');
                $contact->physical_address =  Input::get('physical_address');
                $contact->masterfile_id =  $reg_id;
                $contact->phone_number =  Input::get('phone_number');
                $contact->email =  Input::get('email');
//                $contact->mobile_no =  Input::get('mobile_no');
                $contact->save();

                $sms_credits = new SmsCredit();
                $sms_credits->mf_id = $reg_id;
                $sms_credits->initial_sms = 0;
                $sms_credits->remaining_sms = 0;
                $sms_credits->save();

            $role = Role::where('role_name','Client')->first();
            if(Input::get('role')== $role->role_name) {

                // create user login account
                $password = bcrypt(123456);
                $login = new User();
                $login->mf_id = $reg_id;
                $login->email =Input::get('email');
                $login->name = Input::get('surname').' '.Input::get('firstname');
                $login->password = $password;
                $login->status = 1;
                $login->user_role = $role->id;
                $login->save();
                $user_id = $login->id;

                $role_user = new RoleUser();
                $role_user->role_id = $role->id;
                $role_user->user_id = $user_id;
                $role_user->save();
            }
            Session::flash('success','The masterFile has been created');
        });
        return redirect('all-masterfiles');
    }


    public function getAllMasterfiles(){
        $all_masterfiles = Masterfile::all();
        return view('masterfile.all-masterfiles',array(
            'all_masterfiles'=>$all_masterfiles
        ));
    }

    public function loadMasterFiles(){
        $masterfiles = DB::table('all_masterfiles')->get();
        return Datatables::of($masterfiles)->make(true);
    }

//    public function deleteMasterfile($id){
//        $id = Masterfile::find($id);
//        if($id->delete()) {
//            Session::flash('success' . 'The masterfile has been deleted');
//            return redirect('all-masterfiles');
//        }else{
//            Session::flash('warning','Cannot delete this masterfile for it is being referenced somewhere else');
//        }
//    }

    public function deleteMasterfile($id){
        try {
            Masterfile::destroy($id);
            Session::flash('success','The masterfile has been deleted');
        } catch (\Illuminate\Database\QueryException $e) {
            $message = $this->handleException($e);
            Session::flash('failed', $message);
            return redirect()->back();
        }
    }
}
