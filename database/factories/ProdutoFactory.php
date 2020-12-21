<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\Model\Produto\Produto;
use Illuminate\Support\Str;
use Faker\Generator as Faker;
use Illuminate\Support\Facades\DB;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/

$factory->define(Produto::class, function (Faker $faker) {
    return  [
        'id_cadastro' => 23096,
        'descricao' => $faker->name,
        'codigo_barra' => $faker->randomDigit,
        'identificacao_interna' => $faker->randomDigit,
        'cor' => $faker->name,
        'tamanho' => rand(0,20) ,
        'localizacao' => $faker->address,
        'fabricante' => $faker->name,
        'id_origem' => null,
        'descricao_detalhada' => $faker->name,
        'data_fabricacao' => $faker->dateTime,
        'data_validade' => $faker->dateTime,
        'nr_edicao' => 'S'
    ];
 
});
