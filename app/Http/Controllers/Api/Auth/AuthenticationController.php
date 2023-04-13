<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use Nette\Utils\Random;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Throwable;

class AuthenticationController extends Controller
{
    public function users()
    {
        // return User::all();
        return response([
            'data' => User::all(),
            'status' => 'Success',
            'code' => 200,
            'message' => 'UserInfo Get',
        ], 200);
    }

    public function login(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|max:255',
            'password' => 'required'
        ]);
        try {
            $login = $request->only('email', 'password');

            if (!Auth::attempt($login)) {
                return response([
                    'status' => 'Failed',
                    'code' => 401,
                    'message' => 'Invalid login credential!!',
                ], 401);
            }
            /**
             * @var User $user
             */
            $user = Auth::user();
            $token = $user->createToken($user->name);
            session()->put('abc', $user->id);
            $userInfo = ([
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'role' => $user->role,
                'profile' => $user->profile,
                'created_at' => $user->created_at,
                'updated_at' => $user->updated_at,
                'token' => $token->accessToken,
                'token_expires_at' => $token->token->expires_at,
            ]);
            return response([
                'data' => $userInfo,
                'status' => 'Success',
                'code' => 200,
                'message' => 'Successfully logged in as',
            ], 200);
        } catch (Throwable $e) {
            report($e);

            if (!Auth::attempt($login)) {
                return response([
                    'status' => 'Failed',
                    'code' => 401,
                    'message' => 'Something went Wrong!!',
                ], 401);;
            }
        }
    }


    function  user()
    {
        // return Auth::user();
        try {
            return response([
                'data' => Auth::user(),
                'status' => 'Success',
                'code' => 200,
                'message' => 'User Info!!!!',
            ], 200);
        } catch (\Throwable $th) {
            //throw $th;
            return response([
                'status' => 'Failed',
                'code' => 401,
                'message' => 'Something went Wrong!!',
            ], 401);;
        }
    }


    function updateUsers($id, Request $request)
    {
        try {
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
            if ($updateUser->save()) {
                return response([
                    'data' => $updateUser,
                    'status' => 'Success',
                    'code' => 200,
                    'message' => 'User Successfull Updated!!!',
                ], 200);
            }
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    function deleteUser($id, Request $request)
    {
        try {
            $updateUser = User::where('id', $id)->delete();
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'User Successfully Deleted !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    function deleteSelectedUsers(Request $request)
    {
        try {
            $DeleteUser = User::whereIn('id', $request->id)->delete();
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Users Successfully Deleted !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong. Please Try Again..!!',
            ], 402);
        }
    }


    function roleSelectedUsers(Request $request)
    {
        $request->validate([
            'role' => 'required',
        ]);
        try {
            $Status = user::whereIn('id', $request->id)->update(['role' => $request->role]);
            return response([
                'Status' => $request->role,
                'status' => 'Success',
                'code' => 200,
                'message' => 'Role Successfully Changed !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'Status' => $request->role,
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong. Please Try Again..!!',
            ], 402);
        }
    }

    public function addUser(Request $req)
    {
        $req->validate([
            'name' => 'required',
            'role' => 'required',
            'email' => 'required|email|unique:users',
        ]);
        
        try {
            if ($req->name == '' || $req->email == '') {
                return response([
                    'status' => 'Failed',
                    'code' => 402,
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
                'email' => $req->email,
                'password' => $default_password,
                'url' => $loginUrl,
            );

            $user_email = $req->email;
            $user_name = $req->name;
            if ($result) {
                Mail::send('mail.new-author-email-template', $data, function ($message) use ($user_email, $user_name) {
                    $message->from('shivpatel19@gnu.ac.in', 'Larablog');
                    $message->to($user_email, $user_name)
                        ->subject('Account creation');
                });
                return response([
                    'data' => $user,
                    'status' => 'Success',
                    'code' => 200,
                    'message' => 'User Successfull Created!!!',
                ], 200);
            }
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went wrong!!',
            ], 402);
        }
    }

    function image($id, Request $req)
    {
        try {
            $user = User::find($id);
            $image = $req->file;
            $img_name = $image->getClientOriginalName();
            $image->move(public_path('angular/images'), $img_name);
            $user->profile = $img_name;
            if ($user->save()) {
                return response([
                    'data' => $user,
                    'status' => 'Success',
                    'code' => 200,
                    'message' => 'Profile Pic Uploaded!!',
                ], 200);
            }
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }
}
