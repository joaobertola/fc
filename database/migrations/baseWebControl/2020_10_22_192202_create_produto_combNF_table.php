<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoCombNFTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.produto_combNF', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('id_produto')->unique('id_produto');
            $table->string('descANP', 20);
            $table->decimal('pGLP', 12);
            $table->integer('CODIF');
            $table->decimal('qTemp', 12, 4);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.produto_combNF');
    }
}
