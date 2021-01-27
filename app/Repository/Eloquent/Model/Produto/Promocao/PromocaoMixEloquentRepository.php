<?php

namespace App\Repository\Eloquent\Model\Produto\Promocao;

use Illuminate\Support\Facades\DB;
use App\Model\Produto\Promocao\PromocaoMix;
use App\Repository\Eloquent\WebControlEloquentRepository;
use App\Repository\Contracts\Model\Produto\Promocao\PromocaoMixRepositoryInterface;

/**
 * @author Tiago Franco
 * Repositorio para metodos de consultas dos clientes
 * Todas as consultas deverá ser realizadas passando
 * a conexao atraves do metodo ::connection(connection)
 */
class PromocaoMixEloquentRepository extends WebControlEloquentRepository implements PromocaoMixRepositoryInterface
{
    protected $model;
    /**
     * Instantiate reporitory
     * 
     * @param PromocaoMix $model
     */
    public function __construct(PromocaoMix $model)
    {
        parent::__construct($model);
    }

    public function getItensProdutosPromocao(int $idVenda)
    {
        $sql_desconto = "
            SELECT 
                pmt.id_produto,
                pmt.id_promo_mix,
                SUM(vi.qtd) AS quantidade_add_produto,
                pm.qtd as quantidade_promo,
                pm.total_desconto    
            FROM
                base_web_control.promocao_mix_tempo pmt
                INNER JOIN base_web_control.promocao_mix pm ON pm.id = pmt.id_promo_mix
                INNER JOIN base_web_control.promocao_mix_desconto pmd ON pmd.id_promocao_mix = pm.id
                INNER JOIN base_web_control.venda_itens vi ON vi.id = pmt.id_venda_item
            WHERE
                pmt.id_cadastro = ?
                AND pmt.id_venda = ?
                AND pm.status = 1
                AND pm.data_fim > NOW()
                AND pmt.id_produto = pmd.id_produto
            GROUP BY pmt.id_promo_mix, pmt.id_produto
            ORDER BY pmt.id_promo_mix
        ";
        
        return DB::connection($this->model->getConnectionName())->select($sql_desconto, [
            $this->_usuarioLogadoService->getIdCadastroLogado(),
            $idVenda
        ]);
    }
}
