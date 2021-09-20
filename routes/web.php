<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');

});

Auth::routes();

Route::group(['middleware' => 'auth'], function() {
    Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
    Route::get('/plan/{plan}', [App\Http\Controllers\Admin\ProductController::class, 'show'])->name('plans.show');
    // Route::post('/subscription', [App\Http\Controllers\Admin\ProductController::class, 'create'])->name('subscription.store');

    //*** Routes for Plan ***//
    Route::get('/plans', [App\Http\Controllers\Admin\ProductController::class, 'index'])->name('plans.index');
    Route::get('create/plan', [App\Http\Controllers\Admin\ProductController::class, 'create'])->name('create.plan');
    Route::post('store/plan', [App\Http\Controllers\Admin\ProductController::class, 'store'])->name('store.plan');

    // *** Routes for Customer *** //
    Route::get('customer/listing', [App\Http\Controllers\Admin\CustomerController::class, 'index'])->name('customer.index');
    Route::get('create/customer', [App\Http\Controllers\Admin\CustomerController::class, 'create'])->name('create.customer');
    Route::post('store/customer', [App\Http\Controllers\Admin\CustomerController::class, 'store'])->name('store.customer');

    // *** Routes for Subscription *** //
    Route::get('subscription/listing', [App\Http\Controllers\Admin\SubscriptionController::class, 'index'])->name('subscription.index');
    Route::get('create/subscription', [App\Http\Controllers\Admin\SubscriptionController::class, 'create'])->name('create.subscription');
    Route::post('store/subscription', [App\Http\Controllers\Admin\SubscriptionController::class, 'store'])->name('subscription.store');
    Route::get('subscription/setCustomerIntent', [App\Http\Controllers\Admin\SubscriptionController::class, 'setCustomerIntent']);
});