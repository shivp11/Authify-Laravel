<?php

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthenticationController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\Auth\ForgotPasswordController;
use App\Http\Controllers\Api\PostController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return Auth::user();
});

Route::get('/users', function(){
    return User::all();
}); 

Route::group(['namespace'=>'Api\Auth'], function(){
    Route::post('/login', [AuthenticationController::class, 'login']);
    Route::post('/logout', [AuthenticationController::class, 'logout'])->middleware('auth:api');
    Route::post('/register', [RegisterController::class, 'register']);
    Route::post('/image/{id}', [AuthenticationController::class, 'image']);
    Route::post('/updateProfile/{id}', [RegisterController::class, 'updateProfile']);
    Route::post('/forgot', [ForgotPasswordController::class, 'forgot']);
    Route::post('/reset', [ForgotPasswordController::class, 'reset']);
    Route::post('/updateUsers/{id}', [AuthenticationController::class, 'updateUsers']);
    Route::post('/deleteUser/{id}', [AuthenticationController::class, 'deleteUser']);
    Route::post('/addUser', [AuthenticationController::class, 'addUser']);
});

Route::group(['namespace'=>'Api\Auth'], function(){
    Route::get('/posts', [PostController::class, 'showpost']);
    Route::post('/addPost', [PostController::class, 'addPost']);
    Route::post('/updatePost/{id}', [PostController::class, 'updatePost']);
    Route::post('/deletePost/{id}', [PostController::class, 'deletePost']);
});
