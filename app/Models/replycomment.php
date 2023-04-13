<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class replycomment extends Model
{
    use HasFactory;
    public $timestamps = false;
    protected $fillable = [
        'comment_content',
        'post_id',
        'comment_id',
        'user_id',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function post()
    {
        return $this->belongsTo(Post::class);
    }
    public function comment()
    {
        return $this->belongsTo(comment::class);
    }
}
