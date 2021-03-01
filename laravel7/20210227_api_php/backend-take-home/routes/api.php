<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Gift;
use App\Http\Controllers\GiftController;
use App\Employee;
use App\Http\Controllers\EmployeeController;

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
// thinking Employees REST-api
// CRUD is basically
// 1. GET       get all employees    /api/employees
// 2. POST      create a employees   /api/employees
// 3. GET       get a single         /api/employees/:id
// 4. PUT/PATCH update a single      /api/employees/:id

// thinking Gifts
// CRUD is basically
// 1. GET       get all gifts   /api/gifts
// 2. POST      create a gifts  /api/gifts
// 3. GET       get a single    /api/gifts/:id
// 4. PUT/PATCH update a single /api/gifts/:id

// thinking to create a resources Employees Gifts in laravel
// 1. create the db
// 2. create migrations
// 3. create model
// 4. create a service Eloquent ORM
// 5. create a controller to get info from the db
// 6. return that info


// hacer Gifts
// CRUD is basically



// hacer Employees REST-api
Route::get('/ping', function() {
    return ['message' => 'pong'];
});

Route::prefix('v1')->group(function() {
    // 1. GET       get all gifts   /api/gifts
    Route::Get('/gifts', 'App\Http\Controllers\GiftController@index');
    // 2. POST      create a gifts  /api/gifts
    Route::Post('/gifts', 'App\Http\Controllers\GiftController@store');
    // 3. GET       get a single    /api/gifts/:id
    Route::Get('/gifts/{id}', 'App\Http\Controllers\GiftController@show');
    // 4. PUT/PATCH update a single /api/gifts/:id
    Route::Put('/gifts/{id}', 'App\Http\Controllers\GiftController@update');
    // Route::Delete('/gifts/{id}', 'Gift@Controller@destroy');

// 1. GET       get all employees    /api/employees
    Route::get('/employees','App\Http\Controllers\EmployeeController@index');
// 2. POST      create a employees   /api/employees
    Route::post('/employees','App\Http\Controllers\EmployeeController@store');
// 3. GET       get a single         /api/employees/:id
    Route::get('/employees/{id}','App\Http\Controllers\EmployeeController@show');
// 4. PUT/PATCH update a single      /api/employees/:id
    Route::put('/employees/{id}','App\Http\Controllers\EmployeeController@update');
//Route::delete('/employees/{id}','EmployeeController@destroy');

});
// CRUD is basically

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
