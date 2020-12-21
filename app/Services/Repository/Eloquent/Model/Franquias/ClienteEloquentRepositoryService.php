<?php

namespace App\Services\Repository\Eloquent\Model\Franquias;

use App\DTO\Franquias\clienteDTO;
use App\Model\Franquias\Cliente;
use App\Repository\Eloquent\Model\Franquias\ClienteEloquentRepository;
use App\Services\Repository\Contracts\Model\Franquias\ClienteRepositoryServiceInterface;
use App\Services\Repository\Eloquent\WebControlEloquentRepositoryService;
use Illuminate\Support\Facades\DB;

/**
 * @author Tiago Franco
 * Servico de acesso ao repositorio de Model
 * Deverá possuir os metodos contendo operacoes de escrita
 * do modelo implementando a interface do repositorio
 */
class ClienteEloquentRepositoryService extends WebControlEloquentRepositoryService implements ClienteRepositoryServiceInterface
{
    public function __construct(Cliente $model, ClienteEloquentRepository $repository)
    {
        parent::__construct($model, $repository);
    }

    public function salvarClientes(clienteDTO $clienteDTO)
    {

        $now    = date('Y-m-d H:i:s');
        $idFranquia = $clienteDTO->getIdFranquia();
        $assinatura = $clienteDTO->getAssinatura();
        $pacote     = $clienteDTO->getPacote();

        $queryTaxas = "SELECT a.nome, b.tx_adesao FROM cs2.tabela_valor a
        INNER JOIN cs2.franquia b ON b.id= " . $idFranquia . " WHERE a.id='" . $pacote . "'
        AND a.categoria='" . $assinatura . "'";

        $result = DB::connection($this->model->getConnectionName())->select($queryTaxas);

        if (!empty($result)) {

            $taxas      = $result[0];
            $taxaMensal = $taxas->nome;
            $taxaAdesao = $taxas->tx_adesao;

            $cliente                                = new Cliente();
            $cliente->atendente_resp                = $clienteDTO->getAtendenteResp();
            $cliente->razaosoc                      = $clienteDTO->getRazaosoc();
            $cliente->insc                          = $clienteDTO->getInsc();
            $cliente->nomefantasia                  = $clienteDTO->getNomefantasia();
            $cliente->uf                            = $clienteDTO->getUf();
            $cliente->cidade                        = $clienteDTO->getCidade();
            $cliente->bairro                        = $clienteDTO->getBairro();
            $cliente->end                           = $clienteDTO->getEnd();
            $cliente->numero                        = $clienteDTO->getNumero();
            $cliente->complemento                   = $clienteDTO->getComplemento();
            $cliente->cep                           = $clienteDTO->getCep();
            $cliente->fone                          = $clienteDTO->getFone();
            $cliente->fax                           = $clienteDTO->getFax();
            $cliente->email                         = $clienteDTO->getEmail();
            $cliente->tx_mens                       = $taxaMensal;
            $cliente->tx_adesao                     = $taxaAdesao;
            $cliente->debito                        = 'B';
            $cliente->diapagto                      = '30';
            $cliente->id_franquia                   = $clienteDTO->getIdFranquia();
            $cliente->dt_cad                        = $now;
            $cliente->sitcli                        = '0';
            $cliente->obs                           = $clienteDTO->getObs();
            $cliente->classificacao                 = 'Mensal';
            $cliente->contrato                      = ''; // Verificar regra de negócio
            $cliente->ramo_atividade                = $clienteDTO->getRamoAtividade();
            $cliente->celular                       = $clienteDTO->getCelular();
            $cliente->fone_res                      = $clienteDTO->getFoneRes();
            $cliente->socio1                        = $clienteDTO->getSocio1();
            $cliente->socio2                        = $clienteDTO->getSocio2();
            $cliente->cpfsocio1                     = $clienteDTO->getCpfsocio1();
            $cliente->cpfsocio2                     = $clienteDTO->getCpfsocio2();
            $cliente->emissao_financeiro            = $clienteDTO->getEmissaoFinanceiro();
            $cliente->pendencia_contratual          = '1';
            $cliente->id_consultor                  = $clienteDTO->getIdConsultor();
            $cliente->origem                        = $clienteDTO->getOrigem();
            $cliente->qtd_acessos                   = '0';
            $cliente->hora_cadastro                 = $now;
            $cliente->inscricao_estadual            = $clienteDTO->getInscricaoEstadual();
            $cliente->cnae_fiscal                   = $clienteDTO->getCnaeFiscal();
            $cliente->inscricao_municipal           = $clienteDTO->getInscricaoMunicipal();
            $cliente->inscricao_estadual_tributario = $clienteDTO->getInscricaoEstadualTributario();
            $cliente->contador_nome                 = $clienteDTO->getContadorNome();
            $cliente->contador_telefone             = $clienteDTO->getContadorTelefone();
            $cliente->contador_celular              = $clienteDTO->getContadorCelular();
            $cliente->contador_email1               = $clienteDTO->getContadorEmail1();
            $cliente->contador_email2               = $clienteDTO->getContadorEmail2();
            $cliente->id_agendador                  = $clienteDTO->getIdAgendador();
            $cliente->id_operadora                  = $clienteDTO->getIdOperadora();
            $cliente->nfce                          = 'S';
            $cliente->nfe                           = 'S';
            $cliente->liberar_nfe                   = 'S';
            $cliente->save();
        } else {
            return response()->json(['error' => 'Erro na verficação de assinatura de pacote.'], 401);
        }
    }
}
