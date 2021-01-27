<?php

namespace App\Services\Repository\Contracts\Model\Fornecedor;

use App\DTO\Fornecedor\CadastrarFornecedorDTO;
use App\Services\Repository\Contracts\RepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Interface basica referente a abstração
 * do padrao repository service 
 */
interface FornecedorRepositoryServiceInterface extends RepositoryServiceInterface
{
    public function novoFornecedor(CadastrarFornecedorDTO $cadastrarFornecedorDTO);
    public function editarFornecedor(int $idFornecedor, CadastrarFornecedorDTO $cadastrarFornecedorDTO);
}