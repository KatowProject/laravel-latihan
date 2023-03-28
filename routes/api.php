<?php

use App\Http\Controllers\AdminController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

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

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

Route::middleware(['admin.api'])->prefix('admin')->group(function () {
    Route::post('/create-recipe', [AdminController::class, 'create_recipes']);

    Route::post('/register', [AuthController::class, 'register']);
    Route::get('/register', [AdminController::class, 'show_register']);
    Route::get('/register/{id}', [AdminController::class, 'show_register_by_id']);
    Route::put('/register/{id}', [AdminController::class, 'update_register']);
    Route::delete('/register/{id}', [AdminController::class, 'delete_register']);
    Route::get('/activation-account/{id}', [AdminController::class, 'activation_account']);
    Route::get('/deactivation-account/{id}', [AdminController::class, 'deactivation_account']);
});