<?php

namespace App\Http\Controllers;

use App\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class Library extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function getUserName(){
        return Auth::user()->name;
    }
    public function user(){
        return Auth::user();
    }

    public function getUserRole(){
        $role_id = $this->user()->user_role;
        return $role_code = Role::find($role_id)->role_code;
    }

}
