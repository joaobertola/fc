<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoBeneficioFiscalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.produto_beneficio_fiscal', function (Blueprint $table) {
            $table->integer('Id', true);
            $table->bigInteger('id_produto')->nullable();
            $table->integer('cst')->nullable();
            $table->string('cBeneFiscal', 8)->nullable()->default('');
            $table->index(['id_produto', 'cst'], 'fk001');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.produto_beneficio_fiscal');
    }
}
