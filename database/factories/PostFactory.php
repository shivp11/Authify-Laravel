<?php

namespace Database\Factories;
use Illuminate\Database\Eloquent\Factories\Factory;

class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'post_author' => $this->faker->text(10),
            'post_title' => $this->faker->text(35),
            'post_status'=> 'Pending',
            'post_image'=> 'default-post.jpg',
            'post_content' => $this->faker->text(150),
        ];
    }
}
