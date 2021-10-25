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
    Route::post('customer/get-organization-banks', [App\Http\Controllers\Admin\CustomerController::class, 'organization_banks'])->name('get-organization-banks');

    // *** Routes for Subscription *** //
    Route::any('account/{account_id}/subscription/listing', [App\Http\Controllers\Admin\SubscriptionController::class, 'index'])->name('subscription.index');
    Route::any('account/subscription/listing', [App\Http\Controllers\Admin\SubscriptionController::class, 'account_wise_listing'])->name('account.subscription.index');
    Route::get('create/subscription', [App\Http\Controllers\Admin\SubscriptionController::class, 'create'])->name('create.subscription');
    Route::post('store/subscription', [App\Http\Controllers\Admin\SubscriptionController::class, 'store'])->name('subscription.store');
    Route::get('subscription/setCustomerIntent', [App\Http\Controllers\Admin\SubscriptionController::class, 'setCustomerIntent']);
    Route::post('update-payment-status/subscription', [App\Http\Controllers\Admin\SubscriptionController::class, 'update_payment_status'])->name('subscription.update-payment-status');

    // *** Routes for Organization *** //
    Route::resource('organization', App\Http\Controllers\Admin\OrganizationController::class);

    // *** Routes for Bank *** //
    Route::resource('bank', App\Http\Controllers\Admin\BankController::class);
});