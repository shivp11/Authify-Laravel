<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthenticationController;
use App\Http\Controllers\Api\Auth\LogoutController;
use App\Http\Controllers\Api\Auth\RegisterController;
use App\Http\Controllers\Api\Auth\ForgotPasswordController;
use App\Http\Controllers\Api\PostController;
use App\Http\Controllers\CommentController;


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

Route::middleware('auth:api')->get('/user', [AuthenticationController::class, 'user']);

Route::group(['namespace'=>'Api\Auth'], function(){
    Route::post('/login', [AuthenticationController::class, 'login']);
    Route::post('/logout', [LogoutController::class, 'logout'])->middleware('auth:api');
    Route::post('/register', [RegisterController::class, 'register']);
    Route::post('/forgot', [ForgotPasswordController::class, 'forgot']);
    Route::post('/reset', [ForgotPasswordController::class, 'reset']);
    Route::post('/image/{id}', [AuthenticationController::class, 'image']);
    Route::post('/updateProfile/{id}', [RegisterController::class, 'updateProfile']);
    Route::post('/addPostSubscriber', [PostController::class, 'addPostSubscriber']);
    Route::get('/Subscriberposts', [PostController::class, 'showpostsSubscriber']);
});

Route::group(['middleware'=>['auth:api', 'isAdmin']], function(){
    Route::get('/posts', [PostController::class, 'showpost']);
    Route::post('/addPost', [PostController::class, 'addPost']);
    Route::post('/updatePost/{id}', [PostController::class, 'updatePost']);
    Route::post('/deletePost/{id}', [PostController::class, 'deletePost']);
    Route::post('/deleteSelectedPosts', [PostController::class, 'deleteSelectedPosts']);
    Route::post('/statusSelectedPosts', [PostController::class, 'statusSelectedPosts']);
});

Route::group(['middleware'=>['auth:api', 'isAdmin']], function(){
    Route::get('/users', [AuthenticationController::class, 'users']);
    Route::post('/addUser', [AuthenticationController::class, 'addUser']);
    Route::post('/updateUsers/{id}', [AuthenticationController::class, 'updateUsers']);
    Route::post('/deleteUser/{id}', [AuthenticationController::class, 'deleteUser']);
    Route::post('/deleteSelectedUsers', [AuthenticationController::class, 'deleteSelectedUsers']);
    Route::post('/roleSelectedUsers', [AuthenticationController::class, 'roleSelectedUsers']);
});

Route::post('/postByid/{id}', [PostController::class, 'postByid']);
Route::post('/addComment', [CommentController::class, 'addComment']);
Route::post('/addReplyComment', [CommentController::class, 'addReplyComment']);
Route::get('/getComment/{id}', [CommentController::class, 'getComment']);
Route::get('/getReplyComment/{id}', [CommentController::class, 'getReplyComment']);
Route::post('/like', [CommentController::class, 'like']);
Route::post('/dislike', [CommentController::class, 'dislike']);
Route::post('/AllCount', [CommentController::class, 'AllCount']);