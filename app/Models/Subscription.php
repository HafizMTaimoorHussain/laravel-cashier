<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    use HasFactory;

    protected $table = "subscriptions";

    public function user() {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function customer() {
        return $this->belongsTo(Customer::class, 'customer_stripe_id','stripe_id');
    }
}
