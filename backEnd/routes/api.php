<?php

use App\Http\Controllers\API\AuthController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\mainController;
use App\Http\Middleware\jwtmiddle;
/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::prefix('auth')->group( function ($routes) {
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::post('/refresh', [AuthController::class, 'refresh']);
    Route::get('/user-profile', [AuthController::class, 'userProfile']);
});



Route::middleware(['auth:api'])->group(function (){

    Route::post('WishListInsertion',[mainController::class,'WishListInsertion']);
    Route::get('getWish/{user_id}',[ mainController::class,'getWishlist']);
    Route::get('AllCategories',[mainController::class,'AllCategories']);
    Route::get('categories',[mainController::class,'categories']);
    Route::post('CategoriesInsertion',[mainController::class,'CategoriesInsertion']);
    Route::post('categoriesNamesInsertion',[mainController::class,'categoriesNamesInsertion']);
    Route::post('Categoriesupdate{ID}',[mainController::class,'Categoriesupdate']);
    Route::post('CateDelete',[mainController::class,'Categoriesdelete']);
    Route::get('Searchcategories/{ID}',[mainController::class,'Searchcategories']);
});







