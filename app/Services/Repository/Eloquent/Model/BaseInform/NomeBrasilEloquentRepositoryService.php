<?php

namespace App\Services\Repository\Eloquent\Model\BaseInform;

use App\Model\BaseInform\NomeBrasil;
use App\DTO\BaseInforme\DadosInformDTO;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use App\Repository\Eloquent\Model\BaseInform\NomeBrasilEloquentRepository;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita 
 * do modelo implementando a interface do repositorio
 */
class NomeBrasilEloquentRepositoryService extends WebControlEloquentRepositoryService 
{
    public function __construct(NomeBrasil $model, NomeBrasilEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }


    public function salvarNome(DadosInformDTO $dadosDTO){
        
        if(!$dados = $this->model->whereRaw("
        (Nom_CPF = :cpf AND Nom_Tp= :tipo AND Origem_Nome_id = 1) OR
        ( Nom_CPF = :cpf2 AND Nom_Tp= :tipo2 AND Origem_Nome_id <> 1 AND Nom_Nome = :nome )",
        [
            ':cpf'   => $dadosDTO->getCnpjCpf(),
            ':tipo'  => $dadosDTO->getTipo(),
            ':cpf2'  => $dadosDTO->getCnpjCpf(),
            ':tipo2' => $dadosDTO->getTipo(),
            ':nome'  => $dadosDTO->getNome()
        ])->first()) {
            //se nao exitir cria
            $dados =  $this->create([
                'Origem_Nome_id' => 2,
                'Nom_CPF'        => $dadosDTO->getCnpjCpf(),
                'Nom_Tp'         => $dadosDTO->getTipo(),
                'Nom_Nome'       => $dadosDTO->getNome()
            ]);
        }

        return $dados;
    }
}
