<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNotaCreditoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nota_credito', function (Blueprint $table) {
            $table->bigInteger('id', true);
            $table->integer('id_venda_origem')->index('fk_nt01');
            $table->integer('id_venda_devol')->nullable();
            $table->integer('id_cliente')->index('fk_nt03');
            $table->integer('id_cadastro')->index('fk_nt02');
            $table->date('data_cadastro');
            $table->time('hora_cadastro');
            $table->decimal('valor_credito', 12);
            $table->integer('id_func_cadastro');
            $table->integer('id_venda_resgate')->index('fk_nt04');
            $table->date('data_resgate');
            $table->time('hora_resgate');
            $table->decimal('valor_resgate', 12);
            $table->integer('id_func_resgate');
            $table->string('justificativa', 100);
            $table->enum('status', ['A', 'E'])->default('A')->comment('A = Ativo, E = Excluida');
            $table->integer('id_usuario_exclusao');
            $table->dateTime('data_alteracao')->nullable();
            $table->dateTime('data_sincronismo')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.nota_credito');
    }
}
