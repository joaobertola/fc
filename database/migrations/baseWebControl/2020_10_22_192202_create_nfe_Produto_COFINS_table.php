<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoCOFINSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_COFINS', function (Blueprint $table) {
            $table->integer('id_produto')->default(0)->primary();
            $table->decimal('p_aliq', 10, 3);
            $table->unsignedInteger('CST')->nullable()->default(00);
            $table->decimal('pCOFINS', 10, 3)->nullable();
            $table->double('qBCProd')->nullable();
            $table->decimal('v_aliq', 10)->nullable();
            $table->enum('tp_calculo', ['P', 'V'])->nullable()->default('P');
            $table->enum('tp_imposto', ['A', 'B'])->nullable()->default('A');
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
        Schema::dropIfExists('base_web_control.nfe_Produto_COFINS');
    }
}
