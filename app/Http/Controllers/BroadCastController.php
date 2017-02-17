<?php

namespace App\Http\Controllers;

use App\Broadcast;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\Facades\Datatables;


class BroadCastController extends Controller
{
    private $user;
    public function __construct()
    {
        $this->middleware('auth');
        $this->user = new Library();
    }



    public function index(){
        return view('broadcasts.index');
    }

    public function loadBroadcasts(){
        if($this->user->getUserRole()== 'SYS_ADMIN'){
            $broadcasts = Broadcast::all();
        }else{
            $broadcasts = Broadcast::where('created_by',$this->user->User()->mf_id)->get();
        }
        return \Yajra\Datatables\Datatables::of($broadcasts)->make(true);
    }
}
