<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCustomersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();
            $table->string('customer_prefix_id')->nullable();
            $table->string('customer_stripe_id')->nullable();
            $table->string('name')->nullable();
            $table->string('email')->nullable();
            $table->string('description')->nullable();
            $table->string('phone_no')->nullable();
            $table->string('address_line_1')->nullable();
            $table->string('address_line_2')->nullable();
            $table->string('postal_code')->nullable();
            $table->string('city')->nullable();
            $table->string('billing_email')->nullable();
            $table->string('billing_country')->nullable();
            $table->string('shopping_email')->nullable();
            $table->string('shopping_country')->nullable();
            $table->string('shopping_timezone')->nullable();
            $table->string('shopping_language')->nullable();
            $table->string('shopping_currency')->nullable();
            $table->string('shopping_tax_status')->nullable();
            $table->string('shopping_tax_id')->nullable();
            $table->unsignedInteger('organization_id')->nullable();
            $table->unsignedInteger('bank_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
}
