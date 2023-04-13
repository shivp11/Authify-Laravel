<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LogoutController extends Controller
{
    //
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
                'code' => 200,
                'message' => 'Log out from all device !!',
            ], 200);
        }

        $userToken = $user->token();
        $userToken->delete();
        return response([
            'status' => 'Success',
            'code' => 200,
            'message' => 'Logout Successful !!',
        ], 200);
    }
}
