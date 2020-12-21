<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoICMSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_ICMS', function (Blueprint $table) {
            $table->integer('id_produto')->default(0)->primary();
            $table->char('orig', 1)->nullable();
            $table->char('CST', 3)->nullable();
            $table->char('modBC', 1)->nullable();
            $table->decimal('pRedBC', 10, 3)->nullable();
            $table->decimal('pICMS', 10, 4)->nullable();
            $table->char('modBCST', 1)->nullable();
            $table->decimal('pMVAST', 10, 3)->nullable();
            $table->decimal('pRedBCST', 10, 3)->nullable();
            $table->decimal('pICMSST', 10)->nullable();
            $table->enum('regimes', ['T', 'S'])->nullable()->default('T');
            $table->decimal('pOpePropria', 10, 3)->nullable();
            $table->char('uf', 2)->nullable();
            $table->decimal('vl_aliq_calc_cre', 10, 3)->nullable();
            $table->decimal('bc_icms_st_ret_ant', 10, 3)->nullable();
            $table->decimal('pMVAST_LR', 10, 3)->nullable();
            $table->decimal('valor_desoneracao_icms', 10)->nullable();
            $table->string('motivo_desoneracao_icms', 60)->nullable();
            $table->decimal('percentual_diferimento_icms', 10)->nullable();
            $table->char('uf_retido_remetente_icms_st', 2)->nullable();
            $table->char('uf_destino_icms_st', 2)->nullable();
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
        Schema::dropIfExists('base_web_control.nfe_Produto_ICMS');
    }
}
