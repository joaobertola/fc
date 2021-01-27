<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeCupomFiscalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_cupom_fiscal', function (Blueprint $table) {
            $table->integer('id_cupom_fiscal', true);
            $table->integer('id_produto')->nullable()->index('fk_id_produto');
            $table->integer('id_cfop')->nullable();
            $table->string('ncm', 8)->nullable();
            $table->string('sped', 5)->nullable();
            $table->decimal('percentual_issqn', 10)->nullable();
            $table->integer('cst')->nullable();
            $table->string('codigo_balanca')->nullable();
            $table->decimal('percentual_icms', 10)->nullable();
            $table->decimal('percentual_pis', 10)->nullable();
            $table->string('csosn', 60)->nullable();
            $table->string('totalizador_parcial', 10)->nullable();
            $table->decimal('percentual_ipi', 10)->nullable();
            $table->decimal('percentual_cofins', 10)->nullable();
            $table->string('icmsst', 60)->nullable();
            $table->char('situacao_tributaria', 1)->nullable();
            $table->string('iat', 20)->nullable();
            $table->string('ippt', 10)->nullable();
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
        Schema::dropIfExists('base_web_control.nfe_cupom_fiscal');
    }
}
