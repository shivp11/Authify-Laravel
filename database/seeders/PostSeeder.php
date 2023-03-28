<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Post;
use Faker\Factory;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Post::factory(5)->create();
        // $faker = Factory::create();
        // $post = new post();
        // $post->post_title = $faker->post_title;
        // $post->post_author = $faker->post_author;
        // $post->post_status = "Pending";
        // $post->post_content = $faker->post_content;
        // $post->post_date = now();
        // $defaultImg = 'default-post.jpg';
        // $post->post_image = $defaultImg;
        // $post->save();

    }
}
