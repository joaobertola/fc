<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoISSQNTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_ISSQN', function (Blueprint $table) {
            $table->integer('ISSQN_id', true);
            $table->integer('imposto_id')->nullable();
            $table->double('pAliq', 4, 2)->nullable();
            $table->char('uf', 2)->nullable();
            $table->char('cMunFG', 7)->nullable();
            $table->string('cListServ', 4)->nullable();
            $table->enum('tributacao', ['N', 'R', 'S', 'I'])->nullable();
            $table->integer('produto_id')->nullable()->index('idx_id_produto');
            $table->integer('id_exigibilidade')->nullable();
            $table->enum('incentivo_fiscal', ['S', 'N'])->nullable()->default('S');
            $table->decimal('valor_deducoes', 10)->nullable();
            $table->decimal('valor_outras_retencoes', 10)->nullable();
            $table->decimal('valor_desconto_condicionado', 10)->nullable();
            $table->decimal('valor_retencao', 10)->nullable();
            $table->string('codigo_servico', 5)->nullable();
            $table->char('uf_incidencia', 2)->nullable();
            $table->integer('id_municipio_incidencia')->nullable();
            $table->string('processo', 60)->nullable();
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
        Schema::dropIfExists('base_web_control.nfe_Produto_ISSQN');
    }
}
