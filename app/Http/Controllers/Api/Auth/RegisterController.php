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
        $defaultImg = 'Profile.jpeg';
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => 'Subscriber',
            'profile' => $defaultImg,
        ]);
        return response([
            'data' => $user,
            'status' => 'Success',
            'code'=> 200,
            'message' => 'User Successfully Register.',
        ], 200);
    }

    public function updateProfile($id, Request $request){
        $user = User::find($id);
        $user->name = $request->name;
        $result = $user->save();
        if($result){
            return response([
                'data' => $user,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Profile Updated!!',
            ], 200);
        }else{
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }
}
