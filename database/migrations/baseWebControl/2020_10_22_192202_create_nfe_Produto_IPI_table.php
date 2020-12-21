<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNfeProdutoIPITable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.nfe_Produto_IPI', function (Blueprint $table) {
            $table->integer('id_produto')->default(0)->primary();
            $table->char('cIEnq', 5)->nullable();
            $table->char('CNPJProd', 14)->nullable();
            $table->string('cSelo', 60)->nullable();
            $table->double('qSelo')->nullable();
            $table->char('cEnq', 3)->nullable();
            $table->unsignedInteger('CST')->nullable()->default(00);
            $table->double('qUnid')->nullable();
            $table->double('pIPI')->nullable();
            $table->enum('tp_calculo', ['P', 'V'])->nullable()->default('P');
            $table->decimal('v_aliq', 10)->nullable();
            $table->timestamp('data_alteracao')->useCurrent();
            $table->dateTime('data_sincronismo')->nullable();
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
        Schema::dropIfExists('base_web_control.nfe_Produto_IPI');
    }
}
