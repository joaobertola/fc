<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoOpcoesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_Opcoes', function (Blueprint $table) {
            $table->integer('id_produto')->nullable()->index('fk_001');
            $table->enum('tributacao_lucro', ['S', 'N'])->nullable()->default('N');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.nfe_Produto_Opcoes');
    }
}
