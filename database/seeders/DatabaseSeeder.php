<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\User::factory(20)->create();
        $this->call([
            CountriesTableSeeder::class,
            CurrenciesTableSeeder::class,
            TimezonesTableSeeder::class,
            LanguagesTableSeeder::class,
        ]);
    }
}
