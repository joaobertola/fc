<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoPISTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_PIS', function (Blueprint $table) {
            $table->integer('id_produto')->default(0)->primary();
            $table->char('tp_calculo', 1)->nullable()->default('N')->comment('N - Nulo    P - Percentual  V-Valores');
            $table->unsignedInteger('CST')->nullable()->default(00);
            $table->decimal('pPIS', 10)->nullable();
            $table->decimal('v_aliq', 10)->nullable();
            $table->enum('tp_imposto', ['A', 'B'])->nullable()->default('A');
            $table->timestamp('data_alteracao')->useCurrent();
            $table->dateTime('data_sincronismo')->nullable();
            $table->integer('id_off')->nullable();
            $table->integer('id_cadastro')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.nfe_Produto_PIS');
    }
}
