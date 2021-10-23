<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Organization extends Model
{
    use HasFactory;

    protected $guarded = [];
    
    public function bank() {
        return $this->hasOne(Bank::class);
    }

    public function customer() {
        return $this->hasOne(Customer::class);
    }
}
