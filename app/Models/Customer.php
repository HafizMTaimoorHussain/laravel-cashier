<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use Laravel\Cashier\Subscription;
use Laravel\Cashier\Billable;

class Customer extends Model
{
    use HasFactory, Billable;

    protected $guarded = [];

    public function organization() {
        return $this->belongsTo(Organization::class, 'organization_id');
    }

    public function bank() {
        return $this->belongsTo(Bank::class, 'bank_id');
    }
}
