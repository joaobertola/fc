<?php

namespace App\Services\Repository\Contracts\Model\Produto;

use App\DTO\Grades\GradeDTO;
use App\DTO\FrenteCaixa\DevolucaoDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface GradeRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function salvarHistoricoGradeDevolucao(DevolucaoDTO $devolucaoDTO);
    public function atualizarQtdeEstoque(int $idGrade, int $qtdAtual);
    public function atualizarQtdeEstoqueProduto(int $idProduto, int $qtdAtual);

    public function salvarGrade(int $idProduto, string $codigoBarraPai, GradeDTO $gradeDTO);
    public function editarGrade(int $idGrade, GradeDTO $gradeDTO);

    public function vincularFoto(int $idGrade, string $pathImage);
    public function excluirFoto(int $idGrade, int $idFoto);
}