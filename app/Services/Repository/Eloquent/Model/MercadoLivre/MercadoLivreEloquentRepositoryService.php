<?php

namespace App\Services\Repository\Eloquent\Model\MercadoLivre;

use App\Model\MercadoLivre\MercadoLivre;
use App\Repository\Eloquent\Model\MercadoLivre\MercadoLivreEloquentRepository;
use App\Services\Repository\Contracts\Model\MercadoLivre\MercadoLivreRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class MercadoLivreEloquentRepositoryService extends WebControlEloquentRepositoryService implements MercadoLivreRepositoryServiceInterface
{
    public function __construct(MercadoLivre $model, MercadoLivreEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function vincularProdutoAoMercadoLivre(int $idIntegracaoML, int $idProduto)
    {
        $ml = new MercadoLivre();
        $ml->setConnection($this->connection);

        $ml->id_mercado_livre = $idIntegracaoML;
        $ml->id_produto       = $idProduto;
        $ml->save();
    }
    
    public function atualizaUltimaSincronizacao(int $idMercadoLivre)
    {
        $mercadoLivre = $this->find($idMercadoLivre);
        $mercadoLivre->save();
    }
}
