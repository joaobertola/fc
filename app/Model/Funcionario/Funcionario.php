<?php

namespace App\Model\Funcionario;

use Illuminate\Database\Eloquent\Model;
/**
 * Class Funcionario
 * @property string $id
 * @property string $nome
 * @package App\Model\Funcionario
 * @OA\Schema(
 *     schema="funcionario",
 *     type="object",
 *     title="Funcionario",
 *     properties={
 *         @OA\Property(property="id", type="integer"),
 *         @OA\Property(property="nome", type="string"),
 *         @OA\Property(property="funcao", type="string"),
 *         @OA\Property(property="email", type="string"),
 *         @OA\Property(property="telefone", type="string"),
 *         @OA\Property(property="celular", type="string"),
 *         @OA\Property(property="data_nascimento", type="integer"),
 *         @OA\Property(property="sexo", type="string"),
 *         @OA\Property(property="nome_pai", type="string"),
 *         @OA\Property(property="nome_mae", type="string"),
 *         @OA\Property(property="naturalidade", type="string"),
 *         @OA\Property(property="uf_naturalidade", type="string"),
 *         @OA\Property(property="nacionalidade", type="string"),
 *         @OA\Property(property="estado_civil", type="integer"),
 *         @OA\Property(property="qtde_filho", type="integer"),
 *         @OA\Property(property="grau_instrucao", type="integer"),
 *         @OA\Property(property="id_tipo_log", type="integer"),
 *         @OA\Property(property="endereco", type="string"),
 *         @OA\Property(property="numero", type="string"),
 *         @OA\Property(property="complemento", type="string"),
 *         @OA\Property(property="cep", type="string"),
 *         @OA\Property(property="bairro", type="string"),
 *         @OA\Property(property="cidade", type="string"),
 *         @OA\Property(property="uf", type="string"),
 *         @OA\Property(property="cpf", type="string"),
 *         @OA\Property(property="rg", type="string"),
 *         @OA\Property(property="data_admissao", type="integer"),
 *         @OA\Property(property="informacoes_adicionais", type="integer"),
 *         @OA\Property(property="data_cadastro", type="integer"),
 *         @OA\Property(property="id_cadastro", type="integer"),
 *         @OA\Property(property="ativo", type="integer"),
 *         @OA\Property(property="id_usuario_excluir", type="integer"),
 *         @OA\Property(property="pis", type="string"),
 *         @OA\Property(property="sincronizado", type="integer"),
 *         @OA\Property(property="classificacao", type="integer"),
 *         @OA\Property(property="comissao", type="integer"),
 *         @OA\Property(property="comissao_servico", type="integer"),
 *         @OA\Property(property="pessoa_recado1", type="string"),
 *         @OA\Property(property="pessoa_recado2", type="string"),
 *         @OA\Property(property="fone_recado1", type="string"),
 *         @OA\Property(property="fone_recado2", type="string"),
 *         @OA\Property(property="tipo_conta", type="integer"),
 *         @OA\Property(property="id_banco", type="integer"),
 *         @OA\Property(property="agencia", type="string"),
 *         @OA\Property(property="conta", type="string"),
 *         @OA\Property(property="titular", type="string"),
 *         @OA\Property(property="titular_cpfcnpj", type="string"),
 *         @OA\Property(property="salario", type="integer"),
 *         @OA\Property(property="tipo_comissao", type="integer"),
 *         @OA\Property(property="tipo_comissao_servico", type="integer"),
 *         @OA\Property(property="tp_funcionario", type="integer"),
 *         @OA\Property(property="mot_demissao", type="string"),
 *         @OA\Property(property="data_demissao", type="integer"),
 *         @OA\Property(property="foto", type="string"),
 *         @OA\Property(property="orgao_expedidor", type="string"),
 *         @OA\Property(property="agenda", type="integer"),
 *         @OA\Property(property="tipo_funcionario", type="string", description="ENUM('G','N')"),
 *         @OA\Property(property="data_alteracao", type="integer"),
 *         @OA\Property(property="data_sincronismo", type="integer"),
 *         @OA\Property(property="id_off", type="integer"),
 *         @OA\Property(property="id_setor", type="integer"),
 *         @OA\Property(property="id_cargo", type="integer"),
 *     }
 * )
 */
class Funcionario extends Model
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'base_web_control.funcionario';
}
