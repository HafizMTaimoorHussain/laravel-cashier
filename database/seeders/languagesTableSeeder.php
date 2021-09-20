<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class languagesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('languages')->delete();
        $languages = array(
            ['name' => 'Arabic'],
            ['name' => 'Brazilian Portuguese'],
            ['name' => 'Danish'],
            ['name' => 'Dutch'],
            ['name' => 'English'],
            ['name' => 'Finnish'],
            ['name' => 'French'],
            ['name' => 'German'],
            ['name' => 'Hebrew'],
            ['name' => 'Italian'],
            ['name' => 'Japanese'],
            ['name' => 'Latin American Spanish'],
            ['name' => 'Norwegian'],
            ['name' => 'Spanish'],
            ['name' => 'Swedish'],
        );
        DB::table('languages')->insert($languages);
    }
}
