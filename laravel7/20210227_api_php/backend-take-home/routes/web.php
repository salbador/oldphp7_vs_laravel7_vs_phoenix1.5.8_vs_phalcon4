<?php

use Illuminate\Support\Facades\Route;
use App\Models\Employee;
use App\Models\Gift;
use App\Models\Goft;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
# Como sacar unicos Gifts.json
# cat gifts.json | grep categories | cut -d: -f2 | cuet '"' | cuet '\[' | cuet '\]' | sed 's/,/\n/g' | sort | uniq
# ["botany", "cocktails", "crossfit", "drinking", "eating", "family", "film", "football", "german", "handball", "music", "pets", "photography", "power lifting", "reading", "running", "scifi", "scuba", "sitting comfortably", "skydiving", "techno", "triathlons", "yoga"]

# Como sacar unicos Employees.json
# cat employees.json | grep interests | cut -d: -f2 | cuet '"' | cuet '\[' | cuet '\]' | sed 's/,/\n/g' | sort | uniq
# [ "camping","cocktails","crossfit","drinking","eating","family","football","handball","high end audio","meditation","motorcross","music","music making","pets","photography","power lifting","reading","running","scifi","scuba","sitting comfortably","skydiving","sleeping","techno","triathlons","warhammer","yoga"]

Route::get('/fill-gofts-table', function () {
    $jsonData = (json_decode(file_get_contents(storage_path('data/gifts.json'))));

    foreach ($jsonData as $key => $value) {
        $employee = new Goft();
        $employee->name = $value->name;
        $employee->categories = implode(',', $value->categories);
        $employee->save();
    }
});

Route::get('/fill-employoos-table', function () {
    $jsonData = (json_decode(file_get_contents(storage_path('data/employees.json'))));

    foreach ($jsonData as $key => $value) {
        $employee = new Employee();
        $employee->name = $value->name;
        $employee->interests = json_encode($value->interests);
        $employee->save();
    }
});

Route::get('/fill-gifts-table', function () {
    $jsonData = (json_decode(file_get_contents(storage_path('data/gifts.json'))));

    foreach ($jsonData as $key => $value) {
        $employee = new Gift();
        $employee->name = $value->name;
        $employee->categories = json_encode($value->categories);
        $employee->save();
    }
});

Route::get('/fill-employees-table', function () {
    $jsonData = (json_decode(file_get_contents(storage_path('data/employees.json'))));

    foreach ($jsonData as $key => $value) {
        $employee = new Employee();
        $employee->name = $value->name;
        $employee->interests = json_encode($value->interests);
        $employee->save();
    }
});
