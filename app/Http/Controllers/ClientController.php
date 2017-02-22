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
            $client->created_by = $this->user()->mf_id;

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
            return Datatables::of(Client::where('created_by', $this->user()->mf_id)->get())->make(true);
        }else{
            return Datatables::of($clients)->make(true);
        }
    }

    public function getGroups(){
        return view('client.client_groups');
    }

    public function getClientGroups(){

        if($this->user->getUserRole() != 'SYS_ADMIN') {
            $groups = ClientGroup::where('created_by', $this->user()->mf_id)->get();
        }else{
            $groups = ClientGroup::all();
        }
        return Datatables::of($groups)
            ->editColumn('status','
            @if($status == 1)
                {{ "Active" }}
                @else
                {{ "Inactive"}}
                
                @endif
            ')

            ->make(true);
    }

    public function storeClientGroup(Request $request){
        $this->validate($request,array(
           'group_name'=>'required'
        ));

        $results = ClientGroup::where([['group_name',$request->group_name],['created_by',$this->user()->mf_id]])->get();
        if(count($results)>0){
            Session::flash('failed','A Client group with the name already exists');
        }else{
            $client_g = new ClientGroup();
            $client_g->group_name = $request->group_name;
            $client_g->status = true;
            $client_g->created_by = $this->user()->mf_id;
            try{
                $client_g->save();
                Session::flash('success','Client Group '.$request->group_name.' has been created');
            }catch (QueryException $e){
                $this->handleException2($e);
            }

            return redirect('client-groups');
        }
    }
}
