<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class GiftControllerTest extends TestCase
{
    use RefreshDatabase;
    /**
     * A basic feature test example.
     * @test
     * @return void
     */
    public function all()
    {
        $response = $this->get('/api/v1/gifts');
        $response->assertStatus(200);
    }

    /**
     * @test
     */
    public function single()
    {
        $response = $this->get('/api/v1/gifts/1');
        $response->assertStatus(200);
    }

    /**
     * @test
     */
    public function update()
    {
        $response = $this->get('/api/v1/gifts/20?name=Keyboard&categories=["pc"]');
        $response->assertStatus(200);
    }
    /**
     * @test
     */
    public function create()
    {
        $response = $this->get('/api/v1/gifts/?name=Ball&categories=["pc"]');
        $response->assertStatus(200);
    }
    /**
     * @test
     */
    public function create_fail()
    {
        $response = $this->get('/api/v1/gifts/?categories=["pc"]');
        $response->assertStatus(200);
    }
}
