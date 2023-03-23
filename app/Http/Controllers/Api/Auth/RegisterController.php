<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class RegisterController extends Controller
{
    //
    public function register(Request $request){
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|unique:users',
            'password' => 'required|confirmed',
        ]);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        return response(['message' => 'User Successfully Register.'], 200);
    }

    public function updateProfile($id, Request $request){
        $this->validate($request, [
            'name' => 'required',
        ]);
        $user = User::find($id);
        $user->name = $request->name;
        $user->save();
        return response(['message' => $user], 200);
    }
}
