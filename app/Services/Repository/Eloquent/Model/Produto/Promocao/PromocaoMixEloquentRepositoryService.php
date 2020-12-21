<?php

namespace App\Services\Repository\Eloquent\Model\Produto\Promocao;

use Illuminate\Support\Facades\DB;
use App\DTO\FrenteCaixa\PromocaoMixDTO;
use App\Model\Produto\Promocao\PromocaoMix;
use App\DTO\FrenteCaixa\PromocaoMixTempoDTO;
use App\DTO\FrenteCaixa\PromocaoMixDescontoDTO;
use App\Model\Produto\Promocao\PromocaoMixTempo;
use App\Model\Produto\Promocao\PromocaoMixDesconto;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\Produto\Promocao\PromocaoMixEloquentRepository;
use App\Services\Repository\Contracts\Model\Produto\Promocao\PromocaoMixRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class PromocaoMixEloquentRepositoryService extends WebControlEloquentRepositoryService implements PromocaoMixRepositoryServiceInterface
{
    public function __construct(PromocaoMix $model, PromocaoMixEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvar(PromocaoMixDTO $promocaoMixDTO)
    { 
        $promocaoMix                   = new PromocaoMix();
        $promocaoMix->setConnection($this->connection);

        $promocaoMix->id_cadastro      = $this->_usuarioLogadoService->getIdCadastroLogado();
        $promocaoMix->descricao        = $promocaoMixDTO->getNome();
        $promocaoMix->array_id_produto = implode(";", $promocaoMixDTO->getProdutos());
        $promocaoMix->qtd              = $promocaoMixDTO->getQuantidade();
        $promocaoMix->valor            = $promocaoMixDTO->getValor();
        $promocaoMix->data_inicio      = $promocaoMixDTO->getDataInicial();
        $promocaoMix->data_fim         = $promocaoMixDTO->getDataFinal();
        $promocaoMix->status           = 1;
        $promocaoMix->total_desconto   = $promocaoMixDTO->getTotalDesconto();

        $promocaoMix->save();
        return $promocaoMix;
    }

    public function editar(PromocaoMixDTO $promocaoMixDTO) 
    {
        $promocaoMix                   = PromocaoMix::find($promocaoMixDTO->getId());
        $promocaoMix->setConnection($this->connection);

        $promocaoMix->id_cadastro      = $this->_usuarioLogadoService->getIdCadastroLogado();
        $promocaoMix->descricao        = $promocaoMixDTO->getNome();
        $promocaoMix->array_id_produto = implode(";", $promocaoMixDTO->getProdutos());
        $promocaoMix->qtd              = $promocaoMixDTO->getQuantidade();
        $promocaoMix->valor            = $promocaoMixDTO->getValor();
        $promocaoMix->data_inicio      = $promocaoMixDTO->getDataInicial();
        $promocaoMix->data_fim         = $promocaoMixDTO->getDataFinal();
        $promocaoMix->status           = $promocaoMixDTO->getStatus();
        $promocaoMix->total_desconto   = $promocaoMixDTO->getTotalDesconto();

        $promocaoMix->save();
        return $promocaoMix;         
    }

    public function salvarDesconto(PromocaoMixDescontoDTO $promocaoMixDescontoDTO)
    {
        $promocaoDesconto                  = new PromocaoMixDesconto();
        $promocaoDesconto->setConnection($this->connection);
        $promocaoDesconto->id_cadastro     = $this->_usuarioLogadoService->getIdCadastroLogado();
        $promocaoDesconto->id_produto      = $promocaoMixDescontoDTO->getIdProduto();
        $promocaoDesconto->id_promocao_mix = $promocaoMixDescontoDTO->getIdPromocaoMix();
        $promocaoDesconto->valor_desconto  = $promocaoMixDescontoDTO->getValor();

        $promocaoDesconto->save();
        return $promocaoDesconto;
    }

    public function salvarItemVendaDesconto(PromocaoMixTempoDTO $promocaoMixTempoDTO)
    {
        $promocaoMixTempo = new PromocaoMixTempo();
        $promocaoMixTempo->setConnection($this->connection);

        $promocaoMixTempo->id_cadastro    = $this->_usuarioLogadoService->getIdCadastroLogado();
        $promocaoMixTempo->id_venda_item  = $promocaoMixTempoDTO->getIdVendaItem();
        $promocaoMixTempo->id_promo_mix   = $promocaoMixTempoDTO->getIdPromoMix();
        $promocaoMixTempo->id_produto     = $promocaoMixTempoDTO->getIdProduto();
        $promocaoMixTempo->id_venda       = $promocaoMixTempoDTO->getIdVenda();
        
        $promocaoMixTempo->save();
        return $promocaoMixTempo;
    }

    public function ativaInativaPromocaoMix(int $idPromocaoMix, $status = 1) 
    {
        $sql = "update base_web_control.promocao_mix
                    set status = :status
                where id = :id
                    and id_cadastro = :id_cadastro";

        DB::update($sql, [
            ":id"           => $idPromocaoMix,
            ":id_cadastro"  => $this->_usuarioLogadoService->getIdCadastroLogado(),
            ":status"       => $status
        ]);
    }
    

    public function excluirDescontos(int $idPromocaoMix)
    {
        $sql = "delete from base_web_control.promocao_mix_desconto
                where id_promocao_mix = :id_promocao_mix
                and id_cadastro = :id_cadastro";

        DB::delete($sql, [
        ":id_promocao_mix" => $idPromocaoMix,
        ":id_cadastro"     => $this->_usuarioLogadoService->getIdCadastroLogado()
        ]);
    }
}
