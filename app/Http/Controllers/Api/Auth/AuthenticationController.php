<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Nette\Utils\Random;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class AuthenticationController extends Controller
{
    //
    public function login(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|max:255',
            'password' => 'required'
        ]);

        $login = $request->only('email', 'password');

        if (!Auth::attempt($login)) {
        return response([
                'status' => 'Failed',
                'code'=> 401,
                'message' => 'Invalid login credential!!',
            ], 401);;
        }
        /**
         * @var User $user
         */
        $user = Auth::user();
        $token = $user->createToken($user->name);

        $userInfo = ([
            'id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'created_at' => $user->created_at,
            'updated_at' => $user->updated_at,
            'token' => $token->accessToken,
            'token_expires_at' => $token->token->expires_at,
        ]);
        return response([
            'data' => $userInfo,
            'status' => 'Success',
            'code'=> 200,
            'message' => 'Successfully logged in as',
        ], 200);
    }

    public function logout(Request $request)
    {
        $this->validate($request, [
            'allDevice' => 'required'
        ]);
        /**
         * @var user $user
         */
        $user = Auth::user();
        if ($request->allDevice) {
            $user->tokens->each(function ($token) {
                $token->delete();
            });
            return response([
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Log out from all device !!',
            ], 200);
        }

        $userToken = $user->token();
        $userToken->delete();
        return response([
            'status' => 'Success',
            'code'=> 200,
            'message' => 'Logout Successful !!',
        ], 200);
    }

    function updateUsers($id,Request $request){
        $updateUser = User::find($id);
        $updateUser->name = $request->name;
        $updateUser->email = $request->email;
        $updateUser->role = $request->role;
        if ($request->hasfile('profile')) {
            $image = $request->profile;
            $img_name = $image->getClientOriginalName();
            $image->move(public_path('angular/images'), $img_name);
            $updateUser->profile = $img_name;
        }
        if($updateUser->save()){
            return response([
                'data' => $updateUser,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'User Successfull Updated!!!',
            ], 200);
        }else{
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    function deleteUser($id,Request $request){
        $updateUser = User::where('id',$id)->delete();
        return response([
            'status' => 'Success',
            'code'=> 200,
            'message' => 'User Successfully Deleted !!',
        ], 200);
    }

    public function addUser(Request $req)
        {    
        $req->validate([
            'name'=>'required',
            'role'=>'required',
            'email'=>'required|email|unique:users',
        ]);
            
        if($req->name == '' || $req->email == ''){
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
          $default_password = Random::generate(8);

          $user = new User();
          $user->name = $req->name;
          $user->email = $req->email;
          $user->role = $req->role;
          $defaultImg = 'Profile.jpeg';
          $user->profile = $defaultImg; 
          $user->password = Hash::make($default_password);
          $result = $user->save();

          $loginUrl = "http://localhost:4200/login";
          $data = array(
             'name' => $req->name,
             'email'=>$req->email,
             'password'=> $default_password,
             'url'=> $loginUrl,
          );

          $user_email = $req->email;
          $user_name = $req->name;
          if($result){
            Mail::send('mail.new-author-email-template', $data, function($message) use ($user_email, $user_name){
                 $message->from('shivpatel19@gnu.ac.in','Larablog');
                 $message->to($user_email,$user_name)
                         ->subject('Account creation');
            });
                return response([
                    'data' => $user,
                    'status' => 'Success',
                    'code'=> 200,
                    'message' => 'User Successfull Created!!!',
                ], 200);
            }else{
                return response([
                    'status' => 'Failed',
                    'code'=> 402,
                    'message' => 'Something went wrong!!',
                ], 402);
            }
    }

    function image($id,Request $req){
        $user = User::find($id);
        $image = $req->file;
        $img_name = $image->getClientOriginalName();
        $image->move(public_path('angular/images'),$img_name);
        $user->profile = $img_name;
        if($user->save()){
            return response([
                'data' => $user,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Profile Pic Uploaded!!',
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
