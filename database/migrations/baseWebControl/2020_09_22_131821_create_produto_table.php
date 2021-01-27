<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProdutoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('base_web_control.produto', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('descricao', 120)->nullable()->index('fk_produto05');
            $table->unsignedInteger('id_cadastro')->nullable()->index('fk_produto04');
            $table->unsignedInteger('id_usuario')->nullable();
            $table->timestamp('data_cadastro')->nullable()->useCurrent();
            $table->unsignedInteger('id_classificacao')->nullable()->index('fk_produto03');
            $table->string('cor', 15)->nullable();
            $table->integer('id_cor')->nullable();
            $table->string('tamanho', 15)->nullable();
            $table->decimal('custo', 10, 5)->nullable();
            $table->decimal('custo_medio_venda', 10, 3)->unsigned()->nullable();
            $table->decimal('custo_medio_venda_prazo', 12, 3)->unsigned()->nullable();
            $table->decimal('custo_medio_venda_varejo', 12, 3)->unsigned()->nullable();
            $table->decimal('custo_medio_venda_atacado', 12, 3)->unsigned()->nullable();
            $table->decimal('porcentagem_custo_venda', 18, 15)->unsigned()->nullable();
            $table->decimal('porcentagem_venda_prazo', 18, 15)->unsigned()->nullable();
            $table->decimal('porcentagem_atacado_avista', 18, 15)->unsigned()->nullable();
            $table->decimal('porcentagem_atacado_aprazo', 18, 15)->unsigned()->nullable();
            $table->unsignedInteger('qtd_atacado')->nullable();
            $table->enum('ativo', ['A', 'I', 'E'])->default('A')->comment('A - Ativo, I - Inativo, E - Excluido');
            $table->decimal('qtd_minima', 10, 3)->nullable()->default(0.000);
            $table->decimal('peso', 12, 4)->nullable()->default(0.0000);
            $table->string('codigo_barra', 22)->nullable();
            $table->string('barra', 20)->nullable();
            $table->integer('sincronizado')->default(0)->comment('0-Nao 1-Sim');
            $table->integer('iss')->nullable()->default(0);
            $table->decimal('icms', 4)->nullable()->default(0.00);
            $table->integer('id_unidade')->default(2);
            $table->integer('id_unidade_trib')->nullable();
            $table->string('localizacao', 50)->nullable();
            $table->bigInteger('id_fornecedor')->nullable();
            $table->string('fabricante', 50)->nullable();
            $table->string('ean', 13)->nullable();
            $table->string('ex_tipi', 3)->nullable();
            $table->string('ncm', 8)->nullable();
            $table->string('cest', 8)->nullable();
            $table->string('unidade_trib', 6)->nullable();
            $table->string('qtd_trib', 10)->nullable();
            $table->decimal('vlr_unit_trib', 10)->nullable();
            $table->integer('genero_produto')->nullable();
            $table->integer('id_tributacao')->nullable();
            $table->integer('id_origem')->nullable()->default(0)->comment('0 - Nacional, 1 - Importacao Direta, 2 - Adquirida no mercado Interno');
            $table->integer('id_especifico')->nullable();
            $table->integer('id_cfop')->nullable();
            $table->integer('id_cfop_itens')->nullable();
            $table->integer('desconto')->nullable()->default(0);
            $table->enum('vender_estoque_zerado', ['S', 'N'])->nullable()->default('S');
            $table->text('descricao_detalhada')->nullable();
            $table->enum('ecommerce', ['S', 'N'])->nullable()->default('N')->comment('Enviar para Loja Virtual');
            $table->enum('promocao_ecommerce', ['S', 'N'])->nullable()->default('N');
            $table->enum('produto_destaque_ecommerce', ['S', 'N'])->nullable()->default('N');
            $table->decimal('altura', 12)->nullable()->default(0.00);
            $table->decimal('largura', 12)->nullable()->default(0.00);
            $table->decimal('comprimento', 12)->nullable()->default(0.00);
            $table->integer('id_marca')->nullable();
            $table->enum('destaque', ['P', 'L', 'N'])->nullable()->default('N')->comment('Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque');
            $table->decimal('valor_frete', 10)->nullable()->default(0.00);
            $table->string('cofins', 5)->nullable();
            $table->string('pis', 5)->nullable();
            $table->date('data_fabricacao')->nullable();
            $table->date('data_validade')->nullable();
            $table->string('lote_produto', 15)->nullable();
            $table->string('nr_edicao', 15)->nullable();
            $table->decimal('peso_bruto', 12, 4)->nullable()->default(0.0000);
            $table->decimal('pis_aliquota', 4)->nullable();
            $table->integer('pis_cst')->nullable();
            $table->integer('ipi_aliquota')->nullable();
            $table->integer('ipi_cst')->nullable();
            $table->decimal('cofins_aliquota', 4)->nullable();
            $table->integer('cofins_cst')->nullable();
            $table->integer('icms_cst')->nullable();
            $table->integer('icms_modalidade')->nullable();
            $table->decimal('peso_caixa', 12, 4)->nullable()->default(0.0000);
            $table->decimal('alt_caixa', 5)->nullable();
            $table->decimal('larg_caixa', 5)->nullable();
            $table->decimal('comp_caixa', 5)->nullable();
            $table->enum('margem_lucro_tipo', ['P', 'V'])->nullable();
            $table->decimal('margem_lucro_valor', 10)->nullable();
            $table->enum('desconto_maximo_tipo', ['P', 'V'])->nullable();
            $table->decimal('desconto_maximo_percentual', 10)->nullable();
            $table->decimal('desconto_maximo_valor', 10)->nullable();
            $table->enum('infos_nutricionais', ['S', 'N'])->nullable()->default('N');
            $table->enum('prod_serv', ['P', 'S'])->default('P');
            $table->string('identificacao_interna', 22)->nullable();
            $table->enum('solicitar_vrtotal', ['S', 'N'])->nullable()->default('N');
            $table->unsignedInteger('casas_decimais')->nullable()->default(2);
            $table->decimal('locacao_quantidade', 10, 3)->unsigned()->nullable()->default(0.000);
            $table->text('obs_preco')->nullable();
            $table->integer('id_bomba_bico')->nullable();
            $table->integer('id_importacao')->nullable();
            $table->timestamp('data_alteracao')->nullable()->useCurrent();
            $table->decimal('perc_dif_uf', 5)->nullable();
            $table->decimal('qtd_unidade', 10, 3)->nullable();
            $table->enum('truncar_vlr_total', ['S', 'N'])->nullable()->default('S');
            $table->string('codigo_anp', 10)->nullable();
            $table->enum('env_prod', ['S', 'N'])->nullable()->default('S')->comment('Enviar para Producao (comanda)');
            $table->decimal('peso_liquido', 12, 4)->nullable()->default(0.0000);
            $table->tinyInteger('estoque_lojavirtual')->nullable()->default(1);
            $table->enum('deletar', ['S', 'N'])->default('S');
            $table->decimal('comissao_valor', 12)->nullable();
            $table->integer('num_parcelas')->nullable();
            $table->dateTime('data_sincronismo')->nullable();
            $table->integer('id_off')->nullable();
            $table->char('fcp', 1)->nullable()->default('S');
            $table->char('glp', 1)->nullable()->default('N');
            $table->integer('exibir_grafico')->nullable()->default(0);
            $table->integer('id_ibptax')->nullable();
            $table->index(['id_cadastro', 'descricao'], 'fk_produto02');
            $table->index(['id_cadastro', 'codigo_barra'], 'fk_produto00');
            $table->index(['id_cadastro', 'codigo_barra', 'id_classificacao', 'id_fornecedor'], 'fk_produto01');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('base_web_control.produto');
    }
}
