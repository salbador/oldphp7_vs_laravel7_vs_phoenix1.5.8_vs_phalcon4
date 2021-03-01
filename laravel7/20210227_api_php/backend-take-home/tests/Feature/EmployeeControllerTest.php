<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class EmployeeControllerTest extends TestCase
{
    use RefreshDatabase;
    /**
     * A basic feature test example.
     * @test
     * @return void
     */
    public function all()
    {
        $response = $this->get('/api/v1/employees');
        $response->assertStatus(200);
    }

    /**
     * @test
     */
    public function single()
    {
        $this->withoutExceptionHandling();
        $response = $this->get('/api/v1/employees/1');
        $response->assertStatus(200);
    }
    /**
     * @test
     */
    public function update()
    {
        $response = $this->get('/api/v1/employees/1?name=severin');
        $response->assertStatus(200);
    }
    /**
     * @test
     */
    public function create()
    {
        $response = $this->get('/api/v1/employees?name=pancho&interests=["family","music","food"]');
        $response->assertStatus(200);
    }
    /**
     * @test
     */
    public function create_fails()
    {
        $response = $this->get('/api/v1/employees?interests=["nada"]');
        $response->assertStatus(200);
    }

}
