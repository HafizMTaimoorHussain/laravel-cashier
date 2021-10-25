<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSubscriptionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subscriptions', function (Blueprint $table) {
            $table->id('id');
            // $table->unsignedBigInteger('user_id');
            // $table->string('name');
            // $table->string('stripe_id')->unique();
            // $table->string('stripe_status');
            // $table->string('stripe_price')->nullable();
            // $table->integer('quantity')->nullable();
            // $table->timestamp('trial_ends_at')->nullable();
            // $table->timestamp('ends_at')->nullable();
            $table->string('stripe_subscription_id')->nullable();
            $table->string('product_id')->nullable();
            $table->string('product_name')->nullable();
            $table->string('stripe_price')->nullable();
            $table->string('stripe_status')->nullable();
            $table->string('price')->nullable();
            $table->string('currency')->nullable();
            $table->string('recurring')->nullable();
            $table->string('next_invoice_date')->nullable();
            $table->string('customer_stripe_id')->nullable();
            $table->string('organization_id')->nullable();
            $table->string('account_id')->nullable();
            $table->string('sales_rep')->nullable();
            $table->string('cfid')->nullable();
            $table->string('created_by')->nullable();
            $table->string('status')->nullable();
            $table->integer('payment_status')->default(1);
            $table->timestamps();

            // $table->index(['user_id', 'stripe_status']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subscriptions');
    }
}
