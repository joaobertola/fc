<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoCOFINSSTTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_COFINSST', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('imposto_id')->nullable();
            $table->decimal('pCOFINS', 10)->nullable();
            $table->decimal('qBCProd', 10)->nullable();
            $table->decimal('v_aliq', 10)->nullable();
            $table->enum('tp_calculo', ['P', 'V'])->nullable()->default('P');
            $table->unsignedInteger('produto_id')->nullable()->default(0)->index('fk001');
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
        Schema::dropIfExists('base_web_control.nfe_Produto_COFINSST');
    }
}
