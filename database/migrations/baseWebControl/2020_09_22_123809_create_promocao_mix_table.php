<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePromocaoMixTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.promocao_mix', function (Blueprint $table) {
            $table->integer('id', true);
            $table->integer('id_cadastro')->index('idx_idcadastro');
            $table->string('descricao', 150)->nullable();
            $table->text('array_id_produto')->nullable();
            $table->float('qtd', 10, 3)->nullable();
            $table->float('valor', 10)->nullable();
            $table->timestamp('data_inicio')->nullable();
            $table->timestamp('data_fim')->nullable();
            $table->tinyInteger('status')->nullable()->default(1);
            $table->float('total_desconto', 10)->nullable()->default(0.00);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.promocao_mix');
    }
}
