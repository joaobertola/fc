<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGradeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.grade', function (Blueprint $table) {
            $table->bigIncrements('id_grade');
            $table->unsignedInteger('id_cadastro')->index('id_cadastro');
            $table->unsignedInteger('id_produto')->index('id_produto');
            $table->string('id_grade_atributo_valor')->nullable();
            $table->unsignedInteger('id_usuario_alterou')->nullable();
            $table->string('codigo_barra_pai', 22)->nullable()->index('codigo_barra_pai');
            $table->string('codigo_barra', 22)->nullable();
            $table->string('codigo_interno', 22)->nullable();
            $table->decimal('qtd_atual', 10, 3)->nullable()->default(0.000);
            $table->decimal('qtd_minima', 10, 3)->nullable()->default(0.000);
            $table->decimal('qtd_locacao', 10, 3)->nullable()->default(0.000);
            $table->decimal('qtd_locacao_locado', 10, 3)->nullable()->default(0.000)->comment('Armazena o total locado, somar ao locar e remover na devolução');
            $table->decimal('valor_custo', 10, 5)->nullable();
            $table->decimal('valor_varejo_avista', 10)->nullable();
            $table->decimal('valor_varejo_aprazo', 10)->nullable();
            $table->decimal('valor_atacado_avista', 10)->nullable();
            $table->decimal('valor_atacado_aprazo', 10)->nullable();
            $table->decimal('porc_varejo_avista', 18, 15)->nullable();
            $table->decimal('porc_varejo_aprazo', 18, 15)->nullable();
            $table->decimal('porc_atacado_avista', 18, 15)->nullable();
            $table->decimal('porc_atacado_aprazo', 18, 15)->nullable();
            $table->boolean('ativo')->unsigned()->nullable()->default(1)->index('ativo')->comment('1 = ativo, 0 inativo');
            $table->timestamp('data_alteracao')->nullable()->useCurrent();
            $table->dateTime('data_sincronismo')->nullable();
            $table->integer('id_off')->nullable();
            $table->string('alteracao')->nullable();
            $table->index(['id_cadastro', 'codigo_barra'], 'id_cadastro_codigo_barra');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.grade');
    }
}
