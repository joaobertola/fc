<?php

namespace App\Services\Grade;

use App\DTO\Grades\GradeDTO;
use App\Model\Produto\Grade;
use Illuminate\Http\Request;
use App\Model\Produto\Produto;
use App\Model\Produto\GradeFoto;
use App\Exceptions\ApiWebControlException;
use App\Services\Auth\UsuarioLogadoService;
use App\Services\Produtos\PesquisaProdutosService;
use App\Services\Repository\Contracts\Model\Produto\GradeRepositoryServiceInterface;

/**
 * @author Tiago Franco
 * Servico responsavel pelo processamento
 * envolvendo
 */
class GradeService
{
    /**
     * @var GradeRepositoryServiceInterface
     */
    private $_gradeRepositoryService;

    /**
     * @var PesquisaProdutosService
     */
    private $_pesquisaProdutosService;

    /**
     * @var UsuarioLogadoService
     */
    private $_usuarioLogadoService;

    public function __construct(
        GradeRepositoryServiceInterface $gradeRepositoryService,
        PesquisaProdutosService $pesquisaProdutosService,
        UsuarioLogadoService $usuarioLogadoService
    ) {
        $this->_gradeRepositoryService  = $gradeRepositoryService;
        $this->_pesquisaProdutosService = $pesquisaProdutosService;
        $this->_usuarioLogadoService    = $usuarioLogadoService;
    }

    public function salvarNovaGrade(Produto $produto, GradeDTO $gradeDTO)
    {
        if (!$this->_pesquisaProdutosService->validarCodBarraNaoVinculado($gradeDTO->getCodigoBarra())) {
            throw new ApiWebControlException("Código de barras já vinculado em outro produto, kit ou grade de produto");
        }

        return $this->_gradeRepositoryService->salvarGrade($produto->id, $produto->codigo_barra, $gradeDTO);
    }

    public function editarGrade(Grade $grade, GradeDTO $gradeDTO)
    {
        if (!$this->_pesquisaProdutosService->validarCodBarraNaoVinculado($gradeDTO->getCodigoBarra())) {
            throw new ApiWebControlException("Código de barras já vinculado em outro produto, kit ou grade de produto");
        }

        $this->_gradeRepositoryService->editarGrade($grade->id_grade, $gradeDTO);
        return $this->_gradeRepositoryService->find($grade->id_grade);
    }

    public function excluirGrade(Grade $grade)
    {
        if ($grade->id_cadastro == $this->_usuarioLogadoService->getIdCadastroLogado()) {

            $this->_gradeRepositoryService->update([
                'ativo' => 0,  "id_usuario_alterou" => $this->_usuarioLogadoService->getIdUsuarioLogado()
            ], $grade->id_grade);
        }
    }

    public function vincularImagemGrade(Grade $grade, Request $request)
    {
        if (!$request->hasFile("image")) {
            throw new ApiWebControlException("É obrigatório o envio da imagem da grade");
        }

        if (!$request->file("image")->isValid()) {
            throw new ApiWebControlException("Ocorreu um erro durante o envio da imagem da grade");
        }

        if ($request->file("image")->getSize() > 5000000 /*5MB*/) {
            throw new ApiWebControlException("A imagem deve ter no máximo 5 Megabytes (5MB)");
        }

        // Retorna mime type do arquivo (Exemplo image/png)
        if (!in_array($request->image->getMimeType(), ['image/gif', 'image/jpeg', 'image/jpg', 'image/png'])) {
            throw new ApiWebControlException("Formato de arquivo inválido, favor anexar arquivo em formato git,jpeg, jpg ou png");
        }

        $name = md5(uniqid(time()));

        // Recupera a extensão do arquivo
        $extension = $request->image->extension();

        $upload = $request->image->storeAs('fotos_grade/' . $this->_usuarioLogadoService->getIdCadastroLogado(), "{$name}.{$extension}");
        if (!$upload) {
            throw new ApiWebControlException("Erro ao gravar a imagem no servidor");
        }
        $this->_gradeRepositoryService->vincularFoto($grade->id, "{$name}.{$extension}");
    }

    public function excluirFotoGrade(GradeFoto $gradeFoto)
    {
        $caminho = "storage/fotos_grade/".$this->_usuarioLogadoService->getIdCadastroLogado()."/".$gradeFoto->caminho_imagem;
        if(file_exists($caminho)){
            unset($caminho);     
        }
        $this->_gradeRepositoryService->excluirFoto($gradeFoto->id, $gradeFoto->id);
    }
}
