<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoInfoNutricionaisTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.produto_info_nutricionais', function (Blueprint $table) {
            $table->integer('id_produto')->primary();
            $table->integer('dias');
            $table->string('porcao', 35);
            $table->integer('calorias');
            $table->integer('caboidrato');
            $table->integer('proteinas');
            $table->integer('gord_tot');
            $table->integer('gord_sat');
            $table->integer('colesterol');
            $table->integer('gord_trans');
            $table->integer('fibra');
            $table->integer('calcio');
            $table->integer('ferro');
            $table->integer('sodio');
            $table->timestamp('data_alteracao')->useCurrent();
            $table->dateTime('data_sincronismo')->nullable();
            $table->integer('id_cadastro')->nullable();
            $table->integer('id_off')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.produto_info_nutricionais');
    }
}
