<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class ForgotPasswordController extends Controller
{
    //
    public function forgot(Request $request){
        $this->validate($request,[
            'email' => 'required|email'
        ]);
        $email = $request->email;

        if(User::where('email', $request->email)->doesntExist()){
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Email Does not exists.',
            ], 402);
        }

        $token = Str::random(10);

        DB::table('password_resets')->insert([
            'email' => $request->email,
            'token' => $token,
            'created_at' => now()->addHours(6)
        ]);

        $user = User::where('email', $request->email)->first();
        $data = array(
            'name' => $user->name,
            'name'=>$user->email,
        );

        Mail::send('mail.password_reset', ['token'=>$token, 'user'=>$user], function ($message) use($email){
            $message->to($email);
            $message->subject('Reset Your Password');
        });
        return response([
            'data' => $user,
            'status' => 'Success',
            'code'=> 200,
            'message' => 'Check your email.',
        ], 200);
    }

    public function reset(Request $request){
        $this->validate($request, [
            'token' => 'required|string',
            'password' => 'required|string|confirmed',
        ]);

        $token = $request->token;
        $passwordRest = DB::table('password_resets')->where('token', $token)->first();

        // Verify
        if(!$passwordRest){
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Token Not Found.',
            ], 402);
        }

        // Validate exipire time
        if(!$passwordRest->created_at >= now()){
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Token has expired.',
            ], 402);
        }

        $user = User::where('email', $passwordRest->email)->first();

        if(!$user){
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'User does not exists.',
            ], 402);
        }

        $user->password = Hash::make($request->password);
        $user->save();

        DB::table('password_resets')->where('token', $token)->delete();;

        return response([
            'data' => $user,
            'status' => 'Success',
            'code'=> 200,
            'message' => 'Password Successfully Updated.',
        ], 200);
    }
}
