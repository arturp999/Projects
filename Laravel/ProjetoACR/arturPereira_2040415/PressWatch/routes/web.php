<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\MovieController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\GenderController;
use App\Http\Controllers\ContactController;
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


Route::get('/', [MovieController::class, 'index']);

Route::get('/noPermission',[MovieController::class, 'noPermissions'])->name('noPermissions');
Route::get('movie/search',[MovieController::class, 'search'])->name('search');

Route::get('movie/contact',[ContactController::class, 'contact'])->name('contact');
Route::post('movie/contact',[ContactController::class, 'contactMessage']);

Route::resource('movie', MovieController::class);

Route::get('/genders',[GenderController::class, 'genderMenu'])->name('genders')->middleware('auth');
Route::get('/home', [HomeController::class, 'index'])->name('home')->middleware('auth');

Auth::routes();
