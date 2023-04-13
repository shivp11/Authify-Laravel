<?php

namespace App\Http\Controllers\Api;

use App\Models\Post;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    //
    public function showpost(Request $req)
    {
        return Post::all();
    }

    public function showpostsSubscriber(Request $req)
    {
        return Post::all();
    }

    public function addPost(Request $req)
    {
        $req->validate([
            'post_title' => 'required',
            'post_author' => 'required',
            'post_content' => 'required',
        ]);

        $post = new post();
        $post->post_title = $req->post_title;
        $post->post_author = $req->post_author;
        $post->post_status = $req->post_status;
        $post->post_content = $req->post_content;
        $post->post_date = Carbon::now();
        if ($req->post_image) {
            $image = $req->post_image;
            $img_name = $image->getClientOriginalName();
            $image->move(public_path('images/post/'), $img_name);
            $post->post_image = $img_name;
        } else {
            $defaultImg = 'default-post.jpg';
            $post->post_image = $defaultImg;
        }
        if ($post->save()) {
            return response([
                'data' => $post,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Post Successfull Created!!!',
            ], 200);
        } else {
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went wrong!!',
            ], 402);
        }
    }

    public function addPostSubscriber(Request $req)
    {
        $req->validate([
            'post_title' => 'required',
            'post_author' => 'required',
            'post_content' => 'required',
        ]);

        $post = new post();
        $post->post_title = $req->post_title;
        $post->post_author = $req->post_author;
        $post->post_status = $req->post_status;
        $post->post_content = $req->post_content;
        $post->post_date = Carbon::now();
        if ($req->post_image) {
            $image = $req->post_image;
            $img_name = $image->getClientOriginalName();
            $image->move(public_path('images/post/'), $img_name);
            $post->post_image = $img_name;
        } else {
            $defaultImg = 'default-post.jpg';
            $post->post_image = $defaultImg;
        }
        if ($post->save()) {
            return response([
                'data' => $post,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Post Successfull Created!!!',
            ], 200);
        } else {
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went wrong!!',
            ], 402);
        }
    }

    function updatePost($id, Request $req)
    {
        // print json_encode($req->all());exit;
        $post = post::find($id);
        $post->post_title = $req->post_title;
        $post->post_author = $req->post_author;
        $post->post_status = $req->post_status;
        $post->post_content = $req->post_content;
        $post->post_date = Carbon::now();
        if ($req->hasfile('post_image')) {
            $image = $req->post_image;
            $img_name = $image->getClientOriginalName();
            $image->move(public_path('images/post/'), $img_name);
            $post->post_image = $img_name;
        }
        $result = $post->save();
        if ($result) {
            return response([
                'data' => $post,
                'status' => 'Success',
                'code'=> 200,
                'message' => 'Post Successfull Updated!!!',
            ], 200);
        } else {
            return response([
                'status' => 'Failed',
                'code'=> 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    function deletePost($id, Request $request)
    {
        $post = post::where('id', '=', $id)->delete();
        return response([
            'status' => 'Success',
            'code'=> 200,
            'message' => 'Post Successfully Deleted !!',
        ], 200);
    }

    function deleteSelectedPosts(Request $request)
    {
        try {
            $DeletePost = post::whereIn('id', $request->id)->delete();
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Posts Successfully Deleted !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong. Please Try Again..!!',
            ], 402);
        }
    }

    function statusSelectedPosts(Request $request)
    {
        $request->validate([
            'post_status' => 'required',
        ]);
        try {
            $Status = post::whereIn('id', $request->id)->update(['post_status'=> $request->post_status]);
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Status Successfully Changed !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong. Please Try Again..!!',
            ], 402);
        }
    }

    function postByid($id, Request $request)
    {
        try {
            $postByid = post::where('id', $id)->first();
            return response([
                'data' => $postByid,
                'status' => 'Success',
                'code' => 200,
                'message' => 'Status Successfully Changed !!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'id' => $id,
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong. Please Try Again..!!',
            ], 402);
        }
    }
}
