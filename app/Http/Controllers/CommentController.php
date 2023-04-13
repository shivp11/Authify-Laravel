<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\User;
use App\Models\comment;
use App\Models\postdislike;
use App\Models\postlike;
use App\Models\replycomment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CommentController extends Controller
{
    //
    function addComment(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'post_id' => 'required',
            'comment_content' => 'required',
        ]);
        try {
            $comment = new comment();
            $comment->user_id = $request->user_id;
            $comment->post_id = $request->post_id;
            $comment->comment_content = $request->comment_content;
            $comment->created_at = now();
            $comment->save();
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Commented!!!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }
    function addReplyComment(Request $request)
    {
        $request->validate([
            'user_id' => 'required',
            'post_id' => 'required',
            'comment_id' => 'required',
            'comment_content' => 'required',
        ]);
        try {
            $comment = new replycomment();
            $comment->user_id = $request->user_id;
            $comment->post_id = $request->post_id;
            $comment->comment_id = $request->comment_id;
            $comment->comment_content = $request->comment_content;
            $comment->created_at = now();
            $comment->save();
            return response([
                'status' => 'Success',
                'code' => 200,
                'message' => 'Commented!!!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    function getComment($id, Request $request)
    {
        try {
            $comment = Comment::where('post_id', $id)
                ->with('user:id,name,profile')
                ->select('id', 'user_id', 'post_id', 'comment_content')
                ->get();
            return response([
                'data' => $comment,
                'status' => 'Success',
                'code' => 200,
                'message' => 'Commented!!!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }
    function getReplyComment($id, Request $request)
    {
        // print_r($comment);
        // exit;
        try {
            $comment = DB::table('replycomments')
                ->join('users', 'replycomments.user_id', '=', 'users.id')
                ->join('comments', 'replycomments.comment_id', '=', 'comments.id')
                ->select('replycomments.id', 'replycomments.user_id', 'replycomments.post_id', 'replycomments.comment_content', 'users.name', 'users.profile', 'users.id', 'comments.id as comment_id')
                ->where('replycomments.post_id', '=', $id)
                ->get();
            return response([
                'data' => $comment,
                'status' => 'Success',
                'code' => 200,
                'message' => 'Commented!!!',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'code' => 402,
                'message' => 'Something went Wrong!!',
            ], 402);
        }
    }

    public function like(Request $req)
    {
        $user = postlike::where('like_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->get();
        if ($user->isEmpty()) {
            $userInDislike = postdislike::where('dislike_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->get();
            if ($userInDislike->isEmpty()) {
                $like = new postlike();
                $like->like_post_id = $req->post_id;
                $like->user_id = $req->user_id;
                $result = $like->save();
                return response([
                    'data' => $like,
                    'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                    'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                    'status' => 'Success',
                    'code' => 200,
                    'message' => 'liked!!!',
                ], 200);
            } else {
                $userInDislike = postdislike::where('dislike_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->delete();
                $like = new postlike();
                $like->like_post_id = $req->post_id;
                $like->user_id = $req->user_id;
                $result = $like->save();
                return response([
                    'data' => $like,
                    'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                    'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                    'status' => 'Success',
                    'code' => 200,
                    'message' => 'liked!!!',
                ], 200);
            }
        } else {
            return response([
                'status' => 'Failed',
                'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                'code' => 402,
                'message' => 'You already liked!!!',
            ], 200);
        }
    }

    public function dislike(Request $req)
    {
        try {
            $user = postdislike::where('dislike_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->get();
            if ($user->isEmpty()) {
                $userInlike = postlike::where('like_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->get();
                if ($userInlike->isEmpty()) {
                    $dislike = new postdislike();
                    $dislike->dislike_post_id = $req->post_id;
                    $dislike->user_id = $req->user_id;
                    $result = $dislike->save();
                    return response([
                        'data' => $dislike,
                        'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                        'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                        'status' => 'Success',
                        'code' => 200,
                        'message' => 'Unliked!!!',
                    ], 200);
                } else {
                    $userInlike = postlike::where('like_post_id', '=', $req->post_id)->where('user_id', '=', $req->user_id)->delete();
                    $dislike = new postdislike();
                    $dislike->dislike_post_id = $req->post_id;
                    $dislike->user_id = $req->user_id;
                    $result = $dislike->save();
                    return response([
                        'data' => $dislike,
                        'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                        'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                        'status' => 'Success',
                        'code' => 200,
                        'message' => 'Unliked!!!',
                    ], 200);
                }
            } else {
                return response([
                    'status' => 'Failed',
                    'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                    'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                    'code' => 402,
                    'message' => 'You already disliked!!!',
                ], 200);
            }
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                'code' => 402,
                'message' => 'Something Went worng please try again!!! ',
            ], 200);
        }
    }

    function AllCount(Request $req){
        try {
            return response([
                'status' => 'Success',
                'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                'code' => 200,
                'message' => 'Get Count',
            ], 200);
        } catch (\Throwable $th) {
            return response([
                'status' => 'Failed',
                'likecount' => postlike::where('like_post_id', '=', $req->post_id)->count(),
                'dislikecount' => postdislike::where('dislike_post_id', '=', $req->post_id)->count(),
                'code' => 402,
                'message' => 'Something Went worng please try again!!! ',
            ], 200);
        }
    }
}
