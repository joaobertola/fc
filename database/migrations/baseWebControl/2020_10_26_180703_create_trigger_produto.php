<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTriggerProduto extends Migration
{
    /**
    * Run the migrations.
    *
    * @return void
    */
   public function up()
   {
       DB::unprepared("
       CREATE TRIGGER `base_web_control`.`tgr_produto_ins`
       AFTER INSERT ON `base_web_control`.`produto`
       FOR EACH ROW
     BEGIN
        
                     DECLARE id_grade_new INT;
                    
                     SET id_grade_new = (SELECT id_grade FROM grade WHERE id_produto = NEW.id and codigo_barra = new.codigo_barra);
                    
                     IF id_grade_new IS NULL THEN
                    
                                    INSERT INTO grade(
                                                                       id_cadastro,
                                                                       id_produto,
                                                                       codigo_barra_pai,
                                                                       codigo_barra,
                                                                       codigo_interno,
                                                                       valor_custo,
                                                                       valor_varejo_aprazo,
                                                                       valor_atacado_aprazo,
                                                                       qtd_minima,
                                                                       qtd_locacao,
                                                                       porc_varejo_aprazo,
                                                                       id_usuario_alterou,
                                                                                                                                         data_alteracao
                                                                      )
                                    VALUES(
                                                    NEW.id_cadastro,
                                                    NEW.id,
                                                    NEW.codigo_barra,
                                                    NEW.codigo_barra,
                                                    NEW.identificacao_interna,
                                                    NEW.custo,
                                                    NEW.custo_medio_venda,
                                                    NEW.custo_medio_venda_atacado,
                                                    NEW.qtd_minima,
                                                    NEW.locacao_quantidade,
                                                    ((NEW.custo_medio_venda / NEW.custo) * 100) - 100,
                                                    NEW.id_usuario,
                                                                                                  NOW());
                                   
                     ELSE
                    
                                    UPDATE
                                                    grade
                                    SET ativo = 1,
                        id_usuario_alterou = NEW.id_usuario
                                    WHERE id_produto = NEW.id;
                    
                    
                     END IF;
                     
                     
                     
     END
       ");
   }

   /**
    * Reverse the migrations.
    *
    * @return void
    */
   public function down()
   {
       DB::unprepared('DROP TRIGGER base_web_control.tgr_produto_ins');
   }
}
