<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subscription extends Model
{
    use HasFactory;

    protected $table = "subscriptions";

    protected $guarded = [];

    public function user() {
        return $this->belongsTo(User::class, 'created_by');
    }

    public function customer() {
        return $this->belongsTo(Customer::class, 'customer_stripe_id','customer_stripe_id');
    }

    public function organization() {
        return $this->belongsTo(Customer::class, 'organization_id', 'id');
    }

    public function account() {
        return $this->belongsTo(Bank::class, 'account_id', 'id');
    }
}
