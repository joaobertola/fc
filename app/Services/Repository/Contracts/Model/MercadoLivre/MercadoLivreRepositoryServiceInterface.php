<?php

namespace App\Services\Repository\Contracts\Model\MercadoLivre;

use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface MercadoLivreRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function vincularProdutoAoMercadoLivre(int $idIntegracaoML, int $idProduto);
    public function atualizaUltimaSincronizacao(int $idMercadoLivre);
}