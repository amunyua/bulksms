<?php

namespace App\Http\Controllers;

use App\Client;
use App\ClientGroup;
use Illuminate\Database\QueryException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;
use Yajra\Datatables\Datatables;

class ClientController extends Controller
{
    private $user;
    public function __construct()
    {
        $this->middleware('auth');
        $this->user = new Library();
    }
    public function user(){
        return $this->user->user();
    }

    public function Index(){
        return view('client.add_client',array(
            'client_groups'=> ClientGroup::where([['status',1], ['created_by',$this->user()->mf_id]])->get()
        ));
    }

    public function storeClient(Request $request){
        $validate = array(
            'phone_number'=>'required'
        );

        $this->validate($request, $validate);
        //check whether phone number exists
        $result = Client::where([['phone_number',$request->phone_number],['created_by',$this->user()->mf_id]])->first();
        if(count($result)){
            Session::flash('warning','The phone number ( '.$request->phone_number.') already exists');
        }else {
            $client = new Client();
            $client->full_name = $request->full_name;
            $client->phone_number = $request->phone_number;
            $client->created_by = $this->user()->mf_id;
            $client->status = true;
            $client->client_group = $request->client_group;
            try {
                $client->save();
                Session::flash('success', 'Client has been added');

            } catch (QueryException $e) {
                $this->handleException2($e);
            }
        }

        return redirect()->back();
    }

    public function getClients(){
        $clients = Client::all();
        if($this->user->getUserRole() != 'SYS_ADMIN') {
            return Datatables::of(Client::where(['created_by', $this->user()->mf_id])->get())->make(true);
        }else{
            return Datatables::of($clients)->make(true);
        }
    }
}
