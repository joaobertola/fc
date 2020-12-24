# Host: 10.2.2.3  (Version 5.7.20-log)
# Date: 2020-12-24 10:53:15
# Generator: MySQL-Front 6.0  (Build 2.20)


CREATE DATABASE IF NOT EXISTS `base_web_control`;

#
# Structure for table "acesso_filiacao"
#

CREATE TABLE `base_web_control`.`acesso_filiacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_matriz_filial` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned NOT NULL,
  `id_cadastro_filial` int(10) DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `cpf_funcionario` varchar(12) DEFAULT NULL,
  `permissoes` varchar(1000) DEFAULT NULL COMMENT 'lista de ids de permissoes do usuario, concatenado com ;',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usuario_alteracao` int(10) unsigned NOT NULL,
  `ativo` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '0 - inativo, 1 - ativo',
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1325719 DEFAULT CHARSET=latin1;

#
# Structure for table "agenda"
#

CREATE TABLE `base_web_control`.`agenda` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `codloja` int(11) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `allday` tinyint(1) DEFAULT NULL,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_parceiro` int(11) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`evento_id`),
  KEY `fk_agenda` (`codloja`)
) ENGINE=InnoDB AUTO_INCREMENT=53606717 DEFAULT CHARSET=latin1;

#
# Structure for table "agenda_usuario_parceiro"
#

CREATE TABLE `base_web_control`.`agenda_usuario_parceiro` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Telefone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8;

#
# Structure for table "agendamento_tarefa"
#

CREATE TABLE `base_web_control`.`agendamento_tarefa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned NOT NULL,
  `informacoes` json NOT NULL,
  `status` enum('A','C','R','F') NOT NULL DEFAULT 'A' COMMENT 'A - Aguardando\nC - Cancelado\nR - Recorrente\nF - Finalizado',
  `data_agendamento` datetime NOT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT NULL,
  `data_concluido` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idx_id_cadastro` (`id_cadastro`),
  KEY `idx_data_agendamento_status` (`data_agendamento`,`status`),
  KEY `idx_status` (`status`),
  KEY `idx_data_agendamento` (`data_agendamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2378 DEFAULT CHARSET=latin1;

#
# Structure for table "agendamento_tarefa_log"
#

CREATE TABLE `base_web_control`.`agendamento_tarefa_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `data_envio` datetime DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24405 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_garantia` int(11) DEFAULT NULL,
  `aparelho` varchar(255) DEFAULT NULL,
  `marca` int(11) DEFAULT NULL,
  `modelo` varchar(255) DEFAULT NULL,
  `n_serie` varchar(255) DEFAULT NULL,
  `voltagem` int(11) DEFAULT NULL,
  `servico` longtext,
  `servico_prazo` date DEFAULT NULL,
  `defeitos` longtext,
  `acessorios` longtext,
  `observacao` longtext,
  `status` int(11) DEFAULT '0' COMMENT '0    ''Em Andamento'',\\n1   ''Aguardando Peças'',\\n2    ''Liberado para Entrega'',\\n3   ''Finalizado'',\\n4    ''Aguardando Aprovação'',\\n5    ''Aprovado'',\\n6    ''Não Aprovado'', 7  ''aguardando avaliacao'' ',
  `data_cadastro` datetime DEFAULT NULL,
  `delete_date` datetime DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60892 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica_conclusao"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_conclusao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_assistencia` int(11) DEFAULT NULL,
  `conclusao` longtext,
  `id_funcionario` int(11) DEFAULT NULL,
  `valor` float DEFAULT NULL,
  `save_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35808 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica_garantia"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_garantia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='	';

#
# Structure for table "assistencia_tecnica_marcas"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4414 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica_observacoes"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_observacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `apelido` varchar(150) DEFAULT NULL,
  `descricao` text,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica_produtos"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_assistencia` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `insert_date` datetime DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6592 DEFAULT CHARSET=latin1;

#
# Structure for table "assistencia_tecnica_voltagem"
#

CREATE TABLE `base_web_control`.`assistencia_tecnica_voltagem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "atendimento"
#

CREATE TABLE `base_web_control`.`atendimento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_cliente` int(10) unsigned DEFAULT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL,
  `descricao_atendimento` text,
  `id_tipo_atendimento` int(10) unsigned DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_cliente`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_cliente` (`id_cliente`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=684472 DEFAULT CHARSET=latin1;

#
# Structure for table "atendimento_fornecedor"
#

CREATE TABLE `base_web_control`.`atendimento_fornecedor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL,
  `descricao_atendimento` text,
  `id_tipo_atendimento` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

#
# Structure for table "atendimento_funcionario"
#

CREATE TABLE `base_web_control`.`atendimento_funcionario` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL,
  `descricao_atendimento` text,
  `id_tipo_atendimento` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8;

#
# Structure for table "atendimento_tipo"
#

CREATE TABLE `base_web_control`.`atendimento_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Structure for table "atendimento_transportadora"
#

CREATE TABLE `base_web_control`.`atendimento_transportadora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_transportadora` int(11) DEFAULT NULL,
  `data_atendimento` date DEFAULT NULL,
  `hora_atendimento` time DEFAULT NULL,
  `descricao_atendimento` text,
  `id_tipo_atendimento` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

#
# Structure for table "autor"
#

CREATE TABLE `base_web_control`.`autor` (
  `cod_autor` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `nascimento` date NOT NULL,
  PRIMARY KEY (`cod_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "autorizacao_cielo"
#

CREATE TABLE `base_web_control`.`autorizacao_cielo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venda_id` int(11) DEFAULT NULL,
  `tid` varchar(50) DEFAULT NULL,
  `data_autenticacao` date DEFAULT NULL,
  `hora_autenticacao` time DEFAULT NULL,
  `dt_autorizacao` date DEFAULT NULL,
  `hora_autorizacao` time DEFAULT NULL,
  `data_captura` date DEFAULT NULL,
  `hora_captura` time DEFAULT NULL,
  `status` enum('A','R','C','N','X') DEFAULT 'A' COMMENT 'Aguardando, Realizado, Confirmado, Negada, X=Cancelado',
  `ip_autorizacao` varchar(15) DEFAULT NULL,
  `xml_retorno` longtext,
  `valor` varchar(15) DEFAULT NULL,
  `data_postagem` date DEFAULT NULL,
  `nr_objeto_correio` varchar(20) DEFAULT NULL,
  `funcionario_id_correio` int(11) DEFAULT NULL,
  `funcionario_id_estorno` int(11) DEFAULT NULL,
  `data_estorno` date DEFAULT NULL,
  `obs_estorno` text,
  `vencimento_bol` date DEFAULT NULL,
  `funcionario_id_cancelamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_tid` (`tid`),
  KEY `fk_venda_id` (`venda_id`),
  KEY `fk_funcionario_id_correio` (`funcionario_id_correio`),
  KEY `fk_funcionario_id_estorno` (`funcionario_id_estorno`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;

#
# Structure for table "aux_venda_faturado_impressao"
#

CREATE TABLE `base_web_control`.`aux_venda_faturado_impressao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `impresso` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2909 DEFAULT CHARSET=latin1;

#
# Structure for table "auxiliar_envio_sms"
#

CREATE TABLE `base_web_control`.`auxiliar_envio_sms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(255) DEFAULT NULL,
  `cod_campanha` varchar(11) DEFAULT NULL,
  `data_envio` varchar(50) DEFAULT NULL,
  `codigo_status` varchar(10) DEFAULT NULL COMMENT 'T - Sucesso, F - Falha',
  `status` varchar(30) DEFAULT NULL,
  `origem` varchar(10) DEFAULT NULL COMMENT 'S - Recebida, E - Enviada',
  `celular` varchar(255) DEFAULT NULL,
  `mensagem` text,
  `servidor_saida` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_data_envio` (`data_envio`),
  KEY `idx_celular` (`celular`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "auxiliar_importacao_produto"
#

CREATE TABLE `base_web_control`.`auxiliar_importacao_produto` (
  `id_cadastro` int(11) DEFAULT NULL,
  `data_hora_importacao` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "banco"
#

CREATE TABLE `base_web_control`.`banco` (
  `id` char(3) NOT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `logo` text,
  `habilitado_wc` enum('S','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "boleto_doc"
#

CREATE TABLE `base_web_control`.`boleto_doc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codloja` int(11) DEFAULT NULL,
  `numdoc` varchar(105) DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `log_ref` int(11) DEFAULT NULL COMMENT '1 - log boleto gerado  (inform/boleto/boleto-log.php)',
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12268 DEFAULT CHARSET=latin1;

#
# Structure for table "cadastro"
#

CREATE TABLE `base_web_control`.`cadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razaosoc` varchar(60) NOT NULL DEFAULT '',
  `insc` varchar(14) NOT NULL DEFAULT '',
  `nomefantasia` varchar(50) DEFAULT NULL,
  `uf` char(2) NOT NULL DEFAULT '',
  `cidade` varchar(30) NOT NULL DEFAULT '',
  `bairro` varchar(30) NOT NULL DEFAULT '',
  `end` varchar(60) NOT NULL DEFAULT '',
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(30) DEFAULT NULL,
  `cep` varchar(10) NOT NULL DEFAULT '',
  `fone` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `email2` varchar(60) DEFAULT NULL,
  `tx_mens` decimal(5,2) NOT NULL DEFAULT '0.00',
  `tx_adesao` decimal(6,2) NOT NULL DEFAULT '0.00',
  `debito` enum('B','A') NOT NULL DEFAULT 'B',
  `boleto` decimal(4,2) NOT NULL DEFAULT '0.00',
  `carteira` tinyint(4) NOT NULL DEFAULT '0',
  `diapagto` tinyint(4) NOT NULL DEFAULT '0',
  `id_franquia` bigint(20) NOT NULL DEFAULT '0',
  `codv` int(5) NOT NULL DEFAULT '0',
  `dt_cad` date NOT NULL DEFAULT '0000-00-00',
  `dt_exp` date NOT NULL DEFAULT '0000-00-00',
  `dt_recis` date DEFAULT NULL,
  `sitcli` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0 - Ativo  1 - Bloqueado  2 - Cancelado  3 - Bloqueio Virtual',
  `obs` longtext,
  `tx_renpac` decimal(4,2) DEFAULT NULL,
  `classificacao` varchar(25) NOT NULL DEFAULT 'Mensal',
  `classe` int(3) DEFAULT '0',
  `tit_atrazado` int(1) NOT NULL DEFAULT '0',
  `codf` int(5) NOT NULL DEFAULT '0',
  `contrato` varchar(20) NOT NULL DEFAULT '',
  `id_ramo` int(5) DEFAULT NULL,
  `registro` varchar(15) NOT NULL DEFAULT '',
  `origem` int(3) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `id_operadora` int(11) DEFAULT NULL,
  `fone_res` varchar(15) DEFAULT NULL,
  `socio1` varchar(35) DEFAULT NULL,
  `socio2` varchar(35) DEFAULT NULL,
  `cpfsocio1` varchar(14) DEFAULT NULL,
  `cpfsocio2` varchar(14) DEFAULT NULL,
  `emissao_financeiro` int(1) DEFAULT '1',
  `pendencia_contratual` int(1) DEFAULT '1',
  `dt_regularizacao` date DEFAULT NULL,
  `sit_cobranca` int(1) DEFAULT '0',
  `vendedor` varchar(20) DEFAULT NULL,
  `ramo_atividade` varchar(25) DEFAULT NULL,
  `banco_cliente` int(3) DEFAULT NULL,
  `agencia_cliente` varchar(5) DEFAULT NULL,
  `conta_cliente` varchar(20) DEFAULT NULL,
  `tpconta` int(1) NOT NULL DEFAULT '1' COMMENT '1-conta corrente; 2-poupança',
  `cpfcnpj_doc` varchar(20) DEFAULT NULL,
  `nome_doc` varchar(60) DEFAULT NULL,
  `tx_mens_anterior` decimal(5,2) NOT NULL DEFAULT '0.00',
  `qtd_acessos` bigint(10) unsigned NOT NULL DEFAULT '0',
  `fx_inicio` varchar(10) DEFAULT NULL,
  `fx_final` varchar(10) DEFAULT NULL,
  `logomarca` blob,
  `tx_extra` enum('SIM','NAO') DEFAULT 'SIM',
  `ctrl_neg_equifax` int(11) DEFAULT '0',
  `renegociacao_tabela` date DEFAULT NULL,
  `id_franquia_jr` bigint(5) DEFAULT '0',
  `liberado_web_control` enum('S','N') DEFAULT 'N',
  `dt_libera_web` date DEFAULT NULL,
  `hora_cadastro` time DEFAULT NULL,
  `atendente_resp` varchar(100) DEFAULT NULL,
  `mensalidade_solucoes` decimal(12,2) DEFAULT '19.90' COMMENT 'Licença Mensal - Software e Soluções',
  `senha_baixatitulo` bigint(6) DEFAULT '0',
  `codigo_equifax` bigint(12) DEFAULT NULL,
  `cx_equifax_usuario` bigint(8) DEFAULT NULL,
  `cx_equifax_senha` varchar(8) DEFAULT NULL,
  `inscricao_estadual` varchar(14) DEFAULT NULL,
  `cnae_fiscal` varchar(7) DEFAULT NULL,
  `inscricao_municipal` varchar(14) DEFAULT NULL,
  `inscricao_estadual_tributario` varchar(14) DEFAULT NULL,
  `numero_endereco` varchar(10) DEFAULT NULL,
  `tipo_cliente` enum('A','N') DEFAULT 'N' COMMENT 'A-Administrador  N-Normal',
  `liberado_contabil` enum('S','N') DEFAULT 'N',
  `dt_libera_contabil` date DEFAULT NULL,
  `dt_pgto_comissao_vendedor` date DEFAULT NULL,
  `valor_comissao_vendedor` decimal(10,2) DEFAULT '0.00',
  `dt_atualizacao_email` date DEFAULT NULL,
  `ecommerce` enum('S','N') DEFAULT 'N',
  `dt_envio_email_cobranca` date DEFAULT NULL,
  `dt_atualizacao_virtual` date DEFAULT NULL,
  `permissao_acesso_pp` enum('0','1') DEFAULT '1' COMMENT '0 - Liberado  - 1 - Negado',
  `pendencia_contrato` int(1) DEFAULT '0' COMMENT '0 - Normal   1 - Pendente',
  `dt_pgto_fixo` date DEFAULT NULL,
  `vr_pgto_fixo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `data_consultoria` date DEFAULT NULL,
  `nome_consultoria` varchar(30) DEFAULT NULL,
  `regime_tributacao` int(1) DEFAULT '0' COMMENT '0 - Tributacao Normal      1 - Simples Nacional  2 - Simples Nacional  / Excesso sublime  de receita bruta',
  `liberar_nfe` enum('S','N') DEFAULT 'N' COMMENT 'Liberar acesso a NFe',
  `tipo_nfe` enum('NFe','NFCe') DEFAULT NULL,
  `emitir_nfs` enum('S','N') DEFAULT 'N',
  `status_nfe` enum('H','P','N') DEFAULT 'N' COMMENT 'H - Homologação   P- Produção',
  `vr_max_limite_crediario` decimal(12,2) DEFAULT '5000.00',
  `limite_credito` decimal(12,2) unsigned NOT NULL DEFAULT '0.00',
  `limite_credito_liberado` enum('S','N') DEFAULT 'N',
  `user_pendencia` int(11) NOT NULL DEFAULT '0',
  `qtd_pdv_caixa` int(1) DEFAULT '1',
  `qtd_codigo_coluna_balanca` int(1) DEFAULT '4',
  `nfe` enum('S','N') DEFAULT 'N',
  `nfce` enum('S','N') DEFAULT 'N',
  `cte` enum('S','N') DEFAULT 'N',
  `nfse` enum('S','N') DEFAULT 'N',
  `cfiscal` enum('S','N') DEFAULT 'N',
  `mdfe` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(2) DEFAULT '2',
  `contador_nome` varchar(50) NOT NULL,
  `contador_telefone` varchar(15) NOT NULL,
  `contador_celular` varchar(15) NOT NULL,
  `contador_email1` varchar(100) NOT NULL,
  `contador_email2` varchar(100) NOT NULL,
  `contador_cpfcnpj` varchar(20) DEFAULT NULL,
  `contador_crc` varchar(25) DEFAULT NULL,
  `contador_cep` varchar(10) DEFAULT NULL,
  `contador_endereco` varchar(60) DEFAULT NULL,
  `contador_numero` varchar(10) DEFAULT NULL,
  `contador_complemento` varchar(30) DEFAULT NULL,
  `contador_bairro` varchar(30) DEFAULT NULL,
  `contador_cod_mun` varchar(10) DEFAULT NULL,
  `multa_contratual` int(1) DEFAULT '0' COMMENT '0 - Nao - 1 Sim',
  `iss_padrao` varchar(9) DEFAULT 'ABRASF',
  `dt_pgto_adesao` date DEFAULT NULL,
  `vr_pgto_adesao` decimal(10,2) DEFAULT '0.00',
  `contadorSN` enum('S','N') DEFAULT 'N',
  `baixa_automatica` enum('S','N') NOT NULL DEFAULT 'S' COMMENT 'CAMPO USADO PARA DAR BAIXA AUTOMATICA NAS CONTAS A RECEBER QUANDO FOR CARTAO DE CREDITO OU CHEQUE',
  `agendador` varchar(255) DEFAULT NULL,
  `id_consultor` bigint(11) NOT NULL,
  `id_agendador` bigint(11) NOT NULL,
  `liberacao_receita_nfc` enum('S','N') DEFAULT 'N',
  `liberacao_receita_nfe` enum('S','N') DEFAULT 'N',
  `hash` varchar(60) DEFAULT NULL,
  `vr_pgto_comissao` decimal(10,2) DEFAULT NULL,
  `dt_pgto_comissao` datetime DEFAULT NULL,
  `compartilhar_comanda` enum('S','N') DEFAULT 'N' COMMENT 'FLAG PARA COMPARTILHAMENTO DE COMANDA ENTRE MAIS DE UMA PESSOA',
  `pendencia_frente_caixa` tinyint(4) DEFAULT '0',
  `cnpj_empresa_faturar` varchar(14) DEFAULT NULL,
  `flag_resp_pgto1` char(1) DEFAULT '0' COMMENT '0-False 1-True',
  `flag_resp_pgto2` char(1) DEFAULT '0' COMMENT '0-False 1-True',
  `flag_resp_pgto3` char(1) DEFAULT '0' COMMENT '0-False 1-True',
  `nom_resp_pgto1` varchar(40) DEFAULT NULL,
  `nom_resp_pgto2` varchar(40) DEFAULT NULL,
  `nom_resp_pgto3` varchar(40) DEFAULT NULL,
  `data_sync_inativo` datetime DEFAULT NULL,
  `nfs_wc_obrigatorio` enum('S','N') DEFAULT 'N',
  `email_host_server` varchar(60) DEFAULT NULL,
  `email_password` varchar(30) DEFAULT NULL,
  `blq_pendencia_senha` int(1) DEFAULT '0' COMMENT '0 - Bloqueado - 1 Liberado',
  PRIMARY KEY (`id`),
  KEY `cad_02` (`razaosoc`),
  KEY `cad_03` (`nomefantasia`),
  KEY `fk_pagto` (`banco_cliente`,`agencia_cliente`,`conta_cliente`),
  KEY `cad_04` (`id_franquia`),
  KEY `fk_cad05` (`fone`,`fax`,`celular`,`fone_res`),
  KEY `fk_cad06` (`dt_cad`,`vendedor`),
  KEY `fk_contador` (`contador_cpfcnpj`),
  KEY `idx_insc` (`insc`),
  KEY `fk003` (`id_consultor`)
) ENGINE=MyISAM AUTO_INCREMENT=78243 DEFAULT CHARSET=utf8 ROW_FORMAT=FIXED;

#
# Structure for table "cadastro_aut_notas"
#

CREATE TABLE `base_web_control`.`cadastro_aut_notas` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `cpfcnpj` bigint(20) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `tipo_doc` enum('1','2') DEFAULT '2' COMMENT '1-CPF     2-CNPJ',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `fk_002` (`id_cadastro`,`cpfcnpj`),
  KEY `fk_001` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=latin1;

#
# Structure for table "cadastro_controles"
#

CREATE TABLE `base_web_control`.`cadastro_controles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL DEFAULT '0',
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK001` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=23939 DEFAULT CHARSET=latin1;

#
# Structure for table "cadastro_convenio_bancario"
#

CREATE TABLE `base_web_control`.`cadastro_convenio_bancario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_banco` char(3) NOT NULL DEFAULT '0',
  `carteira` int(11) NOT NULL,
  `agencia` varchar(11) NOT NULL DEFAULT '0',
  `agencia_dv` char(1) DEFAULT NULL,
  `conta` int(11) unsigned NOT NULL,
  `conta_dv` int(11) unsigned NOT NULL,
  `seq_boleto` int(11) DEFAULT '1',
  `ativo` bit(1) DEFAULT b'0',
  `cod_convenio` int(11) unsigned DEFAULT NULL,
  `chave_crypto` varchar(245) DEFAULT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` datetime DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_usuario_atualizacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_banco`,`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1 COMMENT='Tabela responsável por cadastrar os convenios das empresas, menu Dados Empresáriais.';

#
# Structure for table "cadastro_imposto_padrao"
#

CREATE TABLE `base_web_control`.`cadastro_imposto_padrao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `origem_nfe` int(1) DEFAULT '0',
  `cfop_dentro_estado` varchar(6) NOT NULL DEFAULT '',
  `cfop_fora_estado` varchar(6) NOT NULL DEFAULT '',
  `tipo_imposto` enum('ICMS','ISSQN') DEFAULT 'ICMS',
  `icms` int(6) DEFAULT NULL,
  `icms_modbc` char(1) DEFAULT NULL,
  `icms_predbc` decimal(10,3) DEFAULT NULL,
  `icms_pICMS` decimal(10,4) DEFAULT NULL,
  `icms_modbcst` char(1) DEFAULT NULL,
  `icms_pmvast` decimal(10,3) DEFAULT NULL,
  `icms_predbcst` decimal(10,3) DEFAULT NULL,
  `icms_picmsst` decimal(10,4) DEFAULT NULL,
  `icms_regimes` enum('T','S') DEFAULT 'T',
  `icms_popepropria` decimal(10,3) DEFAULT NULL,
  `icms_uf` char(2) DEFAULT NULL,
  `icms_vl_aliq_calc_cre` decimal(10,3) DEFAULT NULL,
  `icms_bc_icms_st_ret_ant` decimal(10,3) DEFAULT NULL,
  `icms_valor_desoneracao` decimal(10,2) DEFAULT NULL,
  `icms_motivo_desoneracao` varchar(60) DEFAULT NULL,
  `icms_percentual_diferimento` decimal(10,2) DEFAULT NULL,
  `icms_st_uf_retido_remetente` char(2) DEFAULT NULL,
  `icms_st_uf_destino` char(2) DEFAULT NULL,
  `ipi` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  `ipi_cIEnq` char(5) DEFAULT NULL,
  `ipi_CNPJProd` char(14) DEFAULT NULL,
  `ipi_cSelo` varchar(60) DEFAULT NULL,
  `ipi_qSelo` double DEFAULT NULL,
  `ipi_cEnq` char(3) DEFAULT NULL,
  `ipi_qUnid` double DEFAULT NULL,
  `ipi_pIPI` decimal(10,2) DEFAULT NULL,
  `ipi_tp_calculo` enum('P','V') DEFAULT 'P',
  `ipi_v_aliq` decimal(10,2) DEFAULT NULL,
  `pis` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  `pis_tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `pis_pPIS` decimal(10,2) DEFAULT NULL,
  `pis_v_aliq` decimal(10,2) DEFAULT NULL,
  `pisST_tp_calculo` char(1) DEFAULT 'N' COMMENT 'N-Nulo   P - Percentual   V - Valor',
  `pisST_pPIS` decimal(10,2) DEFAULT NULL,
  `pisST_v_aliq` decimal(10,2) DEFAULT NULL,
  `cofins` int(2) unsigned zerofill NOT NULL DEFAULT '00',
  `cofins_tpcalculo` enum('P','V') DEFAULT NULL,
  `cofins_aliq_perc` decimal(10,2) DEFAULT NULL,
  `cofins_aliq_vlr` decimal(10,2) DEFAULT NULL,
  `cofins_st_tpcalculo` enum('P','V') DEFAULT NULL,
  `cofins_st_aliq_perc` decimal(10,2) DEFAULT NULL,
  `cofins_st_aliq_vlr` decimal(10,2) DEFAULT NULL,
  `regime_tributacao` char(1) NOT NULL DEFAULT '',
  `issqn_regime_tributacao` char(1) DEFAULT NULL,
  `issqn_percentual_aliquota` decimal(12,2) DEFAULT NULL,
  `issqn_uf` char(2) DEFAULT NULL,
  `issqn_id_municipio` char(7) DEFAULT NULL,
  `issqn_id_lista_servicos` varchar(4) DEFAULT NULL,
  `issqn_id_exigibilidade` int(11) DEFAULT NULL,
  `issqn_incentivo_fiscal` enum('S','N') DEFAULT 'S',
  `issqn_valor_deducoes` decimal(10,2) DEFAULT NULL,
  `issqn_valor_outras_retencoes` decimal(10,2) DEFAULT NULL,
  `issqn_valor_desconto_condicionado` decimal(10,2) DEFAULT NULL,
  `issqn_valor_retencao` decimal(10,2) DEFAULT NULL,
  `issqn_codigo_servico` varchar(60) DEFAULT NULL,
  `issqn_uf_incidencia` char(2) DEFAULT NULL,
  `issqn_id_municipio_incidencia` int(11) DEFAULT NULL,
  `issqn_processo` varchar(60) DEFAULT NULL,
  `issqn_situacao` enum('tp','tt','tf','is','nt','si','ca') DEFAULT 'tp',
  `issqn_cmc` varchar(20) DEFAULT NULL,
  `issqn_cpf` varchar(20) DEFAULT NULL,
  `issqn_senha_cmc_cpf` varchar(40) DEFAULT NULL,
  `issqn_padrao` varchar(55) DEFAULT NULL,
  `issqn_assinar_nfs` enum('S','N') DEFAULT NULL,
  `issqn_info_nota_fiscal` longtext,
  `cfop_dev_d` varchar(6) DEFAULT NULL,
  `cfop_dev_f` varchar(6) DEFAULT NULL,
  `cfop_dev_gar_d` varchar(6) DEFAULT NULL,
  `cfop_dev_gar_f` varchar(6) DEFAULT NULL,
  `cfop_dev_out_d` varchar(6) DEFAULT NULL,
  `cfop_dev_out_f` varchar(6) DEFAULT NULL,
  `cfop_ent_d` varchar(6) DEFAULT NULL,
  `cfop_ent_f` varchar(6) DEFAULT NULL,
  `nome_arquivo_certificado` varchar(200) NOT NULL,
  `senha_certificado` varchar(50) NOT NULL,
  `nfe_tipo_ambiente` enum('P','H') DEFAULT 'P',
  `nfe_sequencia_nota` int(11) DEFAULT '1',
  `nfe_formato` enum('R','P') DEFAULT 'P',
  `nfce_tipo_ambiente` enum('P','H') DEFAULT 'P',
  `nfce_sequencia_nota` int(11) DEFAULT '1',
  `nfce_csc_token` varchar(50) DEFAULT NULL,
  `nfce_idtoken` varchar(50) DEFAULT NULL,
  `nfce_data_ativacao` date DEFAULT NULL,
  `nfce_hora_ativacao` time DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `tributacao_lucro` enum('S','N') DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `solicitar_cod_cartao` tinyint(4) DEFAULT '1',
  `relatorio_mensal` int(11) DEFAULT '0',
  `issqn_codigo_obra` varchar(8) DEFAULT NULL,
  `issqn_serie_nf` varchar(5) DEFAULT NULL,
  `issqn_cod_ativ_mun` varchar(5) DEFAULT NULL,
  `issqn_anocertificado` int(4) DEFAULT '2016',
  `calcular_difal` int(1) DEFAULT '1' COMMENT '1-Sim, 0-Nao',
  `nfce_serie` int(2) DEFAULT '1',
  `nfe_serie` int(2) DEFAULT '1',
  `xPed` enum('S','N') DEFAULT 'N',
  `codBenef` varchar(10) DEFAULT NULL COMMENT 'Codigo Beneficiario, usado para cliente do Regime Normal',
  `cte_tipo_ambiente` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - Producao 2 - Homologacao',
  `cte_sequencia_nota` int(11) NOT NULL,
  `cte_formato` enum('P','H') NOT NULL DEFAULT 'P' COMMENT 'P - Producao H - Homologacao',
  `cte_serie` int(2) NOT NULL,
  `mdfe_tipo_ambiente` enum('1','2') NOT NULL DEFAULT '1' COMMENT '1 - Producao 2 - Homologacao',
  `mdfe_sequencia_nota` int(11) NOT NULL,
  `mdfe_formato` enum('P','H') NOT NULL DEFAULT 'P' COMMENT 'P - Producao H - Homologacao',
  `mdfe_serie` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cadimp01` (`id_cadastro`),
  KEY `fk_cadimp02` (`id_usuario`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=8213 DEFAULT CHARSET=latin1;

#
# Structure for table "cadastro_imposto_padrao_hist"
#

CREATE TABLE `base_web_control`.`cadastro_imposto_padrao_hist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `origem_nfe` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `origem_nfe_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dentro_estado` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dentro_estado_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_fora_estado` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_fora_estado_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `tipo_imposto` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `tipo_imposto_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_modbc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_modbc_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_predbc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_predbc_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_pICMS` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_pICMS_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_modbcst` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_modbcst_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_pmvast` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_pmvast_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_predbcst` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_predbcst_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_picmsst` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_picmsst_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_regimes` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_regimes_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_popepropria` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_popepropria_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_uf` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_uf_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_vl_aliq_calc_cre` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_vl_aliq_calc_cre_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_bc_icms_st_ret_ant` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_bc_icms_st_ret_ant_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_valor_desoneracao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_valor_desoneracao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_motivo_desoneracao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_motivo_desoneracao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_percentual_diferimento` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_percentual_diferimento_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_st_uf_retido_remetente` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_st_uf_retido_remetente_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_st_uf_destino` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `icms_st_uf_destino_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cIEnq` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cIEnq_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_CNPJProd` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_CNPJProd_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cSelo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cSelo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_qSelo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_qSelo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cEnq` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_cEnq_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_qUnid` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_qUnid_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_pIPI` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_pIPI_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_tp_calculo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_tp_calculo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_v_aliq` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `ipi_v_aliq_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_tp_calculo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_tp_calculo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_pPIS` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_pPIS_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_v_aliq` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pis_v_aliq_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_tp_calculo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_tp_calculo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_pPIS` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_pPIS_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_v_aliq` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `pisST_v_aliq_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_tpcalculo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_tpcalculo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_aliq_perc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_aliq_perc_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_aliq_vlr` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_aliq_vlr_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_tpcalculo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_tpcalculo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_aliq_perc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_aliq_perc_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_aliq_vlr` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cofins_st_aliq_vlr_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `regime_tributacao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `regime_tributacao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_regime_tributacao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_regime_tributacao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_percentual_aliquota` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_percentual_aliquota_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_uf` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_uf_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_municipio` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_municipio_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_lista_servicos` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_lista_servicos_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_exigibilidade` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_exigibilidade_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_incentivo_fiscal` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_incentivo_fiscal_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_deducoes` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_deducoes_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_outras_retencoes` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_outras_retencoes_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_desconto_condicionado` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_desconto_condicionado_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_retencao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_valor_retencao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_codigo_servico` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_codigo_servico_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_uf_incidencia` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_uf_incidencia_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_municipio_incidencia` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_id_municipio_incidencia_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_processo` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_processo_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_situacao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_situacao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_cmc` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_cmc_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_cpf` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_cpf_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_senha_cmc_cpf` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_senha_cmc_cpf_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_padrao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_padrao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_assinar_nfs` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `issqn_assinar_nfs_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_d` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_d_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_f` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_f_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_gar_d` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_gar_d_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_gar_f` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_gar_f_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_out_d` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_out_d_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_out_f` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_dev_out_f_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_ent_d` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_ent_d_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_ent_f` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `cfop_ent_f_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nome_arquivo_certificado` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nome_arquivo_certificado_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `senha_certificado` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `senha_certificado_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_tipo_ambiente` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_tipo_ambiente_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_sequencia_nota` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_sequencia_nota_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_formato` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfe_formato_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_tipo_ambiente` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_tipo_ambiente_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_sequencia_nota` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_sequencia_nota_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_csc_token` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_csc_token_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_idtoken` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_idtoken_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_data_ativacao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_data_ativacao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_hora_ativacao` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `nfce_hora_ativacao_old` varchar(50) CHARACTER SET utf8 DEFAULT '',
  `id_usuario` int(11) DEFAULT '0',
  `id_cadastro` int(11) DEFAULT '0',
  `data_alteracao` datetime DEFAULT NULL,
  `solicitar_cod_cartao` int(11) DEFAULT NULL,
  `solicitar_cod_cartao_old` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262932 DEFAULT CHARSET=latin1;

#
# Structure for table "campanhas_log"
#

CREATE TABLE `base_web_control`.`campanhas_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_campanha` int(11) NOT NULL DEFAULT '0',
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_campanha` enum('E','T','W') NOT NULL COMMENT 'e = email, t = torpedo, w = whatsapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=latin1 COMMENT='Registro de campanhas: emails mkt, whatsapp mkt e torpedo mkt';

#
# Structure for table "cargo"
#

CREATE TABLE `base_web_control`.`cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` enum('S','N') DEFAULT NULL,
  `id_setor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=703 DEFAULT CHARSET=latin1;

#
# Structure for table "carne"
#

CREATE TABLE `base_web_control`.`carne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `num_contrato` varchar(20) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `vencimento` date NOT NULL,
  `parcela` varchar(7) NOT NULL,
  `multa_atraso` decimal(4,2) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `observacoes` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_baixa` datetime DEFAULT NULL,
  `valor_baixa` decimal(15,2) DEFAULT NULL,
  `id_usuario_baixa` int(11) DEFAULT NULL,
  `situacao` enum('P','I','B') NOT NULL DEFAULT 'P' COMMENT 'P - Pendente  I - Inativo  B - Baixado',
  `id_abertura_caixa` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `taxa_juros` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_cadastro`),
  KEY `idx_id_off` (`id_off`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_cliente` (`id_cliente`),
  KEY `idx_idvenda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=74029 DEFAULT CHARSET=latin1;

#
# Structure for table "carrinho"
#

CREATE TABLE `base_web_control`.`carrinho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cod` int(11) NOT NULL DEFAULT '0',
  `nome` varchar(150) DEFAULT NULL,
  `preco` double(10,2) NOT NULL DEFAULT '0.00',
  `qtd` int(11) NOT NULL DEFAULT '0',
  `sessao` text,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cartaofid_cartao"
#

CREATE TABLE `base_web_control`.`cartaofid_cartao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_config` int(11) DEFAULT NULL COMMENT 'Id da configuracao tabela config que gerou isso, necessario caso seja modificado o sistema para trabalhar com mais de um modelo por cliente',
  `num_cartao` varchar(30) DEFAULT NULL,
  `cpf_cliente` char(50) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=94499 DEFAULT CHARSET=latin1 COMMENT='Cartoes cadastrados pelos clienteswc';

#
# Structure for table "cartaofid_config"
#

CREATE TABLE `base_web_control`.`cartaofid_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `tipo_cartao` char(1) DEFAULT NULL COMMENT 'P - Premiacao / D - Desconto na compra',
  `tipo_modelo` char(1) DEFAULT NULL COMMENT 'E - Existente / P - Próprio',
  `id_modelo` int(11) DEFAULT NULL,
  `tpd_reais_eq_ponto_compra` decimal(10,2) DEFAULT NULL COMMENT 'X reais na compra equivalem a 1 ponto',
  `tpd_ponto_eq_reais_gasto` decimal(10,2) DEFAULT NULL COMMENT '1 ponto na compra equivale a X reais',
  `min_pontos` int(5) DEFAULT NULL COMMENT 'minimo de pontos para uso como desconto',
  `validade_pontos` int(5) DEFAULT NULL COMMENT 'por quantos dias valem os pontos - validad em dias',
  `regulamento` varchar(255) DEFAULT NULL COMMENT 'regulamento que sera impresso no cartao',
  `informacao_frente` varchar(255) DEFAULT NULL,
  `nome_cartao` varchar(255) DEFAULT NULL,
  `cartoes_gerados` char(5) DEFAULT '0' COMMENT 'tota de cartoes gerados',
  `grafica` char(1) DEFAULT NULL COMMENT '0 - 1 enviado p grafica',
  `dt_grafica` timestamp NULL DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cadastro` (`id_cadastro`),
  KEY `idx_cartao` (`tipo_cartao`),
  KEY `fk_001` (`id_cadastro`,`tipo_cartao`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=latin1 COMMENT='Dados de configiração do cartao do cliente.';

#
# Structure for table "cartaofid_historico"
#

CREATE TABLE `base_web_control`.`cartaofid_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `num_cartao` varchar(30) DEFAULT NULL,
  `pontos_ganhos_venda` decimal(10,2) DEFAULT '0.00' COMMENT 'pontos ganhos nesta venda',
  `pontos_gastos_venda` decimal(10,2) DEFAULT '0.00' COMMENT 'pontos gastos nesta venda',
  `valor_conversao_pr` decimal(10,2) DEFAULT '0.00' COMMENT 'valor base em reais para conversao dos pontos em reais na data de adicao ',
  `pontos_usados` decimal(10,2) DEFAULT '0.00' COMMENT 'pontos reduzidos de outras compras onde foram usados os pontos',
  `status_pontos_venda` char(1) DEFAULT NULL COMMENT 'A - Ativo , I - Inativo (caso a venda seja cancelada os pontos ganhos aqui não são mais válidos)',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk001` (`id_cadastro`),
  KEY `fk002` (`num_cartao`),
  KEY `fk003` (`id_cadastro`,`status_pontos_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=7678 DEFAULT CHARSET=latin1 COMMENT='Historico de uso dos cartoes pelo cliente do cliente wc';

#
# Structure for table "cartaofid_modelo"
#

CREATE TABLE `base_web_control`.`cartaofid_modelo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT '0',
  `imagem_view` varchar(255) DEFAULT NULL,
  `imagem_front` varchar(255) DEFAULT NULL,
  `imagem_back` varchar(255) DEFAULT NULL,
  `tipo_modelo` char(1) DEFAULT NULL COMMENT 'P - Padrão / C - cliente',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=latin1 COMMENT='Modelos de cartoes';

#
# Structure for table "cartaofid_pedido_grafica"
#

CREATE TABLE `base_web_control`.`cartaofid_pedido_grafica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_config` int(11) DEFAULT NULL,
  `qtde_solicitada` char(10) DEFAULT NULL,
  `range_start` char(50) DEFAULT NULL,
  `range_end` char(50) DEFAULT NULL,
  `dt_solicitado` timestamp NULL DEFAULT NULL,
  `resultado_cron` char(5) DEFAULT NULL,
  `dt_update_cron` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=latin1;

#
# Structure for table "catalogo"
#

CREATE TABLE `base_web_control`.`catalogo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slug` varchar(50) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `cod_loja` int(11) DEFAULT NULL,
  `mostrar_foto` int(11) DEFAULT NULL COMMENT '0-1',
  `mostrar_preco` int(11) DEFAULT NULL,
  `mostrar_desc` int(11) DEFAULT NULL,
  `mostrar_grade` int(11) NOT NULL DEFAULT '0',
  `mostrar_estoque` int(11) NOT NULL DEFAULT '0',
  `mostrar_loja_virtual` int(11) NOT NULL DEFAULT '0',
  `pedido_online` int(11) NOT NULL DEFAULT '0',
  `situacao` int(11) DEFAULT '0' COMMENT '0-inativo/1-ativo',
  `codigo_barras` int(11) DEFAULT NULL,
  `obs` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=latin1 COMMENT='catalogo de produtos para acesso externo';

#
# Structure for table "cest"
#

CREATE TABLE `base_web_control`.`cest` (
  `numero_cest` varchar(10) NOT NULL,
  `descricao_cest` text,
  PRIMARY KEY (`numero_cest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "CEST"
#

CREATE TABLE `base_web_control`.`CEST` (
  `CEST_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CEST_ITEM` varchar(20) DEFAULT NULL,
  `CEST_CEST` varchar(15) DEFAULT NULL,
  `CEST_NCM` varchar(15) DEFAULT NULL,
  `CEST_DESCRICAO` longtext,
  PRIMARY KEY (`CEST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=latin1;

#
# Structure for table "cest2"
#

CREATE TABLE `base_web_control`.`cest2` (
  `numero_cest` varchar(10) NOT NULL,
  `ncm` varchar(10) DEFAULT NULL,
  `descricao_cest` text,
  PRIMARY KEY (`numero_cest`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cfop"
#

CREATE TABLE `base_web_control`.`cfop` (
  `codigo` int(5) NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`codigo`),
  KEY `fk_cfop01` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cidade"
#

CREATE TABLE `base_web_control`.`cidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  `estado` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Cidade_estado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=5565 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacao"
#

CREATE TABLE `base_web_control`.`classificacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) unsigned DEFAULT NULL,
  `id_anterior` int(11) DEFAULT NULL,
  `ecommerce` enum('S','N') DEFAULT 'N',
  `lixo` varchar(10) DEFAULT NULL,
  `id_class_master` varchar(11) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `show_comanda` tinyint(4) DEFAULT '0' COMMENT '''0'',''1''',
  `id_importacao` int(11) DEFAULT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_mercadolivre` varchar(20) DEFAULT NULL,
  `favoritoloja` tinyint(1) DEFAULT '0' COMMENT '0 = nao favorito e padrao do campo 1 = favorito e fixo na barra de classificacoes do layout 2 da loja virtual2',
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `lixo` (`descricao`),
  KEY `idx_id_off` (`id_off`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5914706 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacao_alteracao_valores"
#

CREATE TABLE `base_web_control`.`classificacao_alteracao_valores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_classificacao` int(11) NOT NULL DEFAULT '0',
  `tipo_alteracao` enum('D','A') DEFAULT NULL COMMENT 'D - DIMINUIR / A - AUMENTAR',
  `fator_alteracao` enum('P','R') DEFAULT NULL COMMENT 'P - PERCENTUAL / R - REAIS',
  `valor_alteracao` decimal(15,2) DEFAULT NULL,
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `desfeito` tinyint(4) DEFAULT '0',
  `id_fornecedor` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=5825 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacao_bancodeimagens"
#

CREATE TABLE `base_web_control`.`classificacao_bancodeimagens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_imagem` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacao_contas"
#

CREATE TABLE `base_web_control`.`classificacao_contas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(70) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) unsigned DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `tipo` enum('P','R') DEFAULT 'P',
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=13019 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacao_sub"
#

CREATE TABLE `base_web_control`.`classificacao_sub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_classificacao` bigint(20) NOT NULL,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

#
# Structure for table "classificacoes_removidas"
#

CREATE TABLE `base_web_control`.`classificacoes_removidas` (
  `id` int(10) unsigned NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) unsigned DEFAULT NULL,
  `id_anterior` int(11) DEFAULT NULL,
  `ecommerce` enum('S','N') DEFAULT 'N',
  `lixo` varchar(10) DEFAULT NULL,
  `id_class_master` varchar(11) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `show_comanda` tinyint(4) DEFAULT '0' COMMENT '''0'',''1''',
  `id_importacao` int(11) DEFAULT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `lixo` (`descricao`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cli_recebafacil"
#

CREATE TABLE `base_web_control`.`cli_recebafacil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cliente"
#

CREATE TABLE `base_web_control`.`cliente` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) DEFAULT NULL,
  `tipo_pessoa` enum('F','J','B','E') CHARACTER SET latin1 DEFAULT NULL COMMENT 'Fisica, Juridica, Balcão, Extrangeiro',
  `cnpj_cpf` varchar(15) CHARACTER SET latin1 DEFAULT '00000000000',
  `rg` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `inscricao_municipal` varchar(19) CHARACTER SET latin1 DEFAULT NULL,
  `inscricao_estadual` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `inscricao_suframa` varchar(14) CHARACTER SET latin1 DEFAULT NULL,
  `nome` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `razao_social` varchar(60) CHARACTER SET latin1 DEFAULT NULL,
  `id_tipo_log` int(10) unsigned DEFAULT '1',
  `endereco` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `numero` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `complemento` varchar(55) CHARACTER SET latin1 DEFAULT NULL,
  `bairro` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `cidade` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `uf` char(2) CHARACTER SET latin1 DEFAULT NULL,
  `cep` varchar(8) CHARACTER SET latin1 DEFAULT NULL,
  `pais` varchar(40) CHARACTER SET latin1 DEFAULT 'BRASIL',
  `informacoes_adicionais` text CHARACTER SET latin1,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `telefone` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `celular` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `ativo` enum('A','I','E') CHARACTER SET latin1 NOT NULL DEFAULT 'A',
  `renda_media` decimal(10,2) DEFAULT NULL,
  `empresa_trabalha` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `cargo` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fone_empresa` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `endereco_empresa` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `nome_referencia_comercial` varchar(100) CHARACTER SET latin1 DEFAULT NULL COMMENT 'Nome Referencia Comercial',
  `referencia_comercial` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `nome_referencia` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `referencia_pessoal` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `nome_pai` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `nome_mae` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `numero_titulo` bigint(12) DEFAULT NULL,
  `zona` varchar(3) CHARACTER SET latin1 DEFAULT NULL,
  `secao` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `placa` longtext CHARACTER SET latin1,
  `fone_pai` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `fone_mae` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `socio1` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `socio2` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `fone_socio1` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `fone_socio2` varchar(11) CHARACTER SET latin1 DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `senha_ecommerce` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `isento_icms` enum('S','N') CHARACTER SET latin1 DEFAULT 'S',
  `sincronizado` int(11) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `obs` longtext CHARACTER SET latin1,
  `tabela_preco` int(11) DEFAULT '1',
  `estado_civil` int(11) DEFAULT NULL,
  `nome_conjuge` char(60) CHARACTER SET latin1 DEFAULT NULL,
  `tipo_residencia` char(1) CHARACTER SET latin1 DEFAULT NULL,
  `foto` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `orgao_expedidor` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `naturalidade` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `limite_credito` decimal(10,2) unsigned DEFAULT '0.00',
  `limite_credito_cc` decimal(15,3) NOT NULL DEFAULT '0.000',
  `tipo_compra` enum('A','V') CHARACTER SET latin1 NOT NULL DEFAULT 'V',
  `origem_cadastro` int(11) DEFAULT NULL,
  `data_cadastro_user` date DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `substituto_tributario` int(1) DEFAULT '0',
  `senha` varchar(55) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_usuario` (`id_usuario`),
  KEY `fk_cliente02` (`cnpj_cpf`),
  KEY `fk_cliente01` (`id_cadastro`,`tipo_pessoa`),
  KEY `iddx_cliente04` (`id_cadastro`),
  KEY `idx_id_off` (`id_off`),
  KEY `fk_cliente04` (`id_cadastro`,`razao_social`),
  KEY `fk_cliente03` (`id_cadastro`,`nome`),
  KEY `fk_datanascimento` (`id_cadastro`,`data_nascimento`),
  FULLTEXT KEY `fk_bairro` (`bairro`)
) ENGINE=InnoDB AUTO_INCREMENT=8137324 DEFAULT CHARSET=utf8;

#
# Structure for table "cliente_agendamentos"
#

CREATE TABLE `base_web_control`.`cliente_agendamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `fone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Coluna 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_documento"
#

CREATE TABLE `base_web_control`.`cliente_documento` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `documento` varchar(255) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1045 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_documentos"
#

CREATE TABLE `base_web_control`.`cliente_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `url_documento` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_forma_pagamento"
#

CREATE TABLE `base_web_control`.`cliente_forma_pagamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_forma_pagamento` int(11) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT '1',
  `juro_mes` decimal(5,2) DEFAULT NULL,
  `cod_convenio` varchar(15) DEFAULT NULL,
  `cnpj_adm` char(15) DEFAULT NULL,
  `chave_e_commerce` varchar(70) DEFAULT NULL,
  `ativo` tinyint(4) unsigned DEFAULT '1',
  `loja_virtual` tinyint(4) DEFAULT '0',
  `entrada` tinyint(4) DEFAULT '0',
  `ordem_visual` int(11) DEFAULT NULL,
  `baixa_automatica` enum('S','N') DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `avista` decimal(10,2) DEFAULT NULL,
  `aprazo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_cadastro_baixa_automatica` (`id_cadastro`,`baixa_automatica`)
) ENGINE=InnoDB AUTO_INCREMENT=3221130 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_optica"
#

CREATE TABLE `base_web_control`.`cliente_optica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `longe_od_esferico` varchar(45) DEFAULT NULL,
  `longe_od_cilindrico` varchar(45) DEFAULT NULL,
  `longe_od_eixo` varchar(45) DEFAULT NULL,
  `longe_od_adicao` varchar(45) DEFAULT NULL,
  `longe_od_dnp` varchar(45) DEFAULT NULL,
  `longe_od_altura` varchar(45) DEFAULT NULL,
  `longe_oe_esferico` varchar(45) DEFAULT NULL,
  `longe_oe_cilindrico` varchar(45) DEFAULT NULL,
  `longe_oe_eixo` varchar(45) DEFAULT NULL,
  `longe_oe_adicao` varchar(45) DEFAULT NULL,
  `longe_oe_dnp` varchar(45) DEFAULT NULL,
  `longe_oe_altura` varchar(45) DEFAULT NULL,
  `perto_od_esferico` varchar(45) DEFAULT NULL,
  `perto_od_cilindrico` varchar(45) DEFAULT NULL,
  `perto_od_eixo` varchar(45) DEFAULT NULL,
  `perto_od_adicao` varchar(45) DEFAULT NULL,
  `perto_od_dnp` varchar(45) DEFAULT NULL,
  `perto_od_altura` varchar(45) DEFAULT NULL,
  `perto_oe_esferico` varchar(45) DEFAULT NULL,
  `perto_oe_cilindrico` varchar(45) DEFAULT NULL,
  `perto_oe_eixo` varchar(45) DEFAULT NULL,
  `perto_oe_adicao` varchar(45) DEFAULT NULL,
  `perto_oe_dnp` varchar(45) DEFAULT NULL,
  `perto_oe_altura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29736 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_optica_historico"
#

CREATE TABLE `base_web_control`.`cliente_optica_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `longe_od_esferico` varchar(45) DEFAULT NULL,
  `longe_od_cilindrico` varchar(45) DEFAULT NULL,
  `longe_od_eixo` varchar(45) DEFAULT NULL,
  `longe_od_adicao` varchar(45) DEFAULT NULL,
  `longe_od_dnp` varchar(45) DEFAULT NULL,
  `longe_od_altura` varchar(45) DEFAULT NULL,
  `longe_oe_esferico` varchar(45) DEFAULT NULL,
  `longe_oe_cilindrico` varchar(45) DEFAULT NULL,
  `longe_oe_eixo` varchar(45) DEFAULT NULL,
  `longe_oe_adicao` varchar(45) DEFAULT NULL,
  `longe_oe_dnp` varchar(45) DEFAULT NULL,
  `longe_oe_altura` varchar(45) DEFAULT NULL,
  `perto_od_esferico` varchar(45) DEFAULT NULL,
  `perto_od_cilindrico` varchar(45) DEFAULT NULL,
  `perto_od_eixo` varchar(45) DEFAULT NULL,
  `perto_od_adicao` varchar(45) DEFAULT NULL,
  `perto_od_dnp` varchar(45) DEFAULT NULL,
  `perto_od_altura` varchar(45) DEFAULT NULL,
  `perto_oe_esferico` varchar(45) DEFAULT NULL,
  `perto_oe_cilindrico` varchar(45) DEFAULT NULL,
  `perto_oe_eixo` varchar(45) DEFAULT NULL,
  `perto_oe_adicao` varchar(45) DEFAULT NULL,
  `perto_oe_dnp` varchar(45) DEFAULT NULL,
  `perto_oe_altura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4152 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_veiculo"
#

CREATE TABLE `base_web_control`.`cliente_veiculo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `placa` varchar(255) NOT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `modelo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_praka` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=667188 DEFAULT CHARSET=latin1;

#
# Structure for table "cliente_veiculos"
#

CREATE TABLE `base_web_control`.`cliente_veiculos` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) unsigned NOT NULL DEFAULT '0',
  `id_cadastro` int(11) unsigned NOT NULL DEFAULT '0',
  `veiculo` varchar(50) NOT NULL DEFAULT '0',
  `modelo` varchar(50) NOT NULL DEFAULT '0',
  `ano` smallint(4) NOT NULL DEFAULT '0',
  `placa` varchar(50) NOT NULL DEFAULT '0',
  `km_atual` varchar(50) NOT NULL DEFAULT '0',
  `cor` varchar(50) NOT NULL DEFAULT '0',
  `chassi` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_cliente_veiculos_cliente` (`id_cliente`),
  KEY `id_cadastro` (`id_cadastro`),
  CONSTRAINT `FK_cliente_veiculos_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `base_web_control`.`cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=570719 DEFAULT CHARSET=latin1 COMMENT='cadastro de veiculos do cliente';

#
# Structure for table "clientes_removidos"
#

CREATE TABLE `base_web_control`.`clientes_removidos` (
  `id` int(10) unsigned NOT NULL,
  `id_cadastro` int(10) DEFAULT NULL,
  `tipo_pessoa` enum('F','J','B','E') DEFAULT NULL,
  `cnpj_cpf` varchar(15) DEFAULT '00000000000',
  `rg` varchar(20) DEFAULT NULL,
  `inscricao_municipal` varchar(19) DEFAULT NULL,
  `inscricao_estadual` varchar(14) DEFAULT NULL,
  `inscricao_suframa` int(11) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `razao_social` varchar(60) DEFAULT NULL,
  `id_tipo_log` int(10) unsigned DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(55) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `pais` varchar(6) DEFAULT 'BRASIL',
  `informacoes_adicionais` text,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A',
  `renda_media` decimal(10,2) DEFAULT NULL,
  `empresa_trabalha` varchar(50) DEFAULT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `fone_empresa` varchar(11) DEFAULT NULL,
  `endereco_empresa` varchar(100) DEFAULT NULL,
  `nome_referencia_comercial` varchar(100) DEFAULT NULL COMMENT 'Nome Referencia Comercial',
  `referencia_comercial` varchar(11) DEFAULT NULL,
  `nome_referencia` varchar(100) DEFAULT NULL,
  `referencia_pessoal` varchar(11) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `nome_pai` varchar(50) DEFAULT NULL,
  `nome_mae` varchar(50) DEFAULT NULL,
  `numero_titulo` bigint(12) DEFAULT NULL,
  `zona` varchar(3) DEFAULT NULL,
  `secao` varchar(4) DEFAULT NULL,
  `placa` longtext,
  `fone_pai` varchar(11) DEFAULT NULL,
  `fone_mae` varchar(11) DEFAULT NULL,
  `socio1` varchar(50) DEFAULT NULL,
  `socio2` varchar(50) DEFAULT NULL,
  `fone_socio1` varchar(11) DEFAULT NULL,
  `fone_socio2` varchar(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `senha_ecommerce` varchar(10) DEFAULT NULL,
  `isento_icms` enum('S','N') DEFAULT 'S',
  `sincronizado` int(11) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `obs` longtext,
  `tabela_preco` int(11) DEFAULT '1',
  `estado_civil` int(11) DEFAULT NULL,
  `nome_conjuge` char(60) DEFAULT NULL,
  `tipo_residencia` char(1) DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `orgao_expedidor` varchar(20) DEFAULT NULL,
  `naturalidade` varchar(255) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `limite_credito` decimal(10,2) unsigned DEFAULT '0.00',
  `limite_credito_cc` decimal(15,3) NOT NULL DEFAULT '0.000',
  `tipo_compra` enum('A','V') NOT NULL DEFAULT 'V',
  `origem_cadastro` int(11) DEFAULT NULL,
  `data_cadastro_user` date DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `substituto_tributario` int(1) DEFAULT '0',
  KEY `fk_id_usuarior` (`id_usuario`),
  KEY `fk_cliente02r` (`cnpj_cpf`),
  KEY `fk_cliente03r` (`nome`),
  KEY `fk_cliente01r` (`id_cadastro`,`tipo_pessoa`),
  KEY `iddx_cliente04r` (`id_cadastro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cm_comanda"
#

CREATE TABLE `base_web_control`.`cm_comanda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `num_comanda` char(10) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0 - Vazia, 1 - Ocupada, 2 - Desativada',
  `id_off` bigint(20) unsigned DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qtde_pessoas` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_cadastro_num_comanda` (`id_cadastro`,`num_comanda`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=260375 DEFAULT CHARSET=latin1 COMMENT='Cadastro de Comandas Abertas Somente, as comandas fechadas s';

#
# Structure for table "cm_historico"
#

CREATE TABLE `base_web_control`.`cm_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT '0' COMMENT 'id da mesa quando for mesa, no caso de comanda fica 0',
  `id_cliente` int(11) DEFAULT NULL,
  `num_cm` char(20) DEFAULT NULL COMMENT 'número da comanda ou mesa',
  `tipo_cm` char(1) DEFAULT NULL COMMENT 'C - Comanda, M - Mesa',
  `status` int(10) DEFAULT NULL COMMENT '0 - Fechado, 1 - Aberto',
  `datahora_abertura` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_id_impresso` char(10) DEFAULT '0' COMMENT 'dado do ultimo id impresso para cozinha',
  `id_reserva` int(11) DEFAULT NULL COMMENT 'caso seja um pedido aberto a partir de uma reserva reserva o id estara aqui',
  `num_pessoas` int(3) DEFAULT '1' COMMENT 'numero de pessoas na comanda ou mesa',
  `id_off` bigint(20) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=382401 DEFAULT CHARSET=latin1 COMMENT='Historico de Comandas e Mesas Utilizados';

#
# Structure for table "cm_mesa"
#

CREATE TABLE `base_web_control`.`cm_mesa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `num_mesa` char(5) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0 - Vazia, 1 - Ocupada, 2 - Desativada, 3 - reservada',
  `qtde_pessoas` char(5) DEFAULT '0',
  `id_off` bigint(20) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=20225 DEFAULT CHARSET=latin1 COMMENT='Cadastro de Mesas';

#
# Structure for table "cm_producao"
#

CREATE TABLE `base_web_control`.`cm_producao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL DEFAULT '0',
  `idvenda_item` int(11) NOT NULL DEFAULT '0',
  `enviado_producao` enum('S','N') NOT NULL DEFAULT 'N',
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_off` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `FK001` (`idvenda_item`)
) ENGINE=InnoDB AUTO_INCREMENT=288316 DEFAULT CHARSET=latin1;

#
# Structure for table "cm_reserva"
#

CREATE TABLE `base_web_control`.`cm_reserva` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `nome_pessoa` varchar(50) DEFAULT NULL,
  `cpf_pessoa` char(15) DEFAULT NULL,
  `telefone_pessoa` char(15) DEFAULT NULL,
  `qtde_pessoas` char(5) DEFAULT NULL,
  `data_reserva` date DEFAULT NULL,
  `hora_reserva` time DEFAULT NULL,
  `situacao` char(1) NOT NULL DEFAULT '1' COMMENT '0 - Efetivada, 1 - aberta, 2 - cancelada',
  `id_off` bigint(20) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincromismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1 COMMENT='tabela de reservas de mesas';

#
# Structure for table "cm_reserva_mesa"
#

CREATE TABLE `base_web_control`.`cm_reserva_mesa` (
  `id_reserva` int(11) DEFAULT NULL,
  `id_mesa` int(11) DEFAULT NULL,
  `id_off` varchar(20) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='registro de n reserva para n mesa';

#
# Structure for table "cnae"
#

CREATE TABLE `base_web_control`.`cnae` (
  `codigo` char(15) DEFAULT NULL,
  `descricao` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "cnae_issqn"
#

CREATE TABLE `base_web_control`.`cnae_issqn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` char(7) DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1470 DEFAULT CHARSET=latin1;

#
# Structure for table "compartilhamento"
#

CREATE TABLE `base_web_control`.`compartilhamento` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_compartilhamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=504 DEFAULT CHARSET=latin1;

#
# Structure for table "compromisso"
#

CREATE TABLE `base_web_control`.`compromisso` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(10) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  `hora_compromisso` time DEFAULT NULL,
  `data_compromisso` date DEFAULT NULL,
  `descricao_compromisso` text,
  `hora_baixa_compromisso` time DEFAULT NULL,
  `data_baixa_compromisso` date DEFAULT NULL,
  `descricao_baixa_compromisso` text,
  `ativo` enum('A','I') DEFAULT 'A',
  `data_cadastro` date DEFAULT NULL,
  `hora_cadastro` time DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `local` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21633 DEFAULT CHARSET=latin1;

#
# Structure for table "conferencia_estoque"
#

CREATE TABLE `base_web_control`.`conferencia_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4980 DEFAULT CHARSET=latin1;

#
# Structure for table "conferencia_estoque_itens"
#

CREATE TABLE `base_web_control`.`conferencia_estoque_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_conferencia` int(11) DEFAULT NULL,
  `id_grade` int(11) DEFAULT NULL,
  `codigo_barra` varchar(60) DEFAULT NULL,
  `qtd_estoque` int(11) DEFAULT NULL,
  `qtd_conferencia` int(11) DEFAULT NULL,
  `qtd_diferenca` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48390 DEFAULT CHARSET=latin1;

#
# Structure for table "conferencia_estoque_itens_tmp"
#

CREATE TABLE `base_web_control`.`conferencia_estoque_itens_tmp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conferencia` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_grade` int(11) DEFAULT NULL,
  `codigo_barra` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125634 DEFAULT CHARSET=latin1;

#
# Structure for table "conta_corrente"
#

CREATE TABLE `base_web_control`.`conta_corrente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `data_abertura` datetime NOT NULL,
  `data_alteracao` datetime NOT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `data_fechamento` datetime NOT NULL,
  `saldo` decimal(15,3) NOT NULL,
  `ativo` enum('A','E','I') NOT NULL DEFAULT 'A',
  `id_usuario_abertura` int(11) NOT NULL,
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `id_usuario_fechamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6498 DEFAULT CHARSET=latin1;

#
# Structure for table "conta_corrente_movimentacao"
#

CREATE TABLE `base_web_control`.`conta_corrente_movimentacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_conta_corrente` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `tipo_movimentacao` enum('D','C') NOT NULL,
  `data_movimentacao` datetime NOT NULL,
  `id_usuario_movimentacao` int(11) NOT NULL,
  `valor_movimentacao` decimal(15,3) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_conta_corrente_movimentacao_conta_corrente_idx` (`id_conta_corrente`),
  CONSTRAINT `fk_conta_corrente_movimentacao_conta_corrente` FOREIGN KEY (`id_conta_corrente`) REFERENCES `base_web_control`.`conta_corrente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=101452 DEFAULT CHARSET=latin1;

#
# Structure for table "contador_cliente"
#

CREATE TABLE `base_web_control`.`contador_cliente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_contador` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "contas_comprovante"
#

CREATE TABLE `base_web_control`.`contas_comprovante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `comprovante_hash` text COMMENT 'nome do arquivo enviado com hash',
  `nome_arquivo` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6702 DEFAULT CHARSET=latin1;

#
# Structure for table "contas_empresa"
#

CREATE TABLE `base_web_control`.`contas_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_banco` char(3) DEFAULT NULL,
  `agencia` int(11) DEFAULT NULL,
  `conta` int(11) DEFAULT NULL,
  `saldo_inicial` decimal(10,2) NOT NULL DEFAULT '0.00',
  `limite` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status_conta` char(1) DEFAULT 'A' COMMENT 'A - Ativa, I - Inativa',
  `dt_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` bigint(20) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2910 DEFAULT CHARSET=latin1;

#
# Structure for table "contas_pagar"
#

CREATE TABLE `base_web_control`.`contas_pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_descricao_conta_pagar` int(11) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `informacoes_adicionais` text,
  `situacao` enum('A','P','C') DEFAULT 'A' COMMENT 'Ativa, Paga, Cancelada',
  `valor_baixa` decimal(10,2) DEFAULT NULL,
  `data_baixa` datetime DEFAULT NULL,
  `id_usuario_baixa` int(11) DEFAULT NULL,
  `informacaoes_adicionais_baixa` text,
  `data_cadastro_baixa` datetime DEFAULT NULL,
  `extornada` enum('S','N') DEFAULT 'N',
  `tp_conta` enum('P','R') DEFAULT 'P' COMMENT 'P - Pagar   R - Receber',
  `origem` enum('G','O') DEFAULT 'G' COMMENT 'Geral, Ordem Serviço',
  `id_os_orcamento` bigint(10) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `numero_documento` varchar(15) DEFAULT NULL,
  `id_formapgto` int(11) DEFAULT NULL,
  `id_classificacao` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `qtd_parcela` int(11) DEFAULT NULL,
  `chave` varchar(10) DEFAULT NULL,
  `parcela` varchar(7) DEFAULT '01/01',
  `id_tipo_documento` int(11) DEFAULT NULL,
  `nome_devedor` varchar(255) DEFAULT NULL,
  `cod_banco` varchar(3) DEFAULT NULL,
  `id_contas_pagar_pai` int(11) DEFAULT NULL COMMENT 'Usado qnd o pagamento for parcial, assim grava o id da conta anterior',
  `multa_atraso` decimal(4,2) DEFAULT NULL,
  `baixa_automatica` enum('S','N') DEFAULT 'N',
  `id_abertura_caixa` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `juros_parcelamento` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_descricao_conta_pagar` (`id_descricao_conta_pagar`,`id_usuario_cadastro`,`id_usuario_baixa`),
  KEY `fk_conta01` (`id_cadastro`),
  KEY `fk_conta02` (`id_venda`),
  KEY `fk_conta03` (`id_cadastro`,`id_venda`),
  KEY `chave` (`chave`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=13274494 DEFAULT CHARSET=latin1;

#
# Structure for table "contas_pagar_bkp"
#

CREATE TABLE `base_web_control`.`contas_pagar_bkp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_descricao_conta_pagar` int(11) DEFAULT NULL,
  `data_vencimento` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `informacoes_adicionais` text,
  `situacao` enum('A','P','C') DEFAULT 'A' COMMENT 'Ativa, Paga, Cancelada',
  `valor_baixa` decimal(10,2) DEFAULT NULL,
  `data_baixa` datetime DEFAULT NULL,
  `id_usuario_baixa` int(11) DEFAULT NULL,
  `informacaoes_adicionais_baixa` text,
  `data_cadastro_baixa` datetime DEFAULT NULL,
  `extornada` enum('S','N') DEFAULT 'N',
  `tp_conta` enum('P','R') DEFAULT 'P' COMMENT 'P - Pagar   R - Receber',
  `origem` enum('G','O') DEFAULT 'G' COMMENT 'Geral, Ordem Serviço',
  `id_os_orcamento` bigint(10) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `codigo_barra` varchar(50) DEFAULT NULL,
  `numero_documento` varchar(15) DEFAULT NULL,
  `id_formapgto` int(11) DEFAULT NULL,
  `id_classificacao` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `qtd_parcela` int(11) DEFAULT NULL,
  `chave` varchar(10) DEFAULT NULL,
  `parcela` varchar(7) DEFAULT '01/01',
  `id_tipo_documento` int(11) DEFAULT NULL,
  `nome_devedor` varchar(255) DEFAULT NULL,
  `cod_banco` varchar(3) DEFAULT NULL,
  `id_contas_pagar_pai` int(11) DEFAULT NULL COMMENT 'Usado qnd o pagamento for parcial, assim grava o id da conta anterior',
  `multa_atraso` decimal(4,2) DEFAULT NULL,
  `baixa_automatica` enum('S','N') DEFAULT 'N',
  `id_abertura_caixa` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `juros_parcelamento` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_descricao_conta_pagar` (`id_descricao_conta_pagar`,`id_usuario_cadastro`,`id_usuario_baixa`),
  KEY `fk_conta01` (`id_cadastro`),
  KEY `fk_conta02` (`id_venda`),
  KEY `fk_conta03` (`id_cadastro`,`id_venda`),
  KEY `chave` (`chave`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6870163 DEFAULT CHARSET=latin1;

#
# Structure for table "contas_pagar_tpdoc"
#

CREATE TABLE `base_web_control`.`contas_pagar_tpdoc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=73396 DEFAULT CHARSET=latin1;

#
# Structure for table "controle_anuncios"
#

CREATE TABLE `base_web_control`.`controle_anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anunciantes` int(11) DEFAULT NULL,
  `id_cadastro_cliente` int(11) DEFAULT NULL COMMENT 'IDCADASTRO DO CLIENTE QUE VISUALIZOU A CAMPANHA',
  `visto` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_anunciantes` (`id_anunciantes`),
  KEY `id_cadastro_cliente` (`id_cadastro_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=32392 DEFAULT CHARSET=latin1;

#
# Structure for table "controle_notafiscal"
#

CREATE TABLE `base_web_control`.`controle_notafiscal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `sequencia` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ctlnfe_01` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Structure for table "credenciadora_cartao"
#

CREATE TABLE `base_web_control`.`credenciadora_cartao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_forma_pagamento` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `cnpj` varchar(15) NOT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2636 DEFAULT CHARSET=latin1;

#
# Structure for table "credenciadoras_fixas"
#

CREATE TABLE `base_web_control`.`credenciadoras_fixas` (
  `id_credenciadora` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(15) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_credenciadora`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Structure for table "credenciadoras_fixas_ignorar"
#

CREATE TABLE `base_web_control`.`credenciadoras_fixas_ignorar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_credenciadora_fixa` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2456 DEFAULT CHARSET=latin1;

#
# Structure for table "cst"
#

CREATE TABLE `base_web_control`.`cst` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `codigo` int(2) unsigned zerofill DEFAULT NULL,
  `referencia` varchar(10) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkindex01` (`codigo`,`referencia`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=latin1;

#
# Structure for table "dados_avaliacao"
#

CREATE TABLE `base_web_control`.`dados_avaliacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT '0',
  `id_usuario` int(11) DEFAULT '0',
  `regiao_usuario` char(2) DEFAULT NULL COMMENT 'S - Sul, SE - Sudeste, SO - Sudoeste, C - Centro, N - Norte, NE - Nordeste, NO - Noroeste, O - Oeste, L - Leste',
  `estado_usuario` char(2) DEFAULT NULL,
  `nome_usuario` char(60) DEFAULT NULL,
  `telefone_usuario` char(12) DEFAULT NULL,
  `tipo_avaliacao` char(3) DEFAULT NULL COMMENT 'ASS - Avaliacao de Satisfacao do Sistema',
  `avaliacao` char(5) DEFAULT NULL,
  `data_avaliacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `obs_avaliacao` varchar(2048) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2598 DEFAULT CHARSET=latin1 COMMENT='aramazena os dados de avaliacao da empresa';

#
# Structure for table "descricao_contas_pagar"
#

CREATE TABLE `base_web_control`.`descricao_contas_pagar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=562967 DEFAULT CHARSET=latin1;

#
# Structure for table "descricao_contas_pagar_padrao"
#

CREATE TABLE `base_web_control`.`descricao_contas_pagar_padrao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for table "documentos_arquivado"
#

CREATE TABLE `base_web_control`.`documentos_arquivado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_documentos_pasta` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `arquivo` varchar(100) DEFAULT NULL,
  `data_hora_criacao` datetime DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `extensao` varchar(4) DEFAULT NULL,
  `situacao` enum('S','N','C') DEFAULT 'N' COMMENT 'Campo documento contador, S -> Ativo, N-> Inativo, C -> Cancelado',
  `data_vencimento` datetime DEFAULT NULL COMMENT 'Data de Vencimento',
  `data_baixa` datetime DEFAULT NULL COMMENT 'Data da baixa do documento',
  `id_pai` int(11) unsigned DEFAULT NULL COMMENT 'referencia do documento pai',
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=19408 DEFAULT CHARSET=latin1;

#
# Structure for table "documentos_pasta"
#

CREATE TABLE `base_web_control`.`documentos_pasta` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pai` int(11) DEFAULT NULL,
  `id_dono_pasta` int(11) DEFAULT NULL,
  `tipo_dono_pasta` char(1) NOT NULL DEFAULT 'M' COMMENT 'C - Cliente, F - Funcionario, T - Transportadora, O - Fornecedor, U - Usuario, M - Master, A - Acessou',
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=42363 DEFAULT CHARSET=latin1;

#
# Structure for table "editora"
#

CREATE TABLE `base_web_control`.`editora` (
  `cod_editora` int(11) NOT NULL,
  `razao` text,
  `endereco` varchar(50) DEFAULT NULL,
  `cnpj` int(11) NOT NULL,
  `cidade` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`cod_editora`),
  UNIQUE KEY `cnpj` (`cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "encaminhamento"
#

CREATE TABLE `base_web_control`.`encaminhamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT '0',
  `id_venda` int(10) unsigned DEFAULT '0',
  `id_funcionario` int(10) unsigned DEFAULT '0',
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8256 DEFAULT CHARSET=latin1;

#
# Structure for table "encaminhamento_endereco"
#

CREATE TABLE `base_web_control`.`encaminhamento_endereco` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_encaminhamento` int(10) unsigned DEFAULT NULL,
  `id_funcionario` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cep` varchar(9) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `complemento` varchar(225) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `logradouro` int(2) DEFAULT NULL,
  `numero` varchar(6) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=latin1;

#
# Structure for table "encaminhamento_produtos"
#

CREATE TABLE `base_web_control`.`encaminhamento_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_encaminhamento` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_endereco` int(10) unsigned DEFAULT NULL,
  `codigo_barra` char(20) DEFAULT NULL,
  `quantidade` float DEFAULT NULL,
  `tipo_encaminhamento` int(11) DEFAULT NULL,
  `prazo_entrega` datetime DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25597 DEFAULT CHARSET=latin1;

#
# Structure for table "encaminhamento_tipo"
#

CREATE TABLE `base_web_control`.`encaminhamento_tipo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `tipo_dados` varchar(60) NOT NULL COMMENT 'C - Cliente, E - Endereco, P - Produto, V - Valores',
  `ordenacao` int(10) unsigned NOT NULL COMMENT 'Ordenacao de apresentacao',
  `ativo` char(1) DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo',
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "envio_sms_boleto"
#

CREATE TABLE `base_web_control`.`envio_sms_boleto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_titulo_recebafacil` int(11) DEFAULT NULL,
  `data_envio` date DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1769 DEFAULT CHARSET=latin1;

#
# Structure for table "estado"
#

CREATE TABLE `base_web_control`.`estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `sigla` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Structure for table "estado_civil"
#

CREATE TABLE `base_web_control`.`estado_civil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "estados"
#

CREATE TABLE `base_web_control`.`estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `sigla` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

#
# Structure for table "estoque"
#

CREATE TABLE `base_web_control`.`estoque` (
  `código` text,
  `nome` text,
  `estoque` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "estoque_apoio"
#

CREATE TABLE `base_web_control`.`estoque_apoio` (
  `id_grade` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_grade_atributo_valor` int(11) DEFAULT NULL,
  `id_usuario_alterou` int(11) DEFAULT NULL,
  `codigo_barra_pai` text,
  `codigo_barra` text,
  `codigo_interno` text,
  `qtd_atual` float DEFAULT NULL,
  `qtd_minima` float DEFAULT NULL,
  `qtd_locacao` float DEFAULT NULL,
  `qtd_locacao_locado` float DEFAULT NULL,
  `valor_custo` float DEFAULT NULL,
  `valor_varejo_avista` int(11) DEFAULT NULL,
  `valor_varejo_aprazo` float DEFAULT NULL,
  `valor_atacado_avista` int(11) DEFAULT NULL,
  `valor_atacado_aprazo` float DEFAULT NULL,
  `porc_varejo_avista` int(11) DEFAULT NULL,
  `porc_varejo_aprazo` float DEFAULT NULL,
  `porc_atacado_avista` int(11) DEFAULT NULL,
  `porc_atacado_aprazo` int(11) DEFAULT NULL,
  `ativo` int(11) DEFAULT NULL,
  `data_alteracao` int(11) DEFAULT NULL,
  `data_sincronismo` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "Estoque_apoio"
#

CREATE TABLE `base_web_control`.`Estoque_apoio` (
  `Nr. loja` int(11) DEFAULT NULL,
  `Fabric./Fornec.` text,
  `Grupo` text,
  `Cod. exibição` int(11) DEFAULT NULL,
  `Referência` float DEFAULT NULL,
  `cod_barras` text,
  `Descrição` text,
  `Loja` text,
  `Vlr. total compra` text,
  `Vlr. compra` text,
  `Vlr. total venda` text,
  `Vlr. venda` text,
  `Quantidade` text,
  `Qtde. total estoque` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "estoque_produto"
#

CREATE TABLE `base_web_control`.`estoque_produto` (
  `ID` int(11) DEFAULT NULL,
  `EMP` int(11) DEFAULT NULL,
  `ID_ESTOQUE` int(11) DEFAULT NULL,
  `ID_PRODUTO` int(11) DEFAULT NULL,
  `NOME` text,
  `QUANT_DISPO` text,
  `QUANT_REQUE` text,
  `QUANT_TOTAL` text,
  `LOCAL` int(11) DEFAULT NULL,
  `SEL_INA` int(11) DEFAULT NULL,
  `SEL_LOTE` int(11) DEFAULT NULL,
  `DELL` int(11) DEFAULT NULL,
  `CRIADO` int(11) DEFAULT NULL,
  `ATUALIZADO` int(11) DEFAULT NULL,
  `DATA_POST` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "exclusao_info"
#

CREATE TABLE `base_web_control`.`exclusao_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `info` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

#
# Structure for table "exclusao_info_relacionados"
#

CREATE TABLE `base_web_control`.`exclusao_info_relacionados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_info` int(11) DEFAULT NULL,
  `desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

#
# Structure for table "fila_tarefas"
#

CREATE TABLE `base_web_control`.`fila_tarefas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `url` varchar(200) NOT NULL,
  `parametros` text,
  `metodo` enum('GET','POST') NOT NULL,
  `status` enum('A','C','E') NOT NULL DEFAULT 'A',
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_concluido` timestamp NULL DEFAULT NULL,
  `requisicoes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2212 DEFAULT CHARSET=latin1;

#
# Structure for table "financeiro_apoio"
#

CREATE TABLE `base_web_control`.`financeiro_apoio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` bigint(20) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `tp_pagamento` enum('FPC','CC','FF') DEFAULT 'FPC',
  `descricao` varchar(20) NOT NULL,
  `cpfcnpj` varchar(14) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_index01` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "financeiro_funcionario_banco"
#

CREATE TABLE `base_web_control`.`financeiro_funcionario_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  `id_banco` int(11) DEFAULT NULL,
  `agencia` varchar(50) DEFAULT NULL,
  `conta_corrente` varchar(15) DEFAULT NULL,
  `informacoes_adicionais` text,
  `data` date DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `titular` varchar(75) DEFAULT NULL,
  `cpf_titular` varchar(11) DEFAULT NULL,
  `id_financeiro_funcionario_valor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=latin1;

#
# Structure for table "financeiro_funcionario_valor"
#

CREATE TABLE `base_web_control`.`financeiro_funcionario_valor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_funcionario` varchar(255) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `comissao` decimal(10,2) DEFAULT NULL,
  `id_usuario_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=647 DEFAULT CHARSET=latin1;

#
# Structure for table "fluxo_caixa"
#

CREATE TABLE `base_web_control`.`fluxo_caixa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned NOT NULL DEFAULT '0',
  `mes` tinyint(3) NOT NULL DEFAULT '0',
  `ano` smallint(6) NOT NULL DEFAULT '0',
  `valor_inicial` decimal(10,3) NOT NULL DEFAULT '0.000',
  `debito` decimal(10,3) NOT NULL DEFAULT '0.000',
  `credito` decimal(10,3) NOT NULL DEFAULT '0.000',
  `valor_final` decimal(10,3) NOT NULL DEFAULT '0.000',
  `conta` char(20) DEFAULT '',
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4148 DEFAULT CHARSET=latin1;

#
# Structure for table "forma_pagamento"
#

CREATE TABLE `base_web_control`.`forma_pagamento` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `nome_reduzido` varchar(10) DEFAULT NULL,
  `sigla_bandeira` char(1) DEFAULT NULL,
  `logo` varchar(50) DEFAULT NULL,
  `nome_reduzido2` varchar(15) DEFAULT NULL,
  `ordem_visual` int(11) DEFAULT NULL,
  `cod_receita` int(2) unsigned zerofill DEFAULT '00',
  `baixa_automatica` enum('S','N') DEFAULT 'N',
  `tipo_cobranca` enum('C','D','O') DEFAULT 'O' COMMENT 'C - Credito / D - Debito / O - Outros',
  `sinc_pdv` tinyint(4) DEFAULT '1',
  `contas_pagar` enum('S','N') DEFAULT 'S' COMMENT 'vai para contas a pagar ???',
  `parcelas` int(11) DEFAULT '12',
  `fluxo_contabil` enum('S','N') DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;

#
# Structure for table "forma_pagamento_bandeira"
#

CREATE TABLE `base_web_control`.`forma_pagamento_bandeira` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `ativo` enum('S','N') DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "forma_pagamento_cliente"
#

CREATE TABLE `base_web_control`.`forma_pagamento_cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_formapgto` int(11) NOT NULL,
  `ativo` enum('A','I') DEFAULT 'I',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "forma_pagamento_ecommerce"
#

CREATE TABLE `base_web_control`.`forma_pagamento_ecommerce` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_bandeira` varchar(10) DEFAULT NULL,
  `nr_parcelas` varchar(2) DEFAULT NULL,
  `juro_mes` decimal(10,2) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` enum('S','N') DEFAULT 'N',
  `tp_pgto` int(1) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `cod_convenio` varchar(15) DEFAULT NULL,
  `chave_e_commerce` varchar(70) DEFAULT NULL,
  `cnpj_adm` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109329 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor"
#

CREATE TABLE `base_web_control`.`fornecedor` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(100) DEFAULT NULL,
  `fantasia` varchar(100) DEFAULT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `cnpj_cpf` varchar(15) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `skype` varchar(50) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `informacoes_adicionais` text,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `tipo_pessoa` enum('F','J','E') DEFAULT 'J',
  `ativo` enum('A','I','E') DEFAULT 'A',
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_tipo_log` int(10) unsigned DEFAULT '0',
  `tipo_cadastro` enum('F','C') DEFAULT 'F' COMMENT 'F = Fornecedor, C=Contato (agenda telefonica)',
  `id_fornecedor_servico` int(11) DEFAULT NULL,
  `id_tmp` int(11) DEFAULT NULL,
  `rgie` varchar(30) DEFAULT NULL,
  `fone_tmp` varchar(15) DEFAULT NULL,
  `insc_estadual` varchar(15) DEFAULT NULL,
  `insc_municipal` varchar(15) DEFAULT NULL,
  `id_forn_master` int(10) DEFAULT NULL,
  `data_fundacao` date DEFAULT NULL,
  `prazo_entrega_produtos` int(5) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `isento_icms` enum('S','N') DEFAULT 'N',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `pais` varchar(20) DEFAULT 'BRASIL',
  `id_pais` int(11) DEFAULT '1058',
  PRIMARY KEY (`id`),
  KEY `fk_tmp` (`id_tmp`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk2` (`id_forn_master`),
  KEY `idx_id_fornecedor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=667605 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_banco"
#

CREATE TABLE `base_web_control`.`fornecedor_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_banco` int(3) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(10) DEFAULT NULL,
  `titular` varchar(60) DEFAULT NULL,
  `titular_cpfcnpj` varchar(20) DEFAULT NULL,
  `tipo_conta` enum('C','P') DEFAULT 'C',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_forn01` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=2944 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_pedido"
#

CREATE TABLE `base_web_control`.`fornecedor_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_pedido` datetime DEFAULT NULL COMMENT 'Data em que o pedido foi realizado',
  `statos_pedido` enum('A','C','E','P') DEFAULT NULL COMMENT 'A - Aberto, C - Cancelado, E - Entregue, P - Pago',
  `data_entrega` datetime DEFAULT NULL COMMENT 'Data em que o pedido foi entregue',
  `data_previsao_entrega` datetime DEFAULT NULL COMMENT 'Data passada pelo fornecedor como previsao de entrega',
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_pedido_item"
#

CREATE TABLE `base_web_control`.`fornecedor_pedido_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pedido` int(11) NOT NULL,
  `id_grade` int(11) DEFAULT NULL,
  `id_usuario_criacao` int(11) DEFAULT NULL,
  `nome_item` varchar(50) DEFAULT NULL,
  `valor_custo` decimal(10,3) DEFAULT NULL,
  `quantidade` decimal(8,3) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo_registro` enum('A','L') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, L - Log',
  `statos_item` enum('A','C') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, C- Cancelado',
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_produto"
#

CREATE TABLE `base_web_control`.`fornecedor_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17655 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_servico"
#

CREATE TABLE `base_web_control`.`fornecedor_servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3321 DEFAULT CHARSET=latin1;

#
# Structure for table "fornecedor_transportadora"
#

CREATE TABLE `base_web_control`.`fornecedor_transportadora` (
  `id_transportadora` int(11) NOT NULL AUTO_INCREMENT,
  `id_fornecedor` int(11) DEFAULT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transportadora`),
  KEY `fk_001` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=1901 DEFAULT CHARSET=latin1;

#
# Structure for table "funcionario"
#

CREATE TABLE `base_web_control`.`funcionario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `nome_pai` varchar(50) DEFAULT NULL,
  `nome_mae` varchar(50) DEFAULT NULL,
  `naturalidade` varchar(50) DEFAULT NULL,
  `uf_naturalidade` char(3) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `estado_civil` int(1) unsigned DEFAULT NULL,
  `qtde_filho` int(10) unsigned DEFAULT NULL,
  `grau_instrucao` int(10) unsigned DEFAULT NULL,
  `id_tipo_log` int(10) unsigned DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `informacoes_adicionais` text,
  `data_cadastro` timestamp NULL DEFAULT NULL,
  `id_cadastro` int(11) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') DEFAULT 'A',
  `id_usuario_excluir` int(11) DEFAULT NULL,
  `pis` varchar(15) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `classificacao` int(2) DEFAULT '0' COMMENT '0-Operador  1-Supervisor',
  `comissao` decimal(10,2) DEFAULT '0.00',
  `comissao_servico` decimal(10,2) DEFAULT '0.00',
  `pessoa_recado1` varchar(50) DEFAULT NULL,
  `pessoa_recado2` varchar(50) DEFAULT NULL,
  `fone_recado1` varchar(11) DEFAULT NULL,
  `fone_recado2` varchar(11) DEFAULT NULL,
  `tipo_conta` enum('C','P') DEFAULT 'C',
  `id_banco` int(11) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(10) DEFAULT NULL,
  `titular` varchar(60) DEFAULT NULL,
  `titular_cpfcnpj` varchar(14) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `tipo_comissao` enum('R','P') DEFAULT 'R',
  `tipo_comissao_servico` enum('R','P') DEFAULT 'R',
  `tp_funcionario` enum('G','S','F','P') DEFAULT 'F',
  `mot_demissao` varchar(40) DEFAULT NULL,
  `data_demissao` date DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `orgao_expedidor` varchar(20) DEFAULT NULL,
  `agenda` tinyint(4) DEFAULT '1',
  `tipo_funcionario` enum('G','N') DEFAULT 'N' COMMENT 'G - Gerente, N - Normal',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_setor` int(11) DEFAULT NULL,
  `id_cargo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ID_CADASTRO` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=311777 DEFAULT CHARSET=latin1;

#
# Structure for table "funcionario_agendamento"
#

CREATE TABLE `base_web_control`.`funcionario_agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `id_cliente_agendamentos` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `hora_inicio` time DEFAULT NULL,
  `hora_fim` time DEFAULT NULL,
  `status` enum('A','R','C') DEFAULT 'A' COMMENT 'A = agendado, R = realizado, C = cancelado',
  `observacao` text,
  PRIMARY KEY (`id`,`id_funcionario`),
  KEY `fk_agendamentos_funcionario_agendamento1_idx` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

#
# Structure for table "funcionario_comissao"
#

CREATE TABLE `base_web_control`.`funcionario_comissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL DEFAULT '0',
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `tipo_comissao` enum('R','P') DEFAULT NULL,
  `valor_comissao` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto` (`id_produto`),
  KEY `id_funcionario` (`id_funcionario`)
) ENGINE=InnoDB AUTO_INCREMENT=172093 DEFAULT CHARSET=latin1 COMMENT='Registro de comissoes individuais para produtos/serviços';

#
# Structure for table "funcionario_funcao"
#

CREATE TABLE `base_web_control`.`funcionario_funcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "funcionario_horario_trabalho"
#

CREATE TABLE `base_web_control`.`funcionario_horario_trabalho` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_semana` enum('0','1','2','3','4','5','6','7') DEFAULT NULL,
  `entrada_1` varchar(5) DEFAULT NULL,
  `saida_1` varchar(5) DEFAULT NULL,
  `entrada_2` varchar(5) DEFAULT NULL,
  `saida_2` varchar(5) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `tempo_medio_atendimento` int(11) DEFAULT NULL,
  `antecedencia_agendamento` int(11) DEFAULT NULL,
  `choque_horario` enum('S','N') DEFAULT NULL,
  `choque_qtde` int(2) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `id_funcionario` (`id_funcionario`,`id_semana`)
) ENGINE=InnoDB AUTO_INCREMENT=454012 DEFAULT CHARSET=latin1;

#
# Structure for table "funcionario2"
#

CREATE TABLE `base_web_control`.`funcionario2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `sexo` char(1) DEFAULT NULL,
  `nome_pai` varchar(50) DEFAULT NULL,
  `nome_mae` varchar(50) DEFAULT NULL,
  `naturalidade` varchar(50) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `estado_civil` int(1) unsigned DEFAULT NULL,
  `qtde_filho` int(10) unsigned DEFAULT NULL,
  `grau_instrucao` int(10) unsigned DEFAULT NULL,
  `id_tipo_log` int(10) unsigned DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `rg` varchar(15) DEFAULT NULL,
  `data_admissao` date DEFAULT NULL,
  `informacoes_adicionais` text,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` int(11) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') DEFAULT 'A',
  `id_usuario_excluir` int(11) DEFAULT NULL,
  `pis` varchar(15) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `classificacao` int(2) DEFAULT '0' COMMENT '0-Operador  1-Supervisor',
  `comissao` decimal(10,2) DEFAULT '0.00',
  `comissao_servico` decimal(10,2) DEFAULT '0.00',
  `pessoa_recado1` varchar(50) DEFAULT NULL,
  `pessoa_recado2` varchar(50) DEFAULT NULL,
  `fone_recado1` varchar(11) DEFAULT NULL,
  `fone_recado2` varchar(11) DEFAULT NULL,
  `tipo_conta` enum('C','P') DEFAULT 'C',
  `id_banco` int(11) DEFAULT NULL,
  `agencia` varchar(6) DEFAULT NULL,
  `conta` varchar(10) DEFAULT NULL,
  `titular` varchar(60) DEFAULT NULL,
  `titular_cpfcnpj` varchar(14) DEFAULT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `tipo_comissao` enum('R','P') DEFAULT 'R',
  `tipo_comissao_servico` enum('R','P') DEFAULT 'R',
  `tp_funcionario` enum('G','S','F','P') DEFAULT 'F',
  `mot_demissao` varchar(40) DEFAULT NULL,
  `data_demissao` date DEFAULT NULL,
  `foto` varchar(500) DEFAULT NULL,
  `orgao_expedidor` varchar(20) DEFAULT NULL,
  `agenda` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_funcionario` (`id_cadastro`,`tp_funcionario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "grade"
#

CREATE TABLE `base_web_control`.`grade` (
  `id_grade` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_produto` int(11) unsigned NOT NULL,
  `id_grade_atributo_valor` varchar(255) DEFAULT NULL,
  `id_usuario_alterou` int(10) unsigned DEFAULT NULL,
  `codigo_barra_pai` varchar(22) DEFAULT NULL,
  `codigo_barra` varchar(22) DEFAULT NULL,
  `codigo_interno` varchar(22) DEFAULT NULL,
  `qtd_atual` decimal(10,3) DEFAULT '0.000',
  `qtd_minima` decimal(10,3) DEFAULT '0.000',
  `qtd_locacao` decimal(10,3) DEFAULT '0.000',
  `qtd_locacao_locado` decimal(10,3) DEFAULT '0.000' COMMENT 'Armazena o total locado, somar ao locar e remover na devolução',
  `valor_custo` decimal(10,5) DEFAULT NULL,
  `valor_varejo_avista` decimal(10,2) DEFAULT NULL,
  `valor_varejo_aprazo` decimal(10,2) DEFAULT NULL,
  `valor_atacado_avista` decimal(10,2) DEFAULT NULL,
  `valor_atacado_aprazo` decimal(10,2) DEFAULT NULL,
  `porc_varejo_avista` decimal(18,15) DEFAULT NULL,
  `porc_varejo_aprazo` decimal(18,15) DEFAULT NULL,
  `porc_atacado_avista` decimal(18,15) DEFAULT NULL,
  `porc_atacado_aprazo` decimal(18,15) DEFAULT NULL,
  `ativo` tinyint(1) unsigned DEFAULT '1' COMMENT '1 = ativo, 0 inativo',
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `alteracao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_grade`),
  KEY `id_grade` (`id_grade`),
  KEY `id_cadastro_codigo_barra` (`id_cadastro`,`codigo_barra`),
  KEY `id_produto` (`id_produto`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `codigo_barra_pai` (`codigo_barra_pai`),
  KEY `ativo` (`ativo`)
) ENGINE=InnoDB AUTO_INCREMENT=1012001245 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_arrumar_estoque"
#

CREATE TABLE `base_web_control`.`grade_arrumar_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_grade` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `qtd_arrumar` decimal(15,3) DEFAULT NULL,
  `data_hora` datetime DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `finalizado` enum('N','S') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=252189 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_atributo"
#

CREATE TABLE `base_web_control`.`grade_atributo` (
  `id_grade_atributo` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `atributo` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1=Ativo, 0=Desativado',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grade_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=12087 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_atributo_valor"
#

CREATE TABLE `base_web_control`.`grade_atributo_valor` (
  `id_grade_atributo_valor` int(11) NOT NULL AUTO_INCREMENT,
  `id_atributo` int(11) DEFAULT NULL,
  `valor` varchar(100) DEFAULT NULL,
  `ativo` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1=Ativo, 0=Desativado',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grade_atributo_valor`),
  KEY `atributo` (`id_atributo`)
) ENGINE=InnoDB AUTO_INCREMENT=34965 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_foto"
#

CREATE TABLE `base_web_control`.`grade_foto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_grade` bigint(20) NOT NULL COMMENT 'id_grade',
  `caminho_imagem` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`,`id_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=1566 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Structure for table "grade_historico"
#

CREATE TABLE `base_web_control`.`grade_historico` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_grade` bigint(20) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `qtd_antigo` decimal(11,3) DEFAULT NULL,
  `qtd_atual` decimal(11,3) DEFAULT NULL,
  `codigo_barra_antigo` char(20) DEFAULT NULL,
  `codigo_barra` char(20) DEFAULT NULL,
  `valor_custo_antigo` decimal(10,2) DEFAULT NULL,
  `valor_custo` decimal(10,2) DEFAULT NULL,
  `valor_varejo_aprazo_antigo` decimal(10,2) DEFAULT NULL,
  `valor_varejo_aprazo` decimal(10,2) DEFAULT NULL,
  `valor_atacado_aprazo_antigo` decimal(10,2) DEFAULT NULL,
  `valor_atacado_aprazo` decimal(10,2) DEFAULT NULL,
  `ativo_antigo` tinyint(1) unsigned DEFAULT '1',
  `ativo` tinyint(1) unsigned DEFAULT '1',
  `data_hora_alteracao` datetime DEFAULT NULL,
  `origem_alteracao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `codigo_barra_antigo` (`id_cadastro`,`codigo_barra_antigo`),
  KEY `codigo_barra` (`codigo_barra`,`id_cadastro`),
  KEY `fk_index01` (`id_grade`)
) ENGINE=InnoDB AUTO_INCREMENT=152311752 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_promocao"
#

CREATE TABLE `base_web_control`.`grade_promocao` (
  `id_grade_promocao` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_grade` bigint(20) unsigned DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `disponivel_inicio` datetime DEFAULT NULL,
  `disponivel_final` datetime DEFAULT NULL,
  `promo_valor_varejo_avista` decimal(10,2) DEFAULT NULL,
  `promo_valor_varejo_aprazo` decimal(10,2) DEFAULT NULL,
  `promo_valor_atacado_avista` decimal(10,2) DEFAULT NULL,
  `promo_valor_atacado_aprazo` decimal(10,2) DEFAULT NULL,
  `promo_porc_varejo_avista` decimal(18,15) DEFAULT NULL,
  `promo_porc_varejo_aprazo` decimal(18,15) DEFAULT NULL,
  `promo_porc_atacado_avista` decimal(18,15) DEFAULT NULL,
  `promo_porc_atacado_aprazo` decimal(18,15) DEFAULT NULL,
  `id_usuario_cadastrou` int(11) DEFAULT NULL,
  `cadastro` datetime DEFAULT NULL,
  `id_usuario_deletou` int(11) DEFAULT NULL,
  `deletou` datetime DEFAULT NULL,
  `ativo` char(1) DEFAULT '1',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_grade_promocao`),
  KEY `id_grade_promocao` (`id_grade_promocao`),
  KEY `id_grade_ativo` (`id_grade`,`ativo`),
  KEY `id_grade` (`id_grade`),
  KEY `filtro_inicial` (`id_grade`,`disponivel_inicio`,`disponivel_final`,`ativo`)
) ENGINE=InnoDB AUTO_INCREMENT=7389 DEFAULT CHARSET=latin1;

#
# Structure for table "grade_saida_estoque"
#

CREATE TABLE `base_web_control`.`grade_saida_estoque` (
  `id_grade_saida_estoque` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_grade` bigint(20) unsigned NOT NULL DEFAULT '0',
  `id_usuario` int(10) unsigned NOT NULL DEFAULT '0',
  `id_cliente` bigint(20) DEFAULT '0',
  `qtd_estoque_anterior` decimal(10,3) DEFAULT '0.000',
  `qtd_movimentacao` decimal(10,3) DEFAULT '0.000',
  `motivo_principal` varchar(255) DEFAULT NULL,
  `motivo_secundario` varchar(255) DEFAULT NULL,
  `data_hora_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `unidade_destino` text,
  PRIMARY KEY (`id_grade_saida_estoque`)
) ENGINE=InnoDB AUTO_INCREMENT=115191 DEFAULT CHARSET=latin1;

#
# Structure for table "grau_instrucao"
#

CREATE TABLE `base_web_control`.`grau_instrucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "hash"
#

CREATE TABLE `base_web_control`.`hash` (
  `idCadastro` int(11) NOT NULL,
  `hash` varchar(45) NOT NULL,
  KEY `idCadastro` (`idCadastro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "historico_doc_fiscais"
#

CREATE TABLE `base_web_control`.`historico_doc_fiscais` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comando` longtext,
  `status` int(1) DEFAULT NULL COMMENT '0 - Com Erro   -  1 - Sem Erro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "horario_trabalho"
#

CREATE TABLE `base_web_control`.`horario_trabalho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `horario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

#
# Structure for table "ibptax"
#

CREATE TABLE `base_web_control`.`ibptax` (
  `id_ibptax` bigint(1) unsigned NOT NULL AUTO_INCREMENT,
  `uf` char(2) DEFAULT NULL,
  `codigo` int(11) NOT NULL,
  `ex` int(11) NOT NULL,
  `tipo` varchar(20) DEFAULT NULL,
  `descricao` text,
  `aliqNac` float NOT NULL,
  `aliqImp` float NOT NULL,
  `estadual` float NOT NULL,
  `municipal` float NOT NULL,
  `vigencia_inicio` varchar(10) NOT NULL,
  `vigencia_fim` varchar(10) NOT NULL,
  `chave` varchar(15) DEFAULT NULL,
  `versao` varchar(7) NOT NULL,
  `fonte` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_ibptax`),
  KEY `fkindex` (`codigo`),
  KEY `fkindex01` (`uf`,`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=319465 DEFAULT CHARSET=latin1;

#
# Structure for table "importacao"
#

CREATE TABLE `base_web_control`.`importacao` (
  `id_importacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL COMMENT 'ID DO CADASTRO QUE ESTA SENDO IMPORTADO',
  `id_usuario_importacao` int(11) NOT NULL,
  `id_usuario_aprovacao` int(11) DEFAULT NULL,
  `data_importacao` datetime DEFAULT NULL,
  `data_aprovacao` datetime DEFAULT NULL,
  `nome_tabela` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_importacao`)
) ENGINE=InnoDB AUTO_INCREMENT=9098 DEFAULT CHARSET=latin1;

#
# Structure for table "indica_amigo"
#

CREATE TABLE `base_web_control`.`indica_amigo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `codigo_associado` int(11) DEFAULT NULL,
  `nome_amigo` varchar(100) DEFAULT NULL,
  `fone_amigo1` char(50) DEFAULT NULL,
  `fone_amigo2` char(50) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fatura_bonificar` varchar(50) DEFAULT NULL,
  `id_agendador` int(11) DEFAULT NULL,
  `tipo_recebimento` int(11) DEFAULT NULL,
  `quem_indicou` varchar(255) DEFAULT NULL,
  `funcao_empresa` varchar(255) DEFAULT NULL,
  `conta_bancaria` varchar(45) DEFAULT NULL,
  `banco` varchar(45) DEFAULT NULL,
  `agencia` varchar(45) DEFAULT NULL,
  `tipo_conta` int(11) DEFAULT NULL,
  `n_conta` varchar(45) DEFAULT NULL,
  `nome_titular` varchar(255) DEFAULT NULL,
  `cnpj_cpf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=29666 DEFAULT CHARSET=latin1 COMMENT='cliente indica um amigo';

#
# Structure for table "indica_amigo_log"
#

CREATE TABLE `base_web_control`.`indica_amigo_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_indicacao` int(11) DEFAULT NULL,
  `status_indicacao` char(2) DEFAULT NULL COMMENT 'VR - Venda Realizada | SI - Sem Interesse | RE - Reagendado | SC - Sem Contato',
  `cod_cliente_vr` char(10) DEFAULT NULL COMMENT 'Codigo do cliente caso a venda tenha sido realizada',
  `dt_nota` timestamp NULL DEFAULT NULL,
  `desc_nota` text,
  `dt_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `num_doc` varchar(20) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk002` (`id_indicacao`)
) ENGINE=InnoDB AUTO_INCREMENT=29514 DEFAULT CHARSET=latin1;

#
# Structure for table "lancamentos_empresas"
#

CREATE TABLE `base_web_control`.`lancamentos_empresas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_tipo_lan` int(11) DEFAULT NULL,
  `id_conta` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `credor` varchar(60) DEFAULT NULL,
  `valor` decimal(10,2) NOT NULL DEFAULT '0.00',
  `operacao` char(1) NOT NULL COMMENT 'D - Decrementa, I - Incrementa',
  `data_lan` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118278 DEFAULT CHARSET=latin1;

#
# Structure for table "limite_funcionario"
#

CREATE TABLE `base_web_control`.`limite_funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `qtd_dias` int(11) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `renovar` enum('S','N') NOT NULL DEFAULT 'N',
  `ativo` enum('A','I') NOT NULL DEFAULT 'A',
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=50429607 DEFAULT CHARSET=latin1;

#
# Structure for table "link"
#

CREATE TABLE `base_web_control`.`link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `a_link` varchar(50) DEFAULT NULL,
  `referencia` varchar(100) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ordem_link` int(10) unsigned DEFAULT '0',
  `id_modulo` int(11) DEFAULT NULL,
  `cod_permissao` int(11) DEFAULT NULL,
  `cod_permissao_dupla` varchar(20) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A',
  `link` enum('S','N') DEFAULT 'S',
  `visivel` enum('S','N') DEFAULT 'S',
  PRIMARY KEY (`id`),
  KEY `fk_id_modulo` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=latin1;

#
# Structure for table "livro"
#

CREATE TABLE `base_web_control`.`livro` (
  `titulo` varchar(100) NOT NULL,
  `cd_autor` int(11) NOT NULL,
  `cd_editora` int(11) DEFAULT NULL,
  `valor` float NOT NULL,
  `publicacao` date NOT NULL,
  `volume` int(11) NOT NULL,
  PRIMARY KEY (`titulo`,`cd_autor`),
  KEY `cd_autor` (`cd_autor`),
  KEY `cd_editora` (`cd_editora`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`cd_autor`) REFERENCES `base_web_control`.`autor` (`cod_autor`),
  CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`cd_editora`) REFERENCES `base_web_control`.`autor` (`cod_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "log_acesso_offline"
#

CREATE TABLE `base_web_control`.`log_acesso_offline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `tipo_acesso` varchar(1) DEFAULT NULL COMMENT '0 - Login | 1 - Sincronismo Geral | 2 - Sincronismo Parcial',
  `terminal` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170410 DEFAULT CHARSET=latin1;

#
# Structure for table "log_acoes_notasfiscais"
#

CREATE TABLE `base_web_control`.`log_acoes_notasfiscais` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_venda` bigint(20) DEFAULT NULL,
  `tipo_nota` enum('NFE','NFC','NFS') DEFAULT NULL,
  `acao` enum('E','C','CC','A','R') DEFAULT NULL COMMENT 'E - Email C - Cancelamento CC - Carta de Correção A - Apagada R - Recuperada',
  `numero_nota` varchar(50) DEFAULT NULL,
  `email_enviado` varchar(255) DEFAULT NULL,
  `data_hora_acao` datetime DEFAULT NULL,
  `endereco_cc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_venda` (`id_venda`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=561911 DEFAULT CHARSET=latin1;

#
# Structure for table "log_anuncios"
#

CREATE TABLE `base_web_control`.`log_anuncios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `anuncios` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=891775 DEFAULT CHARSET=latin1;

#
# Structure for table "log_anuncios_relatorio"
#

CREATE TABLE `base_web_control`.`log_anuncios_relatorio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_anuncio` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `fone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `data_cadastro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_anuncio` (`id_anuncio`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=2325 DEFAULT CHARSET=latin1;

#
# Structure for table "log_dados_cadastro"
#

CREATE TABLE `base_web_control`.`log_dados_cadastro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `origem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4794 DEFAULT CHARSET=latin1;

#
# Structure for table "log_envio_email"
#

CREATE TABLE `base_web_control`.`log_envio_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_usuario_envio` int(11) DEFAULT NULL,
  `email_destino` varchar(150) NOT NULL COMMENT 'email do destinatario',
  `origem_envio` varchar(150) DEFAULT NULL COMMENT 'parte do sistema de onde foi solicitado o envio do email',
  `data_hora_envio` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'data e hora do envio do email',
  PRIMARY KEY (`id`),
  KEY `id_venda` (`id_venda`),
  KEY `id_usuario` (`id_usuario_envio`),
  KEY `id_cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=32835 DEFAULT CHARSET=latin1 COMMENT='Tabela com log de e-mails de orçamentos enviados pelo sistema';

#
# Structure for table "log_erro_sessao"
#

CREATE TABLE `base_web_control`.`log_erro_sessao` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pagina_anterior` char(254) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=885619 DEFAULT CHARSET=latin1;

#
# Structure for table "log_estoque"
#

CREATE TABLE `base_web_control`.`log_estoque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `codigo_barra` varchar(45) DEFAULT NULL,
  `qtd` varchar(45) DEFAULT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `preco_custo` decimal(15,3) DEFAULT NULL,
  `preco_venda` decimal(15,3) DEFAULT NULL,
  `data_log` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=42969109 DEFAULT CHARSET=latin1;

#
# Structure for table "log_mensage_atencao"
#

CREATE TABLE `base_web_control`.`log_mensage_atencao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_alert` int(11) DEFAULT NULL,
  `save_data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83921 DEFAULT CHARSET=latin1;

#
# Structure for table "log_monitoramento"
#

CREATE TABLE `base_web_control`.`log_monitoramento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `log` text NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=17371211 DEFAULT CHARSET=latin1;

#
# Structure for table "log_sync_loja"
#

CREATE TABLE `base_web_control`.`log_sync_loja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `data_sync` datetime NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `status` enum('O','E') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=4903 DEFAULT CHARSET=latin1;

#
# Structure for table "log_sync_loja_itens"
#

CREATE TABLE `base_web_control`.`log_sync_loja_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sync` int(11) NOT NULL,
  `codigo_barra` varchar(25) NOT NULL,
  `descricao` varchar(150) NOT NULL,
  `classificacao` varchar(255) NOT NULL,
  `cla_ativa` enum('A','I') DEFAULT NULL,
  `cla_ecommerce` enum('S','N') DEFAULT NULL,
  `prod_ativo` enum('A','I') DEFAULT NULL,
  `prod_ecommerce` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_sync` (`id_sync`)
) ENGINE=InnoDB AUTO_INCREMENT=4569971 DEFAULT CHARSET=latin1;

#
# Structure for table "log_web_control"
#

CREATE TABLE `base_web_control`.`log_web_control` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `acessos` longtext,
  `criado` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `classificacao` varchar(50) DEFAULT NULL,
  `tipo_reajuste` varchar(50) DEFAULT NULL,
  `indice` varchar(50) DEFAULT NULL,
  `nome_usuario` char(60) DEFAULT NULL,
  `informacao` text NOT NULL,
  `tipo_log` varchar(5) DEFAULT NULL COMMENT 'DelCV - Exclusão de informações, ReJProd - Reajuste de preços de produto, ZCEST - Zerar Cest Produtos',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16937 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_campanha"
#

CREATE TABLE `base_web_control`.`mailmkt_campanha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT '0',
  `nome_campanha` varchar(150) DEFAULT NULL,
  `assunto_email` varchar(50) DEFAULT NULL,
  `conteudoHtml` mediumtext,
  `conteudoText` mediumtext,
  `data_envio` date DEFAULT NULL,
  `hora_envio` time DEFAULT NULL,
  `status_campanha` char(1) DEFAULT NULL COMMENT 'E - Enviado / A - Agendado / R - Rascunho / P - Pausada / C - Cancelada',
  `lista` text,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_idcadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=2943 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_campanha_agendamento"
#

CREATE TABLE `base_web_control`.`mailmkt_campanha_agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mailmkt_campanha` int(11) NOT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `hora_agendamento` time DEFAULT NULL,
  `status_agendamento` enum('A','E') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=996 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_campanha_fixa"
#

CREATE TABLE `base_web_control`.`mailmkt_campanha_fixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_campanha` varchar(150) DEFAULT NULL,
  `texto` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_campanha_fixa_ignorar"
#

CREATE TABLE `base_web_control`.`mailmkt_campanha_fixa_ignorar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_torpedo_campanha_fixa` int(11) DEFAULT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_config"
#

CREATE TABLE `base_web_control`.`mailmkt_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `nome_remetente` varchar(100) NOT NULL,
  `email_remetente` varchar(100) NOT NULL,
  `horario_gmt` varchar(5) NOT NULL,
  `subaccount_id` int(11) NOT NULL DEFAULT '0',
  `subaccount_key` char(50) NOT NULL DEFAULT '0',
  `subaccount_shortkey` char(10) NOT NULL DEFAULT '0',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=585 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_config_master"
#

CREATE TABLE `base_web_control`.`mailmkt_config_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sparkpost_supperaccount_key` char(50) NOT NULL DEFAULT '0',
  `sender_domain` varchar(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='tabela para configurações master do sistema de email mkt';

#
# Structure for table "mailmkt_lista"
#

CREATE TABLE `base_web_control`.`mailmkt_lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `nome_lista` varchar(200) NOT NULL,
  `emails_lista` longtext NOT NULL,
  `tipo_lista` char(1) DEFAULT NULL COMMENT 'C - Clientes Webcontrol / D - Emails Digitados / I - Importados',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fixa` enum('S','N') DEFAULT 'N',
  `status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55937 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_lista_emails"
#

CREATE TABLE `base_web_control`.`mailmkt_lista_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_lista` int(11) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `nome` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121937 DEFAULT CHARSET=latin1;

#
# Structure for table "mailmkt_log"
#

CREATE TABLE `base_web_control`.`mailmkt_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_campanha` int(11) DEFAULT NULL,
  `id_transmissao_spkp` char(50) DEFAULT NULL COMMENT 'ID que retorna de cada transmissao pelo sparkpost',
  `transmissao_aceitos` char(20) DEFAULT NULL,
  `transmissao_rejeitados` char(20) DEFAULT NULL,
  `total_emails_enviados` int(11) DEFAULT NULL,
  `action` char(1) DEFAULT NULL COMMENT 'A - Agendamento / E - Envio / R - Rascunho / C - Cancelada / X - Excluida',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_idcampanha` (`id_campanha`)
) ENGINE=InnoDB AUTO_INCREMENT=2355 DEFAULT CHARSET=latin1 COMMENT='tabela que guarda o historico dos envios etc';

#
# Structure for table "manifest"
#

CREATE TABLE `base_web_control`.`manifest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_transporte` int(11) DEFAULT NULL,
  `rntrc` bigint(8) DEFAULT NULL,
  `ciot` bigint(12) DEFAULT NULL,
  `veictracao` int(11) DEFAULT NULL,
  `condutor` int(11) DEFAULT NULL,
  `veicreboque` int(11) DEFAULT NULL,
  `vvaleped` varchar(45) DEFAULT NULL,
  `disp` text,
  `cnpjform` varchar(14) DEFAULT NULL,
  `cnpjpg` varchar(14) DEFAULT NULL,
  `ncompra` varchar(20) DEFAULT NULL,
  `createdat` datetime DEFAULT NULL,
  `deletedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "manifest_condutor"
#

CREATE TABLE `base_web_control`.`manifest_condutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "manifest_reboque"
#

CREATE TABLE `base_web_control`.`manifest_reboque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `tara` decimal(12,3) DEFAULT NULL,
  `capkg` decimal(12,3) DEFAULT NULL,
  `capm3` decimal(12,3) DEFAULT NULL,
  `prop` varchar(255) DEFAULT NULL,
  `cpf_cnpj` varchar(255) DEFAULT NULL,
  `rntrc` varchar(45) DEFAULT NULL,
  `xnome` varchar(65) DEFAULT NULL,
  `ie` bigint(20) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `tpprop` int(11) DEFAULT NULL COMMENT '01 - Truck | 02 - Toco | 03 - Cavalo Mecânico | 04 - VAN | 05 - Utilitário | 06 - Outros',
  `tpcar` int(11) DEFAULT NULL COMMENT '00 - não aplicável | 01 - Aberta | 02 - Fechada/Baú | 03 - Granelera | 04 - Porta Container | 05 - Sider',
  `tprodado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "manifest_veictracao"
#

CREATE TABLE `base_web_control`.`manifest_veictracao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `placa` varchar(45) DEFAULT NULL,
  `tara` decimal(12,3) DEFAULT NULL,
  `capkg` decimal(12,3) DEFAULT NULL,
  `capm3` decimal(12,3) DEFAULT NULL,
  `prop` varchar(255) DEFAULT NULL,
  `ie` bigint(20) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `tpprop` int(11) DEFAULT NULL COMMENT '0-TAC ( Agregado ) |  1-TAC (Independente | 2 Outros',
  `tprod` int(11) DEFAULT NULL COMMENT '01 - Truck | 02 - Toco | 03 Cavalo Mecânico | 04 - Van | 05 - Utilitário | 06 Outros',
  `cnpj_cpf` varchar(45) DEFAULT NULL,
  `tpcar` int(11) DEFAULT NULL COMMENT '00 - não aplicável | 01 - Aberta | 02 - Fechada/Baú | 03 - Granelera | 04 - Porta Container | 05 - Sider',
  `rntrc` varchar(145) DEFAULT NULL,
  `ciot` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='	';

#
# Structure for table "manifesto_informacoes"
#

CREATE TABLE `base_web_control`.`manifesto_informacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codloja` int(11) DEFAULT NULL,
  `modal` int(11) DEFAULT NULL,
  `carregamento_uf` char(2) DEFAULT NULL,
  `carregamento_cidade` varchar(100) DEFAULT NULL,
  `descarregamento_uf` char(2) DEFAULT NULL,
  `descarregamento_cidade` varchar(145) DEFAULT NULL,
  `numero` varchar(45) DEFAULT NULL,
  `geracao_automatica` tinyint(1) DEFAULT NULL,
  `serie` varchar(45) DEFAULT NULL,
  `tipo_emitente` int(11) DEFAULT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `descricao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

#
# Structure for table "manifest_uf_percurso"
#

CREATE TABLE `base_web_control`.`manifest_uf_percurso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifest_id` int(11) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifest_info_idx` (`manifest_id`),
  CONSTRAINT `manifest_info` FOREIGN KEY (`manifest_id`) REFERENCES `base_web_control`.`manifesto_informacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Structure for table "manifest_documentos"
#

CREATE TABLE `base_web_control`.`manifest_documentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifesto_id` int(11) DEFAULT NULL,
  `tipo_doc` varchar(50) DEFAULT NULL,
  `municipio` varchar(155) DEFAULT NULL,
  `id_doc` text,
  `qtd` varchar(45) DEFAULT NULL,
  `peso_total` decimal(10,3) DEFAULT NULL,
  `valor_total` float DEFAULT NULL,
  `xml` text,
  PRIMARY KEY (`id`),
  KEY `manifesto_idx` (`manifesto_id`),
  CONSTRAINT `manifesto` FOREIGN KEY (`manifesto_id`) REFERENCES `base_web_control`.`manifesto_informacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

#
# Structure for table "manifesto_modal"
#

CREATE TABLE `base_web_control`.`manifesto_modal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifesto_id` int(11) DEFAULT NULL,
  `ciot` varchar(105) DEFAULT NULL,
  `rntrc` varchar(105) DEFAULT NULL,
  `veic_tracao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Structure for table "manifesto_modal_condutor"
#

CREATE TABLE `base_web_control`.`manifesto_modal_condutor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifesto_id` int(11) DEFAULT NULL,
  `id_condutor` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifesto_idx` (`manifesto_id`),
  CONSTRAINT `manifesto_idxoe` FOREIGN KEY (`manifesto_id`) REFERENCES `base_web_control`.`manifesto_informacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "manifesto_modal_reboque"
#

CREATE TABLE `base_web_control`.`manifesto_modal_reboque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manifesto_id` int(11) DEFAULT NULL,
  `id_reboque` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manifesto_idx` (`manifesto_id`),
  CONSTRAINT `manifesto_idxu` FOREIGN KEY (`manifesto_id`) REFERENCES `base_web_control`.`manifesto_informacoes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Structure for table "marcas"
#

CREATE TABLE `base_web_control`.`marcas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome_marca` varchar(50) DEFAULT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `loja_virtual` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7090 DEFAULT CHARSET=latin1;

#
# Structure for table "matriz_filial"
#

CREATE TABLE `base_web_control`.`matriz_filial` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_matriz` int(10) unsigned DEFAULT NULL,
  `id_filial` int(10) unsigned DEFAULT NULL,
  `tipo_filiacao` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '1 - filiacao parcial(compartilhamento), 2 - filiacao total(fusao)',
  `convite_filial` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '1 - convite enviado, 2 - convite recusado, 3 - convite aceito',
  `ativo` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '0 - inativo, 1 - ativo',
  `data_criacao` datetime NOT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=latin1;

#
# Structure for table "matriz_filial_historico"
#

CREATE TABLE `base_web_control`.`matriz_filial_historico` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_acesso_filiacao` int(10) unsigned DEFAULT NULL,
  `sql_solicitado` text,
  `data_acao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tipo_acao` char(1) NOT NULL COMMENT 'C - Create, U - Update , D - Delete',
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46875 DEFAULT CHARSET=latin1;

#
# Structure for table "matriz_permissao_modulo"
#

CREATE TABLE `base_web_control`.`matriz_permissao_modulo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_permissao` varchar(100) DEFAULT NULL,
  `id_modulo` int(11) DEFAULT NULL,
  `id_submodulo` int(11) DEFAULT NULL,
  `ordem_apresentacao` int(11) DEFAULT NULL COMMENT 'Ordem de apresentacao para o usuario, de preferencia, colocar numeros com range amplo para atualizacoes',
  `ativo` tinyint(4) DEFAULT '1',
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Structure for table "mensagens"
#

CREATE TABLE `base_web_control`.`mensagens` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `mensagem` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "mercado_livre_produto"
#

CREATE TABLE `base_web_control`.`mercado_livre_produto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mercado_livre` varchar(255) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22936 DEFAULT CHARSET=latin1;

#
# Structure for table "modalidade_calculo"
#

CREATE TABLE `base_web_control`.`modalidade_calculo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(25) DEFAULT NULL,
  `situacao` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for table "modalidade_calculo_st"
#

CREATE TABLE `base_web_control`.`modalidade_calculo_st` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `situacao` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "modelo_contrato"
#

CREATE TABLE `base_web_control`.`modelo_contrato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome_modelo` varchar(255) DEFAULT NULL,
  `data_criacao` datetime DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  `texto_clausulas` text,
  `tipo_contrato` enum('L','OS') DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=471 DEFAULT CHARSET=latin1;

#
# Structure for table "modulo"
#

CREATE TABLE `base_web_control`.`modulo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `faixa_permissao` varchar(10) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `ordem_modulo` int(2) DEFAULT NULL,
  `yotube` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Structure for table "modulos"
#

CREATE TABLE `base_web_control`.`modulos` (
  `id_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `cod_modulo` int(11) NOT NULL,
  `nome_modulo` char(50) NOT NULL,
  `descricao_modulo` char(254) NOT NULL,
  KEY `Index 1` (`id_modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='Tabela com a ligacao entre os modulos e o webcontrol';

#
# Structure for table "movimento_titulo_recebafacil"
#

CREATE TABLE `base_web_control`.`movimento_titulo_recebafacil` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `numboleto` bigint(20) NOT NULL,
  `acao` enum('I','B','E') DEFAULT 'I',
  `data_movimento` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vencimento` date DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=480 DEFAULT CHARSET=latin1;

#
# Structure for table "municipio_rf"
#

CREATE TABLE `base_web_control`.`municipio_rf` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `codigo` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `cidade` varchar(57) NOT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5567 DEFAULT CHARSET=latin1;

#
# Structure for table "ncm"
#

CREATE TABLE `base_web_control`.`ncm` (
  `codigo` varchar(20) NOT NULL,
  `descricao` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao"
#

CREATE TABLE `base_web_control`.`nf_devolucao` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_natureza` int(2) DEFAULT NULL,
  `id_transportadora` int(11) DEFAULT NULL,
  `modalidade_frete` int(1) DEFAULT NULL,
  `info_adicionais` longtext,
  `danfe_saida` longtext,
  `num_nota_saida` int(10) NOT NULL,
  `finalizada` enum('S','N') DEFAULT 'N',
  `danfe_entrada` longtext,
  `ano_emissao` varchar(45) DEFAULT NULL,
  `outras_despesas` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tipo_nota` int(1) DEFAULT '0' COMMENT '0 - Entrada   1 - Saida',
  `id_venda` int(11) DEFAULT NULL,
  `status` enum('A','S','C','R','D') DEFAULT 'A' COMMENT 'A - Aguardando, S - Nota Gerada com Sucesso , C - Nota Cancelada - R -Nota Rejeitada, D - Denegada',
  `finalidade` enum('D','S','E') DEFAULT 'D' COMMENT 'Devolucao - Saida - Entrada',
  `natureza` varchar(255) DEFAULT NULL,
  `qtd_volume` int(3) DEFAULT '1',
  `descricao_volume` varchar(10) DEFAULT 'BOX',
  `numero_nota_sefaz` int(11) DEFAULT NULL,
  `vlr_base_calc_st` decimal(13,3) DEFAULT NULL,
  `vlr_icms_st` decimal(13,3) DEFAULT NULL,
  `peso_bruto` decimal(12,3) DEFAULT NULL,
  `peso_liquido` decimal(12,3) DEFAULT NULL,
  `valor_desconto` decimal(12,2) DEFAULT NULL,
  `tipo_finalidade` enum('1','2','3','4') DEFAULT NULL COMMENT '1- NOTA NORMAL 2- NOTA COMPLEMENTAR 3- NOTA DE AJUSTE 4- NOTA DE DEVOLUÇÃO',
  `ambiente` int(1) unsigned DEFAULT '1' COMMENT '1 - Producao 2 - Homologacao',
  `valor_frete` decimal(15,3) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `xml` longtext,
  `placa` varchar(20) DEFAULT NULL,
  `cod_antt` varchar(70) DEFAULT NULL,
  `id_placa` int(11) DEFAULT NULL,
  `numeracao` varchar(70) DEFAULT NULL,
  `forma_pgto` int(1) DEFAULT '0' COMMENT '0 -  A vista, 1 - Prazo, 2 - Outros',
  `ndi` int(11) DEFAULT NULL,
  `datadi` date DEFAULT NULL,
  `datadesembarco` date DEFAULT NULL,
  `localdesembarco` varchar(255) DEFAULT NULL,
  `transporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109558 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_cobranca"
#

CREATE TABLE `base_web_control`.`nf_devolucao_cobranca` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nota_devolucao` int(11) DEFAULT NULL,
  `dup_numero` varchar(10) DEFAULT NULL,
  `dup_venc` date DEFAULT NULL,
  `dup_valor` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=1377 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_nota_devolucao` int(11) DEFAULT NULL,
  `numero_nota` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `codigo_barra` varchar(20) NOT NULL,
  `qtd` decimal(10,4) DEFAULT NULL,
  `vr_unit` decimal(12,4) DEFAULT NULL,
  `cfop` varchar(5) NOT NULL,
  `cest` int(11) DEFAULT NULL,
  `icms` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `cofins` int(11) NOT NULL,
  `ipi` int(2) DEFAULT NULL,
  `finalizado` enum('S','N') DEFAULT 'N',
  `id_grade` bigint(20) DEFAULT NULL,
  `vlr_base_calc_st` decimal(13,4) DEFAULT NULL,
  `vlr_icms_st` decimal(13,2) DEFAULT NULL,
  `vr_bc_cfop` decimal(12,4) DEFAULT NULL,
  `vr_bc_icms` decimal(12,4) DEFAULT NULL,
  `vr_bc_ipi` decimal(12,4) DEFAULT NULL,
  `vr_bc_pis` decimal(12,4) DEFAULT NULL,
  `vr_bc_cofins` decimal(12,4) DEFAULT NULL,
  `unidade` varchar(6) DEFAULT NULL,
  `ordem_compra` varchar(20) DEFAULT NULL,
  `vr_bc_afrmm` decimal(8,2) DEFAULT '0.00',
  `vr_bc_import` decimal(8,2) DEFAULT '0.00',
  `produto_descricao` varchar(255) DEFAULT NULL,
  `nitemped` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=298603 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_COFINS"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_COFINS` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pCOFINS` decimal(10,3) DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `p_aliq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_COFINSST"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_COFINSST` (
  `id_nf_devolucao_itens` int(11) NOT NULL,
  `imposto_id` int(11) DEFAULT NULL,
  `pCOFINS` decimal(10,2) DEFAULT NULL,
  `qBCProd` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_ICMS"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_ICMS` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `orig` char(1) DEFAULT NULL,
  `CST` char(3) DEFAULT NULL,
  `modBC` char(1) DEFAULT NULL,
  `pRedBC` decimal(10,3) DEFAULT NULL,
  `pICMS` decimal(10,2) DEFAULT NULL,
  `modBCST` char(1) DEFAULT NULL,
  `pMVAST` decimal(10,3) DEFAULT NULL,
  `pRedBCST` decimal(10,3) DEFAULT NULL,
  `pICMSST` decimal(10,2) DEFAULT NULL,
  `regimes` enum('T','S') DEFAULT 'T',
  `pOpePropria` decimal(10,3) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `vl_aliq_calc_cre` decimal(10,3) DEFAULT NULL,
  `bc_icms_st_ret_ant` decimal(10,3) DEFAULT NULL,
  `pMVAST_LR` decimal(10,3) DEFAULT NULL,
  `valor_desoneracao_icms` decimal(10,2) DEFAULT NULL,
  `motivo_desoneracao_icms` varchar(60) DEFAULT NULL,
  `percentual_diferimento_icms` decimal(10,2) DEFAULT NULL,
  `uf_retido_remetente_icms_st` char(2) DEFAULT NULL,
  `uf_destino_icms_st` char(2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_origem` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_II"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_II` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `vBC` double DEFAULT NULL,
  `vDespAdu` double DEFAULT NULL,
  `vII` double DEFAULT NULL,
  `vIOF` double DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_IPI"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_IPI` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `cIEnq` char(5) DEFAULT NULL,
  `CNPJProd` char(14) DEFAULT NULL,
  `cSelo` varchar(60) DEFAULT NULL,
  `qSelo` double DEFAULT NULL,
  `cEnq` char(3) DEFAULT NULL,
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `qUnid` double DEFAULT NULL,
  `pIPI` double DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_PIS"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_PIS` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pPIS` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_devolucao_itens_PISST"
#

CREATE TABLE `base_web_control`.`nf_devolucao_itens_PISST` (
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `pPIS` double DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `vAliqProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_entrada"
#

CREATE TABLE `base_web_control`.`nf_entrada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) unsigned DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `hora_cadastro` time DEFAULT NULL,
  `numero_nota` int(11) DEFAULT NULL,
  `vr_icms` decimal(12,2) NOT NULL,
  `vr_icms_st` decimal(12,2) NOT NULL,
  `vr_ipi` decimal(12,2) NOT NULL,
  `vr_pis` decimal(12,2) NOT NULL,
  `vr_cofins` decimal(12,2) NOT NULL,
  `vr_frete` decimal(12,2) NOT NULL,
  `vr_seguro` decimal(12,2) NOT NULL,
  `outras_despesas` decimal(12,2) NOT NULL,
  `informacoes_adicionais` text,
  `finalizado` enum('S','N') DEFAULT 'N',
  `status` enum('A','C','S','D','R') DEFAULT 'A',
  `ambiente` int(1) DEFAULT '1' COMMENT '1 - Producao   2 - Homologacao',
  `numero_nota_sefaz` int(11) DEFAULT NULL,
  `natureza_operacao` varchar(60) NOT NULL DEFAULT 'OUTRAS ENTRADAS NAO ESPECIFICADAS',
  `finalidade_nota` enum('1','2','3','4') DEFAULT '1' COMMENT '1- Nota Normal  2-Nota Complementar 3-Nota de Ajuste    4-Nota de Devolucao',
  `vlr_total_nota` decimal(15,3) DEFAULT NULL,
  `danfe` longtext,
  `data_emissao` date DEFAULT NULL,
  `xml` longtext,
  `id_transportadora` int(11) DEFAULT NULL,
  `modalidade_frete` int(1) DEFAULT '9' COMMENT '0-Emitente   1-Dest/Rem  2-Terceiros  9-Sem Frete',
  `qtd_volume` int(3) DEFAULT NULL,
  `descricao_volume` varchar(10) DEFAULT NULL,
  `vr_desconto` decimal(12,2) DEFAULT NULL,
  `ndi` varchar(12) DEFAULT NULL,
  `datadi` date DEFAULT NULL,
  `datadesembaraco` date DEFAULT NULL,
  `localdesembaraco` varchar(255) DEFAULT NULL,
  `uf_desembaraco` char(2) DEFAULT 'PR',
  `transporte` int(11) DEFAULT NULL,
  `peso_bruto` double(10,3) DEFAULT NULL,
  `peso_liquido` decimal(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nfe_01` (`id_cadastro`),
  KEY `fk_nfe_02` (`numero_nota`),
  KEY `fk_nfe_03` (`id_cliente`),
  KEY `id_fornecedor` (`id_fornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=17743 DEFAULT CHARSET=latin1 COMMENT='transporte [ 1 - Marintima, 2 - Fluvial, 3 - Lacustre, 4 - Aérea, 5 - Postal, 6 - Ferroviária, 7 - Rodoviária, 8 - Conduto/Rede Transmissão, 9 - Meios Próprios, 10 - Entrada / Saída , icta, 11 - Courier, 12 - Handcarry ]';

#
# Structure for table "nf_entrada_estoque"
#

CREATE TABLE `base_web_control`.`nf_entrada_estoque` (
  `id_nf_entrada_estoque` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_usuario` varchar(45) DEFAULT NULL,
  `num_danfe` varchar(70) DEFAULT NULL,
  `num_nf` varchar(50) DEFAULT NULL,
  `num_serie` varchar(20) DEFAULT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `data_saida` datetime DEFAULT NULL,
  `vlr_total_nf` decimal(20,4) DEFAULT NULL,
  `num_processo` int(11) DEFAULT NULL,
  `tp_emissao` int(11) DEFAULT NULL,
  `ind_finalidade` int(11) DEFAULT NULL,
  `tp_operacao` int(11) DEFAULT NULL,
  `forma_pagamento` int(11) DEFAULT NULL,
  `base_calc_icms` decimal(20,4) DEFAULT NULL,
  `valor_icms` decimal(20,4) DEFAULT NULL,
  `valor_icms_desonerado` decimal(20,4) DEFAULT NULL,
  `base_calculo_icms` decimal(20,4) DEFAULT NULL,
  `valor_icms_substituicao` decimal(20,4) DEFAULT NULL,
  `valor_total_prod` decimal(20,4) DEFAULT NULL,
  `valor_frete` decimal(20,4) DEFAULT NULL,
  `valor_seguro` decimal(20,4) DEFAULT NULL,
  `valor_outros` decimal(20,4) DEFAULT NULL,
  `valor_ipi` decimal(20,4) DEFAULT NULL,
  `valor_nf` decimal(20,4) DEFAULT NULL,
  `valor_descontos` decimal(20,4) DEFAULT NULL,
  `valor_total_ii` decimal(20,4) DEFAULT NULL,
  `valor_pis` decimal(20,4) DEFAULT NULL,
  `valor_cofins` decimal(20,4) DEFAULT NULL,
  `valor_aprox_tributo` decimal(20,4) DEFAULT NULL,
  `valor_total_icms_fcp` decimal(20,4) DEFAULT NULL,
  `valor_uf_destino` decimal(20,4) DEFAULT NULL,
  `valor_uf_remitente` decimal(20,4) DEFAULT NULL,
  `mod_frete` int(11) DEFAULT NULL,
  `frete_cnpj` varchar(30) DEFAULT NULL,
  `frete_razao_social` varchar(255) DEFAULT NULL,
  `frete_insc_estadual` varchar(45) DEFAULT NULL,
  `frete_endereco` varchar(255) DEFAULT NULL,
  `frete_cod_municipio` varchar(45) DEFAULT NULL,
  `frete_uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_nf_entrada_estoque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_entrada_estoque_itens"
#

CREATE TABLE `base_web_control`.`nf_entrada_estoque_itens` (
  `id_nf_entrada_estoque_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_entrada_estoque` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtd` decimal(20,4) DEFAULT NULL,
  `und_comercial` varchar(20) DEFAULT NULL,
  `valor_item` decimal(20,4) DEFAULT NULL,
  `cod_ncm` varchar(50) DEFAULT NULL,
  `cod_cest` varchar(50) DEFAULT NULL,
  `cod_ext_tipi` varchar(45) DEFAULT NULL,
  `cfop` varchar(45) DEFAULT NULL,
  `valor_outros` decimal(20,4) DEFAULT NULL,
  `valor_desconto` decimal(20,4) DEFAULT NULL,
  `valor_total_frete` decimal(20,4) DEFAULT NULL,
  `valor_seguro` decimal(20,4) DEFAULT NULL,
  `cod_ean_c` varchar(45) DEFAULT NULL,
  `cod_ean_t` varchar(45) DEFAULT NULL,
  `und_tributavel` varchar(45) DEFAULT NULL,
  `qtd_tributavel` decimal(20,4) DEFAULT NULL,
  `valor_unit_c` decimal(20,4) DEFAULT NULL,
  `valor_unit_t` decimal(20,4) DEFAULT NULL,
  `vlr_aprox_t` decimal(20,4) DEFAULT NULL,
  `num_fci` varchar(45) DEFAULT NULL,
  `orig_mercadoria` varchar(20) DEFAULT NULL,
  `tributo_icms` varchar(20) DEFAULT NULL,
  `valor_bc_icms_st_retido` decimal(20,4) DEFAULT NULL,
  `valor_icms_st_retido` decimal(20,4) DEFAULT NULL,
  `pis_cst` varchar(20) DEFAULT NULL,
  `codigo_barra` varchar(100) DEFAULT NULL,
  `fator` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_nf_entrada_estoque_item`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_entrada_itens"
#

CREATE TABLE `base_web_control`.`nf_entrada_itens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL DEFAULT '0',
  `id_nota_entrada` int(11) DEFAULT NULL,
  `codigo_barra` varchar(20) NOT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `qtd` decimal(10,3) DEFAULT NULL,
  `vr_unit` decimal(20,10) DEFAULT NULL,
  `cfop` varchar(5) NOT NULL,
  `icms` int(11) NOT NULL,
  `pis` int(11) NOT NULL,
  `cofins` int(11) NOT NULL,
  `ipi` int(2) DEFAULT NULL,
  `vr_bc_icms` decimal(12,4) DEFAULT NULL,
  `vr_bc_ipi` decimal(12,4) DEFAULT NULL,
  `vr_bc_pis` decimal(12,4) DEFAULT NULL,
  `vr_bc_cofins` decimal(12,4) DEFAULT NULL,
  `vr_import` decimal(10,4) DEFAULT '0.0000',
  `vr_bc_import` decimal(10,4) DEFAULT '0.0000',
  `vr_afrmm` decimal(10,4) DEFAULT '0.0000',
  `vr_bc_afrmm` decimal(10,4) DEFAULT '0.0000',
  `produto_descricao` varchar(255) DEFAULT NULL,
  `vr_outras_despesas` decimal(12,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk001` (`id_nota_entrada`)
) ENGINE=InnoDB AUTO_INCREMENT=53443 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_entrada_xml"
#

CREATE TABLE `base_web_control`.`nf_entrada_xml` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `data_hora_importacao` datetime NOT NULL,
  `numero_nota` int(11) DEFAULT NULL,
  `arquivo_xml` longtext,
  `cnpj_fornecedor` bigint(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_numero_nota` (`id_cadastro`,`numero_nota`),
  KEY `fk_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=314654 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_inutilizadas"
#

CREATE TABLE `base_web_control`.`nf_inutilizadas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `num_nota` int(11) NOT NULL,
  `tipo_nota` enum('NFE','NFC','NFS') DEFAULT NULL,
  `data_hora_inutilizacao` datetime NOT NULL,
  `protocolo` varchar(255) DEFAULT NULL,
  `motivo_inutilizacao` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196534 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_municipio_RF"
#

CREATE TABLE `base_web_control`.`nf_municipio_RF` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `codigo` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `cidade` varchar(57) NOT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5567 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_natureza"
#

CREATE TABLE `base_web_control`.`nf_natureza` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo` enum('DF') DEFAULT NULL,
  `Valor` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_paises"
#

CREATE TABLE `base_web_control`.`nf_paises` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(60) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_servico_assinadas"
#

CREATE TABLE `base_web_control`.`nf_servico_assinadas` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LOTE` int(11) NOT NULL,
  `QTDE` int(11) NOT NULL,
  `XML` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `ARQUIVO` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `SITUACAO` enum('A','C') CHARACTER SET utf8 NOT NULL DEFAULT 'A' COMMENT 'A - Nota OK   -  C - Nota Cancelada',
  `EMPRESA` varchar(50) DEFAULT NULL,
  `RETORNO` text,
  `NUMERO_PEDIDO` bigint(20) DEFAULT NULL,
  `LINK_NFS` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `UK_TBL_RPS_ASSINADAS` (`LOTE`),
  KEY `FK_RPS_ASSINADAS_01` (`NUMERO_PEDIDO`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_COFINS"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_COFINS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pCOFINS` decimal(10,3) DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `p_aliq` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_COFINSST"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_COFINSST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL,
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `imposto_id` int(11) DEFAULT NULL,
  `pCOFINS` decimal(10,2) DEFAULT NULL,
  `qBCProd` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_ICMS"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_ICMS` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `orig` char(1) DEFAULT NULL,
  `CST` char(3) DEFAULT NULL,
  `modBC` char(1) DEFAULT NULL,
  `pRedBC` decimal(10,3) DEFAULT NULL,
  `pICMS` decimal(10,2) DEFAULT NULL,
  `modBCST` char(1) DEFAULT NULL,
  `pMVAST` decimal(10,3) DEFAULT NULL,
  `pRedBCST` decimal(10,3) DEFAULT NULL,
  `pICMSST` decimal(10,2) DEFAULT NULL,
  `regimes` enum('T','S') DEFAULT 'T',
  `pOpePropria` decimal(10,3) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `vl_aliq_calc_cre` decimal(10,3) DEFAULT NULL,
  `bc_icms_st_ret_ant` decimal(10,3) DEFAULT NULL,
  `pMVAST_LR` decimal(10,3) DEFAULT NULL,
  `valor_desoneracao_icms` decimal(10,2) DEFAULT NULL,
  `motivo_desoneracao_icms` varchar(60) DEFAULT NULL,
  `percentual_diferimento_icms` decimal(10,2) DEFAULT NULL,
  `uf_retido_remetente_icms_st` char(2) DEFAULT NULL,
  `uf_destino_icms_st` char(2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_origem` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_II"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_II` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `vBC` double DEFAULT NULL,
  `vDespAdu` double DEFAULT NULL,
  `vII` double DEFAULT NULL,
  `vIOF` double DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_IPI"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_IPI` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `cIEnq` char(5) DEFAULT NULL,
  `CNPJProd` char(14) DEFAULT NULL,
  `cSelo` varchar(60) DEFAULT NULL,
  `qSelo` double DEFAULT NULL,
  `cEnq` char(3) DEFAULT NULL,
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `qUnid` double DEFAULT NULL,
  `pIPI` double DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_PIS"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_PIS` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pPIS` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_itens_PISST"
#

CREATE TABLE `base_web_control`.`nf_tributos_itens_PISST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_nf_devolucao_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_entrada_itens` int(11) NOT NULL DEFAULT '0',
  `id_nf_venda_itens` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `pPIS` double DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `vAliqProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_nf_venda_itens` (`id_nf_venda_itens`),
  KEY `fk_id_nf_entrada_itens` (`id_nf_entrada_itens`),
  KEY `fk_id_nf_devolucao_itens` (`id_nf_devolucao_itens`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nf_tributos_venda"
#

CREATE TABLE `base_web_control`.`nf_tributos_venda` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_natureza` int(2) DEFAULT NULL,
  `id_transportadora` int(11) DEFAULT NULL,
  `modalidade_frete` int(1) DEFAULT NULL,
  `info_adicionais` longtext,
  `danfe_saida` longtext,
  `num_nota_saida` int(10) NOT NULL,
  `finalizada` enum('S','N') DEFAULT 'N',
  `danfe_entrada` longtext,
  `outras_despesas` decimal(12,2) NOT NULL DEFAULT '0.00',
  `tipo_nota` int(1) DEFAULT '0' COMMENT '0 - Entrada   1 - Saida',
  `id_venda` int(11) DEFAULT NULL,
  `status` enum('A','S','C','R','D') DEFAULT 'A' COMMENT 'A - Aguardando, S - Nota Gerada com Sucesso , C - Nota Cancelada - R -Nota Rejeitada, D - Denegada',
  `finalidade` enum('D','S','E','V') DEFAULT 'V' COMMENT 'Devolucao - Saida - Entrada - Venda',
  `natureza` varchar(255) DEFAULT NULL,
  `qtd_volume` int(3) DEFAULT '1',
  `descricao_volume` varchar(10) DEFAULT 'BOX',
  `numero_nota_sefaz` int(11) DEFAULT NULL,
  `vlr_base_calc_st` decimal(13,3) DEFAULT NULL,
  `vlr_icms_st` decimal(13,3) DEFAULT NULL,
  `peso_bruto` decimal(12,3) DEFAULT NULL,
  `peso_liquido` decimal(12,3) DEFAULT NULL,
  `valor_desconto` decimal(12,2) DEFAULT NULL,
  `tipo_finalidade` enum('1','2','3','4') DEFAULT NULL COMMENT '1- NOTA NORMAL 2- NOTA COMPLEMENTAR 3- NOTA DE AJUSTE 4- NOTA DE DEVOLUÇÃO',
  `ambiente` int(1) unsigned DEFAULT '1' COMMENT '1 - Producao 2 - Homologacao',
  `valor_frete` decimal(15,3) DEFAULT NULL,
  `data_emissao` date DEFAULT NULL,
  `xml` longtext,
  `transportadora` varchar(255) DEFAULT NULL,
  `placa` varchar(20) DEFAULT NULL,
  `cod_antt` varchar(70) DEFAULT NULL,
  `id_placa` int(11) DEFAULT NULL,
  `numeracao` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20990 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_cupom_fiscal"
#

CREATE TABLE `base_web_control`.`nfe_cupom_fiscal` (
  `id_cupom_fiscal` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `sped` varchar(5) DEFAULT NULL,
  `percentual_issqn` decimal(10,2) DEFAULT NULL,
  `cst` int(11) DEFAULT NULL,
  `codigo_balanca` varchar(255) DEFAULT NULL,
  `percentual_icms` decimal(10,2) DEFAULT NULL,
  `percentual_pis` decimal(10,2) DEFAULT NULL,
  `csosn` varchar(60) DEFAULT NULL,
  `totalizador_parcial` varchar(10) DEFAULT NULL,
  `percentual_ipi` decimal(10,2) DEFAULT NULL,
  `percentual_cofins` decimal(10,2) DEFAULT NULL,
  `icmsst` varchar(60) DEFAULT NULL,
  `situacao_tributaria` char(1) DEFAULT NULL,
  `iat` varchar(20) DEFAULT NULL,
  `ippt` varchar(10) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cupom_fiscal`),
  KEY `fk_id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=99913 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_exigibilidade"
#

CREATE TABLE `base_web_control`.`nfe_exigibilidade` (
  `id_exigibilidade` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_exigibilidade`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_icms_interestaduais"
#

CREATE TABLE `base_web_control`.`nfe_icms_interestaduais` (
  `uf_destino` char(2) NOT NULL,
  `AC` int(2) NOT NULL,
  `AL` int(2) NOT NULL,
  `AM` int(2) NOT NULL,
  `AP` int(2) NOT NULL,
  `BA` int(2) NOT NULL,
  `CE` int(2) NOT NULL,
  `DF` int(2) NOT NULL,
  `ES` int(2) NOT NULL,
  `GO` int(2) NOT NULL,
  `MA` int(2) NOT NULL,
  `MT` int(2) NOT NULL,
  `MS` int(2) NOT NULL,
  `MG` int(2) NOT NULL,
  `PA` int(2) NOT NULL,
  `PB` int(2) NOT NULL,
  `PR` int(2) NOT NULL,
  `PE` int(2) NOT NULL,
  `PI` int(2) NOT NULL,
  `RN` int(2) NOT NULL,
  `RS` int(2) NOT NULL,
  `RJ` int(2) NOT NULL,
  `RO` decimal(10,2) DEFAULT NULL,
  `RR` int(2) NOT NULL,
  `SC` int(2) NOT NULL,
  `SP` int(2) NOT NULL,
  `SE` int(2) NOT NULL,
  `TOC` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_icms_interestaduais_cliente"
#

CREATE TABLE `base_web_control`.`nfe_icms_interestaduais_cliente` (
  `id_cadastro` int(11) NOT NULL,
  `uf` char(2) NOT NULL,
  `percentual` decimal(12,3) NOT NULL,
  PRIMARY KEY (`id_cadastro`,`uf`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_icms_situacao_tributaria"
#

CREATE TABLE `base_web_control`.`nfe_icms_situacao_tributaria` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `regime` enum('S','T') DEFAULT NULL COMMENT 'T - Tributacao Normal   S - Simples Nacional',
  `valor` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_lista_servico"
#

CREATE TABLE `base_web_control`.`nfe_lista_servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text,
  `codigo` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_modalidade"
#

CREATE TABLE `base_web_control`.`nfe_modalidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `tipo` enum('1','2','3') DEFAULT NULL,
  `valor` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_motivo_desoneracao_icms"
#

CREATE TABLE `base_web_control`.`nfe_motivo_desoneracao_icms` (
  `id_motivo_desoneracao` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_motivo_desoneracao`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_municipio"
#

CREATE TABLE `base_web_control`.`nfe_municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_estado` int(10) DEFAULT '0',
  `sigla` varchar(5) DEFAULT '',
  `descricao` varchar(100) DEFAULT '',
  `url_endereco` text,
  `url_endereco_hom` text,
  `url_endereco_prod` text,
  `padrao_xml` varchar(15) DEFAULT NULL,
  `habilitado_emissao_nota` int(1) DEFAULT '0',
  `arquivo_xml_php` varchar(40) DEFAULT NULL,
  `msg_observacao_nfs` longtext,
  `msg_info_interno` longtext,
  `msg_info_intermunicipal` longtext,
  `class_php` varchar(50) DEFAULT NULL,
  `class_php_new` varchar(50) DEFAULT NULL,
  `entidade_equiplano` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_01` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=5594 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_mvat"
#

CREATE TABLE `base_web_control`.`nfe_mvat` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `uf_destino` char(2) NOT NULL,
  `mvat_sn` decimal(12,3) NOT NULL,
  `mvat_lr` decimal(12,3) NOT NULL,
  `pICMS_Interno` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_origem"
#

CREATE TABLE `base_web_control`.`nfe_origem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(2) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_paises"
#

CREATE TABLE `base_web_control`.`nfe_paises` (
  `codigo` bigint(11) NOT NULL DEFAULT '0',
  `nome` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_COFINS"
#

CREATE TABLE `base_web_control`.`nfe_Produto_COFINS` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `p_aliq` decimal(10,3) NOT NULL,
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pCOFINS` decimal(10,3) DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_COFINSST"
#

CREATE TABLE `base_web_control`.`nfe_Produto_COFINSST` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imposto_id` int(11) DEFAULT NULL,
  `pCOFINS` decimal(10,2) DEFAULT NULL,
  `qBCProd` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `produto_id` int(11) unsigned DEFAULT '0',
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk001` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=324115 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_ICMS"
#

CREATE TABLE `base_web_control`.`nfe_Produto_ICMS` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `orig` char(1) DEFAULT NULL,
  `CST` char(3) DEFAULT NULL,
  `modBC` char(1) DEFAULT NULL,
  `pRedBC` decimal(10,3) DEFAULT NULL,
  `pICMS` decimal(10,4) DEFAULT NULL,
  `modBCST` char(1) DEFAULT NULL,
  `pMVAST` decimal(10,3) DEFAULT NULL,
  `pRedBCST` decimal(10,3) DEFAULT NULL,
  `pICMSST` decimal(10,2) DEFAULT NULL,
  `regimes` enum('T','S') DEFAULT 'T',
  `pOpePropria` decimal(10,3) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `vl_aliq_calc_cre` decimal(10,3) DEFAULT NULL,
  `bc_icms_st_ret_ant` decimal(10,3) DEFAULT NULL,
  `pMVAST_LR` decimal(10,3) DEFAULT NULL,
  `valor_desoneracao_icms` decimal(10,2) DEFAULT NULL,
  `motivo_desoneracao_icms` varchar(60) DEFAULT NULL,
  `percentual_diferimento_icms` decimal(10,2) DEFAULT NULL,
  `uf_retido_remetente_icms_st` char(2) DEFAULT NULL,
  `uf_destino_icms_st` char(2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_II"
#

CREATE TABLE `base_web_control`.`nfe_Produto_II` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `vBC` double DEFAULT NULL,
  `vDespAdu` double DEFAULT NULL,
  `vII` double DEFAULT NULL,
  `vIOF` double DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_IPI"
#

CREATE TABLE `base_web_control`.`nfe_Produto_IPI` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `cIEnq` char(5) DEFAULT NULL,
  `CNPJProd` char(14) DEFAULT NULL,
  `cSelo` varchar(60) DEFAULT NULL,
  `qSelo` double DEFAULT NULL,
  `cEnq` char(3) DEFAULT NULL,
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `qUnid` double DEFAULT NULL,
  `pIPI` double DEFAULT NULL,
  `tp_calculo` enum('P','V') DEFAULT 'P',
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_ISSQN"
#

CREATE TABLE `base_web_control`.`nfe_Produto_ISSQN` (
  `ISSQN_id` int(11) NOT NULL AUTO_INCREMENT,
  `imposto_id` int(11) DEFAULT NULL,
  `pAliq` double(4,2) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `cMunFG` char(7) DEFAULT NULL,
  `cListServ` varchar(4) DEFAULT NULL,
  `tributacao` enum('N','R','S','I') DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `id_exigibilidade` int(11) DEFAULT NULL,
  `incentivo_fiscal` enum('S','N') DEFAULT 'S',
  `valor_deducoes` decimal(10,2) DEFAULT NULL,
  `valor_outras_retencoes` decimal(10,2) DEFAULT NULL,
  `valor_desconto_condicionado` decimal(10,2) DEFAULT NULL,
  `valor_retencao` decimal(10,2) DEFAULT NULL,
  `codigo_servico` varchar(5) DEFAULT NULL,
  `uf_incidencia` char(2) DEFAULT NULL,
  `id_municipio_incidencia` int(11) DEFAULT NULL,
  `processo` varchar(60) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`ISSQN_id`),
  KEY `idx_id_produto` (`produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3950 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_Opcoes"
#

CREATE TABLE `base_web_control`.`nfe_Produto_Opcoes` (
  `id_produto` int(11) DEFAULT NULL,
  `tributacao_lucro` enum('S','N') DEFAULT 'N',
  KEY `fk_001` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_PIS"
#

CREATE TABLE `base_web_control`.`nfe_Produto_PIS` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `CST` int(2) unsigned zerofill DEFAULT '00',
  `pPIS` decimal(10,2) DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_Produto_PISST"
#

CREATE TABLE `base_web_control`.`nfe_Produto_PISST` (
  `id_produto` int(11) NOT NULL DEFAULT '0',
  `tp_calculo` char(1) DEFAULT 'N' COMMENT 'N - Nulo    P - Percentual  V-Valores',
  `pPIS` double DEFAULT NULL,
  `qBCProd` double DEFAULT NULL,
  `vAliqProd` double DEFAULT NULL,
  `v_aliq` decimal(10,2) DEFAULT NULL,
  `tp_imposto` enum('A','B') DEFAULT 'A',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_situacao_tributaria"
#

CREATE TABLE `base_web_control`.`nfe_situacao_tributaria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` int(3) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `tipo` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_tipo_especifico"
#

CREATE TABLE `base_web_control`.`nfe_tipo_especifico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `situacao` enum('0','1') DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_transportadora"
#

CREATE TABLE `base_web_control`.`nfe_transportadora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_modalidade_frete` int(2) DEFAULT NULL,
  `id_transportadora` int(11) DEFAULT NULL,
  `quantidade_volumes` int(11) DEFAULT NULL,
  `peso_liquido` decimal(10,2) DEFAULT NULL,
  `peso_bruto` decimal(10,2) DEFAULT NULL,
  `especie` varchar(60) DEFAULT NULL,
  `id_nfe` bigint(20) DEFAULT NULL,
  `lacre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "nfe_uf"
#

CREATE TABLE `base_web_control`.`nfe_uf` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` char(2) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `CONTINGENCIA` enum('S','N') DEFAULT 'N',
  `FCP_percentual` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `FK_01` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

#
# Structure for table "nfs_server"
#

CREATE TABLE `base_web_control`.`nfs_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cidade` varchar(60) NOT NULL,
  `uf` char(2) NOT NULL,
  `endereco_xsd` varchar(50) NOT NULL,
  `endereco_producao` varchar(200) NOT NULL DEFAULT '',
  `endereco_homologacao` varchar(200) NOT NULL DEFAULT '',
  `xml_assinado` enum('S','N') DEFAULT 'S',
  `xml_padrao` varchar(15) DEFAULT NULL,
  `informacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;

#
# Structure for table "nfs_situacao_tributaria"
#

CREATE TABLE `base_web_control`.`nfs_situacao_tributaria` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `padrao` varchar(10) DEFAULT NULL,
  `codigo_st` int(2) DEFAULT NULL,
  `descricao` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Structure for table "nfse_erros"
#

CREATE TABLE `base_web_control`.`nfse_erros` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `idCidade` int(11) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  `mensagem` longtext,
  `correcao` longtext,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;

#
# Structure for table "nota_credito"
#

CREATE TABLE `base_web_control`.`nota_credito` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda_origem` int(11) NOT NULL,
  `id_venda_devol` int(11) DEFAULT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_cadastro` int(11) NOT NULL,
  `data_cadastro` date NOT NULL,
  `hora_cadastro` time NOT NULL,
  `valor_credito` decimal(12,2) NOT NULL,
  `id_func_cadastro` int(11) NOT NULL,
  `id_venda_resgate` int(11) NOT NULL,
  `data_resgate` date NOT NULL,
  `hora_resgate` time NOT NULL,
  `valor_resgate` decimal(12,2) NOT NULL,
  `id_func_resgate` int(11) NOT NULL,
  `justificativa` varchar(100) NOT NULL,
  `status` enum('A','E') NOT NULL DEFAULT 'A' COMMENT 'A = Ativo, E = Excluida',
  `id_usuario_exclusao` int(11) NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_nt01` (`id_venda_origem`),
  KEY `fk_nt02` (`id_cadastro`),
  KEY `fk_nt03` (`id_cliente`),
  KEY `fk_nt04` (`id_venda_resgate`)
) ENGINE=InnoDB AUTO_INCREMENT=73007 DEFAULT CHARSET=latin1;

#
# Structure for table "nota_credito_historico"
#

CREATE TABLE `base_web_control`.`nota_credito_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL DEFAULT '0',
  `idnota_credito` bigint(20) NOT NULL DEFAULT '0',
  `data_hora` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_venda` int(11) NOT NULL,
  `valor_inicial` decimal(12,2) NOT NULL,
  `valor_abatido` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_nota` (`idnota_credito`),
  CONSTRAINT `id_nota` FOREIGN KEY (`idnota_credito`) REFERENCES `base_web_control`.`nota_credito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24443 DEFAULT CHARSET=latin1;

#
# Structure for table "nota_fiscal"
#

CREATE TABLE `base_web_control`.`nota_fiscal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `numero_nota` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hora_cadastro` time DEFAULT NULL,
  `id_produto` int(10) unsigned DEFAULT NULL,
  `qtd_produto` decimal(10,3) unsigned DEFAULT NULL,
  `id_fornecedor` int(10) unsigned DEFAULT NULL,
  `vlr_unitario` decimal(16,6) unsigned DEFAULT NULL,
  `vlr_venda` decimal(10,2) DEFAULT NULL,
  `informacoes_adicionais` text,
  `codigo_barra` varchar(30) DEFAULT NULL,
  `fator` int(3) NOT NULL DEFAULT '1',
  `ncm` varchar(10) DEFAULT NULL,
  `picms` decimal(5,2) DEFAULT NULL,
  `vr_ipi` decimal(12,2) DEFAULT NULL,
  `vr_pis` decimal(12,2) DEFAULT NULL,
  `vr_cofins` decimal(12,2) DEFAULT NULL,
  `vlr_total` decimal(15,2) DEFAULT NULL,
  `vlr_total_prod` decimal(15,2) DEFAULT NULL,
  `status` enum('A','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, E - Excluido',
  `cest` varchar(8) DEFAULT NULL,
  `codigo_anp` varchar(50) DEFAULT NULL,
  `codigo_barra_ean` varchar(50) DEFAULT NULL,
  `margem_lucro` decimal(10,2) DEFAULT NULL,
  `vr_icmsst` decimal(10,2) DEFAULT NULL,
  `nf_data_emissao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_fornecedor`),
  KEY `fk_nota01` (`id_cadastro`),
  KEY `fk_id_produto` (`id_produto`),
  KEY `fk_nota02` (`numero_nota`),
  KEY `fk_nota03` (`id_cadastro`,`codigo_barra`)
) ENGINE=InnoDB AUTO_INCREMENT=6323519 DEFAULT CHARSET=latin1;

#
# Structure for table "nota_fiscal_tmp"
#

CREATE TABLE `base_web_control`.`nota_fiscal_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `numero_nota` varchar(50) DEFAULT NULL,
  `serie` varchar(20) DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  `hora_cadastro` time DEFAULT NULL,
  `id_produto` int(10) unsigned DEFAULT NULL,
  `qtd_produto` decimal(10,3) unsigned DEFAULT NULL,
  `id_fornecedor` int(10) unsigned DEFAULT NULL,
  `vlr_unitario` decimal(16,4) DEFAULT NULL,
  `vlr_venda` decimal(16,4) DEFAULT NULL,
  `vlr_total` decimal(12,2) DEFAULT NULL,
  `vlr_nota` decimal(12,2) DEFAULT NULL,
  `informacoes_adicionais` text,
  `codigo_barra` varchar(30) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `tipo` varchar(5) DEFAULT NULL,
  `fator` int(3) DEFAULT NULL,
  `ncm` varchar(10) DEFAULT NULL,
  `nfci` varchar(60) DEFAULT NULL,
  `infAdProd` varchar(255) DEFAULT NULL,
  `id_origem` int(1) DEFAULT NULL,
  `picms` decimal(5,2) DEFAULT NULL,
  `vr_ipi` decimal(12,2) DEFAULT NULL,
  `vr_pis` decimal(12,2) DEFAULT NULL,
  `vr_cofins` decimal(12,2) DEFAULT NULL,
  `vr_total` decimal(12,2) DEFAULT NULL,
  `id_pro_parametro_valor` int(11) DEFAULT NULL,
  `grade` varchar(400) DEFAULT '0',
  `cest` varchar(8) DEFAULT NULL,
  `codigo_anp` varchar(50) DEFAULT NULL,
  `codigo_barra_ean` varchar(50) DEFAULT NULL,
  `margem_lucro` decimal(10,3) DEFAULT NULL,
  `vr_icmsst` decimal(10,2) DEFAULT NULL,
  `vlr_atacado` decimal(16,4) DEFAULT NULL,
  `id_classificacao` int(11) DEFAULT NULL,
  `fracionar_qtditens` decimal(16,3) DEFAULT NULL,
  `nf_data_emissao` datetime DEFAULT NULL,
  `tipo_calculo` enum('P','R','F') NOT NULL DEFAULT 'P',
  `id_unidade` int(11) DEFAULT NULL,
  `vr_vfcp` decimal(10,4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`,`id_fornecedor`),
  KEY `fk_nota01` (`id_cadastro`),
  KEY `fk_id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=5631397 DEFAULT CHARSET=latin1;

#
# Structure for table "notas_promissorias"
#

CREATE TABLE `base_web_control`.`notas_promissorias` (
  `promissoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `promissoria_chave` varchar(10) NOT NULL DEFAULT '0',
  `codloja` int(11) DEFAULT NULL,
  `debito_valor` decimal(10,2) DEFAULT NULL,
  `parcela_quantidade` smallint(4) DEFAULT NULL,
  `parcela_valor` decimal(10,2) DEFAULT NULL,
  `parcela_data` date DEFAULT NULL,
  `emissao_data` date DEFAULT NULL,
  `consumidor_cpf` varchar(14) DEFAULT NULL,
  `consumidor_nome` varchar(100) DEFAULT NULL,
  `consumidor_end_tipo` int(11) DEFAULT NULL,
  `consumidor_end_logradouro` varchar(100) DEFAULT NULL,
  `consumidor_end_numero` int(11) DEFAULT NULL,
  `consumidor_end_complemento` varchar(50) DEFAULT NULL,
  `consumidor_end_bairro` varchar(50) DEFAULT NULL,
  `consumidor_end_cidade` varchar(50) DEFAULT NULL,
  `consumidor_end_uf` varchar(2) DEFAULT NULL,
  `consumidor_end_cep` varchar(10) DEFAULT NULL,
  `consumidor_tel_residencial` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`promissoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "oauth_clients"
#

CREATE TABLE `base_web_control`.`oauth_clients` (
  `client_id` int(11) NOT NULL,
  `client_secret` varchar(256) NOT NULL,
  `redirect_uri` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "oauth_tokens"
#

CREATE TABLE `base_web_control`.`oauth_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_token` varchar(256) NOT NULL,
  `access_token_expires_on` timestamp NOT NULL,
  `client_id` varchar(256) NOT NULL,
  `refresh_token` varchar(256) NOT NULL,
  `refresh_token_expires_on` timestamp NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "orcamento"
#

CREATE TABLE `base_web_control`.`orcamento` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `observacao` text,
  `data_hora_orcamento` datetime DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_forma_pagamento` int(11) DEFAULT NULL,
  `status` enum('A','C') DEFAULT 'A' COMMENT 'Aberto, Concluído',
  `id_cliente` bigint(20) DEFAULT NULL,
  `tabela` enum('O','C') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_cliente` (`id_cliente`),
  KEY `fk_id_forma_pagamento` (`id_forma_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=78014 DEFAULT CHARSET=latin1;

#
# Structure for table "orcamento_cliente"
#

CREATE TABLE `base_web_control`.`orcamento_cliente` (
  `id` bigint(1) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(50) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_tplog` int(11) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(25) DEFAULT NULL,
  `bairro` varchar(40) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27422 DEFAULT CHARSET=latin1;

#
# Structure for table "orcamento_itens"
#

CREATE TABLE `base_web_control`.`orcamento_itens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_orcamento` bigint(20) DEFAULT NULL,
  `qtd` varchar(10) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_unidade` int(2) DEFAULT '10',
  PRIMARY KEY (`id`),
  KEY `fk_id_orcamento` (`id_orcamento`),
  KEY `fk_id_unidade` (`id_unidade`)
) ENGINE=InnoDB AUTO_INCREMENT=181072 DEFAULT CHARSET=latin1;

#
# Structure for table "ordem_servico"
#

CREATE TABLE `base_web_control`.`ordem_servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `ativo` tinyint(4) DEFAULT '0',
  `enviar_torpedo` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102739 DEFAULT CHARSET=latin1;

#
# Structure for table "ordem_servico_itens"
#

CREATE TABLE `base_web_control`.`ordem_servico_itens` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164765 DEFAULT CHARSET=latin1;

#
# Structure for table "ordem_servico_tipo"
#

CREATE TABLE `base_web_control`.`ordem_servico_tipo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(70) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_hora_cadastro` datetime DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A' COMMENT 'Ativo, Inativo',
  `valor_padrao` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=59544 DEFAULT CHARSET=latin1;

#
# Structure for table "origem"
#

CREATE TABLE `base_web_control`.`origem` (
  `id` int(11) NOT NULL DEFAULT '0',
  `descricao` varchar(50) DEFAULT NULL,
  `situacao` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "Pagamento_notas"
#

CREATE TABLE `base_web_control`.`Pagamento_notas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_nota` varchar(255) DEFAULT NULL,
  `tipo_nota` varchar(255) DEFAULT NULL COMMENT 'E = Entrada, D = Devolucao, S = Saida',
  `meio_pagamento` int(11) DEFAULT NULL,
  `valor_pagamento` decimal(10,2) DEFAULT NULL,
  `forma_pagamento` int(11) DEFAULT NULL COMMENT '0 = A vista, 1 = A prazo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4774 DEFAULT CHARSET=latin1;

#
# Structure for table "pais"
#

CREATE TABLE `base_web_control`.`pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "parcela"
#

CREATE TABLE `base_web_control`.`parcela` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "permissao_usuario"
#

CREATE TABLE `base_web_control`.`permissao_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_modulo` int(11) DEFAULT NULL,
  `id_cod_permissao` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_permissao02` (`id_usuario`),
  KEY `fk_permissao01` (`id_modulo`,`id_cod_permissao`)
) ENGINE=InnoDB AUTO_INCREMENT=2079798 DEFAULT CHARSET=latin1;

#
# Structure for table "posto_registros"
#

CREATE TABLE `base_web_control`.`posto_registros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `codigo_barra` varchar(255) DEFAULT NULL,
  `descricao` text,
  `data_fechamento` date DEFAULT NULL,
  `estoque_inicio_dia` float DEFAULT NULL,
  `volume_entradas` float DEFAULT NULL,
  `volume_disponivel` float DEFAULT NULL,
  `volume_saidas` float DEFAULT NULL,
  `estoque_escritural` float DEFAULT NULL,
  `valor_perda` float DEFAULT NULL,
  `valor_ganho` float DEFAULT NULL,
  `estoque_fechamento` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "pro_parametro"
#

CREATE TABLE `base_web_control`.`pro_parametro` (
  `id_pro_parametro` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `parametro` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pro_parametro`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

#
# Structure for table "pro_parametro_valor"
#

CREATE TABLE `base_web_control`.`pro_parametro_valor` (
  `id_pro_parametro_valor` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_valor` int(11) DEFAULT NULL,
  `qtd` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_pro_parametro_valor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "pro_valor"
#

CREATE TABLE `base_web_control`.`pro_valor` (
  `id_pro_valor` int(11) NOT NULL AUTO_INCREMENT,
  `id_parametro` int(11) DEFAULT NULL,
  `valor_parametro` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pro_valor`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

#
# Structure for table "produto"
#

CREATE TABLE `base_web_control`.`produto` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(120) DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_classificacao` int(10) unsigned DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `id_cor` int(5) DEFAULT NULL,
  `tamanho` varchar(15) DEFAULT NULL,
  `custo` decimal(10,5) DEFAULT NULL,
  `custo_medio_venda` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda_prazo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_varejo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_atacado` decimal(12,3) unsigned DEFAULT NULL,
  `porcentagem_custo_venda` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_venda_prazo` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_avista` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_aprazo` decimal(18,15) unsigned DEFAULT NULL,
  `qtd_atacado` int(10) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo, E - Excluido',
  `qtd_minima` decimal(10,3) DEFAULT '0.000',
  `peso` decimal(12,4) DEFAULT '0.0000',
  `codigo_barra` varchar(22) DEFAULT NULL,
  `barra` varchar(20) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `iss` int(2) DEFAULT '0',
  `icms` decimal(4,2) DEFAULT '0.00',
  `id_unidade` int(2) NOT NULL DEFAULT '2',
  `id_unidade_trib` int(2) DEFAULT NULL,
  `localizacao` varchar(50) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `ex_tipi` varchar(3) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(8) DEFAULT NULL,
  `unidade_trib` varchar(6) DEFAULT NULL,
  `qtd_trib` varchar(10) DEFAULT NULL,
  `vlr_unit_trib` decimal(10,2) DEFAULT NULL,
  `genero_produto` int(2) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT '0' COMMENT '0 - Nacional, 1 - Importacao Direta, 2 - Adquirida no mercado Interno',
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(3) DEFAULT '0',
  `vender_estoque_zerado` enum('S','N') DEFAULT 'S',
  `descricao_detalhada` text,
  `ecommerce` enum('S','N') DEFAULT 'N' COMMENT 'Enviar para Loja Virtual',
  `promocao_ecommerce` enum('S','N') DEFAULT 'N',
  `produto_destaque_ecommerce` enum('S','N') DEFAULT 'N',
  `altura` decimal(12,2) DEFAULT '0.00',
  `largura` decimal(12,2) DEFAULT '0.00',
  `comprimento` decimal(12,2) DEFAULT '0.00',
  `id_marca` int(11) DEFAULT NULL,
  `destaque` enum('P','L','N') DEFAULT 'N' COMMENT 'Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `cofins` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `lote_produto` varchar(15) DEFAULT NULL,
  `nr_edicao` varchar(15) DEFAULT NULL,
  `peso_bruto` decimal(12,4) DEFAULT '0.0000',
  `pis_aliquota` decimal(4,2) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(3) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` decimal(4,2) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(2) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` decimal(12,4) DEFAULT '0.0000',
  `alt_caixa` decimal(5,2) DEFAULT NULL,
  `larg_caixa` decimal(5,2) DEFAULT NULL,
  `comp_caixa` decimal(5,2) DEFAULT NULL,
  `margem_lucro_tipo` enum('P','V') DEFAULT NULL,
  `margem_lucro_valor` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_tipo` enum('P','V') DEFAULT NULL,
  `desconto_maximo_percentual` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_valor` decimal(10,2) DEFAULT NULL,
  `infos_nutricionais` enum('S','N') DEFAULT 'N',
  `prod_serv` enum('P','S') NOT NULL DEFAULT 'P',
  `identificacao_interna` varchar(22) DEFAULT NULL,
  `solicitar_vrtotal` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(1) unsigned DEFAULT '2',
  `locacao_quantidade` decimal(10,3) unsigned DEFAULT '0.000',
  `obs_preco` text,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `perc_dif_uf` decimal(5,2) DEFAULT NULL,
  `qtd_unidade` decimal(10,3) DEFAULT NULL,
  `truncar_vlr_total` enum('S','N') DEFAULT 'S',
  `codigo_anp` varchar(10) DEFAULT NULL,
  `env_prod` enum('S','N') DEFAULT 'S' COMMENT 'Enviar para Producao (comanda)',
  `peso_liquido` decimal(12,4) DEFAULT '0.0000',
  `estoque_lojavirtual` tinyint(4) DEFAULT '1',
  `deletar` enum('S','N') NOT NULL DEFAULT 'S',
  `comissao_valor` decimal(12,2) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `fcp` char(1) DEFAULT 'S',
  `glp` char(1) DEFAULT 'N',
  `exibir_grafico` int(1) DEFAULT '0',
  `id_ibptax` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produto04` (`id_cadastro`),
  KEY `fk_produto03` (`id_classificacao`),
  KEY `fk_produto00` (`id_cadastro`,`codigo_barra`),
  KEY `fk_produto01` (`id_cadastro`,`codigo_barra`,`id_classificacao`,`id_fornecedor`),
  KEY `fk_produto02` (`id_cadastro`,`descricao`),
  FULLTEXT KEY `fk_produto05` (`descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=1003028624 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_apoio"
#

CREATE TABLE `base_web_control`.`produto_apoio` (
  `ID` int(11) DEFAULT NULL,
  `UID` text,
  `Codigo` text,
  `Descricao` text,
  `Unid` text,
  `Preco` int(11) DEFAULT NULL,
  `PrecoAuto` text,
  `Margem` text,
  `Obs` int(11) DEFAULT NULL,
  `Imagem` int(11) DEFAULT NULL,
  `Categoria` int(11) DEFAULT NULL,
  `Fornecedor` int(11) DEFAULT NULL,
  `SubCateg` int(11) DEFAULT NULL,
  `EstoqueAtual` int(11) DEFAULT NULL,
  `EstoquePend` int(11) DEFAULT NULL,
  `EstoqueTot` int(11) DEFAULT NULL,
  `brtrib` int(11) DEFAULT NULL,
  `CustoUnitario` text,
  `PodeAlterarPreco` int(11) DEFAULT NULL,
  `PermiteVendaFracionada` int(11) DEFAULT NULL,
  `NaoControlaEstoque` text,
  `EstoqueMin` int(11) DEFAULT NULL,
  `EstoqueMax` int(11) DEFAULT NULL,
  `AbaixoMin` text,
  `AbaixoMinDesde` text,
  `EstoqueRepor` int(11) DEFAULT NULL,
  `ComissaoPerc` int(11) DEFAULT NULL,
  `ComissaoLucro` int(11) DEFAULT NULL,
  `PesoBruto` int(11) DEFAULT NULL,
  `PesoLiq` int(11) DEFAULT NULL,
  `tax_id` int(11) DEFAULT NULL,
  `Ativo` text,
  `Fidelidade` text,
  `FidPontos` int(11) DEFAULT NULL,
  `NCM` int(11) DEFAULT NULL,
  `NCM_Ex` int(11) DEFAULT NULL,
  `cest` int(11) DEFAULT NULL,
  `modST` int(11) DEFAULT NULL,
  `MVA` int(11) DEFAULT NULL,
  `Pauta` int(11) DEFAULT NULL,
  `CadastroRapido` text,
  `IncluidoEm` text,
  `AlteradoEm` text,
  `AlteradoPor` text,
  `RecVer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produto_arrumar_estoque"
#

CREATE TABLE `base_web_control`.`produto_arrumar_estoque` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora_arrumo` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_produto` bigint(20) DEFAULT NULL,
  `qtd_atual` decimal(10,3) DEFAULT NULL,
  `qtd_retiro_inseriu` decimal(10,3) DEFAULT NULL,
  `informacoes_adicionais` text,
  `inserir_retirar` enum('I','R') DEFAULT 'I',
  `fico` decimal(10,3) DEFAULT NULL,
  `id_motivo` int(11) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `tipo` enum('E','S','A') DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `id_grade` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arruma01` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`),
  KEY `fk_id_produto` (`id_produto`),
  KEY `fk_id_001` (`id_cadastro`,`id_produto`),
  KEY `fk_id_002` (`id_cadastro`,`id_produto`,`inserir_retirar`)
) ENGINE=InnoDB AUTO_INCREMENT=6816588 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_arrumar_estoque_tmp"
#

CREATE TABLE `base_web_control`.`produto_arrumar_estoque_tmp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora_arrumo` datetime DEFAULT NULL,
  `id_cliente` bigint(20) DEFAULT NULL,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_produto` bigint(20) DEFAULT NULL,
  `qtd_atual` decimal(10,3) DEFAULT NULL,
  `qtd_retiro_inseriu` decimal(10,3) DEFAULT NULL,
  `informacoes_adicionais` text,
  `inserir_retirar` enum('I','R') DEFAULT 'I',
  `fico` decimal(10,3) DEFAULT NULL,
  `id_motivo` varchar(255) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `tipo` enum('E','S','A') DEFAULT NULL,
  `cod_barra` varchar(20) DEFAULT NULL,
  `unidade_destino` text,
  PRIMARY KEY (`id`),
  KEY `fk_arruma01` (`id_cadastro`),
  KEY `fk_id_usuario` (`id_usuario`),
  KEY `fk_id_produto` (`id_produto`),
  KEY `fk_id_001` (`id_cadastro`,`id_produto`),
  KEY `fk_id_002` (`id_cadastro`,`id_produto`,`inserir_retirar`)
) ENGINE=InnoDB AUTO_INCREMENT=195403 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_beneficio_fiscal"
#

CREATE TABLE `base_web_control`.`produto_beneficio_fiscal` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) DEFAULT NULL,
  `cst` int(3) DEFAULT NULL,
  `cBeneFiscal` varchar(8) DEFAULT '',
  PRIMARY KEY (`Id`),
  KEY `fk001` (`id_produto`,`cst`)
) ENGINE=InnoDB AUTO_INCREMENT=13356 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_busca_prevenda"
#

CREATE TABLE `base_web_control`.`produto_busca_prevenda` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(105) DEFAULT NULL,
  `chave` varchar(105) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='selectFiltroBuscaPreVenda';

#
# Structure for table "produto_busca_prevenda_ordem"
#

CREATE TABLE `base_web_control`.`produto_busca_prevenda_ordem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_busca_prevenda` int(11) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2496 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_combNF"
#

CREATE TABLE `base_web_control`.`produto_combNF` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `descANP` varchar(20) NOT NULL,
  `pGLP` decimal(12,2) NOT NULL,
  `CODIF` int(11) NOT NULL,
  `qTemp` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=15476 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_configuracoes_comercial"
#

CREATE TABLE `base_web_control`.`produto_configuracoes_comercial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) DEFAULT NULL,
  `controle_qtd` enum('S','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_contabil"
#

CREATE TABLE `base_web_control`.`produto_contabil` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) DEFAULT NULL,
  `codBenef` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk001` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_fornecedor"
#

CREATE TABLE `base_web_control`.`produto_fornecedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) unsigned NOT NULL,
  `id_fornecedor` int(10) unsigned NOT NULL,
  `id_usuario` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_produto_idx` (`id_produto`),
  KEY `fk_fornecedor_fornecedor_produto_idx` (`id_fornecedor`),
  KEY `idx_busca` (`id_produto`,`id_fornecedor`),
  CONSTRAINT `fk_fornecedor_fornecedor_produto` FOREIGN KEY (`id_fornecedor`) REFERENCES `base_web_control`.`fornecedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_produto_fornecedor_produto` FOREIGN KEY (`id_produto`) REFERENCES `base_web_control`.`produto` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2023 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_foto"
#

CREATE TABLE `base_web_control`.`produto_foto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_produto` bigint(20) DEFAULT NULL COMMENT 'id_grade ou id_produto ',
  `caminho_imagem` varchar(150) DEFAULT NULL,
  `id_grade` bigint(20) DEFAULT NULL COMMENT 'id_grade ou id_produto ',
  PRIMARY KEY (`id`),
  KEY `fk_id_produto` (`id_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=504956 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_icms"
#

CREATE TABLE `base_web_control`.`produto_icms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT NULL,
  `id_base_calculo` int(11) DEFAULT NULL,
  `aliquota_icms` decimal(10,2) DEFAULT NULL,
  `percentual_base_calculo` decimal(10,2) DEFAULT NULL,
  `id_modalidade_st` int(11) DEFAULT NULL,
  `aliquota_icms_st` decimal(10,2) DEFAULT NULL,
  `percentual_reducao` decimal(10,2) DEFAULT NULL,
  `percentual_margem` decimal(10,2) DEFAULT NULL,
  `id_produto` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `data_hora_cadastro` datetime DEFAULT NULL,
  `situacao` enum('A','E') DEFAULT 'A',
  `data_hora_excluido` datetime DEFAULT NULL,
  `id_usuario_deleto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=latin1;

#
# Structure for table "produto_info_nutricionais"
#

CREATE TABLE `base_web_control`.`produto_info_nutricionais` (
  `id_produto` int(6) NOT NULL,
  `dias` int(2) NOT NULL,
  `porcao` varchar(35) NOT NULL,
  `calorias` int(5) NOT NULL,
  `caboidrato` int(5) NOT NULL,
  `proteinas` int(5) NOT NULL,
  `gord_tot` int(5) NOT NULL,
  `gord_sat` int(5) NOT NULL,
  `colesterol` int(5) NOT NULL,
  `gord_trans` int(5) NOT NULL,
  `fibra` int(5) NOT NULL,
  `calcio` int(5) NOT NULL,
  `ferro` int(5) NOT NULL,
  `sodio` int(5) NOT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produto_num_parcelas_aux"
#

CREATE TABLE `base_web_control`.`produto_num_parcelas_aux` (
  `id_produto` int(11) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produto_pedido_equipamento"
#

CREATE TABLE `base_web_control`.`produto_pedido_equipamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TABELA USADA PARA TABELA DE PEDIDOS DA PAGINA DE FRANQUIAS',
  `id_cadastro` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=596 DEFAULT CHARSET=latin1;

#
# Structure for table "produto2"
#

CREATE TABLE `base_web_control`.`produto2` (
  `descricao` varchar(120) DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_classificacao` int(10) unsigned DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `id_cor` int(5) DEFAULT NULL,
  `tamanho` varchar(15) DEFAULT NULL,
  `custo` decimal(10,5) DEFAULT NULL,
  `custo_medio_venda` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda_prazo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_varejo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_atacado` decimal(12,3) unsigned DEFAULT NULL,
  `porcentagem_custo_venda` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_venda_prazo` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_avista` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_aprazo` decimal(18,15) unsigned DEFAULT NULL,
  `qtd_atacado` int(10) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo, E - Excluido',
  `qtd_minima` decimal(10,3) DEFAULT '0.000',
  `peso` decimal(12,4) DEFAULT '0.0000',
  `codigo_barra` varchar(22) DEFAULT NULL,
  `barra` varchar(20) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `iss` int(2) DEFAULT '0',
  `icms` decimal(4,2) DEFAULT '0.00',
  `id_unidade` int(2) NOT NULL DEFAULT '2',
  `localizacao` varchar(50) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `ex_tipi` varchar(3) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(8) DEFAULT NULL,
  `unidade_trib` varchar(6) DEFAULT NULL,
  `qtd_trib` varchar(10) DEFAULT NULL,
  `vlr_unit_trib` decimal(10,2) DEFAULT NULL,
  `genero_produto` int(2) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT '0' COMMENT '0 - Nacional, 1 - Importacao Direta, 2 - Adquirida no mercado Interno',
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(3) DEFAULT '0',
  `vender_estoque_zerado` enum('S','N') DEFAULT 'S',
  `descricao_detalhada` text,
  `ecommerce` enum('S','N') DEFAULT 'N' COMMENT 'Enviar para Loja Virtual',
  `promocao_ecommerce` enum('S','N') DEFAULT 'N',
  `produto_destaque_ecommerce` enum('S','N') DEFAULT 'N',
  `altura` decimal(12,2) DEFAULT '0.00',
  `largura` decimal(12,2) DEFAULT '0.00',
  `comprimento` decimal(12,2) DEFAULT '0.00',
  `id_marca` int(11) DEFAULT NULL,
  `destaque` enum('P','L','N') DEFAULT 'N' COMMENT 'Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `cofins` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `lote_produto` varchar(15) DEFAULT NULL,
  `nr_edicao` varchar(15) DEFAULT NULL,
  `peso_bruto` decimal(12,4) DEFAULT '0.0000',
  `pis_aliquota` decimal(4,2) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(3) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` decimal(4,2) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(2) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` decimal(12,4) DEFAULT '0.0000',
  `alt_caixa` decimal(5,2) DEFAULT NULL,
  `larg_caixa` decimal(5,2) DEFAULT NULL,
  `comp_caixa` decimal(5,2) DEFAULT NULL,
  `margem_lucro_tipo` enum('P','V') DEFAULT NULL,
  `margem_lucro_valor` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_tipo` enum('P','V') DEFAULT NULL,
  `desconto_maximo_percentual` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_valor` decimal(10,2) DEFAULT NULL,
  `infos_nutricionais` enum('S','N') DEFAULT 'N',
  `prod_serv` enum('P','S') NOT NULL DEFAULT 'P',
  `identificacao_interna` varchar(22) DEFAULT NULL,
  `solicitar_vrtotal` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(1) unsigned DEFAULT '2',
  `locacao_quantidade` decimal(10,3) unsigned DEFAULT '0.000',
  `obs_preco` text,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `perc_dif_uf` decimal(5,2) DEFAULT NULL,
  `qtd_unidade` decimal(10,3) DEFAULT NULL,
  `truncar_vlr_total` enum('S','N') DEFAULT 'S',
  `codigo_anp` varchar(10) DEFAULT NULL,
  `env_prod` enum('S','N') DEFAULT 'S' COMMENT 'Enviar para Producao (comanda)',
  `peso_liquido` decimal(12,4) DEFAULT '0.0000',
  `estoque_lojavirtual` tinyint(4) DEFAULT '1',
  `deletar` enum('S','N') NOT NULL DEFAULT 'S',
  `comissao_valor` decimal(12,2) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `fcp` char(1) DEFAULT 'S',
  `glp` char(1) DEFAULT 'N',
  `exibir_grafico` int(1) DEFAULT '0',
  KEY `fk_produto04` (`id_cadastro`),
  KEY `fk_produto03` (`id_classificacao`),
  KEY `fk_produto00` (`id_cadastro`,`codigo_barra`),
  KEY `fk_produto01` (`id_cadastro`,`codigo_barra`,`id_classificacao`,`id_fornecedor`),
  KEY `fk_produto02` (`id_cadastro`,`descricao`),
  FULLTEXT KEY `fk_produto05` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_apio"
#

CREATE TABLE `base_web_control`.`produtos_apio` (
  `codprodutos` int(11) DEFAULT NULL,
  `codigobarras` float DEFAULT NULL,
  `qtdetiqueta` int(11) DEFAULT NULL,
  `tributacao` int(11) DEFAULT NULL,
  `cstentrada` int(11) DEFAULT NULL,
  `cstsaida` int(11) DEFAULT NULL,
  `ncm` int(11) DEFAULT NULL,
  `mva` int(11) DEFAULT NULL,
  `ipi` int(11) DEFAULT NULL,
  `aliquota` int(11) DEFAULT NULL,
  `aliquotareducao` int(11) DEFAULT NULL,
  `descricao` text,
  `descricaoresumida` text,
  `estoqueatual` float DEFAULT NULL,
  `estoqueminimo` int(11) DEFAULT NULL,
  `estoquemaximo` int(11) DEFAULT NULL,
  `grupo` text,
  `departamento` text,
  `unidademedida` text,
  `pesado` text,
  `enviabalanca` text,
  `participavenda` text,
  `promocao` text,
  `aliquotas` text,
  `precocompra` float DEFAULT NULL,
  `margemlucro` float DEFAULT NULL,
  `precovenda1` float DEFAULT NULL,
  `precovenda2` int(11) DEFAULT NULL,
  `precovenda3` int(11) DEFAULT NULL,
  `margemlucroideal` int(11) DEFAULT NULL,
  `isentopiscofins` text,
  `permitirdesconto` text,
  `desconto` int(11) DEFAULT NULL,
  `dataultimavenda` text,
  `precoultimavenda` float DEFAULT NULL,
  `horarioultimavenda` text,
  `codigoaliquota` int(11) DEFAULT NULL,
  `codigosecao` int(11) DEFAULT NULL,
  `ativo` text,
  `aliquotanacional` float DEFAULT NULL,
  `aliquotaimportados` float DEFAULT NULL,
  `tributacaosaida` int(11) DEFAULT NULL,
  `precomediounidade` int(11) DEFAULT NULL,
  `validade` int(11) DEFAULT NULL,
  `aliquotasaida` int(11) DEFAULT NULL,
  `aliquotareducaosaida` int(11) DEFAULT NULL,
  `controlarlote` text,
  `composicao` text,
  `alterado` text,
  `secao` text,
  `kit` text,
  `caixa` text,
  `quantidadecaixa` int(11) DEFAULT NULL,
  `transformacao` text,
  `impressora` text,
  `familia` int(11) DEFAULT NULL,
  `grade` text,
  `tipoitem` text,
  `generoitem` int(11) DEFAULT NULL,
  `cfop` text,
  `piscofinssaida` int(11) DEFAULT NULL,
  `csticmssaida` int(11) DEFAULT NULL,
  `aliquotareducaoicmssaida` text,
  `codigointerno` text,
  `origemmercadoria` text,
  `usacontrolenumeroserie` text,
  `aliquotaicmssaida` text,
  `cstipisaida` int(11) DEFAULT NULL,
  `anp` text,
  `solicitarg` text,
  `controlabebidas` text,
  `ultimadatainventario` date DEFAULT NULL,
  `controlaobs` text,
  `controlasabores` int(11) DEFAULT NULL,
  `quantidadesabores` int(11) DEFAULT NULL,
  `cor` text,
  `tamanho` text,
  `impressora2` text,
  `rodizio` int(11) DEFAULT NULL,
  `aliquotareducaost` int(11) DEFAULT NULL,
  `aliquotadiferimento` int(11) DEFAULT NULL,
  `datacadastro` date DEFAULT NULL,
  `aliquotadiferenciadapiscofins` int(11) DEFAULT NULL,
  `aliquotareaispiscofins` int(11) DEFAULT NULL,
  `precovenda4` int(11) DEFAULT NULL,
  `vasilhame` text,
  `prodvasilhame` int(11) DEFAULT NULL,
  `codbarrasvasilhame` text,
  `aliquotaestadual` int(11) DEFAULT NULL,
  `imagemproduto` text,
  `aliquotamunicipal` int(11) DEFAULT NULL,
  `materiaprima` text,
  `adicionais` text,
  `infadnota` text,
  `usainfadnota` text,
  `servico` text,
  `volume` int(11) DEFAULT NULL,
  `controlavolume` text,
  `cest` text,
  `customedio` int(11) DEFAULT NULL,
  `ncmex` text,
  `codnaturezareceita` text,
  `cstpisentrada` int(11) DEFAULT NULL,
  `cstpissaida` int(11) DEFAULT NULL,
  `aliquotapisentrada` int(11) DEFAULT NULL,
  `aliquotapissaida` int(11) DEFAULT NULL,
  `cstcofinsentrada` float DEFAULT NULL,
  `cstcofinssaida` float DEFAULT NULL,
  `aliquotacofinsentrada` int(11) DEFAULT NULL,
  `aliquotacofinssaida` int(11) DEFAULT NULL,
  `subgrupo` text,
  `tipomva` text,
  `mvadistribuidor` int(11) DEFAULT NULL,
  `creditooutorgado` text,
  `regimeespecial29560` text,
  `cstsaiataccontrib` int(11) DEFAULT NULL,
  `aliqicmssaiataccontrib` int(11) DEFAULT NULL,
  `aliqicmsstsaiataccontrib` int(11) DEFAULT NULL,
  `redbcicmssaiataccontrib` int(11) DEFAULT NULL,
  `redbcicmsstsaiataccontrib` int(11) DEFAULT NULL,
  `cstsaiataccontribsimples` int(11) DEFAULT NULL,
  `aliqicmssaiataccontribsimples` int(11) DEFAULT NULL,
  `aliqicmsstsaiataccontribsimples` int(11) DEFAULT NULL,
  `redbcicmssaiataccontribsimples` int(11) DEFAULT NULL,
  `redbcicmsstsaiataccontribsimples` int(11) DEFAULT NULL,
  `cstsaivarejcontrib` int(11) DEFAULT NULL,
  `aliqicmssaivarejcontrib` int(11) DEFAULT NULL,
  `aliqicmsstsaivarejcontrib` int(11) DEFAULT NULL,
  `redbcicmssaivarejcontrib` int(11) DEFAULT NULL,
  `redbcicmsstsaivarejcontrib` int(11) DEFAULT NULL,
  `cstsainaocontrib` int(11) DEFAULT NULL,
  `aliqicmssainaocontrib` int(11) DEFAULT NULL,
  `aliqicmsstsainaocontrib` int(11) DEFAULT NULL,
  `redbcicmssainaocontrib` int(11) DEFAULT NULL,
  `redbcicmsstsainaocontrib` int(11) DEFAULT NULL,
  `cstentradaindustria` int(11) DEFAULT NULL,
  `aliqicmsentradaindustria` int(11) DEFAULT NULL,
  `aliqicmsstentradaindustria` int(11) DEFAULT NULL,
  `redbcicmsentradaindustria` int(11) DEFAULT NULL,
  `redbcicmsstentradaindustria` int(11) DEFAULT NULL,
  `cstentradadistribuidor` int(11) DEFAULT NULL,
  `aliqicmsentradadistribuidor` int(11) DEFAULT NULL,
  `aliqicmsstentradadistribuidor` int(11) DEFAULT NULL,
  `redbcicmsentradadistribuidor` int(11) DEFAULT NULL,
  `redbcicmsstentradadistribuidor` int(11) DEFAULT NULL,
  `cstentradasn` int(11) DEFAULT NULL,
  `aliqicmsentradasn` int(11) DEFAULT NULL,
  `aliqicmsstentradasn` int(11) DEFAULT NULL,
  `redbcicmsentradasn` int(11) DEFAULT NULL,
  `redbcicmsstentradasn` int(11) DEFAULT NULL,
  `cstnotaentradaindustria` float DEFAULT NULL,
  `cstnotaentradadistribuidor` float DEFAULT NULL,
  `csosnnotaentradasimplesnacional` float DEFAULT NULL,
  `aliquotanotaentrada` int(11) DEFAULT NULL,
  `precovenda5` int(11) DEFAULT NULL,
  `produtoimportado` text,
  `despesasaduaneiras` int(11) DEFAULT NULL,
  `iofimportacao` int(11) DEFAULT NULL,
  `impostoimportacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_apoio"
#

CREATE TABLE `base_web_control`.`produtos_apoio` (
  `COD_PRD` int(11) DEFAULT NULL,
  `DESCRI_PRD` text,
  `UNIDADE_PRD` text,
  `VLRUNIDADE_PRD` text,
  `FORN_PRD` int(11) DEFAULT NULL,
  `QTDE_PRD` int(11) DEFAULT NULL,
  `MINIMO_PRD` int(11) DEFAULT NULL,
  `VLRCOMPRA_PRD` text,
  `INDCUSTO_PRD` text,
  `LOCAL1_PRD` int(11) DEFAULT NULL,
  `LOCAL2_PRD` int(11) DEFAULT NULL,
  `DPTO_PRD` int(11) DEFAULT NULL,
  `CODBAR_PRD` float DEFAULT NULL,
  `SUJVDA_PRD` int(11) DEFAULT NULL,
  `CUSPOND_PRD` int(11) DEFAULT NULL,
  `OFERTA_PRD` text,
  `DTOFERTA_PRD` text,
  `VLROFERTA_PRD` int(11) DEFAULT NULL,
  `SUBDPTO_PRD` int(11) DEFAULT NULL,
  `PRECAD_PRD` text,
  `MAXDESC_PRD` int(11) DEFAULT NULL,
  `CTRVCTO_PRD` text,
  `SCTAPRODUCAO_PRD` text,
  `tipo_prd` int(11) DEFAULT NULL,
  `Cargabal_prd` text,
  `ALIQUOTA_PRD` int(11) DEFAULT NULL,
  `Atual_prd` text,
  `VDDBALANCA_PRD` int(11) DEFAULT NULL,
  `CODFAB_PRD` int(11) DEFAULT NULL,
  `VLRTETO_PRD` int(11) DEFAULT NULL,
  `TPAGREG_PRD` text,
  `VLIMPORG_PRD` int(11) DEFAULT NULL,
  `VLIMPAGRE_PRD` int(11) DEFAULT NULL,
  `Atacado_prd` text,
  `PREMONTA_PRD` text,
  `ATLFRENTE_PRD` float DEFAULT NULL,
  `Paranet_prd` text,
  `Ativo_prd` text,
  `CODEX_PRD` int(11) DEFAULT NULL,
  `CL_PRD` int(11) DEFAULT NULL,
  `CODGN_PRD` int(11) DEFAULT NULL,
  `SIT_PRD` text,
  `ICMS_PRD` int(11) DEFAULT NULL,
  `ORIGEM_PRD` int(11) DEFAULT NULL,
  `STPIS_PRD` int(11) DEFAULT NULL,
  `ALQPIS_PRD` int(11) DEFAULT NULL,
  `STCOFINS_PRD` int(11) DEFAULT NULL,
  `ALQCOFINS_PRD` int(11) DEFAULT NULL,
  `CFOP_PRD` int(11) DEFAULT NULL,
  `Forcatrib_prd` text,
  `ipi_prd` int(11) DEFAULT NULL,
  `CSOSN_PRD` int(11) DEFAULT NULL,
  `SLTAVLR_PRD` text,
  `PRODUZONDE_PRD` int(11) DEFAULT NULL,
  `SLTAVLRUNI_PRD` text,
  `COMBUSTIVEL_PRD` text,
  `CODANP_PRD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_composicao"
#

CREATE TABLE `base_web_control`.`produtos_composicao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_produto_composicao` int(11) DEFAULT NULL,
  `qtd` decimal(15,3) DEFAULT NULL,
  `tipo_baixa_composicao` enum('F','V') DEFAULT 'F',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_deletados"
#

CREATE TABLE `base_web_control`.`produtos_deletados` (
  `id` int(11) DEFAULT NULL,
  `descricao` text,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `data_cadastro` text,
  `id_classificacao` int(11) DEFAULT NULL,
  `cor` int(11) DEFAULT NULL,
  `id_cor` int(11) DEFAULT NULL,
  `tamanho` int(11) DEFAULT NULL,
  `custo` float DEFAULT NULL,
  `custo_medio_venda` int(11) DEFAULT NULL,
  `custo_medio_venda_prazo` int(11) DEFAULT NULL,
  `custo_medio_venda_varejo` int(11) DEFAULT NULL,
  `custo_medio_venda_atacado` int(11) DEFAULT NULL,
  `porcentagem_custo_venda` int(11) DEFAULT NULL,
  `porcentagem_venda_prazo` int(11) DEFAULT NULL,
  `porcentagem_atacado_avista` int(11) DEFAULT NULL,
  `porcentagem_atacado_aprazo` int(11) DEFAULT NULL,
  `qtd_atacado` int(11) DEFAULT NULL,
  `ativo` text,
  `qtd_minima` float DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `codigo_barra` text,
  `barra` int(11) DEFAULT NULL,
  `sincronizado` int(11) DEFAULT NULL,
  `iss` int(11) DEFAULT NULL,
  `icms` float DEFAULT NULL,
  `id_unidade` int(11) DEFAULT NULL,
  `localizacao` int(11) DEFAULT NULL,
  `id_fornecedor` int(11) DEFAULT NULL,
  `fabricante` int(11) DEFAULT NULL,
  `ean` int(11) DEFAULT NULL,
  `ex_tipi` int(11) DEFAULT NULL,
  `ncm` int(11) DEFAULT NULL,
  `cest` int(11) DEFAULT NULL,
  `unidade_trib` int(11) DEFAULT NULL,
  `qtd_trib` int(11) DEFAULT NULL,
  `vlr_unit_trib` int(11) DEFAULT NULL,
  `genero_produto` int(11) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT NULL,
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(11) DEFAULT NULL,
  `vender_estoque_zerado` text,
  `descricao_detalhada` int(11) DEFAULT NULL,
  `ecommerce` text,
  `promocao_ecommerce` text,
  `produto_destaque_ecommerce` text,
  `altura` int(11) DEFAULT NULL,
  `largura` int(11) DEFAULT NULL,
  `comprimento` int(11) DEFAULT NULL,
  `id_marca` int(11) DEFAULT NULL,
  `destaque` text,
  `valor_frete` float DEFAULT NULL,
  `cofins` int(11) DEFAULT NULL,
  `pis` int(11) DEFAULT NULL,
  `data_fabricacao` int(11) DEFAULT NULL,
  `data_validade` int(11) DEFAULT NULL,
  `lote_produto` int(11) DEFAULT NULL,
  `nr_edicao` int(11) DEFAULT NULL,
  `peso_bruto` int(11) DEFAULT NULL,
  `pis_aliquota` int(11) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(11) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` int(11) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(11) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` int(11) DEFAULT NULL,
  `alt_caixa` int(11) DEFAULT NULL,
  `larg_caixa` int(11) DEFAULT NULL,
  `comp_caixa` int(11) DEFAULT NULL,
  `margem_lucro_tipo` int(11) DEFAULT NULL,
  `margem_lucro_valor` int(11) DEFAULT NULL,
  `desconto_maximo_tipo` int(11) DEFAULT NULL,
  `desconto_maximo_percentual` int(11) DEFAULT NULL,
  `desconto_maximo_valor` int(11) DEFAULT NULL,
  `infos_nutricionais` text,
  `prod_serv` text,
  `identificacao_interna` int(11) DEFAULT NULL,
  `solicitar_vrtotal` text,
  `casas_decimais` int(11) DEFAULT NULL,
  `locacao_quantidade` float DEFAULT NULL,
  `obs_preco` int(11) DEFAULT NULL,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` text,
  `perc_dif_uf` int(11) DEFAULT NULL,
  `qtd_unidade` int(11) DEFAULT NULL,
  `truncar_vlr_total` text,
  `codigo_anp` int(11) DEFAULT NULL,
  `env_prod` text,
  `peso_liquido` int(11) DEFAULT NULL,
  `estoque_lojavirtual` int(11) DEFAULT NULL,
  `deletar` text,
  `comissao_valor` int(11) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` int(11) DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_detalhes"
#

CREATE TABLE `base_web_control`.`produtos_detalhes` (
  `id_produto` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `codigo_barra_ean` bigint(20) NOT NULL,
  `codigo_barra_dun` bigint(20) DEFAULT NULL,
  `ncm` varchar(10) DEFAULT NULL,
  `validade_dias` int(5) DEFAULT NULL,
  `imagem_produto` varchar(255) DEFAULT NULL,
  `nome_sem_acento` varchar(255) DEFAULT NULL,
  `nome_upper` varchar(255) DEFAULT NULL,
  `nome_upper_sem_acento` varchar(255) DEFAULT NULL,
  `nome_lower` varchar(255) DEFAULT NULL,
  `nome_lowe_sem_acento` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  UNIQUE KEY `fk002` (`codigo_barra_ean`)
) ENGINE=InnoDB AUTO_INCREMENT=13126 DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_detalhes_agrupagem"
#

CREATE TABLE `base_web_control`.`produtos_detalhes_agrupagem` (
  `id_produto_detalhes` bigint(20) NOT NULL,
  `unidade_por_caixa` decimal(12,3) DEFAULT NULL,
  `unidade_por_palete` decimal(12,3) DEFAULT NULL,
  `caixa_por_palete` decimal(12,3) DEFAULT NULL,
  `caixa_por_camada` decimal(12,3) DEFAULT NULL,
  `camadas_por_palete` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id_produto_detalhes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_detalhes_dimensoes_caixa"
#

CREATE TABLE `base_web_control`.`produtos_detalhes_dimensoes_caixa` (
  `id_produto_detalhes` bigint(20) NOT NULL,
  `altura` decimal(12,3) DEFAULT NULL,
  `comprimento` decimal(12,3) DEFAULT NULL,
  `largura` decimal(12,3) DEFAULT NULL,
  `peso` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id_produto_detalhes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_detalhes_dimensoes_palete"
#

CREATE TABLE `base_web_control`.`produtos_detalhes_dimensoes_palete` (
  `id_produto_detalhes` bigint(20) NOT NULL,
  `altura` decimal(12,3) DEFAULT NULL,
  `comprimento` decimal(12,3) DEFAULT NULL,
  `largura` decimal(12,3) DEFAULT NULL,
  `peso` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id_produto_detalhes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_detalhes_dimensoes_unidade"
#

CREATE TABLE `base_web_control`.`produtos_detalhes_dimensoes_unidade` (
  `id_produto_detalhes` bigint(20) NOT NULL,
  `altura` decimal(12,3) DEFAULT NULL,
  `comprimento` decimal(12,3) DEFAULT NULL,
  `largura` decimal(12,3) DEFAULT NULL,
  `capacidade` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`id_produto_detalhes`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_excluidos"
#

CREATE TABLE `base_web_control`.`produtos_excluidos` (
  `id` bigint(20) unsigned NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_classificacao` int(10) unsigned DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `id_cor` int(5) DEFAULT NULL,
  `tamanho` varchar(15) DEFAULT NULL,
  `custo` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda_prazo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_varejo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_atacado` decimal(12,3) unsigned DEFAULT NULL,
  `porcentagem_custo_venda` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_venda_prazo` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_avista` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_aprazo` decimal(18,15) unsigned DEFAULT NULL,
  `qtd_atacado` int(10) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo, E - Excluido',
  `qtd_minima` int(11) DEFAULT '0',
  `peso` varchar(10) DEFAULT '0',
  `codigo_barra` varchar(20) DEFAULT NULL,
  `barra` varchar(20) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `iss` int(2) DEFAULT '0',
  `icms` decimal(4,2) DEFAULT '0.00',
  `id_unidade` int(2) DEFAULT '2',
  `localizacao` varchar(50) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `ex_tipi` varchar(3) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(8) DEFAULT NULL,
  `unidade_trib` varchar(6) DEFAULT NULL,
  `qtd_trib` varchar(10) DEFAULT NULL,
  `vlr_unit_trib` decimal(10,2) DEFAULT NULL,
  `genero_produto` int(2) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT '1',
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(3) DEFAULT '0',
  `vender_estoque_zerado` enum('S','N') DEFAULT 'S',
  `descricao_detalhada` text,
  `ecommerce` enum('S','N') DEFAULT 'N',
  `promocao_ecommerce` enum('S','N') DEFAULT 'N',
  `produto_destaque_ecommerce` enum('S','N') DEFAULT 'N',
  `altura` int(2) DEFAULT '0',
  `largura` int(2) DEFAULT '0',
  `comprimento` int(2) DEFAULT '0',
  `id_marca` int(11) DEFAULT NULL,
  `destaque` enum('P','L','N') DEFAULT 'N' COMMENT 'Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `cofins` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `lote_produto` varchar(15) DEFAULT NULL,
  `nr_edicao` varchar(15) DEFAULT NULL,
  `peso_bruto` varchar(10) DEFAULT NULL,
  `pis_aliquota` decimal(4,2) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(3) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` decimal(4,2) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(2) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` int(11) DEFAULT NULL,
  `alt_caixa` decimal(5,2) DEFAULT NULL,
  `larg_caixa` decimal(5,2) DEFAULT NULL,
  `comp_caixa` decimal(5,2) DEFAULT NULL,
  `margem_lucro_tipo` enum('P','V') DEFAULT NULL,
  `margem_lucro_valor` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_tipo` enum('P','V') DEFAULT NULL,
  `desconto_maximo_percentual` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_valor` decimal(10,2) DEFAULT NULL,
  `infos_nutricionais` enum('S','N') DEFAULT 'N',
  `prod_serv` enum('P','S') NOT NULL DEFAULT 'P',
  `identificacao_interna` varchar(10) DEFAULT NULL,
  `solicitar_vrtotal` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(1) unsigned DEFAULT '2',
  `locacao_quantidade` int(11) unsigned NOT NULL DEFAULT '0',
  `obs_preco` text,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `perc_dif_uf` decimal(5,2) DEFAULT NULL,
  `qtd_unidade` decimal(10,3) DEFAULT NULL,
  `truncar_vlr_total` enum('S','N') DEFAULT 'S',
  `codigo_anp` varchar(10) DEFAULT NULL,
  `env_prod` enum('S','N') DEFAULT 'S',
  `peso_liquido` varchar(10) DEFAULT NULL,
  `estoque_lojavirtual` tinyint(4) DEFAULT NULL,
  `deletar` enum('S','N') NOT NULL DEFAULT 'S',
  `comissao_valor` decimal(12,2) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  KEY `fk_produto04` (`id_cadastro`),
  KEY `fk_produto03` (`id_classificacao`),
  KEY `fk_produto00` (`id_cadastro`,`codigo_barra`),
  KEY `fk_produto01` (`id_cadastro`,`codigo_barra`,`id_classificacao`,`id_fornecedor`),
  KEY `fk_produto02` (`id_cadastro`,`descricao`),
  FULLTEXT KEY `fk_produto05` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_reciclagem"
#

CREATE TABLE `base_web_control`.`produtos_reciclagem` (
  `id` bigint(20) unsigned DEFAULT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_classificacao` int(10) unsigned DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `id_cor` int(5) DEFAULT NULL,
  `tamanho` varchar(15) DEFAULT NULL,
  `custo` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda_prazo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_varejo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_atacado` decimal(12,3) unsigned DEFAULT NULL,
  `porcentagem_custo_venda` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_venda_prazo` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_avista` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_aprazo` decimal(18,15) unsigned DEFAULT NULL,
  `qtd_atacado` int(10) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo, E - Excluido',
  `qtd_minima` decimal(10,3) DEFAULT '0.000',
  `peso` varchar(10) DEFAULT '0',
  `codigo_barra` varchar(22) DEFAULT NULL,
  `barra` varchar(20) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `iss` int(2) DEFAULT '0',
  `icms` decimal(4,2) DEFAULT '0.00',
  `id_unidade` int(2) NOT NULL DEFAULT '2',
  `localizacao` varchar(50) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `ex_tipi` varchar(3) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(8) DEFAULT NULL,
  `unidade_trib` varchar(6) DEFAULT NULL,
  `qtd_trib` varchar(10) DEFAULT NULL,
  `vlr_unit_trib` decimal(10,2) DEFAULT NULL,
  `genero_produto` int(2) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT '1' COMMENT '0 - Nacional, 1 - Importacao Direta, 2 - Adquirida no mercado Interno',
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(3) DEFAULT '0',
  `vender_estoque_zerado` enum('S','N') DEFAULT 'S',
  `descricao_detalhada` text,
  `ecommerce` enum('S','N') DEFAULT 'N' COMMENT 'Enviar para Loja Virtual',
  `promocao_ecommerce` enum('S','N') DEFAULT 'N',
  `produto_destaque_ecommerce` enum('S','N') DEFAULT 'N',
  `altura` int(2) DEFAULT '0',
  `largura` int(2) DEFAULT '0',
  `comprimento` int(2) DEFAULT '0',
  `id_marca` int(11) DEFAULT NULL,
  `destaque` enum('P','L','N') DEFAULT 'N' COMMENT 'Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `cofins` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `lote_produto` varchar(15) DEFAULT NULL,
  `nr_edicao` varchar(15) DEFAULT NULL,
  `peso_bruto` varchar(10) DEFAULT NULL,
  `pis_aliquota` decimal(4,2) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(3) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` decimal(4,2) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(2) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` int(11) DEFAULT NULL,
  `alt_caixa` decimal(5,2) DEFAULT NULL,
  `larg_caixa` decimal(5,2) DEFAULT NULL,
  `comp_caixa` decimal(5,2) DEFAULT NULL,
  `margem_lucro_tipo` enum('P','V') DEFAULT NULL,
  `margem_lucro_valor` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_tipo` enum('P','V') DEFAULT NULL,
  `desconto_maximo_percentual` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_valor` decimal(10,2) DEFAULT NULL,
  `infos_nutricionais` enum('S','N') DEFAULT 'N',
  `prod_serv` enum('P','S') NOT NULL DEFAULT 'P',
  `identificacao_interna` varchar(22) DEFAULT NULL,
  `solicitar_vrtotal` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(1) unsigned DEFAULT '2',
  `locacao_quantidade` decimal(10,3) unsigned DEFAULT '0.000',
  `obs_preco` text,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT NULL,
  `perc_dif_uf` decimal(5,2) DEFAULT NULL,
  `qtd_unidade` decimal(10,3) DEFAULT NULL,
  `truncar_vlr_total` enum('S','N') DEFAULT 'S',
  `codigo_anp` varchar(10) DEFAULT NULL,
  `env_prod` enum('S','N') DEFAULT 'S' COMMENT 'Enviar para Producao (comanda)',
  `peso_liquido` varchar(10) DEFAULT NULL,
  `estoque_lojavirtual` tinyint(4) DEFAULT '1',
  `deletar` enum('S','N') NOT NULL DEFAULT 'S',
  `comissao_valor` decimal(12,2) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `data_exclusao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `fk_produto04` (`id_cadastro`),
  KEY `fk_produto03` (`id_classificacao`),
  KEY `fk_produto00` (`id_cadastro`,`codigo_barra`),
  KEY `fk_produto01` (`id_cadastro`,`codigo_barra`,`id_classificacao`,`id_fornecedor`),
  KEY `fk_produto02` (`id_cadastro`,`descricao`),
  FULLTEXT KEY `fk_produto05` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "produtos_removidos"
#

CREATE TABLE `base_web_control`.`produtos_removidos` (
  `id` bigint(20) unsigned NOT NULL,
  `descricao` varchar(80) DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_classificacao` int(10) unsigned DEFAULT NULL,
  `cor` varchar(15) DEFAULT NULL,
  `id_cor` int(5) DEFAULT NULL,
  `tamanho` varchar(15) DEFAULT NULL,
  `custo` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda` decimal(10,3) unsigned DEFAULT NULL,
  `custo_medio_venda_prazo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_varejo` decimal(12,3) unsigned DEFAULT NULL,
  `custo_medio_venda_atacado` decimal(12,3) unsigned DEFAULT NULL,
  `porcentagem_custo_venda` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_venda_prazo` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_avista` decimal(18,15) unsigned DEFAULT NULL,
  `porcentagem_atacado_aprazo` decimal(18,15) unsigned DEFAULT NULL,
  `qtd_atacado` int(10) unsigned DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A' COMMENT 'A - Ativo, I - Inativo, E - Excluido',
  `qtd_minima` decimal(10,3) DEFAULT '0.000',
  `peso` varchar(10) DEFAULT '0',
  `codigo_barra` varchar(22) DEFAULT NULL,
  `barra` varchar(20) DEFAULT NULL,
  `sincronizado` int(1) NOT NULL DEFAULT '0' COMMENT '0-Nao 1-Sim',
  `iss` int(2) DEFAULT '0',
  `icms` decimal(4,2) DEFAULT '0.00',
  `id_unidade` int(2) NOT NULL DEFAULT '2',
  `localizacao` varchar(50) DEFAULT NULL,
  `id_fornecedor` bigint(20) DEFAULT NULL,
  `fabricante` varchar(50) DEFAULT NULL,
  `ean` varchar(13) DEFAULT NULL,
  `ex_tipi` varchar(3) DEFAULT NULL,
  `ncm` varchar(8) DEFAULT NULL,
  `cest` varchar(8) DEFAULT NULL,
  `unidade_trib` varchar(6) DEFAULT NULL,
  `qtd_trib` varchar(10) DEFAULT NULL,
  `vlr_unit_trib` decimal(10,2) DEFAULT NULL,
  `genero_produto` int(2) DEFAULT NULL,
  `id_tributacao` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT '1',
  `id_especifico` int(11) DEFAULT NULL,
  `id_cfop` int(11) DEFAULT NULL,
  `id_cfop_itens` int(11) DEFAULT NULL,
  `desconto` int(3) DEFAULT '0',
  `vender_estoque_zerado` enum('S','N') DEFAULT 'S',
  `descricao_detalhada` text,
  `ecommerce` enum('S','N') DEFAULT 'N',
  `promocao_ecommerce` enum('S','N') DEFAULT 'N',
  `produto_destaque_ecommerce` enum('S','N') DEFAULT 'N',
  `altura` int(2) DEFAULT '0',
  `largura` int(2) DEFAULT '0',
  `comprimento` int(2) DEFAULT '0',
  `id_marca` int(11) DEFAULT NULL,
  `destaque` enum('P','L','N') DEFAULT 'N' COMMENT 'Principal= 1 apenas, Lateral=4 apenas, N=Sem destaque',
  `valor_frete` decimal(10,2) DEFAULT '0.00',
  `cofins` varchar(5) DEFAULT NULL,
  `pis` varchar(5) DEFAULT NULL,
  `data_fabricacao` date DEFAULT NULL,
  `data_validade` date DEFAULT NULL,
  `lote_produto` varchar(15) DEFAULT NULL,
  `nr_edicao` varchar(15) DEFAULT NULL,
  `peso_bruto` varchar(10) DEFAULT NULL,
  `pis_aliquota` decimal(4,2) DEFAULT NULL,
  `pis_cst` int(11) DEFAULT NULL,
  `ipi_aliquota` int(3) DEFAULT NULL,
  `ipi_cst` int(11) DEFAULT NULL,
  `cofins_aliquota` decimal(4,2) DEFAULT NULL,
  `cofins_cst` int(11) DEFAULT NULL,
  `icms_cst` int(2) DEFAULT NULL,
  `icms_modalidade` int(11) DEFAULT NULL,
  `peso_caixa` int(11) DEFAULT NULL,
  `alt_caixa` decimal(5,2) DEFAULT NULL,
  `larg_caixa` decimal(5,2) DEFAULT NULL,
  `comp_caixa` decimal(5,2) DEFAULT NULL,
  `margem_lucro_tipo` enum('P','V') DEFAULT NULL,
  `margem_lucro_valor` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_tipo` enum('P','V') DEFAULT NULL,
  `desconto_maximo_percentual` decimal(10,2) DEFAULT NULL,
  `desconto_maximo_valor` decimal(10,2) DEFAULT NULL,
  `infos_nutricionais` enum('S','N') DEFAULT 'N',
  `prod_serv` enum('P','S') NOT NULL DEFAULT 'P',
  `identificacao_interna` varchar(22) DEFAULT NULL,
  `solicitar_vrtotal` enum('S','N') DEFAULT 'N',
  `casas_decimais` int(1) unsigned DEFAULT '2',
  `locacao_quantidade` decimal(10,3) unsigned DEFAULT '0.000',
  `obs_preco` text,
  `id_bomba_bico` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT NULL,
  `perc_dif_uf` decimal(5,2) DEFAULT NULL,
  `qtd_unidade` decimal(10,3) DEFAULT NULL,
  `truncar_vlr_total` enum('S','N') DEFAULT 'S',
  `codigo_anp` varchar(10) DEFAULT NULL,
  `env_prod` enum('S','N') DEFAULT 'S',
  `peso_liquido` varchar(10) DEFAULT NULL,
  `estoque_lojavirtual` tinyint(4) DEFAULT '1',
  `deletar` enum('S','N') NOT NULL DEFAULT 'S',
  `comissao_valor` decimal(12,2) DEFAULT NULL,
  `num_parcelas` int(11) DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  KEY `fk_produtor04` (`id_cadastro`),
  KEY `fk_produtor03` (`id_classificacao`),
  KEY `fk_produtor00` (`id_cadastro`,`codigo_barra`),
  KEY `fk_produtor01` (`id_cadastro`,`codigo_barra`,`id_classificacao`,`id_fornecedor`),
  KEY `fk_produtor02` (`id_cadastro`,`descricao`),
  FULLTEXT KEY `fk_produtor05` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "promocao_kit"
#

CREATE TABLE `base_web_control`.`promocao_kit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `codigo_barra` varchar(25) DEFAULT NULL,
  `ativo` enum('A','I','E') NOT NULL DEFAULT 'A',
  `id_usuario_alteracao` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_cadastro` (`id_cadastro`),
  KEY `idx_codigo_barra` (`codigo_barra`)
) ENGINE=InnoDB AUTO_INCREMENT=4641 DEFAULT CHARSET=latin1;

#
# Structure for table "promocao_kit_grade"
#

CREATE TABLE `base_web_control`.`promocao_kit_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_promocao_kit` int(11) NOT NULL,
  `id_grade` int(11) DEFAULT NULL,
  `vlr_custo_original` decimal(25,15) DEFAULT NULL,
  `vlr_custo_promocao` decimal(25,15) DEFAULT NULL,
  `preco_fixo` enum('S','N') DEFAULT 'N',
  `valor_desconto_perc` decimal(5,2) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `qtde` float(6,3) DEFAULT '1.000',
  PRIMARY KEY (`id`),
  KEY `idx_id_cadastro` (`id_cadastro`),
  KEY `idx_id_grade` (`id_grade`),
  KEY `idx_id_promocao_kit` (`id_promocao_kit`)
) ENGINE=InnoDB AUTO_INCREMENT=48550 DEFAULT CHARSET=latin1;

#
# Structure for table "promocao_mix"
#

CREATE TABLE `base_web_control`.`promocao_mix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `array_id_produto` text,
  `qtd` float(10,3) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_fim` timestamp NULL DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `total_desconto` float(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `idx_idcadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=latin1 COMMENT='tabela para promocao com multiplos produtos (mix gula)';

#
# Structure for table "promocao_mix_desconto"
#

CREATE TABLE `base_web_control`.`promocao_mix_desconto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_promocao_mix` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `valor_desconto` float(10,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1065 DEFAULT CHARSET=latin1;

#
# Structure for table "promocao_mix_tempo"
#

CREATE TABLE `base_web_control`.`promocao_mix_tempo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_promo_mix` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `qtd` float(10,3) DEFAULT NULL,
  `codigo_barra` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=769 DEFAULT CHARSET=latin1;

#
# Structure for table "promocao_quantidade"
#

CREATE TABLE `base_web_control`.`promocao_quantidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_grade` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `qtd_promocao` int(11) NOT NULL,
  `valor_desconto` decimal(15,3) DEFAULT NULL,
  `ativo` enum('A','I') NOT NULL DEFAULT 'A',
  `id_usuario_alterou` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cadastro` (`id_cadastro`),
  KEY `idx_grade` (`id_grade`),
  KEY `idx_usuario` (`id_usuario`),
  KEY `idx_usuario2` (`id_usuario_alterou`),
  KEY `idx_ativo` (`ativo`)
) ENGINE=InnoDB AUTO_INCREMENT=11110 DEFAULT CHARSET=latin1;

#
# Structure for table "relatorio_estoque_mensal"
#

CREATE TABLE `base_web_control`.`relatorio_estoque_mensal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `dia` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "relatorio_estoque_mensal_produtos"
#

CREATE TABLE `base_web_control`.`relatorio_estoque_mensal_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_relatoriomensal` int(11) DEFAULT NULL,
  `codigo_barra` text,
  `id_produto` int(11) DEFAULT NULL,
  `descricao` text,
  `unid` decimal(9,3) DEFAULT NULL,
  `custo` decimal(9,3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10406 DEFAULT CHARSET=latin1;

#
# Structure for table "relatorios_campos"
#

CREATE TABLE `base_web_control`.`relatorios_campos` (
  `id_campo` int(11) NOT NULL AUTO_INCREMENT,
  `id_tabela` int(11) DEFAULT NULL,
  `nome_campo` varchar(100) DEFAULT NULL,
  `tamanho_campo` int(11) NOT NULL,
  `nome_campo_form` varchar(100) DEFAULT NULL,
  `tabela_forenign` int(11) DEFAULT NULL,
  `campo_forenign` int(11) DEFAULT NULL,
  `categoria` varchar(30) DEFAULT NULL,
  `mascara` varchar(50) DEFAULT NULL,
  `ordemApresentacao` int(11) DEFAULT NULL,
  KEY `Index 1` (`id_campo`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=latin1;

#
# Structure for table "relatorios_tabelas"
#

CREATE TABLE `base_web_control`.`relatorios_tabelas` (
  `id_tabela` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tabela` varchar(100) NOT NULL,
  `nome_banco` varchar(100) NOT NULL,
  KEY `Index 1` (`id_tabela`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

#
# Structure for table "remetente"
#

CREATE TABLE `base_web_control`.`remetente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpfCnpj` varchar(14) DEFAULT NULL,
  `rg` varchar(14) DEFAULT NULL,
  `inscricaoEstadual` varchar(14) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `nomeFantasia` varchar(60) DEFAULT NULL,
  `fone` varchar(12) DEFAULT NULL,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(60) DEFAULT NULL,
  `complemento` varchar(60) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `municipio` varchar(60) DEFAULT NULL,
  `idMunicipio` varchar(7) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `uf` varchar(2) DEFAULT NULL,
  `suframa` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "sequencia_assistencia"
#

CREATE TABLE `base_web_control`.`sequencia_assistencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51589 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

#
# Structure for table "sequencia_orcamento"
#

CREATE TABLE `base_web_control`.`sequencia_orcamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184313 DEFAULT CHARSET=latin1;

#
# Structure for table "sequencia_ordem_servico"
#

CREATE TABLE `base_web_control`.`sequencia_ordem_servico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=202153 DEFAULT CHARSET=latin1;

#
# Structure for table "sequencia_pedido"
#

CREATE TABLE `base_web_control`.`sequencia_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `sequencia` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_cadastro`),
  KEY `fk_002` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=806964 DEFAULT CHARSET=latin1;

#
# Structure for table "setor"
#

CREATE TABLE `base_web_control`.`setor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ativo` enum('S','N') DEFAULT 'S',
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=688 DEFAULT CHARSET=latin1;

#
# Structure for table "solicitacao_reativacao"
#

CREATE TABLE `base_web_control`.`solicitacao_reativacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `logon` int(11) DEFAULT NULL,
  `nome_empresa` varchar(255) DEFAULT NULL,
  `nome_proprietario` varchar(255) DEFAULT NULL,
  `telefone` char(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status_reativacao` char(2) DEFAULT NULL,
  `dt_reativacao` timestamp NULL DEFAULT NULL,
  `desc_reativacao` varchar(250) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2258 DEFAULT CHARSET=latin1 COMMENT='quando cliente desativado solicita reativacao';

#
# Structure for table "sugestao"
#

CREATE TABLE `base_web_control`.`sugestao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao_envio` text,
  `data_envio` datetime DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario_envio` int(10) unsigned DEFAULT NULL,
  `lida` enum('N','S','D') DEFAULT 'N',
  `data_lida` datetime DEFAULT NULL,
  `id_franquia_registra_baixa` int(10) unsigned DEFAULT NULL,
  `descricao_lida` text,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=2652 DEFAULT CHARSET=latin1;

#
# Structure for table "tabela_codigo_anp"
#

CREATE TABLE `base_web_control`.`tabela_codigo_anp` (
  `descricao` varchar(200) DEFAULT NULL,
  `codigo` varchar(10) DEFAULT NULL,
  KEY `fk_001` (`codigo`),
  FULLTEXT KEY `fk_002` (`descricao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tabela_ncm"
#

CREATE TABLE `base_web_control`.`tabela_ncm` (
  `ncm` varchar(8) NOT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `descricao` varchar(150) DEFAULT NULL,
  `ipi_percentual` decimal(5,2) DEFAULT NULL,
  `inicio_vigencia` date DEFAULT NULL,
  `fim_vigencia` date DEFAULT NULL,
  `unid_tributada` varchar(5) DEFAULT NULL,
  `desc_unid_tributada` varchar(25) DEFAULT NULL,
  `gtin_producao` date DEFAULT NULL,
  `gtin_homologacao` date DEFAULT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ncm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tabela_ncm_vigente"
#

CREATE TABLE `base_web_control`.`tabela_ncm_vigente` (
  `ncm` varchar(10) DEFAULT NULL,
  `data_inicio` varchar(10) DEFAULT NULL,
  `data_fim` varchar(10) DEFAULT NULL,
  `dt_ini` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "test_apoio"
#

CREATE TABLE `base_web_control`.`test_apoio` (
  `Controle` int(11) DEFAULT NULL,
  `Codigo` int(11) DEFAULT NULL,
  `CodInterno` text,
  `Produto` text,
  `LkSetor` int(11) DEFAULT NULL,
  `Fabricante` text,
  `LkFornec` int(11) DEFAULT NULL,
  `PrecoCusto` text,
  `CustoMedio` text,
  `PrecoVenda` text,
  `Quantidade` int(11) DEFAULT NULL,
  `EstMinimo` int(11) DEFAULT NULL,
  `Unidade` text,
  `Lucro` text,
  `Moeda` text,
  `UltReaj` text,
  `Foto` text,
  `Obs` int(11) DEFAULT NULL,
  `NaoSaiTabela` text,
  `Inativo` text,
  `CodIPI` text,
  `IPI` int(11) DEFAULT NULL,
  `CST` text,
  `ICMS` int(11) DEFAULT NULL,
  `BaseCalculo` int(11) DEFAULT NULL,
  `PesoBruto` int(11) DEFAULT NULL,
  `PesoLiq` int(11) DEFAULT NULL,
  `LkModulo` int(11) DEFAULT NULL,
  `Armazenamento` text,
  `QntEmbalagem` int(11) DEFAULT NULL,
  `ELV` text,
  `Previsao` int(11) DEFAULT NULL,
  `DataFoto` int(11) DEFAULT NULL,
  `DataInc` text,
  `LkUserInc` int(11) DEFAULT NULL,
  `CodEx` text,
  `IVA_ST` int(11) DEFAULT NULL,
  `PFC` int(11) DEFAULT NULL,
  `IPI_CST` text,
  `IPI_BaseCalc` int(11) DEFAULT NULL,
  `IPPT` text,
  `IAT` text,
  `DataUltMov` int(11) DEFAULT NULL,
  `EAD` text,
  `cEAN` text,
  `cEANTrib` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tipo_entrada"
#

CREATE TABLE `base_web_control`.`tipo_entrada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "tipo_log"
#

CREATE TABLE `base_web_control`.`tipo_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reduzido` varchar(30) DEFAULT NULL,
  `descricao` varchar(30) NOT NULL DEFAULT '',
  `visivel` enum('S','N') DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

#
# Structure for table "tipo_residencia"
#

CREATE TABLE `base_web_control`.`tipo_residencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` char(30) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for table "tipo_unidade_tmp"
#

CREATE TABLE `base_web_control`.`tipo_unidade_tmp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  `qtd` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

#
# Structure for table "tipos_lancamentos"
#

CREATE TABLE `base_web_control`.`tipos_lancamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `descricao` char(60) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44931 DEFAULT CHARSET=latin1;

#
# Structure for table "titulos"
#

CREATE TABLE `base_web_control`.`titulos` (
  `id` bigint(10) NOT NULL DEFAULT '0',
  `numdoc` bigint(20) NOT NULL DEFAULT '0',
  `insc` varchar(14) NOT NULL DEFAULT '',
  `codloja` int(11) NOT NULL DEFAULT '0',
  `carteira` int(11) NOT NULL DEFAULT '0',
  `debito` enum('B','A') NOT NULL DEFAULT 'B',
  `emissao` date NOT NULL DEFAULT '0000-00-00',
  `vencimento` date NOT NULL DEFAULT '0000-00-00',
  `dti` date NOT NULL DEFAULT '0000-00-00',
  `dtf` date NOT NULL DEFAULT '0000-00-00',
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valorpg` decimal(8,2) DEFAULT NULL,
  `datapg` date DEFAULT NULL,
  `juros` decimal(4,2) DEFAULT NULL,
  `outras_cob` decimal(8,2) DEFAULT NULL,
  `desconto` decimal(4,2) DEFAULT NULL,
  `obs` longtext,
  `numboleto` varchar(17) DEFAULT NULL,
  `numboleto_bradesco` bigint(20) DEFAULT NULL,
  `origem_pgto` enum('BANCO','FRANQUIA','NEGATIVADO','COMP') DEFAULT NULL,
  `referencia` enum('OUT','BOL','MULTA','ADESAO') NOT NULL DEFAULT 'BOL',
  `banco_faturado` int(3) NOT NULL DEFAULT '237',
  `isento_juros` enum('S','N') DEFAULT 'N',
  `numboleto2` varchar(17) DEFAULT NULL,
  `mensal` decimal(12,2) DEFAULT NULL,
  `data_movimentacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `num_lote` int(11) DEFAULT NULL,
  `data_gravacao_lote` timestamp NULL DEFAULT NULL,
  `banco_registro` int(3) DEFAULT NULL,
  `agencia_registro` varchar(4) DEFAULT NULL,
  `conta_registro` varchar(8) DEFAULT NULL,
  `cod_liquidacao` char(2) DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  `protocolo_nf` varchar(20) NOT NULL,
  `expirado` int(1) DEFAULT '0' COMMENT '0 - Nao Expirado   1 - Expirado',
  `data_baixa_contabilidade` date DEFAULT NULL,
  `acrescimo_boleto` decimal(12,2) DEFAULT '0.00',
  `vencimento_alterado` date DEFAULT NULL,
  `abatimento` decimal(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "titulos_movimentacao"
#

CREATE TABLE `base_web_control`.`titulos_movimentacao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `numdoc` bigint(20) NOT NULL,
  `vencimento` date DEFAULT NULL,
  `vr_desconto` decimal(12,2) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`numdoc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "titulos_recebafacil"
#

CREATE TABLE `base_web_control`.`titulos_recebafacil` (
  `numdoc` varchar(20) NOT NULL DEFAULT '',
  `codloja` int(11) NOT NULL,
  `emissao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `vencimento` date NOT NULL DEFAULT '0000-00-00',
  `valor` decimal(8,2) NOT NULL DEFAULT '0.00',
  `valorpg` decimal(8,2) DEFAULT NULL,
  `datapg` date DEFAULT NULL,
  `juros` decimal(4,2) DEFAULT NULL,
  `numboleto` bigint(20) DEFAULT NULL,
  `numboleto_itau` bigint(20) DEFAULT NULL,
  `numboleto_bradesco` bigint(20) DEFAULT NULL,
  `numboleto_hsbc` bigint(20) DEFAULT NULL,
  `cpfcnpj_devedor` bigint(20) DEFAULT NULL,
  `tp_notificacao` varchar(50) DEFAULT NULL,
  `data_repasse` date DEFAULT NULL,
  `descricao_repasse` longtext,
  `tp_recebafacil` int(1) NOT NULL DEFAULT '0' COMMENT '0- COM NOTIFICACAO   1- SEM NOTIFICACAO    2 - Crediario System',
  `chavebol` bigint(20) DEFAULT NULL,
  `bco` enum('001','237','341','756') DEFAULT '341' COMMENT '001 Banco do Brasil, 237 Bradesco, 341 Itau, 756 SICOOB',
  `tp_titulo` enum('1','2','3') DEFAULT NULL COMMENT '3 - Boleto',
  `contrato` int(11) unsigned zerofill DEFAULT '00000000000',
  `tx_adm` decimal(12,2) DEFAULT NULL,
  `exibir` enum('0','1') DEFAULT '0' COMMENT '0 - exibir / 1 - nao exibir',
  `txjur` int(2) DEFAULT '2',
  `automatico` enum('S','N') NOT NULL DEFAULT 'N',
  `impresso` int(1) NOT NULL DEFAULT '2' COMMENT '1-Sim  2-Nao',
  `data_impresso` date DEFAULT NULL,
  `referencia` enum('C','W') DEFAULT 'C',
  `cod_pedido_web_control` int(11) DEFAULT '0',
  `radio_desconto` enum('S','N') DEFAULT 'N' COMMENT 'Sim, Não',
  `vr_desconto` decimal(8,2) DEFAULT NULL,
  `radio_msg_boleto` enum('S','N') DEFAULT 'N',
  `texto_msg_boleto` varchar(60) DEFAULT NULL,
  `id_usuariobaixa` bigint(20) DEFAULT NULL,
  `tipo_notificacao` int(1) NOT NULL DEFAULT '2' COMMENT '1o. Nível  -  2o. Nível - 3o. Nível',
  `parcela` varchar(5) NOT NULL,
  `vr_total_divida` decimal(12,2) NOT NULL,
  `porcentagem_desconto_avista` int(2) DEFAULT NULL,
  `porcentagem_desconto_aprazo` int(2) DEFAULT NULL,
  `id_motivo_exclusao` int(1) DEFAULT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  `nome` varchar(55) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT NULL,
  `num_lote` char(2) NOT NULL,
  `data_gravacao_lote` timestamp NULL DEFAULT NULL,
  `banco_registro` int(3) DEFAULT NULL,
  `agencia_registro` varchar(4) DEFAULT NULL,
  `conta_registro` varchar(8) DEFAULT NULL,
  `cod_liquidacao` char(2) DEFAULT NULL,
  `data_registro` date DEFAULT NULL,
  `id_abertura_caixa` int(11) DEFAULT NULL,
  `data_baixa_contabilidade` date DEFAULT NULL,
  `expirado` int(1) DEFAULT '0' COMMENT '0-Nao 1 - Sim',
  `carteira` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "titulos_recebafacil_historico"
#

CREATE TABLE `base_web_control`.`titulos_recebafacil_historico` (
  `id` bigint(20) NOT NULL,
  `id_cadastro` bigint(20) NOT NULL,
  `banco` int(3) DEFAULT NULL,
  `numero_lote` int(11) NOT NULL,
  `arquivo_envio` varchar(60) DEFAULT NULL,
  `conteudo_arq_envio` longtext,
  `data_hora_geracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `qtd_reg_enviado` int(11) NOT NULL,
  `arquivo_retorno` varchar(60) DEFAULT NULL,
  `conteudo_arq_retorno` longtext,
  `qtd_reg_erro` int(11) NOT NULL,
  `data_hora_retorno` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "titulos_retorno"
#

CREATE TABLE `base_web_control`.`titulos_retorno` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` int(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `conteudo` text,
  `erros` int(11) DEFAULT NULL,
  `link_arquivo` varchar(256) DEFAULT NULL,
  `lote` int(11) DEFAULT NULL,
  `arquivo_retorno` varchar(256) DEFAULT NULL,
  `data_hora_retorno` timestamp NULL DEFAULT NULL,
  `tp_arq` enum('E','R') DEFAULT 'E',
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_cadastro`),
  KEY `fk_002` (`id_cadastro`,`tp_arq`,`lote`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas"
#

CREATE TABLE `base_web_control`.`tmp_datas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_fatura` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1477790 DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_afiliacoes"
#

CREATE TABLE `base_web_control`.`tmp_datas_afiliacoes` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_afiliacoes_comparar"
#

CREATE TABLE `base_web_control`.`tmp_datas_afiliacoes_comparar` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_afiliacoes1"
#

CREATE TABLE `base_web_control`.`tmp_datas_afiliacoes1` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_atendimento"
#

CREATE TABLE `base_web_control`.`tmp_datas_atendimento` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_cancelamentos"
#

CREATE TABLE `base_web_control`.`tmp_datas_cancelamentos` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_equipamentos"
#

CREATE TABLE `base_web_control`.`tmp_datas_equipamentos` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_equipamentoss"
#

CREATE TABLE `base_web_control`.`tmp_datas_equipamentoss` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_equipamentosss"
#

CREATE TABLE `base_web_control`.`tmp_datas_equipamentosss` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=MEMORY DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_datas_teste"
#

CREATE TABLE `base_web_control`.`tmp_datas_teste` (
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_fat_bonificada"
#

CREATE TABLE `base_web_control`.`tmp_fat_bonificada` (
  `fat_bonificada` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_grafico_afiliacoes"
#

CREATE TABLE `base_web_control`.`tmp_grafico_afiliacoes` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_grafico_afiliacoes_consultor"
#

CREATE TABLE `base_web_control`.`tmp_grafico_afiliacoes_consultor` (
  `valor` int(11) DEFAULT '0',
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_grafico_cancelados"
#

CREATE TABLE `base_web_control`.`tmp_grafico_cancelados` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_imp_classificacao"
#

CREATE TABLE `base_web_control`.`tmp_imp_classificacao` (
  `id_cadastro` varchar(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL,
  `id_class_master` varchar(255) DEFAULT NULL,
  `descricao` text,
  `status` enum('P','AP') DEFAULT 'P' COMMENT 'P - Pendente AP - Aguardado Aprovacao',
  `id_usuario_importacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tmp_imp_cliente"
#

CREATE TABLE `base_web_control`.`tmp_imp_cliente` (
  `id_cadastro` varchar(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `tipo_pessoa` varchar(20) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `uf` varchar(50) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `cnpj_cpf` varchar(255) DEFAULT NULL,
  `inscricao_municipal` varchar(255) DEFAULT NULL,
  `inscricao_estadual` varchar(255) DEFAULT NULL,
  `rg` varchar(255) DEFAULT NULL,
  `telefone` varchar(100) DEFAULT NULL,
  `fax` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `fone_empresa` varchar(100) DEFAULT NULL,
  `nome_referencia` varchar(255) DEFAULT NULL,
  `nome_pai` varchar(255) DEFAULT NULL,
  `nome_mae` varchar(255) DEFAULT NULL,
  `renda_media` varchar(255) DEFAULT NULL,
  `empresa_trabalha` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `informacoes_adicionais` varchar(255) DEFAULT NULL,
  `status` enum('P','AP') DEFAULT 'P' COMMENT 'P - Pendente AP - Aguardado Aprovacao',
  `id_usuario_importacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tmp_imp_estoque"
#

CREATE TABLE `base_web_control`.`tmp_imp_estoque` (
  `id_cadastro` varchar(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL,
  `id_produto` varchar(255) DEFAULT NULL,
  `qtd_atual` varchar(255) DEFAULT NULL,
  `qtd_retiro_inseriu` varchar(255) DEFAULT NULL,
  `fico` varchar(255) DEFAULT NULL,
  `status` enum('P','AP') DEFAULT 'P' COMMENT 'P - Pendente AP - Aguardado Aprovacao',
  `id_usuario_importacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tmp_imp_fornecedor"
#

CREATE TABLE `base_web_control`.`tmp_imp_fornecedor` (
  `id_cadastro` varchar(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL,
  `id_forn_master` varchar(255) DEFAULT NULL,
  `fantasia` varchar(255) DEFAULT NULL,
  `razao_social` varchar(255) DEFAULT NULL,
  `tipo_pessoa` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `complemento` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `uf` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `cnpj_cpf` varchar(255) DEFAULT NULL,
  `insc_municipal` varchar(255) DEFAULT NULL,
  `insc_estadual` varchar(255) DEFAULT NULL,
  `rgie` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `contato` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `informacoes_adicionais` varchar(255) DEFAULT NULL,
  `status` enum('P','AP') DEFAULT 'P' COMMENT 'P - Pendente AP - Aguardado Aprovacao',
  `id_usuario_importacao` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tmp_imp_produto"
#

CREATE TABLE `base_web_control`.`tmp_imp_produto` (
  `id_cadastro` varchar(255) DEFAULT NULL,
  `id_usuario` varchar(255) DEFAULT NULL,
  `codigo_barra` varchar(255) DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `descricao_detalhada` text,
  `id_unidade` varchar(255) DEFAULT NULL,
  `id_classificacao` varchar(255) DEFAULT NULL,
  `id_fornecedor` varchar(255) DEFAULT NULL,
  `custo` varchar(255) DEFAULT NULL,
  `custo_medio_venda` varchar(255) DEFAULT NULL,
  `ncm` varchar(255) DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `id_cfop` varchar(255) DEFAULT NULL,
  `identificacao_interna` varchar(255) DEFAULT NULL,
  `localizacao` varchar(255) DEFAULT NULL,
  `prod_serv` varchar(255) DEFAULT NULL,
  `qtd_minima` varchar(255) DEFAULT NULL,
  `tamanho` varchar(255) DEFAULT NULL,
  `cor` varchar(255) DEFAULT NULL,
  `barra` varchar(255) DEFAULT NULL,
  `ean` varchar(30) DEFAULT NULL,
  `cest` varchar(30) DEFAULT NULL,
  `status` enum('P','AP') DEFAULT 'P' COMMENT 'P - Pendente AP - Aguardado Aprovacao',
  `margem_valor_lucro` varchar(255) DEFAULT NULL,
  `id_usuario_importacao` int(11) DEFAULT NULL,
  KEY `id_cadastro` (`id_cadastro`),
  KEY `codigo_barra` (`codigo_barra`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "tmp_meses_label"
#

CREATE TABLE `base_web_control`.`tmp_meses_label` (
  `num_mes` int(11) DEFAULT NULL,
  `mes_label` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_produto_aux"
#

CREATE TABLE `base_web_control`.`tmp_produto_aux` (
  `id_produto` int(11) DEFAULT NULL,
  `custo` decimal(15,3) DEFAULT NULL,
  `custo_medio_venda` decimal(15,3) DEFAULT NULL,
  `valor_custo` decimal(15,3) DEFAULT NULL,
  `valor_varejo_aprazo` decimal(15,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_ranking_agendamento_diario"
#

CREATE TABLE `base_web_control`.`tmp_ranking_agendamento_diario` (
  `id_assistente` int(11) DEFAULT NULL,
  `d1` int(11) DEFAULT NULL,
  `d2` int(11) DEFAULT NULL,
  `d3` int(11) DEFAULT NULL,
  `d4` int(11) DEFAULT NULL,
  `d5` int(11) DEFAULT NULL,
  `d6` int(11) DEFAULT NULL,
  `d7` int(11) DEFAULT NULL,
  `d1_label` char(10) DEFAULT NULL,
  `d2_label` char(10) DEFAULT NULL,
  `d3_label` char(10) DEFAULT NULL,
  `d4_label` char(10) DEFAULT NULL,
  `d5_label` char(10) DEFAULT NULL,
  `d6_label` char(10) DEFAULT NULL,
  `d7_label` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_ranking_atendimento"
#

CREATE TABLE `base_web_control`.`tmp_ranking_atendimento` (
  `valor` int(11) NOT NULL,
  `data_inicio` varchar(255) DEFAULT NULL,
  `data_fim` varchar(255) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_ranking_geral"
#

CREATE TABLE `base_web_control`.`tmp_ranking_geral` (
  `total` int(11) NOT NULL,
  `mes1` int(11) DEFAULT '0',
  `mes2` int(11) DEFAULT '0',
  `mes3` int(11) DEFAULT '0',
  `mes4` int(11) DEFAULT '0',
  `mes5` int(11) DEFAULT '0',
  `mes6` int(11) DEFAULT '0',
  `mes7` int(11) DEFAULT '0',
  `mes8` int(11) DEFAULT '0',
  `mes9` int(11) DEFAULT '0',
  `mes10` int(11) DEFAULT '0',
  `mes11` int(11) DEFAULT '0',
  `mes12` int(11) DEFAULT '0',
  `mes1_label` varchar(255) DEFAULT NULL,
  `mes2_label` varchar(255) DEFAULT NULL,
  `mes3_label` varchar(255) DEFAULT NULL,
  `mes4_label` varchar(255) DEFAULT NULL,
  `mes5_label` varchar(255) DEFAULT NULL,
  `mes6_label` varchar(255) DEFAULT NULL,
  `mes7_label` varchar(255) DEFAULT NULL,
  `mes8_label` varchar(255) DEFAULT NULL,
  `mes9_label` varchar(255) DEFAULT NULL,
  `mes10_label` varchar(255) DEFAULT NULL,
  `mes11_label` varchar(255) DEFAULT NULL,
  `mes12_label` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_sped_150"
#

CREATE TABLE `base_web_control`.`tmp_sped_150` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `COD_PART` varchar(60) DEFAULT NULL COMMENT 'cpf ou cnpj do destinatario da nota',
  `NOME` varchar(100) DEFAULT NULL COMMENT 'Nome do destinatario',
  `COD_PAIS` int(5) DEFAULT '1058' COMMENT 'Codigo do Pais - 1058 (Brasil)',
  `CNPJ` varchar(14) DEFAULT NULL COMMENT 'Cnpj do destinatario',
  `CPF` varchar(11) DEFAULT NULL COMMENT 'CPF do destinatario',
  `IE` varchar(14) DEFAULT NULL COMMENT 'Insc Estadual do destinatario',
  `COD_MUN` bigint(5) DEFAULT NULL COMMENT 'Codigo da cidade do destinatario',
  `SUFRAMA` varchar(9) DEFAULT NULL COMMENT 'Codigo Suframa do destinatario',
  `END` varchar(60) DEFAULT NULL COMMENT 'Endereco do destinatario',
  `NUM` varchar(10) DEFAULT NULL COMMENT 'Numero do endereco do destinatario',
  `COMPL` varchar(40) DEFAULT NULL COMMENT 'Complemento do endereco do destinatario',
  `BAIRRO` varchar(60) DEFAULT NULL COMMENT 'Bairro do endereco do destinatario',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_sped_190"
#

CREATE TABLE `base_web_control`.`tmp_sped_190` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `unidade` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

#
# Structure for table "tmp_sped_unidade"
#

CREATE TABLE `base_web_control`.`tmp_sped_unidade` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `unidade` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha"
#

CREATE TABLE `base_web_control`.`torpedo_campanha` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_lista` int(11) DEFAULT NULL,
  `listas` text,
  `nome_campanha` varchar(200) DEFAULT NULL,
  `texto` varchar(200) DEFAULT NULL COMMENT 'ate 160 chars',
  `data_envio` date DEFAULT NULL,
  `hora_envio` time DEFAULT NULL,
  `status_campanha` char(5) DEFAULT NULL COMMENT 'E - Enviado / A - Agendado / R - Rascunho / P - Pausada / C - Cancelada / X - Erro / S - Sem saldo',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_campanha_allcance` varchar(255) DEFAULT NULL,
  `msg_erro` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13108 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha_agendamento"
#

CREATE TABLE `base_web_control`.`torpedo_campanha_agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_torpedo_campanha` int(11) NOT NULL,
  `data_inicio` datetime NOT NULL,
  `data_fim` datetime NOT NULL,
  `hora_agendamento` time NOT NULL,
  `status_agendamento` enum('A','E') DEFAULT NULL COMMENT 'Não utilizado, criado só Deus sabe o porque...',
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_torpedo_campanha`)
) ENGINE=InnoDB AUTO_INCREMENT=3068 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha_bkp_excluidos"
#

CREATE TABLE `base_web_control`.`torpedo_campanha_bkp_excluidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_lista` int(11) DEFAULT NULL,
  `listas` text,
  `nome_campanha` varchar(200) DEFAULT NULL,
  `texto` varchar(200) DEFAULT NULL COMMENT 'ate 160 chars',
  `data_envio` date DEFAULT NULL,
  `hora_envio` time DEFAULT NULL,
  `status_campanha` char(5) DEFAULT NULL COMMENT 'E - Enviado / A - Agendado / R - Rascunho / P - Pausada / C - Cancelada',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_campanha_allcance` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10755 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha_fixa"
#

CREATE TABLE `base_web_control`.`torpedo_campanha_fixa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_campanha` varchar(200) NOT NULL,
  `texto` varchar(160) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha_fixa_ignorar"
#

CREATE TABLE `base_web_control`.`torpedo_campanha_fixa_ignorar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_torpedo_campanha_fixa` int(11) DEFAULT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_torpedo_campanha_fixa`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_campanha_lista"
#

CREATE TABLE `base_web_control`.`torpedo_campanha_lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_campanha` varchar(11) DEFAULT NULL,
  `codigo_status` varchar(10) DEFAULT NULL COMMENT 'T - Sucesso, F - Falha',
  `descricao_status` varchar(30) DEFAULT NULL,
  `celular` varchar(255) DEFAULT NULL,
  `codigo_campanha` bigint(20) DEFAULT NULL,
  `dh_entrada` timestamp NULL DEFAULT NULL,
  `dh_entrega` timestamp NULL DEFAULT NULL,
  `operadora` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_celular` (`celular`)
) ENGINE=InnoDB AUTO_INCREMENT=45179 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_lista"
#

CREATE TABLE `base_web_control`.`torpedo_lista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome_lista` varchar(200) DEFAULT NULL,
  `numeros_lista` text,
  `tipo_lista` char(5) DEFAULT NULL COMMENT 'D - Emails Digitados / I - Emails Importados',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fixa` enum('S','N') DEFAULT 'N',
  `status` enum('A','I') DEFAULT 'A' COMMENT 'A - Ativo I - Inativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61273 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_lista_telefones"
#

CREATE TABLE `base_web_control`.`torpedo_lista_telefones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_lista` int(11) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk001` (`id_cadastro`,`telefone`),
  KEY `fk002` (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=13604445 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_log"
#

CREATE TABLE `base_web_control`.`torpedo_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT '0 - cron (considerar usuario que agendou )',
  `id_campanha` int(11) DEFAULT NULL,
  `id_transmissao` char(50) DEFAULT NULL,
  `status_transmissao` int(11) DEFAULT NULL,
  `msg_transmissao` varchar(200) DEFAULT NULL,
  `total_torpedos_enviados` char(50) DEFAULT NULL COMMENT 'total de torpedos enviados',
  `action` char(50) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_cadastro`),
  KEY `fk_002` (`id_campanha`)
) ENGINE=InnoDB AUTO_INCREMENT=1882 DEFAULT CHARSET=latin1;

#
# Structure for table "torpedo_master"
#

CREATE TABLE `base_web_control`.`torpedo_master` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allcance_lgn` varchar(50) NOT NULL DEFAULT '0',
  `allcance_pwd` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='configuracoes do usuario master SMS Allcance.';

#
# Structure for table "torpedo_user"
#

CREATE TABLE `base_web_control`.`torpedo_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL COMMENT 'Senha do sistema Allcance',
  `nome_user` varchar(50) DEFAULT NULL,
  `celular_user` char(50) DEFAULT NULL COMMENT 'Serve como login no sistema Allcance',
  `email_user` varchar(50) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='usuarios do sistema torpedo cadastrados na alcance em revend';

#
# Structure for table "totemfrequency_parameters"
#

CREATE TABLE `base_web_control`.`totemfrequency_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `frequency_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for table "totemtasks"
#

CREATE TABLE `base_web_control`.`totemtasks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `command` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parameters` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UTC',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `dont_overlap` tinyint(1) NOT NULL DEFAULT '0',
  `run_in_maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `notification_email_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_phone_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_slack_webhook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auto_cleanup_num` int(11) NOT NULL DEFAULT '0',
  `auto_cleanup_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `run_on_one_server` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `tasks_is_active_idx` (`is_active`),
  KEY `tasks_dont_overlap_idx` (`dont_overlap`),
  KEY `tasks_run_in_maintenance_idx` (`run_in_maintenance`),
  KEY `tasks_run_on_one_server_idx` (`run_on_one_server`),
  KEY `tasks_auto_cleanup_num_idx` (`auto_cleanup_num`),
  KEY `tasks_auto_cleanup_type_idx` (`auto_cleanup_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "totemtask_results"
#

CREATE TABLE `base_web_control`.`totemtask_results` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `ran_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `duration` decimal(24,14) NOT NULL,
  `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_results_task_id_idx` (`task_id`),
  KEY `task_results_ran_at_idx` (`ran_at`),
  CONSTRAINT `task_id_fk` FOREIGN KEY (`task_id`) REFERENCES `base_web_control`.`totemtasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2736 DEFAULT CHARSET=latin1;

#
# Structure for table "totemtask_frequencies"
#

CREATE TABLE `base_web_control`.`totemtask_frequencies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `task_id` int(10) unsigned NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `task_frequencies_task_id_idx` (`task_id`),
  CONSTRAINT `task_frequencies_task_id_fk` FOREIGN KEY (`task_id`) REFERENCES `base_web_control`.`totemtasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "transportadora"
#

CREATE TABLE `base_web_control`.`transportadora` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario` bigint(20) DEFAULT NULL,
  `situacao` enum('A','I','E') DEFAULT 'A',
  `nome_razao_social` varchar(100) DEFAULT NULL,
  `cnpj_cpf` varchar(14) DEFAULT NULL,
  `tipo_pessoa` enum('F','J') DEFAULT NULL,
  `id_tipo_log` int(11) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `endereco` varchar(50) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `celular` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `fone_gratuito` varchar(11) DEFAULT NULL,
  `informacoes_adicionais` text,
  `pessoa_contato` varchar(50) DEFAULT NULL,
  `insc_estadual` varchar(14) DEFAULT NULL,
  `isento_icms` enum('S','N') DEFAULT 'N',
  `ie_rg` varchar(20) DEFAULT NULL,
  `data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` timestamp NULL DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8435 DEFAULT CHARSET=latin1;

#
# Structure for table "transportadora_placa"
#

CREATE TABLE `base_web_control`.`transportadora_placa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_transportadora` bigint(20) DEFAULT NULL,
  `placa` varchar(7) DEFAULT NULL,
  `data_hora_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `situacao` enum('A','I') DEFAULT 'A',
  `id_usuario` bigint(20) DEFAULT NULL,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `uf` char(2) DEFAULT NULL,
  `rntc` varchar(20) DEFAULT NULL,
  `cod_antt` varchar(30) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_id_tranportadora` (`id_transportadora`)
) ENGINE=InnoDB AUTO_INCREMENT=3005 DEFAULT CHARSET=latin1;

#
# Structure for table "tributacao"
#

CREATE TABLE `base_web_control`.`tributacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sigla` varchar(10) DEFAULT NULL,
  `descricao` varchar(100) DEFAULT NULL,
  `situacao` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Structure for table "unidade"
#

CREATE TABLE `base_web_control`.`unidade` (
  `id` int(2) NOT NULL,
  `sigla` char(6) DEFAULT NULL,
  `descricao` varchar(20) DEFAULT NULL,
  `ativo` enum('A','I') DEFAULT 'A',
  `vlr_quebrado` enum('S','N') DEFAULT 'N',
  `id_frentecaixa` int(1) DEFAULT NULL,
  `qtd_casas_decimais` int(11) DEFAULT NULL,
  `unidade_sped` char(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk001` (`id`,`vlr_quebrado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "unidades_fracionamento"
#

CREATE TABLE `base_web_control`.`unidades_fracionamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_unidade_pai` int(11) NOT NULL,
  `id_unidade_filho` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

#
# Structure for table "users"
#

CREATE TABLE `base_web_control`.`users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "usuario"
#

CREATE TABLE `base_web_control`.`usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome_usuario` varchar(40) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` enum('A','I') DEFAULT 'A',
  `id_cadastro` int(11) DEFAULT NULL,
  `id_funcionario` int(11) DEFAULT NULL,
  `login_master` enum('S','N') DEFAULT 'N',
  `email` varchar(50) DEFAULT NULL,
  `data_desabilita` date DEFAULT NULL,
  `config_venda` enum('N','E','I') DEFAULT 'I' COMMENT 'Nova venda balcao, Outro cliente, Imprimir',
  `cod_empresa` int(11) DEFAULT NULL,
  `cnpj_cpf` varchar(14) DEFAULT NULL,
  `id_tipo_permissao_usuario` int(11) NOT NULL DEFAULT '1',
  `percentual_desconto_autorizado` decimal(10,2) DEFAULT NULL,
  `versao_sistema` int(1) DEFAULT '1' COMMENT '1 - Versao WebControl  2 - Versao WebEmpresa',
  PRIMARY KEY (`id`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `fk_id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=72260 DEFAULT CHARSET=latin1;

#
# Structure for table "vale_presente"
#

CREATE TABLE `base_web_control`.`vale_presente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `valor` decimal(15,2) DEFAULT NULL,
  `data_emissao` datetime DEFAULT NULL,
  `data_resgate` datetime DEFAULT NULL,
  `validade` datetime DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `chave_acesso` varchar(64) DEFAULT NULL,
  `ativo` tinyint(4) DEFAULT '1' COMMENT '0 - Inativo 1 - Ativo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1376 DEFAULT CHARSET=latin1;

#
# Structure for table "vale_presente_historico"
#

CREATE TABLE `base_web_control`.`vale_presente_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_valepresente` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `valor_atual` float(10,2) DEFAULT NULL COMMENT 'Valor Atual = Valor anterior do vale presente - valor utilizado na venda',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=latin1;

#
# Structure for table "vale_presente_new"
#

CREATE TABLE `base_web_control`.`vale_presente_new` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `data_emissao` datetime DEFAULT CURRENT_TIMESTAMP,
  `chave_acesso` varchar(45) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT '1',
  `qtde` int(11) DEFAULT NULL,
  `valor` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

#
# Structure for table "valor"
#

CREATE TABLE `base_web_control`.`valor` (
  `COD_PRODUTO` int(11) DEFAULT NULL,
  `UNIDADE` text,
  `VALOR` text,
  `VALOR_MATERIAL` text,
  `VALOR_MO` text,
  `VALOR_LUCRO` text,
  `PCT_LUCRO` text,
  `VALOR_MINIMO` text,
  `VALOR_PADRAO` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "valor_extra_caixa"
#

CREATE TABLE `base_web_control`.`valor_extra_caixa` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_abertura_caixa` bigint(20) unsigned DEFAULT NULL,
  `id_cliente` int(10) DEFAULT NULL,
  `numero_caixa` tinyint(3) unsigned DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `motivo` varchar(500) DEFAULT NULL,
  `data_entrada` datetime DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  KEY `Index 1` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000343647 DEFAULT CHARSET=latin1;

#
# Structure for table "valor_inicial_caixa"
#

CREATE TABLE `base_web_control`.`valor_inicial_caixa` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `vlr_inicial` decimal(10,2) DEFAULT '0.00',
  `vlr_final` decimal(10,2) DEFAULT NULL,
  `data_hora_inicial` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_hora_final` datetime DEFAULT NULL,
  `id_cadastro` bigint(20) NOT NULL DEFAULT '0',
  `id_usuario` bigint(20) NOT NULL DEFAULT '0',
  `status` enum('I','F','M') DEFAULT 'I' COMMENT 'I - Iniciado, F - Finalizado, M - finalizado pelo usuario Master',
  `num_caixa` int(3) unsigned zerofill DEFAULT '000',
  `vr_extra_caixa` decimal(12,2) DEFAULT '0.00',
  `origem_caixa` int(1) DEFAULT '1' COMMENT '1 Web - 2 Pdv  -  3 OffLine',
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuario` (`id_cadastro`,`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1455411 DEFAULT CHARSET=latin1;

#
# Structure for table "valor_sangria"
#

CREATE TABLE `base_web_control`.`valor_sangria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_hora` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` bigint(20) DEFAULT NULL,
  `id_usuario_retiro` bigint(20) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `id_valor_inicial_caixa` bigint(20) DEFAULT NULL,
  `id_user_logado` bigint(20) DEFAULT NULL,
  `obs` text,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `fk_id_usuario_retiro` (`id_usuario_retiro`),
  KEY `fk_id_valor_inicial_caixa` (`id_valor_inicial_caixa`),
  KEY `fk_id_user_logado` (`id_user_logado`)
) ENGINE=InnoDB AUTO_INCREMENT=774265 DEFAULT CHARSET=latin1;

#
# Structure for table "venda"
#

CREATE TABLE `base_web_control`.`venda` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_tipo_venda` int(10) unsigned DEFAULT '0' COMMENT '0 Venda - 1 Pedido - 2 Orçamento - 3 Ordem Serviço - 4 Consignação - 5 Locação - 6 Comanda - 7 Loja Online - 8 Assistencia Técnica',
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `id_usuario_fecha_venda` int(11) DEFAULT NULL,
  `id_usuario_orcamento` int(11) DEFAULT NULL COMMENT 'usuario que fez o orçamento',
  `id_usuario_extorno` int(11) DEFAULT NULL COMMENT 'usuario que fez o extorno da venda',
  `id_usuario_autoriza_desconto` int(11) DEFAULT NULL,
  `id_usuario_exclusao` int(11) DEFAULT NULL,
  `id_funcionario` int(11) unsigned DEFAULT NULL,
  `id_cliente` int(10) unsigned DEFAULT NULL,
  `id_venda_local` bigint(20) DEFAULT NULL,
  `id_forma_pagamento` char(2) DEFAULT NULL,
  `id_parcela` int(11) DEFAULT NULL,
  `id_nota_devolucao` int(11) DEFAULT NULL,
  `data_venda` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `hora_venda` time DEFAULT '00:00:00',
  `situacao` enum('A','C','E','X','Y','I','G','N','F') DEFAULT 'A' COMMENT 'A - Aguardando Aprovação, C - Encerrada , E Cancelada, X -Aprovado, Y-Aguardando Peças, I - Pedido Impresso Para Cozinha G - Comanda Agrupada, N - Não aprovado F - Faturado',
  `tipo_pgto` char(2) DEFAULT NULL COMMENT 'Dinheiro, Boleto, Cheque, Visa, Master',
  `sessao_venda` varchar(100) DEFAULT NULL,
  `data_orcamento` date DEFAULT NULL COMMENT 'Data que foi feito o orçamento',
  `hora_orcamento` time DEFAULT NULL COMMENT 'Hora que foi feito o orçamento',
  `orcamento` enum('S','N') DEFAULT 'N',
  `data_validade` date DEFAULT NULL COMMENT 'Até que data o orçamento é valido',
  `data_hora_extorno` datetime DEFAULT NULL COMMENT 'Data e hora que foi feito o extorno',
  `descricao_extorno` text COMMENT 'Descrição porque fez o extorno da venda',
  `descricao_venda` text COMMENT 'Descriçaõ da venda',
  `a_vista` enum('P','V') DEFAULT 'V',
  `origem_venda` enum('W','L','CF','CNF','CAT','OFF') DEFAULT 'W' COMMENT 'W web-control, L loja-virtual, CF Cupom Fiscal, CNF Cupom nao Fiscal, CAT - Catálogo Online, OFF - Sinc Offiline',
  `pago` enum('S','N') DEFAULT 'S',
  `valor_final_desconto` decimal(10,2) DEFAULT NULL,
  `nfe_status` enum('0','1','2','3','4','5','6','7','8') DEFAULT '0' COMMENT '0 - não solicitado, 1 - solicitada, 2 - em andamento, 3 - cancelada, 4 - inutilizada, 5 -ok, 6 - falha,  7 - denegada, 8- rejeitada',
  `troco` decimal(12,2) DEFAULT NULL,
  `tp_nf` enum('NFE','NFC') DEFAULT NULL,
  `ambiente_nf` int(1) DEFAULT NULL COMMENT '1 Producao , 2 Homologacao',
  `observacao` text,
  `data_previsao_entrega` date DEFAULT NULL,
  `hora_precisao_entrega` time NOT NULL DEFAULT '00:00:00',
  `prazo_devolucao` varchar(5) DEFAULT NULL,
  `valor_multa_diaria` decimal(12,2) NOT NULL DEFAULT '0.00',
  `valor_comissao_percentual` decimal(12,2) DEFAULT '0.00',
  `valor_comissao_em_reais` decimal(12,2) NOT NULL DEFAULT '0.00',
  `qtd_garantia` int(11) DEFAULT NULL,
  `tp_garantia` char(1) DEFAULT NULL COMMENT 'M - Meses - D Dia - S - Semana',
  `numero_nota_sefaz` int(11) DEFAULT NULL,
  `id_comanda` int(11) DEFAULT NULL,
  `id_abertura_caixa` bigint(20) DEFAULT NULL,
  `data_excluido` datetime DEFAULT NULL,
  `id_comandas_agrupadas` varchar(100) DEFAULT NULL,
  `id_venda_destino` int(11) DEFAULT NULL,
  `valor_entrada` decimal(15,3) DEFAULT '0.000',
  `id_cupom_venda` int(11) DEFAULT NULL,
  `id_objeto_cliente` int(11) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` bigint(22) DEFAULT NULL,
  `id_local` int(11) DEFAULT NULL,
  `situacao_anterior` char(1) DEFAULT NULL,
  `id_placa` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_venda01` (`id_cadastro`,`situacao`,`id_cliente`,`sessao_venda`,`id_forma_pagamento`),
  KEY `fk_id_venda_local` (`id_venda_local`),
  KEY `fk_venda02` (`id_cliente`),
  KEY `id_tipo_venda` (`id_tipo_venda`),
  KEY `fk_venda03` (`id_cadastro`,`situacao`,`origem_venda`),
  KEY `fk_venda04` (`id_cadastro`,`data_venda`),
  KEY `fk_venda05` (`data_venda`),
  KEY `fk_venda_destino` (`id_venda_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=68267593 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_adiantamento"
#

CREATE TABLE `base_web_control`.`venda_adiantamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_abertura_caixa` int(11) NOT NULL,
  `id_forma_pagamento` int(11) NOT NULL,
  `valor` decimal(15,3) NOT NULL,
  `data_adiantamento` datetime NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=7357 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_alerta"
#

CREATE TABLE `base_web_control`.`venda_alerta` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `lido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_consignacao_devolucao"
#

CREATE TABLE `base_web_control`.`venda_consignacao_devolucao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_venda_item` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `qtd` float DEFAULT NULL,
  `qtd_anterior` float DEFAULT NULL,
  `data_cadastro` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cadastro` (`id_cadastro`),
  KEY `idx_venda` (`id_venda`),
  KEY `idx_venda_item` (`id_venda_item`),
  KEY `idx_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14251 DEFAULT CHARSET=latin1 COMMENT='Tabela Responsável por Armazenar o Histórico de Devolução da Consignação	';

#
# Structure for table "venda_devolucao"
#

CREATE TABLE `base_web_control`.`venda_devolucao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_venda` int(10) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `id_nota_credito` int(11) DEFAULT NULL,
  `valor_devolucao` decimal(12,2) DEFAULT NULL,
  `nota_credito` decimal(12,2) DEFAULT NULL,
  `finalizada` enum('S','N') DEFAULT 'N',
  `nfe_status` enum('0','1','2','3','4','5','6','7','8') DEFAULT '0' COMMENT '0 - não solicitado, 1 - solicitada, 2 - em andamento, 3 - cancelada, 4 - inutilizada, 5 -ok, 6 - falha, 7 - denegada, 8- rejeitada',
  `doc_cliente` varchar(14) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_devol_01` (`id_venda`),
  KEY `fk_devol_03` (`id_nota_credito`)
) ENGINE=InnoDB AUTO_INCREMENT=75931 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_informacoes"
#

CREATE TABLE `base_web_control`.`venda_informacoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `valor_frete` decimal(12,2) NOT NULL,
  `info_adicional` longtext,
  `volumes` int(11) DEFAULT '1',
  `doc_consumidor` varchar(14) DEFAULT NULL,
  `desc_volume` varchar(10) DEFAULT NULL,
  `nat_operacao` varchar(50) DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `hora_saida` time DEFAULT NULL,
  `frete_por_conta` int(1) DEFAULT '0',
  `id_transportadora` int(11) DEFAULT '0',
  `id_placa` int(11) DEFAULT '0',
  `indicador_presenca` int(11) DEFAULT '0',
  `outras_despesas` decimal(15,3) DEFAULT NULL,
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `peso_bruto` decimal(15,3) DEFAULT NULL,
  `peso_liquido` decimal(15,3) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `numeracao` varchar(50) DEFAULT NULL,
  `ordem_compra` varchar(15) DEFAULT NULL,
  `tipo_operacao` int(1) DEFAULT '1',
  `consumidor_final` int(1) DEFAULT '0',
  `nf_forma_pgto` int(1) DEFAULT '0' COMMENT '0 - A Vista   1 - A Prazo   2 - Outros',
  `id_id_itens` text,
  PRIMARY KEY (`id`),
  KEY `fk_adic_01` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=8482999 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_itens"
#

CREATE TABLE `base_web_control`.`venda_itens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qtd` decimal(10,3) unsigned DEFAULT NULL,
  `id_venda` int(10) unsigned DEFAULT NULL,
  `id_produto` int(10) unsigned DEFAULT NULL,
  `nome_produto` varchar(120) DEFAULT NULL,
  `preco_tabela` decimal(25,15) DEFAULT NULL,
  `nome_classificacao` varchar(50) DEFAULT NULL,
  `codigo_barra` varchar(20) DEFAULT NULL,
  `preco_venda` decimal(25,15) DEFAULT NULL,
  `id_autoriza_desconto` int(11) DEFAULT NULL,
  `id_autoriza_cancelamento` int(11) DEFAULT '0',
  `id_unidade` int(11) unsigned DEFAULT '0',
  `estornado` enum('S','N') DEFAULT 'N',
  `data_hora_estorno` datetime DEFAULT NULL,
  `desconto` enum('S','N') DEFAULT 'N',
  `cfop` int(11) DEFAULT NULL,
  `percentual_desconto` decimal(10,4) DEFAULT NULL,
  `valor_preco_custo` decimal(12,3) DEFAULT NULL,
  `seq_ecf` smallint(6) DEFAULT NULL,
  `observacoes_cozinha` varchar(255) DEFAULT NULL,
  `id_grade` bigint(20) DEFAULT NULL,
  `id_promocao` bigint(20) unsigned DEFAULT NULL,
  `id_kit` int(11) DEFAULT NULL,
  `informacoes_item` text,
  `atacado_varejo` enum('A','V') NOT NULL DEFAULT 'V',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `xped` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venda` (`id_venda`),
  KEY `fk_venda_itens01` (`id_unidade`,`id_autoriza_cancelamento`,`id_autoriza_desconto`,`id_venda`),
  KEY `fk_venda_itens02` (`codigo_barra`),
  KEY `id_produto` (`id_produto`),
  KEY `id_grade` (`id_grade`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=115118913 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_itens_automoveis"
#

CREATE TABLE `base_web_control`.`venda_itens_automoveis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda_item` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `veicProd` text,
  `tpOp` int(11) DEFAULT NULL,
  `chassi` varchar(17) DEFAULT NULL,
  `cCor` varchar(4) DEFAULT NULL,
  `xCor` varchar(40) DEFAULT NULL,
  `pot` varchar(4) DEFAULT NULL,
  `cilin` varchar(4) DEFAULT NULL,
  `pesoL` varchar(9) DEFAULT NULL,
  `pesoB` varchar(9) DEFAULT NULL,
  `nSerie` varchar(9) DEFAULT NULL,
  `tpComb` varchar(9) DEFAULT NULL,
  `nMotor` varchar(21) DEFAULT NULL,
  `cmt` varchar(9) DEFAULT NULL,
  `dist` varchar(4) DEFAULT NULL,
  `anoMod` int(11) DEFAULT NULL,
  `anoFab` int(11) DEFAULT NULL,
  `tpPint` char(1) DEFAULT NULL,
  `tpVeic` int(11) DEFAULT NULL,
  `espVeic` int(11) DEFAULT NULL,
  `vin` char(1) DEFAULT NULL,
  `condVeic` int(11) DEFAULT NULL,
  `cMod` int(11) DEFAULT NULL,
  `cCorDENATRAN` int(11) DEFAULT NULL,
  `lota` int(11) DEFAULT NULL,
  `tpRest` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk001` (`id_venda_item`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=latin1 COMMENT='INFORMAÇÕES DOS VEICULOS.';

#
# Structure for table "venda_itens_devolucao"
#

CREATE TABLE `base_web_control`.`venda_itens_devolucao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_venda_devol` int(10) DEFAULT NULL,
  `id_venda` int(10) unsigned DEFAULT NULL,
  `id_venda_itens` int(10) unsigned DEFAULT NULL,
  `qtd` decimal(10,3) unsigned DEFAULT NULL,
  `nome_produto` varchar(100) DEFAULT NULL,
  `codigo_barra` varchar(22) DEFAULT NULL,
  `preco_venda` decimal(10,2) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `motivo_devol` char(3) DEFAULT NULL,
  `seq_item_nota` int(2) DEFAULT NULL,
  `finalizados` enum('S','N') DEFAULT 'N',
  `cfop` int(6) DEFAULT NULL,
  `id_grade` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_devol_01` (`id_venda`),
  KEY `fk_devol_02` (`id_venda_itens`)
) ENGINE=InnoDB AUTO_INCREMENT=96638 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_juros_parcelamento"
#

CREATE TABLE `base_web_control`.`venda_juros_parcelamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,1) DEFAULT NULL,
  `descricao` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_locacao"
#

CREATE TABLE `base_web_control`.`venda_locacao` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_venda` bigint(20) unsigned DEFAULT NULL,
  `id_modelo_contrato` int(11) DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `valor` decimal(12,2) DEFAULT NULL,
  `valor_multa_diaria` decimal(12,2) DEFAULT NULL,
  `tipo_faturamento` enum('H','D','S','Q','M','T') DEFAULT NULL COMMENT 'H - Horista, D - Diária, S - Semanal, Q - Quinzenal, M - Mensal, T - Trimestral',
  `fiador` char(1) DEFAULT '0',
  `nome_fiador` varchar(255) DEFAULT NULL,
  `rg_fiador` char(20) DEFAULT NULL,
  `cpf_fiador` char(20) DEFAULT NULL,
  `end_fiador` varchar(200) DEFAULT NULL,
  `fone_fiador` char(20) DEFAULT NULL,
  `fone_fiador2` char(20) DEFAULT NULL,
  `obs` text,
  `status_loc` char(1) DEFAULT 'R' COMMENT 'L - Locado, R - Reservado, D - Devolvido, T - Teste/Prova, C - Cancelado',
  `data_hora_acao` datetime DEFAULT NULL,
  `valor_desconto` decimal(12,2) DEFAULT NULL,
  `data_devolucao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_venda` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=24017 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_nfse_informacoes"
#

CREATE TABLE `base_web_control`.`venda_nfse_informacoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `status_nota` char(1) DEFAULT '3',
  `protocolo` varchar(20) NOT NULL,
  `ambiente` char(1) DEFAULT 'P',
  `protocolo_cancelamento` varchar(20) DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vnfse01` (`id_venda`),
  KEY `fk_vnfse02` (`protocolo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "venda_notas_eletronicas"
#

CREATE TABLE `base_web_control`.`venda_notas_eletronicas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_nota` enum('NFE','NFC','NFS','CFE') NOT NULL DEFAULT 'NFE',
  `status` enum('1','2','3','4','5','6','7','8','9') DEFAULT '1' COMMENT '0 - não solicitado, 1 - solicitada, 2 - em andamento, 3 - cancelada, 4 - inutilizada, 5 -ok, 6 - falha, 7 - denegada, 8- rejeitada, 9 Contingencia',
  `numero_nota` bigint(20) DEFAULT NULL,
  `ambiente_nf` int(1) DEFAULT '1' COMMENT '1 Producao , 2 Homologacao',
  `danfe` varchar(44) DEFAULT NULL,
  `xml` longtext,
  `LOTE` int(11) DEFAULT NULL,
  `QTDE` int(11) DEFAULT NULL,
  `ARQUIVO` varchar(100) DEFAULT NULL,
  `RETORNO` longtext,
  `LINK_NFS` varchar(255) DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `xml_cancelamento` longtext,
  `retorno_cancelamento_prefeitura` longtext,
  `protocolo` varchar(60) DEFAULT '',
  `vr_total_prod` decimal(12,2) NOT NULL,
  `vr_total_nota` decimal(12,2) NOT NULL,
  `vr_total_desconto` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_001` (`id_venda`),
  KEY `fk_003` (`id_venda`,`tipo_nota`,`numero_nota`),
  KEY `fk_004` (`tipo_nota`,`protocolo`),
  KEY `fk_venda_nf01` (`data_hora`,`tipo_nota`,`status`),
  KEY `fk_005` (`id_venda`,`data_hora`,`tipo_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=61185998 DEFAULT CHARSET=utf8;

#
# Structure for table "venda_notas_eletronicas_lixo"
#

CREATE TABLE `base_web_control`.`venda_notas_eletronicas_lixo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tipo_nota` enum('NFE','NFC','NFS','CFE') NOT NULL DEFAULT 'NFE',
  `status_nota` enum('0','1','2','3','4','5','6','7','8') DEFAULT '1' COMMENT '0 - não solicitado, 1 - solicitada, 2 - em andamento, 3 - cancelada, 4 - inutilizada, 5 -ok, 6 - falha, 7 - denegada, 8- rejeitada, 9 Contingencia',
  `numero_nota` bigint(20) DEFAULT NULL,
  `ambiente_nf` int(1) DEFAULT '1' COMMENT '1 Producao , 2 Homologacao',
  `danfe` varchar(44) DEFAULT NULL,
  `xml` text,
  `LOTE` int(11) DEFAULT NULL,
  `QTDE` int(11) DEFAULT NULL,
  `ARQUIVO` varchar(100) DEFAULT NULL,
  `RETORNO` text,
  `LINK_NFS` varchar(255) DEFAULT NULL,
  `data_cancelamento` datetime DEFAULT NULL,
  `xml_cancelamento` longtext,
  `retorno_cancelamento_prefeitura` longtext,
  `protocolo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_003` (`id_venda`,`tipo_nota`,`numero_nota`),
  KEY `fk_001` (`id_venda`),
  KEY `fk_002` (`LOTE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_optica"
#

CREATE TABLE `base_web_control`.`venda_optica` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `data_receita` date DEFAULT NULL,
  `medico` varchar(45) DEFAULT NULL,
  `crm` varchar(45) DEFAULT NULL,
  `uf` varchar(45) DEFAULT NULL,
  `convenio` varchar(45) DEFAULT NULL,
  `ponte` varchar(45) DEFAULT NULL,
  `altura_horizontal` varchar(45) DEFAULT NULL,
  `altura_vertical` varchar(45) DEFAULT NULL,
  `diagonal` varchar(45) DEFAULT NULL,
  `armacao` varchar(45) DEFAULT NULL,
  `longe_od_esferico` varchar(45) DEFAULT NULL,
  `longe_od_cilindrico` varchar(45) DEFAULT NULL,
  `longe_od_eixo` varchar(45) DEFAULT NULL,
  `longe_od_adicao` varchar(45) DEFAULT NULL,
  `longe_od_dnp` varchar(45) DEFAULT NULL,
  `longe_od_altura` varchar(45) DEFAULT NULL,
  `longe_oe_esferico` varchar(45) DEFAULT NULL,
  `longe_oe_cilindrico` varchar(45) DEFAULT NULL,
  `longe_oe_eixo` varchar(45) DEFAULT NULL,
  `longe_oe_adicao` varchar(45) DEFAULT NULL,
  `longe_oe_dnp` varchar(45) DEFAULT NULL,
  `longe_oe_altura` varchar(45) DEFAULT NULL,
  `perto_od_esferico` varchar(45) DEFAULT NULL,
  `perto_od_cilindrico` varchar(45) DEFAULT NULL,
  `perto_od_eixo` varchar(45) DEFAULT NULL,
  `perto_od_adicao` varchar(45) DEFAULT NULL,
  `perto_od_dnp` varchar(45) DEFAULT NULL,
  `perto_od_altura` varchar(45) DEFAULT NULL,
  `perto_oe_esferico` varchar(45) DEFAULT NULL,
  `perto_oe_cilindrico` varchar(45) DEFAULT NULL,
  `perto_oe_eixo` varchar(45) DEFAULT NULL,
  `perto_oe_adicao` varchar(45) DEFAULT NULL,
  `perto_oe_dnp` varchar(45) DEFAULT NULL,
  `perto_oe_altura` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5183 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_pagamento"
#

CREATE TABLE `base_web_control`.`venda_pagamento` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_forma_pgto` int(11) NOT NULL,
  `valor_pgto` decimal(12,2) NOT NULL,
  `cmc7` varchar(30) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `doc_cheque` varchar(20) DEFAULT NULL,
  `codigo_consulta` int(11) DEFAULT NULL,
  `qtd_parcela` int(2) DEFAULT '0',
  `cod_aut_cartao` varchar(50) DEFAULT NULL,
  `id_credenciadora` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cnpj_credenciadora` varchar(20) DEFAULT NULL,
  `vlr_troco` decimal(15,2) NOT NULL DEFAULT '0.00',
  `data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vpgto_01` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=25036296024736 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_pagamento_cheque"
#

CREATE TABLE `base_web_control`.`venda_pagamento_cheque` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmc7_1` char(8) DEFAULT NULL,
  `cmc7_2` char(10) DEFAULT NULL,
  `cmc7_3` varchar(12) DEFAULT NULL,
  `id_Venda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_id_venda` (`id_Venda`)
) ENGINE=InnoDB AUTO_INCREMENT=3851 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_pagamento_ecommerce"
#

CREATE TABLE `base_web_control`.`venda_pagamento_ecommerce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `cielo_order` text,
  `criacao` date DEFAULT NULL,
  `customer_name` text,
  `customer_phone` text,
  `customer_identity` text,
  `customer_email` text,
  `address_zipcode` text,
  `address_district` text,
  `address_city` text,
  `address_state` text,
  `address_line` text,
  `address_number` text,
  `method_type` int(11) DEFAULT NULL,
  `method_brand` int(11) DEFAULT NULL,
  `maskedcreditcard` text,
  `installments` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0 - Criada | 1 - Pendente | 2 - Pago | 3 - Negado | 4 - Expirado | 5 - Cancelado | 6 - Não finalizado | 7 - Autorizado | 8 - ChargeBack',
  `tid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_parcelas"
#

CREATE TABLE `base_web_control`.`venda_parcelas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Structure for table "venda_pgto_temp"
#

CREATE TABLE `base_web_control`.`venda_pgto_temp` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_forma_pgto` int(11) NOT NULL,
  `valor_pgto` decimal(12,2) NOT NULL,
  `cmc7` varchar(30) DEFAULT NULL,
  `vencimento` date DEFAULT NULL,
  `doc_cheque` varchar(20) DEFAULT NULL,
  `codigo_consulta` int(11) DEFAULT NULL,
  `qtd_parcela` int(2) DEFAULT '0',
  `cod_aut_cartao` varchar(50) DEFAULT NULL,
  `id_credenciadora` int(11) DEFAULT NULL,
  `vlr_troco` decimal(15,2) DEFAULT NULL,
  `data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_vpgto_01` (`id_venda`)
) ENGINE=InnoDB AUTO_INCREMENT=22103972 DEFAULT CHARSET=latin1;

#
# Structure for table "vendas_funcionario"
#

CREATE TABLE `base_web_control`.`vendas_funcionario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_funcionario` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `valor` decimal(15,2) NOT NULL,
  `data` date NOT NULL,
  `pago` enum('S','N') DEFAULT 'N',
  `data_pagamento` datetime DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_id_off` (`id_off`)
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=latin1;

#
# Structure for table "view_venda_parcelas"
#

CREATE TABLE `base_web_control`.`view_venda_parcelas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

#
# Structure for table "vp_historico"
#

CREATE TABLE `base_web_control`.`vp_historico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vale_presente_new` int(11) DEFAULT NULL,
  `id_cadastro` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `valor_atual` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "wc_menu"
#

CREATE TABLE `base_web_control`.`wc_menu` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "wc_permissao_menu"
#

CREATE TABLE `base_web_control`.`wc_permissao_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_usuario` bigint(20) NOT NULL,
  `id_submenu` int(11) NOT NULL,
  `permissao` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_permissao01` (`id_usuario`,`id_submenu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "wc_submenu"
#

CREATE TABLE `base_web_control`.`wc_submenu` (
  `id` bigint(21) NOT NULL AUTO_INCREMENT,
  `id_menu` bigint(21) DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "webc_configuracoes_sistema"
#

CREATE TABLE `base_web_control`.`webc_configuracoes_sistema` (
  `id_config` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned NOT NULL DEFAULT '0',
  `caminho_logomarca` varchar(100) DEFAULT '0',
  `cor_sistema` varchar(10) DEFAULT '0',
  `email_fc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=78239 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_configuracoes_sistema_tmp"
#

CREATE TABLE `base_web_control`.`webc_configuracoes_sistema_tmp` (
  `id_config` int(10) unsigned NOT NULL,
  `id_cadastro` int(10) unsigned NOT NULL,
  `caminho_logomarca` varchar(100) DEFAULT NULL,
  `cor_sistema` varchar(10) DEFAULT NULL,
  `email_fc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "webc_grupo_usuarios"
#

CREATE TABLE `base_web_control`.`webc_grupo_usuarios` (
  `id_grupo_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `id_tipo_permissao_usuario` int(11) NOT NULL DEFAULT '1',
  `nome` varchar(50) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_cadastro` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo_usuarios`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_tipo_permissao_usuario` (`id_tipo_permissao_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_grupo_usuarios_cadastro"
#

CREATE TABLE `base_web_control`.`webc_grupo_usuarios_cadastro` (
  `id_grupo_usuarios_cadastro` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo_usuarios` int(11) NOT NULL DEFAULT '0',
  `id_usuario` int(11) NOT NULL DEFAULT '0',
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_cadastro` int(11) NOT NULL,
  PRIMARY KEY (`id_grupo_usuarios_cadastro`),
  KEY `id_grupo_usuarios` (`id_grupo_usuarios`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_modulo"
#

CREATE TABLE `base_web_control`.`webc_modulo` (
  `id_modulo` int(21) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_modulo`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_permissao"
#

CREATE TABLE `base_web_control`.`webc_permissao` (
  `id_permissao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL DEFAULT '',
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `id_usuario_cadastro` int(11) NOT NULL,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_permissao`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_usuario_cadastro` (`id_usuario_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_permissao_grupo_usuarios"
#

CREATE TABLE `base_web_control`.`webc_permissao_grupo_usuarios` (
  `permissao_grupo_usuarios` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo_usuarios` int(11) NOT NULL,
  `id_permissao` int(11) NOT NULL,
  `id_usuario_cadastro` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`permissao_grupo_usuarios`),
  KEY `id_grupo_usuarios` (`id_permissao`),
  KEY `id_usuario_cadastro` (`id_usuario_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_permissao_modulo"
#

CREATE TABLE `base_web_control`.`webc_permissao_modulo` (
  `id_permissao_modulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_permissao` int(10) unsigned NOT NULL,
  `id_modulo` int(10) unsigned DEFAULT NULL,
  `id_sub_modulo` int(11) unsigned DEFAULT NULL,
  `id_cadastro` int(10) unsigned DEFAULT NULL,
  `id_usuario` int(10) unsigned DEFAULT NULL,
  `id_situacao` int(10) unsigned NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_permissao_modulo`),
  KEY `id_menu` (`id_modulo`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_sub_menu` (`id_sub_modulo`),
  KEY `id_permissao` (`id_permissao`),
  KEY `id_usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_permissao_usuario"
#

CREATE TABLE `base_web_control`.`webc_permissao_usuario` (
  `id_permissao_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_permissao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `id_usuario_cadastro` int(11) NOT NULL,
  PRIMARY KEY (`id_permissao_usuario`),
  KEY `id_permissao` (`id_permissao`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_situacao` (`id_situacao`),
  KEY `id_usuario_cadastro` (`id_usuario_cadastro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "webc_posto_bomba"
#

CREATE TABLE `base_web_control`.`webc_posto_bomba` (
  `id_bomba` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_cadastro` int(11) NOT NULL,
  PRIMARY KEY (`id_bomba`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_posto_bomba_bico"
#

CREATE TABLE `base_web_control`.`webc_posto_bomba_bico` (
  `id_bomba_bico` int(11) NOT NULL AUTO_INCREMENT,
  `id_tanque` int(11) DEFAULT NULL,
  `id_bomba` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `encerrante` decimal(15,3) DEFAULT NULL,
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_bomba_bico`),
  KEY `id_bomba` (`id_bomba`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_posto_tanque"
#

CREATE TABLE `base_web_control`.`webc_posto_tanque` (
  `id_tanque` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `conteudo` varchar(60) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cod_ANP` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_tanque`),
  KEY `id_cadastro` (`id_cadastro`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_situacao"
#

CREATE TABLE `base_web_control`.`webc_situacao` (
  `id_situacao` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_sub_modulo"
#

CREATE TABLE `base_web_control`.`webc_sub_modulo` (
  `id_sub_modulo` int(21) NOT NULL AUTO_INCREMENT,
  `id_modulo` int(21) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_sub_modulo`),
  KEY `id_menu` (`id_modulo`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_tipo_permissao_usuario"
#

CREATE TABLE `base_web_control`.`webc_tipo_permissao_usuario` (
  `id_tipo_permissao_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  `id_situacao` int(11) DEFAULT '1',
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_permissao_usuario`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_tipo_venda"
#

CREATE TABLE `base_web_control`.`webc_tipo_venda` (
  `id_tipo_venda` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_situacao` int(11) NOT NULL DEFAULT '1',
  `dt_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_venda`),
  KEY `id_situacao` (`id_situacao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_usuario"
#

CREATE TABLE `base_web_control`.`webc_usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `nome_usuario` varchar(40) DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ativo` enum('A','I','E') DEFAULT 'A',
  `id_funcionario` int(11) DEFAULT NULL,
  `login_master` enum('S','N','V') DEFAULT 'N',
  `email` varchar(50) DEFAULT NULL,
  `data_desabilita` date DEFAULT NULL,
  `percentual_desconto_autorizado` decimal(10,2) DEFAULT NULL,
  `percentual_desconto_item` decimal(10,2) DEFAULT NULL,
  `cnpj_cpf` varchar(14) DEFAULT NULL,
  `id_tipo_permissao_usuario` int(11) DEFAULT '1',
  `array_permissao` text,
  `agenda` tinyint(4) DEFAULT '1',
  `horario_inicio` time DEFAULT '00:00:00',
  `horario_fim` time DEFAULT '23:59:59',
  `data_alteracao` datetime DEFAULT NULL,
  `data_sincronismo` datetime DEFAULT NULL,
  `id_off` int(11) DEFAULT NULL,
  `dias_semana` varchar(13) DEFAULT NULL,
  `api_key` blob,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fk_senha` (`login`,`senha`),
  KEY `id_funcionario` (`id_funcionario`),
  KEY `fk_id_cadastro` (`id_cadastro`),
  KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=118259 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_vfx_syncloja"
#

CREATE TABLE `base_web_control`.`webc_vfx_syncloja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_final` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `situacao` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=991 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_visualizacao_imediata"
#

CREATE TABLE `base_web_control`.`webc_visualizacao_imediata` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `tela` varchar(15) DEFAULT NULL,
  `campo` varchar(250) DEFAULT NULL,
  `nomenclatura` varchar(30) DEFAULT NULL,
  `mascara` varchar(50) DEFAULT NULL,
  `ordem` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;

#
# Structure for table "webc_visualizacao_imediata_dados"
#

CREATE TABLE `base_web_control`.`webc_visualizacao_imediata_dados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(10) unsigned NOT NULL,
  `campos` text,
  PRIMARY KEY (`id`),
  KEY `id_cadastro` (`id_cadastro`)
) ENGINE=InnoDB AUTO_INCREMENT=5894 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_campanha"
#

CREATE TABLE `base_web_control`.`whatsapp_campanha` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_lista` int(11) unsigned NOT NULL,
  `listas` text,
  `nome_campanha` varchar(200) DEFAULT NULL,
  `texto` varchar(1000) DEFAULT NULL,
  `data_envio` date DEFAULT NULL,
  `hora_envio` time DEFAULT NULL,
  `status_campanha` char(1) DEFAULT 'A',
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `imagem` varchar(100) DEFAULT NULL,
  `titulo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2019 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_campanha_agendamento"
#

CREATE TABLE `base_web_control`.`whatsapp_campanha_agendamento` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_whatsapp_campanha` int(11) unsigned DEFAULT NULL,
  `data_inicio` datetime DEFAULT NULL,
  `data_fim` datetime DEFAULT NULL,
  `hora_agendamento` time DEFAULT NULL,
  `status_agendamento` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_campanha_fixa"
#

CREATE TABLE `base_web_control`.`whatsapp_campanha_fixa` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome_campanha` varchar(200) NOT NULL,
  `texto` varchar(1000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_campanha_fixa_ignorar"
#

CREATE TABLE `base_web_control`.`whatsapp_campanha_fixa_ignorar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_whatsapp_campanha_fixa` int(11) unsigned NOT NULL,
  `data_exclusao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_lista"
#

CREATE TABLE `base_web_control`.`whatsapp_lista` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `nome_lista` varchar(200) DEFAULT NULL,
  `numeros_lista` text,
  `tipo_lista` char(5) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT NULL,
  `fixa` enum('S','N') DEFAULT 'N',
  `status` enum('A','I') DEFAULT 'A',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25008 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_lista_telefones"
#

CREATE TABLE `base_web_control`.`whatsapp_lista_telefones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_lista` int(11) unsigned NOT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=440495 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_log"
#

CREATE TABLE `base_web_control`.`whatsapp_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `id_campanha` int(11) unsigned NOT NULL,
  `id_transmissao` bigint(20) unsigned DEFAULT NULL,
  `status_transmissao` int(1) unsigned DEFAULT NULL,
  `total_msg_enviadas` int(11) unsigned DEFAULT NULL,
  `msg_transmissao` varchar(50) DEFAULT NULL,
  `action` char(1) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1714 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_master"
#

CREATE TABLE `base_web_control`.`whatsapp_master` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `allcance_lgn` varchar(50) DEFAULT NULL,
  `allcance_pwd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_transacao"
#

CREATE TABLE `base_web_control`.`whatsapp_transacao` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) unsigned NOT NULL,
  `id_usuario` int(11) unsigned NOT NULL,
  `id_campanha` int(11) unsigned NOT NULL,
  `id_transmissao` bigint(20) DEFAULT NULL,
  `id_mensagem` bigint(20) unsigned DEFAULT NULL,
  `status_transmissao` int(1) DEFAULT NULL COMMENT '1-unverified, 2-waiting, 3-sending, 4-sent, 5-delivered, 6-invalid number, 7-inactive whatsapp, 8-read, 9-closed',
  `msg_transmissao` varchar(1000) DEFAULT NULL,
  `telefone` bigint(14) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_mensagem` (`id_mensagem`)
) ENGINE=InnoDB AUTO_INCREMENT=39174 DEFAULT CHARSET=latin1;

#
# Structure for table "whatsapp_user"
#

CREATE TABLE `base_web_control`.`whatsapp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_cadastro` int(11) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  `nome_user` varchar(50) DEFAULT NULL,
  `celular_user` varchar(50) DEFAULT NULL,
  `email_user` varchar(50) DEFAULT NULL,
  `dt_creation` timestamp NULL DEFAULT NULL,
  `dt_last_update` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Function "fn_check_grade"
#

CREATE FUNCTION `base_web_control`.`fn_check_grade`(
	id_produto_grade INT, 
	codigo_barra_pai CHAR(22), 
	codigo_barra_filho CHAR(22)) RETURNS int(11)
    NO SQL
BEGIN
	DECLARE have_grade INT DEFAULT 0;
	DECLARE retorno INT DEFAULT 1;
	
	SET have_grade = (SELECT 
				IF(COUNT(*) > 1,1,0)
			FROM base_web_control.grade 
			WHERE id_produto = id_produto_grade 
			AND ativo = '1');
	
	IF have_grade = 1 THEN
	
		IF codigo_barra_pai = codigo_barra_filho THEN
			
			SET retorno = 0;
		
		END IF;
		
	END IF;
	
	
	RETURN retorno;
	
	
	
END;

#
# Function "fn_codbarra_in_venda"
#

CREATE FUNCTION `base_web_control`.`fn_codbarra_in_venda`(`id_venda` INT, `cod_barra` VARCHAR(20)) RETURNS int(11)
    NO SQL
BEGIN
	DECLARE retorno INT;	
	SET retorno = (
			SELECT COUNT(`base_web_control`.a.id_venda)          
         FROM base_web_control.venda_itens a       		
       	WHERE `base_web_control`.a.id_venda = id_venda AND `base_web_control`.a.codigo_barra = cod_barra
		);
		
	IF retorno > 0 THEN
		SET retorno = 1;	
	END IF;
	
	RETURN retorno;
END;

#
# Function "fn_get_cobranca_titulo"
#

CREATE FUNCTION `base_web_control`.`fn_get_cobranca_titulo`( v_dia  VARCHAR(25), v_hora varchar(10) ) RETURNS varchar(25) CHARSET latin1
    NO SQL
BEGIN
	
	DECLARE v_data VARCHAR(25);
	DECLARE nome_dia VARCHAR(25) DEFAULT '';
	
	SET @@lc_time_names = 'pt_BR';
	SET v_data = NOW() - INTERVAL 1 DAY;
	SET nome_dia = DAYNAME(NOW() - INTERVAL 1 DAY);
	WHILE nome_dia != v_dia DO
	
	
		SET v_data = v_data - INTERVAL 1 DAY;
		SET nome_dia = DAYNAME(v_data);	
	
	END WHILE;
	
	
	RETURN CONCAT(DATE(v_data), ' ',v_hora);
	
	
END;

#
# Function "fn_get_descricao_grade"
#

CREATE FUNCTION `base_web_control`.`fn_get_descricao_grade`(v_id_grade_atributo_valor VARCHAR(200)) RETURNS varchar(255) CHARSET latin1
    NO SQL
BEGIN
	
	  IF v_id_grade_atributo_valor IS NULL THEN
	  
		RETURN ' ';
	  
	  ELSE
		RETURN IFNULL(CONCAT(' ',(
		   SELECT
			GROUP_CONCAT(`base_web_control`.p.atributo, '-', `base_web_control`.vpg.valor ORDER BY `base_web_control`.p.atributo ASC)
		   FROM base_web_control.grade_atributo_valor vpg
		   INNER JOIN base_web_control.grade_atributo p
			 ON `base_web_control`.p.id_grade_atributo = `base_web_control`.vpg.id_atributo
		   WHERE FIND_IN_SET(`base_web_control`.vpg.id_grade_atributo_valor,v_id_grade_atributo_valor)
		   ORDER BY `base_web_control`.p.atributo ASC
		  )),'');
	END IF;
                           
END;

#
# Function "fn_get_descricao_itens_devolvidos"
#

CREATE FUNCTION `base_web_control`.`fn_get_descricao_itens_devolvidos`(id_venda_devolucao INT) RETURNS text CHARSET latin1
    NO SQL
BEGIN
	RETURN (SELECT
			GROUP_CONCAT(CONVERT(IF(`base_web_control`.aux.vlr_quebrado = 'N', FORMAT(`base_web_control`.aux.qtd,0), `base_web_control`.aux.qtd) USING 'utf8'), ' | ', `base_web_control`.aux.sigla,' - ', nome_produto SEPARATOR '<br>') AS itensDevolvidos
			FROM(
			SELECT
				SUM(`base_web_control`.vid.qtd) AS qtd,
				`base_web_control`.vid.nome_produto,
				`base_web_control`.u.vlr_quebrado,
				`base_web_control`.u.sigla
			FROM `base_web_control`.venda_itens_devolucao vid
			INNER JOIN `base_web_control`.grade g
			ON `base_web_control`.g.id_grade = `base_web_control`.vid.id_grade
			INNER JOIN `base_web_control`.produto p
			ON `base_web_control`.p.id = `base_web_control`.g.id_produto
			INNER JOIN `base_web_control`.unidade u
			ON `base_web_control`.u.id = `base_web_control`.p.id_unidade
			WHERE FIND_IN_SET(id_venda_devol,
			(
			SELECT
				GROUP_CONCAT(id SEPARATOR ',')
			FROM `base_web_control`.venda_devolucao vd
			WHERE id_venda = id_venda_devolucao
			AND finalizada = 'S'
			GROUP BY id_venda))
			GROUP BY id_venda, `base_web_control`.vid.codigo_barra) AS aux);
END;

#
# Function "fn_get_descricao_itens_devolvidos_teste"
#

CREATE FUNCTION `base_web_control`.`fn_get_descricao_itens_devolvidos_teste`(id_venda_devolucao INT) RETURNS text CHARSET latin1
    NO SQL
BEGIN
	RETURN (SELECT
			GROUP_CONCAT(convert(IF(`base_web_control`.aux.vlr_quebrado = 'N', format(`base_web_control`.aux.qtd,0), `base_web_control`.aux.qtd) USING 'utf8'), ' - ', nome_produto SEPARATOR '<br>') AS itensDevolvidos
			FROM(
			SELECT
				SUM(`base_web_control`.vid.qtd) AS qtd,
				`base_web_control`.vid.nome_produto,
				`base_web_control`.u.vlr_quebrado
			FROM `base_web_control`.venda_itens_devolucao vid
			INNER JOIN `base_web_control`.grade g
			ON `base_web_control`.g.id_grade = `base_web_control`.vid.id_grade
			INNER JOIN `base_web_control`.produto p
			ON `base_web_control`.p.id = `base_web_control`.g.id_produto
			INNER JOIN `base_web_control`.unidade u
			ON `base_web_control`.u.id = `base_web_control`.p.id_unidade
			WHERE FIND_IN_SET(id_venda_devol,
			(
			SELECT
				GROUP_CONCAT(id SEPARATOR ',')
			FROM `base_web_control`.venda_devolucao vd
			WHERE id_venda = id_venda_devolucao
			AND finalizada = 'S'
			GROUP BY id_venda))
			GROUP BY id_venda, `base_web_control`.vid.codigo_barra) AS aux);
END;

#
# Function "fn_get_dv_codigo_barra"
#

CREATE FUNCTION `base_web_control`.`fn_get_dv_codigo_barra`(`codigo_barra` VARCHAR(12)) RETURNS int(11)
    NO SQL
BEGIN
	DECLARE dig1 INT;
	DECLARE dig2 INT;
	DECLARE dig3 INT;
	DECLARE dig4 INT;
	DECLARE dig5 INT;
	DECLARE dig6 INT;
	DECLARE dig7 INT;
	DECLARE dig8 INT;
	DECLARE dig9 INT;
	DECLARE dig10 INT;
	DECLARE dig11 INT;
	DECLARE dig12 INT;
	DECLARE soma1 INT;
	DECLARE soma2 INT;
	DECLARE somaTotal INT;
	DECLARE dv INT;
	DECLARE cont INT DEFAULT 0;
	DECLARE contFinal INT DEFAULT 9;
	DECLARE multiplo INT;
	
	SET dig1 = SUBSTR(codigo_barra,1,1);
	SET dig2 = SUBSTR(codigo_barra,2,1);
	SET dig3 = SUBSTR(codigo_barra,3,1);
	SET dig4 = SUBSTR(codigo_barra,4,1);
	SET dig5 = SUBSTR(codigo_barra,5,1);
	SET dig6 = SUBSTR(codigo_barra,6,1);
	SET dig7 = SUBSTR(codigo_barra,7,1);
	SET dig8 = SUBSTR(codigo_barra,8,1);
	SET dig9 = SUBSTR(codigo_barra,9,1);
	SET dig10 = SUBSTR(codigo_barra,10,1);
	SET dig11 = SUBSTR(codigo_barra,11,1);
	
	
	IF LENGTH(codigo_barra) = 11 THEN
	
		SET soma1 = (dig1 + dig3 + dig5 + dig7 + dig9 + dig11) * 3;
		
		SET soma2 = dig2 + dig4 + dig6 + dig8 + dig10;
		
		SET somaTotal = soma1 + soma2;
		
		WHILE cont <= contFinal DO
		
			SET multiplo = somaTotal + cont;
		
			IF MOD(multiplo,10) = 0 THEN
			
				SET dv = cont;
				SET cont = 10;
			END IF;
			
			SET cont = cont +1;
		
		END WHILE;
		
	ELSEIF LENGTH(codigo_barra) = 7 THEN
	
		SET soma1 = (dig1 + dig3 + dig5 + dig7) * 3;
		
		SET soma2 = dig2 + dig4 + dig6;
		
		SET somaTotal = soma1 + soma2;
				
		IF (10 - MOD(somaTotal,10)) = 10 THEN
		
			SET dv = 0;
			
		ELSE
		
			SET dv = (10 - MOD(somaTotal,10));
			
		END IF;
	
	ELSE
		
			
		SET dig12 = SUBSTR(codigo_barra,12,1);
				
		SET soma1 = (dig1 + dig3 + dig5 + dig7 + dig9 + dig11);
		
		SET soma2 = (dig2 + dig4 + dig6 + dig8 + dig10 + dig12)*3;
		
		SET somaTotal = soma1 + soma2;
		
		SET multiplo = (CEIL((somaTotal/10)))*10;
		
		SET dv = multiplo - somaTotal;
	
	END IF;	
	
	RETURN dv;
END;

#
# Function "fn_get_fator"
#

CREATE FUNCTION `base_web_control`.`fn_get_fator`(id_venda_fator INT) RETURNS varchar(20) CHARSET latin1
    NO SQL
BEGIN
	DECLARE fator VARCHAR(20);
	
	SET fator = (SELECT 
                   FORMAT( 
                           (IF(`base_web_control`.b.valor_final_desconto IS NULL, 0, `base_web_control`.b.valor_final_desconto)
                             + 
                             TRUNCATE( SUM( (preco_tabela * qtd) - (preco_venda * qtd) ), 2 )) 
                            / 
                            SUM( preco_tabela * qtd )
                   ,15 ) AS fator
                     FROM base_web_control.venda_itens a
                INNER JOIN base_web_control.venda b ON `base_web_control`.a.id_venda = `base_web_control`.b.id
                WHERE id_venda = id_venda_fator);
	RETURN fator;
END;

#
# Function "fn_get_mes_inicio_filtro"
#

CREATE FUNCTION `base_web_control`.`fn_get_mes_inicio_filtro`() RETURNS varchar(25) CHARSET latin1
    NO SQL
BEGIN
	DECLARE data_retorno VARCHAR(25);
	declare v_ano int;
	declare v_mes int;
	
	set v_mes = month(now());
	set v_ano = year(now());
	if v_mes = 1 then
		set v_ano = year(now()) - 1;
	end if;
	
	
	iF DAY(NOW()) >= 26 THEN
	
		RETURN CONCAT(year(now()), '-',LPAD(MONTH(NOW()) ,2,0),'-25', ' 23:00:00');
	END IF;
	
	IF DAY(NOW()) < 26 THEN
	
		RETURN concat(v_ano, '-',LPAD(MONTH(NOW() - INTERVAL 1 MONTH),2,0),'-26', ' 00:00:00');
	END IF;
END;

#
# Function "fn_get_mes_inicio_filtro_anterior"
#

CREATE FUNCTION `base_web_control`.`fn_get_mes_inicio_filtro_anterior`() RETURNS varchar(25) CHARSET latin1
    NO SQL
BEGIN
	DECLARE data_retorno VARCHAR(25);
	declare v_ano int;
	declare v_mes int;
	
	set v_mes = month(now());
	set v_ano = year(now());
	if v_mes = 1 then
		set v_ano = year(now()) - 1;
	end if;
	
	
	iF DAY(NOW()) >= 26 THEN
	
		RETURN CONCAT(year(now()), '-',LPAD(MONTH(NOW()) ,2,0),'-26', ' 00:00:01');
	END IF;
	
	IF DAY(NOW()) < 26 THEN
	
		RETURN concat(v_ano, '-',LPAD(MONTH(NOW() - INTERVAL 1 MONTH),2,0),'-25', ' 23:59:59');
	END IF;
END;

#
# Function "fn_get_nome_brasil"
#

CREATE FUNCTION `base_web_control`.`fn_get_nome_brasil`(cnpj VARCHAR(50)) RETURNS varchar(255) CHARSET latin1
    NO SQL
BEGIN
	RETURN ( SELECT Nom_Nome FROM base_inform.Nome_Brasil WHERE Nom_CPF = cnpj AND Nom_Tp = IF(LENGTH(cnpj) > 11,1,0) ORDER BY id DESC LIMIT 1);
END;

#
# Function "fn_get_num_caixa"
#

CREATE FUNCTION `base_web_control`.`fn_get_num_caixa`(data_venda VARCHAR(30),
											id_usuario INT,
											id_cadastro INT) RETURNS int(11)
    NO SQL
BEGIN
	DECLARE var_retorno INT;
	
	SET var_retorno = (SELECT 
								`base_web_control`.vic.num_caixa 
							FROM base_web_control.valor_inicial_caixa vic 
							WHERE data_venda
							BETWEEN `base_web_control`.vic.data_hora_inicial AND IFNULL(`base_web_control`.vic.data_hora_final,NOW()) 
							AND `base_web_control`.vic.id_usuario = id_usuario 
							AND `base_web_control`.vic.id_cadastro = id_cadastro LIMIT 1 );
	
	RETURN var_retorno;
END;

#
# Function "fn_get_qtd_produtos"
#

CREATE FUNCTION `base_web_control`.`fn_get_qtd_produtos`(v_id_venda INT) RETURNS decimal(10,3)
    NO SQL
BEGIN
	DECLARE qtd_produto DECIMAL(10,3);
	DECLARE qtd_produto_excluido DECIMAL(10,3);
	
	
	SET qtd_produto = (
	
	SELECT
		`base_web_control`.v.qtd
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'A'
	WHERE `base_web_control`.p.prod_serv = 'P'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	SET qtd_produto_excluido = (
	
	SELECT
		`base_web_control`.v.qtd
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'E'
	WHERE `base_web_control`.p.prod_serv = 'P'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	IF qtd_produto IS NULL THEN
	
		RETURN qtd_produto_excluido;
	
	ELSE 
	
		RETURN qtd_produto;
	END IF;
	
	
END;

#
# Function "fn_get_qtd_servicos"
#

CREATE FUNCTION `base_web_control`.`fn_get_qtd_servicos`(v_id_venda INT) RETURNS decimal(10,3)
    NO SQL
BEGIN
	DECLARE qtd_servicos DECIMAL(10,3);
	DECLARE qtd_servicos_excluidos DECIMAL(10,3);
	
	SET qtd_servicos = 
	(
	
	SELECT
		`base_web_control`.v.qtd
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'A'
	WHERE `base_web_control`.p.prod_serv = 'S'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	SET qtd_servicos_excluidos = 
	(
	
	SELECT
		`base_web_control`.v.qtd
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'E'
	WHERE `base_web_control`.p.prod_serv = 'S'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	IF qtd_servicos IS NULL THEN
	
		RETURN qtd_servicos_excluidos;
	
	ELSE
		
		RETURN qtd_servicos;
	
	END IF;
END;

#
# Function "fn_get_ultima_data_dia_semana"
#

CREATE FUNCTION `base_web_control`.`fn_get_ultima_data_dia_semana`(v_dia VARCHAR(25)) RETURNS varchar(25) CHARSET latin1
    NO SQL
BEGIN
	
	DECLARE v_data VARCHAR(25);
	DECLARE nome_dia VARCHAR(25) DEFAULT '';
	
	IF DAYNAME(NOW()) = 'sexta' AND TIME(NOW()) > '18:01:00' THEN
		
		RETURN CONCAT(DATE(NOW()), ' 18:01:00');
	
	END IF;
	
	SET @@lc_time_names = 'pt_BR';
	SET v_data = NOW() - INTERVAL 1 DAY;
	SET nome_dia = DAYNAME(NOW() - INTERVAL 1 DAY);
	WHILE nome_dia != v_dia DO
	
	
		SET v_data = v_data - INTERVAL 1 DAY;
		SET nome_dia = DAYNAME(v_data);	
	
	END WHILE;
	
	
	RETURN CONCAT(DATE(v_data), ' 18:01:00');
	
	
END;

#
# Function "fn_get_ultima_ocorrencia"
#

CREATE FUNCTION `base_web_control`.`fn_get_ultima_ocorrencia`(
	v_id_cadastro int
) RETURNS varchar(30) CHARSET latin1
    NO SQL
begin
	return (SELECT
               DATE_FORMAT(MAX(DATA), '%d/%m/%Y')
            FROM cs2.ocorrencias
            WHERE codigo = v_id_cadastro);
end;

#
# Function "fn_get_ultima_sexta_feira"
#

CREATE FUNCTION `base_web_control`.`fn_get_ultima_sexta_feira`() RETURNS varchar(25) CHARSET latin1
    NO SQL
begin
	declare v_data varchar(25);
	declare nome_dia varchar(25) default '';
	
	set v_data = now() - interval 1 day;
	set nome_dia = dayname(NOW() - INTERVAL 1 DAY);
	while nome_dia != 'Friday' do
	
	
		set v_data = v_data - interval 1 day;
		SET nome_dia = DAYNAME(v_data);	
	
	end while;
	
	
	return v_data;
	
	
end;

#
# Function "fn_get_valor_comissao_prod"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_comissao_prod`(
	id_venda INT,
	tipo_comissao_p CHAR(1),
	comissao_p DECIMAL(5,2),
	valor_produtos DECIMAL(10,3),
	qtd_produtos DECIMAL(10,3),
	valor_final_desconto DECIMAL(10,3)
	 ) RETURNS decimal(10,3)
    NO SQL
BEGIN
	
	IF valor_final_desconto IS NULL OR valor_final_desconto = '' THEN
	
		
		IF tipo_comissao_p = 'R' THEN
		
			RETURN comissao_p * qtd_produtos;
		
		ELSE 
		
			RETURN (comissao_p / 100) * (valor_produtos);
		
		END IF;
	
	ELSE 
	
		
		IF tipo_comissao_p = 'R' THEN
		
			RETURN comissao_p * qtd_produtos;
		
		ELSE 
			RETURN (valor_produtos - (valor_produtos * base_web_control.fn_get_fator(id_venda))) * (comissao_p / 100);
		
		END IF;
	
	END IF;
END;

#
# Function "fn_get_valor_comissao_serv"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_comissao_serv`(
	id_venda INT,
	tipo_comissao_s CHAR(1),
	comissao_s DECIMAL(5,2),
	valor_servicos DECIMAL(10,3),
	qtd_servicos DECIMAL(10,3),
	valor_final_desconto DECIMAL(10,3)
	 ) RETURNS decimal(10,3)
    NO SQL
BEGIN
	
	IF valor_final_desconto IS NULL OR valor_final_desconto = '' THEN
	
		
		IF tipo_comissao_s = 'R' THEN
		
			RETURN comissao_s * qtd_servicos;
		
		ELSE 
		
			RETURN (comissao_s / 100) * (valor_servicos);
		
		END IF;
	
	ELSE 
	
		
		IF tipo_comissao_s = 'R' THEN
		
			RETURN comissao_s * qtd_servicos;
		
		ELSE 
			RETURN (valor_servicos - (valor_servicos * base_web_control.fn_get_fator(id_venda))) * (comissao_s / 100);
		
		END IF;
	
	END IF;
END;

#
# Function "fn_get_valor_corrigido_np"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_corrigido_np`(
	p_valor_parcela decimal(15,3),
	p_valor_atraso decimal(15,3),
	p_date_diff int) RETURNS decimal(15,2)
    NO SQL
begin
	declare fator decimal(30,15);
	declare valor_mora decimal(30,15);
	declare valor_multa decimal(30,15);
	
	
	
	set valor_multa = (p_valor_parcela * p_valor_atraso) / 100;
	set fator = (p_valor_atraso / 30) * p_date_diff;
	set valor_mora = (p_valor_parcela * fator) / 100;
	
	return replace(format(p_valor_parcela + valor_multa + valor_mora,2),',','');
end;

#
# Function "fn_get_valor_produtos"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_produtos`(v_id_venda INT) RETURNS decimal(10,3)
    NO SQL
BEGIN
	DECLARE valor_produto DECIMAL(13,3);
	DECLARE valor_produto_excluido DECIMAL(13,3);
	
	SET valor_produto =
	(
	
	SELECT
		`base_web_control`.v.qtd * `base_web_control`.v.preco_venda AS preco_venda
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'A'
	WHERE `base_web_control`.p.prod_serv = 'P'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	SET valor_produto_excluido = 
	(
	
	SELECT
		`base_web_control`.v.qtd * `base_web_control`.v.preco_venda AS preco_venda
	FROM `base_web_control`.venda_itens v
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'E'
	WHERE `base_web_control`.p.prod_serv = 'P'
	AND `base_web_control`.v.id = v_id_venda);
	
	
	IF valor_produto IS NULL THEN
	
		RETURN valor_produto_excluido;
	
	ELSE
	
		RETURN valor_produto;	
	
	END IF;
END;

#
# Function "fn_get_valor_servicos"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_servicos`(v_id_venda INT) RETURNS decimal(10,3)
    NO SQL
BEGIN
	
	DECLARE v_valor_prod DECIMAL(13,3);
	DECLARE v_valor_prod_excluido DECIMAL(13,3);
	
	SET v_valor_prod = (
	
				SELECT
					`base_web_control`.v.qtd * `base_web_control`.v.preco_venda AS preco_venda
				FROM `base_web_control`.venda_itens v
				INNER JOIN `base_web_control`.produto p
				ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'A'
				WHERE `base_web_control`.p.prod_serv = 'S'
				AND `base_web_control`.v.id = v_id_venda
				);
				
				
	SET v_valor_prod_excluido =  (
					SELECT
					`base_web_control`.v.qtd * `base_web_control`.v.preco_venda AS preco_venda
				FROM `base_web_control`.venda_itens v
				INNER JOIN `base_web_control`.produtop
				ON `base_web_control`.p.id = `base_web_control`.v.id_produto AND `base_web_control`.p.ativo = 'E'
				WHERE `base_web_control`.p.prod_serv = 'S'
				AND `base_web_control`.v.id= v_id_venda
				);
	
	IF v_valor_prod IS NULL THEN
		RETURN v_valor_prod_excluido;
	
	ELSE 
		RETURN v_valor_prod;
	
	END IF;
END;

#
# Function "fn_get_valor_total_desconto_prod"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_total_desconto_prod`(
	id_venda INT,
	qtd_produtos DECIMAL(10,3),
	valor_final_desconto DECIMAL(15,3),
	valor_produtos DECIMAL(15,3),
	preco_tabela DECIMAL(15,3)) RETURNS decimal(12,3)
    NO SQL
BEGIN
	IF valor_final_desconto IS NULL OR valor_final_desconto = '' THEN 
                        
                        
                RETURN (preco_tabela * qtd_produtos) - valor_produtos;
                        
	ELSE  
	
		RETURN (preco_tabela * qtd_produtos) - (valor_produtos - (valor_produtos * base_web_control.fn_get_fator(id_venda)));
	
	END IF;
                        
END;

#
# Function "fn_get_valor_total_desconto_serv"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_total_desconto_serv`(
	id_venda INT,
	qtd_servicos DECIMAL(10,3),
	valor_final_desconto DECIMAL(15,3),
	valor_servicos DECIMAL(15,3),
	preco_tabela DECIMAL(15,3)) RETURNS decimal(12,3)
    NO SQL
BEGIN
	IF valor_final_desconto IS NULL OR valor_final_desconto = '' THEN 
                        
                        
                RETURN (preco_tabela * qtd_servicos) - (valor_servicos);
                        
	ELSE  
	
		RETURN (preco_tabela * qtd_servicos) - (valor_servicos - (valor_servicos * base_web_control.fn_get_fator(id_venda)));
	
	END IF;
                        
END;

#
# Function "fn_get_valor_venda_em_aberto"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_venda_em_aberto`(
	p_id_venda INT
) RETURNS decimal(20,3)
    NO SQL
BEGIN
	RETURN (SELECT 
		SUM(`base_web_control`.vp.valor_pgto - `base_web_control`.vp.vlr_troco)
	FROM base_web_control.venda_pagamento vp
	WHERE `base_web_control`.vp.id_venda = p_id_venda
	AND DATE(vencimento) > DATE(NOW()));
END;

#
# Function "fn_get_valor_venda_quitada"
#

CREATE FUNCTION `base_web_control`.`fn_get_valor_venda_quitada`(
	p_id_venda int
) RETURNS decimal(20,3)
    NO SQL
begin
	return (select 
		sum(`base_web_control`.vp.valor_pgto - `base_web_control`.vp.vlr_troco)
	from base_web_control.venda_pagamento vp
	where `base_web_control`.vp.id_venda = p_id_venda
	and (vencimento = '' OR date(vencimento) <= date(now()) OR vencimento is null));
end;

#
# Function "fn_produto_in_venda"
#

CREATE FUNCTION `base_web_control`.`fn_produto_in_venda`(`id_venda` INT, `nomeprod` VARCHAR(100)) RETURNS int(11)
    NO SQL
BEGIN
	DECLARE retorno INT;	
	SET retorno = (
			SELECT COUNT(`base_web_control`.a.id_venda)          
         FROM base_web_control.venda_itens a       		
       	WHERE `base_web_control`.a.id_venda = id_venda AND `base_web_control`.a.nome_produto LIKE nomeprod
		);
		
	IF retorno > 0 THEN
		SET retorno = 1;	
	END IF;
	
	RETURN retorno;
END;

#
# Function "fn_remover_acentos"
#

CREATE FUNCTION `base_web_control`.`fn_remover_acentos`(palavra TEXT) RETURNS text CHARSET latin1
    NO SQL
BEGIN
	
	DECLARE out_palavra TEXT;
	
	SET out_palavra = REPLACE(palavra ,'Á','A');
	SET out_palavra = REPLACE(out_palavra ,'À','A'); 
	SET out_palavra = REPLACE(out_palavra ,'Ã','A');  
	SET out_palavra = REPLACE(out_palavra ,'Â','A'); 
	SET out_palavra = REPLACE(out_palavra ,'É','E');  
	SET out_palavra = REPLACE(out_palavra ,'È','E');  
	SET out_palavra = REPLACE(out_palavra ,'Ê','E'); 
	SET out_palavra = REPLACE(out_palavra ,'Í','I');  
	SET out_palavra = REPLACE(out_palavra ,'Ì','I');  
	SET out_palavra = REPLACE(out_palavra ,'Î','I');
	SET out_palavra = REPLACE(out_palavra ,'Ó','O');  
	SET out_palavra = REPLACE(out_palavra ,'Ò','O'); 
	SET out_palavra = REPLACE(out_palavra ,'Ô','O'); 
	SET out_palavra = REPLACE(out_palavra ,'Õ','O');
	SET out_palavra = REPLACE(out_palavra ,'Ú','U');
	SET out_palavra = REPLACE(out_palavra ,'Ù','U');
	SET out_palavra = REPLACE(out_palavra ,'Û','U'); 
	SET out_palavra = REPLACE(out_palavra ,'Ü','U');  
--	SET out_palavra = REPLACE(out_palavra ,'Ç','C');
	
	
	SET out_palavra = REPLACE(out_palavra ,'á','a');
	SET out_palavra = REPLACE(out_palavra ,'à','a'); 
	SET out_palavra = REPLACE(out_palavra ,'ã','a');  
	SET out_palavra = REPLACE(out_palavra ,'â','a'); 
	SET out_palavra = REPLACE(out_palavra ,'é','e');  
	SET out_palavra = REPLACE(out_palavra ,'è','e');  
	SET out_palavra = REPLACE(out_palavra ,'ê','e'); 
	SET out_palavra = REPLACE(out_palavra ,'í','i');  
	SET out_palavra = REPLACE(out_palavra ,'ì','i');  
	SET out_palavra = REPLACE(out_palavra ,'î','i');
	SET out_palavra = REPLACE(out_palavra ,'ó','o');  
	SET out_palavra = REPLACE(out_palavra ,'ò','o'); 
	SET out_palavra = REPLACE(out_palavra ,'ô','o'); 
	SET out_palavra = REPLACE(out_palavra ,'õ','o');
	SET out_palavra = REPLACE(out_palavra ,'ú','u');
	SET out_palavra = REPLACE(out_palavra ,'ù','u');
	SET out_palavra = REPLACE(out_palavra ,'û','u'); 
	SET out_palavra = REPLACE(out_palavra ,'ü','u');  
--	SET out_palavra = REPLACE(out_palavra ,'ç','c');
	
	SET out_palavra = REPLACE(out_palavra ,'"','');
	SET out_palavra = REPLACE(out_palavra ,"'",'');
	SET out_palavra = REPLACE(out_palavra ,'“','');
	SET out_palavra = REPLACE(out_palavra ,'”','');
	SET out_palavra = REPLACE(out_palavra ,'*','');	
	SET out_palavra = REPLACE(out_palavra ,'&','');	
	SET out_palavra = REPLACE(out_palavra ,';','');
	SET out_palavra = REPLACE(out_palavra ,'`','');
	SET out_palavra = REPLACE(out_palavra ,'´','');
	SET out_palavra = REPLACE(out_palavra ,'§','');	
	SET out_palavra = REPLACE(out_palavra ,'/','|');
	SET out_palavra = REPLACE(out_palavra ,'%',' ');
	SET out_palavra = REPLACE(out_palavra ,'ª','a');
	SET out_palavra = REPLACE(out_palavra ,'º','o');
	SET out_palavra = REPLACE(out_palavra ,'?','');
	SET out_palavra = REPLACE(out_palavra ,'!','');



	
	
	RETURN out_palavra;
END;

#
# Function "fn_retira_caracteres_sincronismo"
#

CREATE FUNCTION `base_web_control`.`fn_retira_caracteres_sincronismo`(
	p_campo text
) RETURNS text CHARSET latin1
    NO SQL
begin
	RETURN replace(replace(replace(p_campo,"\r",""),"\n",""),";","");
end;

#
# Function "fn_split"
#

CREATE FUNCTION `base_web_control`.`fn_split`(str VARCHAR(255), delim VARCHAR(12), pos INT) RETURNS varchar(255) CHARSET latin1
    NO SQL
RETURN REPLACE(SUBSTRING(SUBSTRING_INDEX(str, delim, pos),
       LENGTH(SUBSTRING_INDEX(str, delim, pos-1)) + 1),
       delim, '');

#
# Function "retorna_numero"
#

CREATE FUNCTION `base_web_control`.`retorna_numero`(valor VARCHAR(100)) RETURNS varchar(11) CHARSET latin1
    NO SQL
BEGIN
    DECLARE tamanho_str INTEGER;
    DECLARE i INTEGER;
    DECLARE saida VARCHAR(11);
    SET tamanho_str  = (SELECT LENGTH(valor));
    SET i   = 1;
    SET saida = "";
    WHILE i <= tamanho_str DO            
        IF ((SUBSTRING(valor, i,1) REGEXP '[0-9]') <> 0) THEN
            SET saida = CONCAT(saida, CONVERT(SUBSTRING(valor, i,1) USING UTF8));           
        END IF;
        SET i = i  + 1;
    END WHILE;
    RETURN saida;
END;

#
# View "rel_vendas_realizadas_dashbaord"
#

CREATE ALGORITHM=UNDEFINED VIEW `rel_vendas_realizadas_dashbaord` AS SELECT
  `v`.`id_cadastro`,
  `v`.`data_venda`,
  COUNT(`v`.`id`) AS 'qtd_venda',
  SUM(IFNULL((SELECT SUM(`venda_itens`.`qtd`) FROM `venda_itens` WHERE (`venda_itens`.`id_venda` = `v`.`id`)),, 0)) AS 'qtd_itens',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM((IFNULL((SELECT SUM((`vi`.`preco_tabela` - `vi`.`preco_venda`)) FROM `venda_itens` vi WHERE (`vi`.`id_venda` = `v`.`id`)),, 0) + IFNULL(`v`.`valor_final_desconto`, 0))), 2), 2, 'de_DE')) AS 'total_desconto',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(IFNULL((SELECT SUM((`venda_itens`.`qtd` * (`venda_itens`.`preco_venda` - (`venda_itens`.`preco_tabela` - `venda_itens`.`preco_venda`)))) FROM `venda_itens` WHERE (`venda_itens`.`id_venda` = `v`.`id`)),, 0)), 2), 2, 'de_DE')) AS 'total_soma_itens',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM((IFNULL((SELECT SUM((`vi`.`qtd` * (`vi`.`preco_venda` - (`vi`.`preco_tabela` - `vi`.`preco_venda`)))) FROM `venda_itens` vi WHERE (`vi`.`id_venda` = `v`.`id`)),, 0) - IFNULL(`v`.`valor_final_desconto`, 0))), 2), 2, 'de_DE')) AS 'total_liquido',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(IFNULL((SELECT SUM((`vi`.`qtd` * (`vi`.`preco_venda` - (`vi`.`preco_tabela` - `vi`.`preco_venda`)))) FROM (`venda_itens` vi
      JOIN `produto` p ON ((`p`.`id` = `vi`.`id_produto`))) WHERE ((`vi`.`id_venda` = `v`.`id`) AND (`p`.`prod_serv` <> 'S'))),, 0)), 2), 2, 'de_DE')) AS 'total_soma_itens_produto',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(IFNULL((SELECT SUM((`vi`.`qtd` * (`vi`.`preco_venda` - (`vi`.`preco_tabela` - `vi`.`preco_venda`)))) FROM (`venda_itens` vi
      JOIN `produto` p ON ((`p`.`id` = `vi`.`id_produto`))) WHERE ((`vi`.`id_venda` = `v`.`id`) AND (`p`.`prod_serv` = 'S'))),, 0)), 2), 2, 'de_DE')) AS 'total_soma_itens_servico',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(IFNULL((SELECT SUM((`vi`.`qtd` * `vi`.`valor_preco_custo`)) FROM `venda_itens` vi WHERE (`vi`.`id_venda` = `v`.`id`)),, 0)), 2), 2, 'de_DE')) AS 'total_custo',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(((IFNULL((SELECT SUM((`venda_itens`.`qtd` * (`venda_itens`.`preco_venda` - (`venda_itens`.`preco_tabela` - `venda_itens`.`preco_venda`)))) FROM `venda_itens` WHERE (`venda_itens`.`id_venda` = `v`.`id`)),, 0) - IFNULL(`v`.`valor_final_desconto`, 0)) - IFNULL((SELECT SUM((`venda_itens`.`qtd` * `venda_itens`.`valor_preco_custo`)) FROM `venda_itens` WHERE (`venda_itens`.`id_venda` = `v`.`id`)),, 0))), 2), 2, 'de_DE')) AS 'total_lucro',
  CONCAT('R$ ', FORMAT(TRUNCATE(SUM(IFNULL((SELECT SUM(`venda_pagamento`.`valor_pgto`) FROM `venda_pagamento` WHERE ((`venda_pagamento`.`id_venda` = `v`.`id`) AND (`venda_pagamento`.`id_forma_pgto` = 37))),, 0)), 2), 2, 'de_DE')) AS 'nota_credito'
FROM
  `venda` v
WHERE
  (`v`.`situacao` = 'C');

#
# View "v_cliente_lista"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `base_web_control`.`v_cliente_lista`
  AS
SELECT
  `id`,
  `id_cadastro`,
  `tipo_pessoa`,
  `cnpj_cpf`,
  `nome`,
  `email`,
  `razao_social`,
  `cidade`,
  `uf`,
  `cep`,
  `fax`,
  `telefone`,
  `celular`,
  `ativo`,
  `empresa_trabalha`
FROM
  `base_web_control`.`cliente`
WHERE
  (`ativo` = 'A')
ORDER BY `id` DESC;

#
# View "v_contas_receber_listar"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `base_web_control`.`v_contas_receber_listar`
  AS
SELECT
  `base_web_control`.`cp`.`id`,
  `base_web_control`.`cp`.`situacao`,
  `base_web_control`.`cp`.`id_cadastro`,
  `base_web_control`.`wu`.`nome_usuario` AS 'nom_usuario_baixa',
  `base_web_control`.`cp`.`data_vencimento`,
  `base_web_control`.`cp`.`valor`,
  `base_web_control`.`cp`.`data_baixa`,
  `base_web_control`.`cp`.`valor_baixa`,
  `base_web_control`.`f`.`nome` AS 'vendedor',
  IF((`base_web_control`.`c`.`tipo_pessoa` = 'J'), `base_web_control`.`c`.`razao_social`, `base_web_control`.`c`.`nome`) AS 'nomeclientevenda',
  IF((`base_web_control`.`c`.`tipo_pessoa` = 'J'), `base_web_control`.`c`.`razao_social`, `base_web_control`.`c`.`nome`) AS 'nomeclientenota',
  `base_web_control`.`dcp`.`descricao` AS 'descricaodespesa',
  `base_web_control`.`fp`.`descricao` AS 'forma_pagamento',
  `base_web_control`.`cp`.`parcela`,
  `base_web_control`.`cp`.`id_cliente` AS 'idcliente',
  `base_web_control`.`cp`.`informacoes_adicionais`,
  `base_web_control`.`cp`.`id_venda` AS 'idvenda',
  'Estabelecimento' AS 'origempagamento',
  '' AS 'cpfcnpj_devedor',
  (SELECT CONCAT(`base_web_control`.`td`.`descricao`, ' (AVULSO)') FROM `base_web_control`.`contas_pagar_tpdoc` td WHERE (`base_web_control`.`td`.`id` = `base_web_control`.`cp`.`id_tipo_documento`) LIMIT 1) AS 'formapag',
  `base_web_control`.`cp`.`nome_devedor`,
  `base_web_control`.`cp`.`id_formapgto`,
  `base_web_control`.`cp`.`multa_atraso`
FROM
  ((((((`base_web_control`.`contas_pagar` cp
    LEFT JOIN `base_web_control`.`venda` v ON ((`base_web_control`.`cp`.`id_venda` = `base_web_control`.`v`.`id`)))
    LEFT JOIN `base_web_control`.`funcionario` f ON ((`base_web_control`.`f`.`id` = `base_web_control`.`v`.`id_usuario_fecha_venda`)))
    LEFT JOIN `base_web_control`.`cliente` c ON ((`base_web_control`.`v`.`id_cliente` = `base_web_control`.`c`.`id`)))
    LEFT JOIN `base_web_control`.`webc_usuario` wu ON ((`base_web_control`.`cp`.`id_usuario_baixa` = `base_web_control`.`wu`.`id`)))
    LEFT JOIN `base_web_control`.`descricao_contas_pagar` dcp ON ((`base_web_control`.`dcp`.`id` = `base_web_control`.`cp`.`id_descricao_conta_pagar`)))
    LEFT JOIN `base_web_control`.`forma_pagamento` fp ON ((`base_web_control`.`fp`.`id` = `base_web_control`.`cp`.`id_formapgto`)))
WHERE
  (`base_web_control`.`cp`.`tp_conta` = 'R');

#
# View "v_listar_contas_receber"
#

CREATE
  ALGORITHM = UNDEFINED
  VIEW `base_web_control`.`v_listar_contas_receber`
  AS
SELECT
  `base_web_control`.`cp`.`id`,
  `base_web_control`.`wu`.`nome_usuario` AS 'nom_usuario_baixa',
  `base_web_control`.`cp`.`data_vencimento`,
  `base_web_control`.`cp`.`valor`,
  `base_web_control`.`cp`.`data_baixa`,
  `base_web_control`.`cp`.`valor_baixa`,
  `base_web_control`.`f`.`nome` AS 'vendedor',
  IF((`base_web_control`.`c`.`tipo_pessoa` = 'J'), `base_web_control`.`c`.`razao_social`, `base_web_control`.`c`.`nome`) AS 'nomeclientevenda',
  IF((`base_web_control`.`c`.`tipo_pessoa` = 'J'), `base_web_control`.`c`.`razao_social`, `base_web_control`.`c`.`nome`) AS 'nomeclientenota',
  `base_web_control`.`dcp`.`descricao` AS 'descricaodespesa',
  `base_web_control`.`fp`.`descricao` AS 'forma_pagamento',
  `base_web_control`.`cp`.`parcela`,
  `base_web_control`.`cp`.`id_cliente` AS 'idcliente',
  `base_web_control`.`cp`.`informacoes_adicionais`,
  `base_web_control`.`cp`.`id_venda` AS 'idvenda',
  'Estabelecimento' AS 'origempagamento',
  '' AS 'cpfcnpj_devedor',
  (SELECT CONCAT(`base_web_control`.`td`.`descricao`, ' (AVULSO)') FROM `base_web_control`.`contas_pagar_tpdoc` td WHERE (`base_web_control`.`td`.`id` = `base_web_control`.`cp`.`id_tipo_documento`) LIMIT 1) AS 'formapag',
  `base_web_control`.`cp`.`nome_devedor`,
  `base_web_control`.`cp`.`id_formapgto`,
  `base_web_control`.`cp`.`multa_atraso`
FROM
  ((((((`base_web_control`.`contas_pagar` cp
    LEFT JOIN `base_web_control`.`venda` v ON ((`base_web_control`.`cp`.`id_venda` = `base_web_control`.`v`.`id`)))
    LEFT JOIN `base_web_control`.`funcionario` f ON ((`base_web_control`.`f`.`id` = `base_web_control`.`v`.`id_usuario_fecha_venda`)))
    LEFT JOIN `base_web_control`.`cliente` c ON ((`base_web_control`.`v`.`id_cliente` = `base_web_control`.`c`.`id`)))
    LEFT JOIN `base_web_control`.`webc_usuario` wu ON ((`base_web_control`.`cp`.`id_usuario_baixa` = `base_web_control`.`wu`.`id`)))
    LEFT JOIN `base_web_control`.`descricao_contas_pagar` dcp ON ((`base_web_control`.`dcp`.`id` = `base_web_control`.`cp`.`id_descricao_conta_pagar`)))
    LEFT JOIN `base_web_control`.`forma_pagamento` fp ON ((`base_web_control`.`fp`.`id` = `base_web_control`.`cp`.`id_formapgto`)))
WHERE
  (`base_web_control`.`cp`.`tp_conta` = 'R');

#
# Procedure "explode"
#

CREATE PROCEDURE `base_web_control`.`explode`( pDelim VARCHAR(32), pStr TEXT)
BEGIN                                
  DROP TABLE IF EXISTS `base_web_control`.temp_explode;                                
  CREATE TEMPORARY TABLE `base_web_control`.temp_explode (id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, word VARCHAR(40));                                
  SET @sql := CONCAT('INSERT INTO temp_explode (word) VALUES (', REPLACE(QUOTE(pStr), pDelim, '\'), (\''), ')');                                
  PREPARE myStmt FROM @sql;                                
  EXECUTE myStmt;                                
END;

#
# Procedure "kill_proc"
#

CREATE PROCEDURE `kill_proc`()
BEGIN
SET @PROC=0;
SELECT @PROC:=ID,HOST,COMMAND,TIME,STATE,INFO FROM INFORMATION_SCHEMA.PROCESSLIST WHERE USER='csinform' ORDER BY TIME DESC LIMIT 1;
KILL @PROC;
SELECT ID,HOST,COMMAND,TIME,STATE,INFO FROM INFORMATION_SCHEMA.PROCESSLIST WHERE USER='csinform' ORDER BY TIME DESC LIMIT 1;   
END;

#
# Procedure "sp_ajusta_qtd_grade_historico"
#

CREATE PROCEDURE `base_web_control`.`sp_ajusta_qtd_grade_historico`(p_cadastro int, p_data date, p_limite int)
BEGIN

DECLARE pronto INT DEFAULT 0;
DECLARE cont_total INT;
DECLARE qtd_anterior INT DEFAULT 0;
DECLARE p_codigo_barra INT DEFAULT 0;
DECLARE v_qtd INT;
DECLARE v_codigo_barra INT;
DECLARE v_id_venda INT;
DECLARE v_id INT;
DECLARE v_qtd_antigo INT;
DECLARE v_qtd_atual INT;
DECLARE cont INT DEFAULT 1;

DECLARE a_venda_item CURSOR FOR 
SELECT `base_web_control`.i.qtd, `base_web_control`.i.codigo_barra, `base_web_control`.i.id_venda, `base_web_control`.g.id, `base_web_control`.g.qtd_antigo, `base_web_control`.g.qtd_atual
FROM `base_web_control`.venda_itens i
INNER JOIN `base_web_control`.venda ON `base_web_control`.venda.id = `base_web_control`.i.id_venda
INNER JOIN `base_web_control`.grade_historico g ON `base_web_control`.g.codigo_barra = `base_web_control`.i.codigo_barra AND `base_web_control`.i.id_venda = SUBSTRING_INDEX(`base_web_control`.g.origem_alteracao,":",-1)
WHERE `base_web_control`.venda.id_cadastro = p_cadastro 
AND date(`base_web_control`.venda.data_venda) = p_data
AND `base_web_control`.venda.situacao = 'C'
AND `base_web_control`.venda.id_tipo_venda <> 4
ORDER BY `base_web_control`.i.codigo_barra
LIMIT p_limite
;

DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;

SET cont_total = (
	SELECT count(*)
	FROM `base_web_control`.venda_itens i
	INNER JOIN `base_web_control`.venda ON `base_web_control`.venda.id = `base_web_control`.i.id_venda
	INNER JOIN `base_web_control`.grade_historico g ON `base_web_control`.g.codigo_barra = `base_web_control`.i.codigo_barra AND `base_web_control`.i.id_venda = SUBSTRING_INDEX(`base_web_control`.g.origem_alteracao,":",-1)
	WHERE `base_web_control`.venda.id_cadastro = p_cadastro 
	AND date(`base_web_control`.venda.data_venda) = p_data
	AND `base_web_control`.venda.situacao = 'C'
	AND `base_web_control`.venda.id_tipo_venda <> 4
    ORDER BY `base_web_control`.i.codigo_barra
    LIMIT p_limite
);

OPEN a_venda_item;
	REPEAT
		IF NOT pronto THEN			
		FETCH a_venda_item INTO v_qtd, v_codigo_barra, v_id_venda, v_id, v_qtd_antigo, v_qtd_atual;
		            
            if p_codigo_barra <> v_codigo_barra then
				if cont > 1 then
					set qtd_anterior = v_qtd_antigo;
                    set p_codigo_barra = v_codigo_barra;
                end if;
            end if;
            
            if cont = 1 then
				set qtd_anterior = v_qtd_antigo;
                set p_codigo_barra = v_codigo_barra;
            end if;
            
            -- select v_qtd as vendeu_estornou,v_qtd_antigo as qtd_antigo, v_qtd_atual as qtd_atual,qtd_anterior as qtdAntigo, (qtd_anterior - v_qtd) as qtdAtual, p_codigo_barra as cAntigo, v_codigo_barra as cAtual;
            update `base_web_control`.grade_historico set qtd_antigo = qtd_anterior, qtd_atual = (qtd_anterior - v_qtd) where id = v_id;
            
            set qtd_anterior = (qtd_anterior - v_qtd);
            set p_codigo_barra = v_codigo_barra;
            
			IF cont = cont_total THEN
				SET pronto = 1;
			END IF;
			
			SET cont = cont + 1;
        END IF;
	UNTIL pronto END REPEAT;
CLOSE a_venda_item;

END;

#
# Procedure "sp_aumenta_qtd_grade_faturada"
#

CREATE PROCEDURE `base_web_control`.`sp_aumenta_qtd_grade_faturada`(
	v_id_venda INT
)
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE v_id_grade INT;
	DECLARE v_id_venda_item INT;
	DECLARE cont INT DEFAULT 1;
	DECLARE cont_total INT;
	DECLARE cur_venda_itens CURSOR FOR SELECT
						id,
						id_grade
					   FROM `base_web_control`.venda_itens
					   WHERE id_venda = v_id_venda;
					   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	SET cont_total = (SELECT
				COUNT(id)
			 FROM `base_web_control`.venda_itens
			 WHERE id_venda = v_id_venda);
	
	OPEN cur_venda_itens;
		REPEAT
		
			IF NOT pronto THEN
			FETCH cur_venda_itens INTO v_id_venda_item, v_id_grade;
				
				
				
				UPDATE `base_web_control`.grade g
				INNER JOIN `base_web_control`.venda_itens vi
					ON `base_web_control`.g.id_grade = `base_web_control`.vi.id_grade
				SET `base_web_control`.g.qtd_atual = qtd_atual + `base_web_control`.vi.qtd
				WHERE `base_web_control`.vi.id = v_id_venda_item ;
			
			
				IF cont = cont_total THEN
					SET pronto = 1;
				END IF;
				SET cont = cont + 1;
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_venda_itens;
END;

#
# Procedure "sp_aumentar_estoque_nf_entrada"
#

CREATE PROCEDURE `base_web_control`.`sp_aumentar_estoque_nf_entrada`(id_nota int)
BEGIN
  INSERT
    INTO `base_web_control`.`grade_historico`
    (`id_grade`, `id_cadastro`, `id_usuario`, `qtd_antigo`, `qtd_atual`, `codigo_barra_antigo`, `codigo_barra`, `valor_custo_antigo`, `valor_custo`, `valor_varejo_aprazo_antigo`, `valor_varejo_aprazo`, `ativo_antigo`, `ativo`, `data_hora_alteracao`, `origem_alteracao`)
    SELECT
      `base_web_control`.`g`.`id_grade`,
      `base_web_control`.`g`.`id_cadastro`,
      `base_web_control`.`g`.`id_usuario_alterou`,
      `base_web_control`.`g`.`qtd_atual`,
      `base_web_control`.`g`.`qtd_atual` + SUM(`base_web_control`.`nfi`.`qtd`),
      `base_web_control`.`g`.`codigo_barra` AS 'codigo_barra_antigo',
      `base_web_control`.`g`.`codigo_barra`,
      `base_web_control`.`g`.`valor_custo` AS 'valor_custo_antigo',
      `base_web_control`.`g`.`valor_custo`,
      `base_web_control`.`g`.`valor_varejo_aprazo` AS 'valor_varejo_aprazo_antigo',
      `base_web_control`.`g`.`valor_varejo_aprazo`,
      `base_web_control`.`g`.`ativo` AS 'ativo_antigo',
      `base_web_control`.`g`.`ativo`,
      NOW(),
      CONCAT('Nota Entrada ', id_nota)
    FROM
      `base_web_control`.`grade` g
        INNER JOIN `base_web_control`.`nf_entrada_itens` nfi ON `base_web_control`.`g`.`id_produto` = `base_web_control`.`nfi`.`id_produto` AND `base_web_control`.`g`.`codigo_barra` = `base_web_control`.`nfi`.`codigo_barra` AND `base_web_control`.`g`.`ativo` = '1'
    WHERE
      `base_web_control`.`nfi`.`id_nota_entrada` = id_nota
    GROUP BY
      `base_web_control`.`g`.`codigo_barra`;
  UPDATE
    `base_web_control`.`grade` g
      INNER JOIN (SELECT
        `id_produto`, `codigo_barra`, SUM(`qtd`) AS 'soma', `id_nota_entrada`
      FROM
        `base_web_control`.`nf_entrada_itens`
      WHERE
        `id_nota_entrada` = id_nota
      GROUP BY
        `codigo_barra`) AS nfi ON `base_web_control`.`g`.`id_produto` = `base_web_control`.`nfi`.`id_produto` AND `base_web_control`.`g`.`codigo_barra` = `base_web_control`.`nfi`.`codigo_barra` AND `base_web_control`.`g`.`ativo` = '1'
  SET
    `base_web_control`.`g`.`qtd_atual` = `base_web_control`.`g`.`qtd_atual` + `base_web_control`.`nfi`.`soma`
  WHERE
    `base_web_control`.`nfi`.`id_nota_entrada` = id_nota;
END;

#
# Procedure "sp_cliente_list_filter"
#

CREATE PROCEDURE `base_web_control`.`sp_cliente_list_filter`(IN `id_cadastro_` INT, IN `limit_` INT, IN `offset_` INT, IN `filter_type_` INT, IN `filter_value_` VARCHAR(255))
BEGIN 
	 
		SELECT 
			`base_web_control`.`cliente`.`id` AS `id`,
			`base_web_control`.`cliente`.`id_cadastro` AS `id_cadastro`,
			`base_web_control`.`cliente`.`tipo_pessoa` AS `tipo_pessoa`,
			`base_web_control`.`cliente`.`cnpj_cpf` AS `cnpj_cpf`,
			`base_web_control`.`cliente`.`rg` AS `rg`,
			`base_web_control`.`cliente`.`inscricao_municipal` AS `inscricao_municipal`,
			`base_web_control`.`cliente`.`inscricao_estadual` AS `inscricao_estadual`,
			`base_web_control`.`cliente`.`inscricao_suframa` AS `inscricao_suframa`,
			`base_web_control`.`cliente`.`nome` AS `nome`,
			`base_web_control`.`cliente`.`razao_social` AS `razao_social`,
			`base_web_control`.`cliente`.`id_tipo_log` AS `id_tipo_log`,
			`base_web_control`.`cliente`.`endereco` AS `endereco`,
			`base_web_control`.`cliente`.`numero` AS `numero`,
			`base_web_control`.`cliente`.`complemento` AS `complemento`,
			`base_web_control`.`cliente`.`bairro` AS `bairro`,
			`base_web_control`.`cliente`.`cidade` AS `cidade`,
			`base_web_control`.`cliente`.`uf` AS `uf`,
			`base_web_control`.`cliente`.`cep` AS `cep`,
			`base_web_control`.`cliente`.`pais` AS `pais`,
			`base_web_control`.`cliente`.`informacoes_adicionais` AS `informacoes_adicionais`,
			`base_web_control`.`cliente`.`data_cadastro` AS `data_cadastro`,
			`base_web_control`.`cliente`.`email` AS `email`,
			`base_web_control`.`cliente`.`telefone` AS `telefone`,
			`base_web_control`.`cliente`.`celular` AS `celular`,
			`base_web_control`.`cliente`.`fax` AS `fax`,
			`base_web_control`.`cliente`.`ativo` AS `ativo`,
			`base_web_control`.`cliente`.`renda_media` AS `renda_media`,
			`base_web_control`.`cliente`.`empresa_trabalha` AS `empresa_trabalha`,
			`base_web_control`.`cliente`.`cargo` AS `cargo`,
			`base_web_control`.`cliente`.`fone_empresa` AS `fone_empresa`,
			`base_web_control`.`cliente`.`endereco_empresa` AS `endereco_empresa`,
			`base_web_control`.`cliente`.`nome_referencia_comercial` AS `nome_referencia_comercial`,
			`base_web_control`.`cliente`.`referencia_comercial` AS `referencia_comercial`,
			`base_web_control`.`cliente`.`nome_referencia` AS `nome_referencia`,
			`base_web_control`.`cliente`.`referencia_pessoal` AS `referencia_pessoal`,
			`base_web_control`.`cliente`.`data_nascimento` AS `data_nascimento`,
			`base_web_control`.`cliente`.`nome_pai` AS `nome_pai`,
			`base_web_control`.`cliente`.`nome_mae` AS `nome_mae`,
			`base_web_control`.`cliente`.`numero_titulo` AS `numero_titulo`,
			`base_web_control`.`cliente`.`zona` AS `zona`,
			`base_web_control`.`cliente`.`secao` AS `secao`,
			`base_web_control`.`cliente`.`placa` AS `placa`,
			`base_web_control`.`cliente`.`fone_pai` AS `fone_pai`,
			`base_web_control`.`cliente`.`fone_mae` AS `fone_mae`,
			`base_web_control`.`cliente`.`socio1` AS `socio1`,
			`base_web_control`.`cliente`.`socio2` AS `socio2`,
			`base_web_control`.`cliente`.`fone_socio1` AS `fone_socio1`,
			`base_web_control`.`cliente`.`fone_socio2` AS `fone_socio2`,
			`base_web_control`.`cliente`.`id_usuario` AS `id_usuario`,
			`base_web_control`.`cliente`.`senha_ecommerce` AS `senha_ecommerce`,
			`base_web_control`.`cliente`.`isento_icms` AS `isento_icms`,
			`base_web_control`.`cliente`.`sincronizado` AS `sincronizado`,
			`base_web_control`.`cliente`.`obs` AS `obs`,
			`base_web_control`.`cliente`.`tabela_preco` AS `tabela_preco`,
			`base_web_control`.`cliente`.`estado_civil` AS `estado_civil`,
			`base_web_control`.`cliente`.`nome_conjuge` AS `nome_conjuge`,
			`base_web_control`.`cliente`.`tipo_residencia` AS `tipo_residencia`,
			`base_web_control`.`cliente`.`foto` AS `foto`,
			`base_web_control`.`cliente`.`orgao_expedidor` AS `orgao_expedidor`,
			`base_web_control`.`cliente`.`naturalidade` AS `naturalidade`,
			`base_web_control`.`cliente`.`id_importacao` AS `id_importacao`,
			`base_web_control`.`cliente`.`id_funcionario` AS `id_funcionario`,
			`base_web_control`.`cliente`.`limite_credito` AS `limite_credito`,
			`base_web_control`.`cliente`.`limite_credito_cc` AS `limite_credito_cc`,
			`base_web_control`.`cliente`.`tipo_compra` AS `tipo_compra`,
			`base_web_control`.`cliente`.`origem_cadastro` AS `origem_cadastro`,
			`base_web_control`.`cliente`.`data_cadastro_user` AS `data_cadastro_user`,
			`base_web_control`.`cliente`.`data_alteracao` AS `data_alteracao`,
			`base_web_control`.`cliente`.`data_sincronismo` AS `data_sincronismo`,
			`base_web_control`.`cliente`.`id_off` AS `id_off`,
			`base_web_control`.`cliente`.`substituto_tributario` AS `substituto_tributario`
		FROM 
			`base_web_control`.`cliente` AS `cliente` 
		LEFT JOIN `base_web_control`.`cliente_veiculo` AS `cliente_veiculo` 
			ON `base_web_control`.`cliente`.`id` = `base_web_control`.`cliente_veiculo`.`id_cliente`
		WHERE 
			`base_web_control`.`cliente`.`id_cadastro` = id_cadastro_ 
		AND 
			`base_web_control`.`cliente`.`ativo` = 'A'  
		AND 
			
			# 1 = todososcampos
			# 2 = cod_cliente
			# 3 = nome`
			# 4 = razao_social 
			# 5 = End
			# 6 = Cidade
			# 7 = CPF/CNPJ
			# 8 = Telefone  
			
			CASE 
				WHEN filter_type_ = 1 THEN  
					( 
						   `base_web_control`.`cliente`.`nome` LIKE filter_value_
						OR `base_web_control`.`cliente`.`razao_social` LIKE filter_value_
						OR `base_web_control`.`cliente`.`cnpj_cpf` LIKE filter_value_
						OR `base_web_control`.`cliente`.`rg` LIKE filter_value_
						OR `base_web_control`.`cliente`.`inscricao_estadual` LIKE filter_value_
						OR `base_web_control`.`cliente`.`telefone` LIKE filter_value_
						OR `base_web_control`.`cliente`.`celular` LIKE filter_value_ 
						OR `base_web_control`.`cliente`.`email` LIKE filter_value_
						OR `base_web_control`.`cliente`.`cidade` LIKE filter_value_
						OR `base_web_control`.`cliente`.`uf` LIKE filter_value_
						OR CONCAT(`base_web_control`.`cliente`.`endereco`, ' ',  `base_web_control`.`cliente`.`numero`) LIKE filter_value_
						OR `base_web_control`.`cliente_veiculo`.`placa` LIKE filter_value_
					) 
				WHEN filter_type_ = 2 THEN  
					( 
						`base_web_control`.`cliente`.`id` = filter_value_
					)
				WHEN filter_type_ = 3 THEN  
					(
						`base_web_control`.`cliente`.`nome` = filter_value_
					)
				WHEN filter_type_ = 4 THEN   
					(
						`base_web_control`.`cliente`.`razao_social` = filter_value_
					)
				WHEN filter_type_ = 5 THEN  
					(
						`base_web_control`.`cliente`.`endereco` = filter_value_
					)
				WHEN filter_type_ = 6 THEN  
					(
						`base_web_control`.`cliente`.`cidade` = filter_value_
					)
				WHEN filter_type_ = 7 THEN  
					(
						`base_web_control`.`cliente`.`cnpj_cpf` = filter_value_
					)
				WHEN filter_type_ = 8 THEN  
					(
						`base_web_control`.`cliente`.`telefone` = filter_value_
					) 
				ELSE 
					1  
			END
		AND 
        ( `base_web_control`.`cliente`.`nome` <> ''  OR `base_web_control`.`cliente`.`razao_social` <> '')
		
        ORDER BY `base_web_control`.`cliente`.`nome`
        
        LIMIT offset_,limit_ 
		
	 ;

END;

#
# Procedure "sp_criar_balcao"
#

CREATE PROCEDURE `base_web_control`.`sp_criar_balcao`()
begin
	declare v_id_cadastro int;
	declare v_pronto int default 0;
	declare v_cur_clientes cursor for SELECT
						`base_web_control`.c.codLoja
					FROM cs2.cadastro c
					LEFT JOIN base_web_control.cliente cli
					ON `base_web_control`.cli.id_cadastro = `base_web_control`.c.codLoja
					AND `base_web_control`.cli.tipo_pessoa = 'B'
					WHERE (`base_web_control`.cli.id IS NULL OR `base_web_control`.cli.ativo = 'E') ;
	
	declare continue handler for not found set v_pronto = 1;
	
	open v_cur_clientes;
		repeat
			
			if not v_pronto then
			fetch v_cur_clientes into v_id_cadastro;
			
				INSERT INTO `base_web_control`.cliente(
					id_cadastro,
					tipo_pessoa,
					cnpj_cpf,
					inscricao_municipal,
					nome,
					endereco,
					complemento,
					bairro,
					cidade,
					ativo,
					isento_icms,
					tabela_preco,
					tipo_compra)
				VALUES(
					v_id_cadastro,
					'B',
					'00000000000',
					'CLIENTE BALCAO',
					'CLIENTE BALCAO',
					'CLIENTE BALCAO',
					'CLIENTE BALCAO',
					'CLIENTE BALCAO',
					'CLIENTE BALCAO',
					'A',
					'S',
					'1',
					'V');
			
			
			end if;
		until v_pronto end repeat;
	close v_cur_clientes;
end;

#
# Procedure "sp_criar_banco_bkp"
#

CREATE PROCEDURE `base_web_control`.`sp_criar_banco_bkp`()
BEGIN
	DECLARE v_nome_tabela VARCHAR(255);
	DECLARE v_campo VARCHAR(255);
	DECLARE v_tipo VARCHAR(255);
	DECLARE v_nullable VARCHAR(10);
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_pronto_aux INT DEFAULT 0;
	DECLARE v_create_campos TEXT;
	DECLARE v_cont_cur INT DEFAULT 0;
	DECLARE v_cont_aux INT DEFAULT 0;
	DECLARE v_cont_tabelas INT DEFAULT 0;
	DECLARE v_cont_tabelas_aux INT DEFAULT 0;
	DECLARE cur_tabelas CURSOR FOR SELECT
						TABLE_NAME						
					FROM information_schema.TABLES
					WHERE TABLE_SCHEMA = 'base_web_control'
					ORDER BY TABLE_NAME ASC;					
	
	DECLARE cur_colunas CURSOR FOR SELECT
						COLUMN_NAME, 
						COLUMN_TYPE
					FROM information_schema.COLUMNS
					WHERE TABLE_SCHEMA = 'base_web_control'
					AND TABLE_NAME = v_nome_tabela
					ORDER BY TABLE_NAME ASC, ORDINAL_POSITION ASC;
	SET v_cont_tabelas =( SELECT
					COUNT(TABLE_NAME)
				FROM information_schema.TABLES
				WHERE TABLE_SCHEMA = 'base_web_control'
				ORDER BY TABLE_NAME ASC);
			
	OPEN cur_tabelas;
	REPEAT
		FETCH cur_tabelas INTO v_nome_tabela;
		IF NOT v_pronto THEN
		SET v_create_campos = '';
		SET v_cont_tabelas_aux = v_cont_tabelas_aux + 1;
		SET v_cont_cur = (SELECT
				
				COUNT(COLUMN_TYPE)
			FROM information_schema.COLUMNS
			WHERE TABLE_SCHEMA = 'base_web_control'
			AND TABLE_NAME = v_nome_tabela
			ORDER BY TABLE_NAME ASC, ORDINAL_POSITION ASC);
			
			OPEN cur_colunas;
			REPEAT
				FETCH cur_colunas INTO v_campo, v_tipo;
				IF NOT v_pronto_aux THEN
				
				SET v_cont_aux = v_cont_aux + 1;
				SELECT v_cont_aux, v_cont_cur;
				IF v_cont_cur = v_cont_aux THEN
				
					SET v_create_campos = CONCAT(v_create_campos,' `',v_campo,'` ', v_tipo);
					SET v_pronto_aux = 1;
				ELSE
					SET v_create_campos = CONCAT(v_create_campos,' `',v_campo,'` ', v_tipo, ', ');
				END IF;
				
				
				END IF;
			UNTIL v_pronto_aux END REPEAT;
			CLOSE cur_colunas;
				
		
		SET v_pronto_aux = 0;
		SET v_cont_aux = 0;
		SET @sql = CONCAT('CREATE TABLE IF NOT EXISTS base_web_control_inativos.', v_nome_tabela, ' (', v_create_campos, ')'); 
		SELECT @sql;
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
		
		IF v_cont_tabelas = v_cont_tabelas_aux THEN
		
			SET v_pronto_aux = 0;
			SET v_pronto = 0;
		
		END IF;
		
		END IF;
	UNTIL v_pronto END REPEAT;
	CLOSE cur_tabelas;
	
END;

#
# Procedure "sp_criar_campos_sync_tabela"
#

CREATE PROCEDURE `base_web_control`.`sp_criar_campos_sync_tabela`(
	p_nome_tabela varchar(255)
)
begin
	DECLARE nome_coluna VARCHAR(255);
	
	
	SET nome_coluna = (SELECT
				column_name
			FROM information_schema.COLUMNS
			WHERE TABLE_SCHEMA = 'base_web_control'
			AND TABLE_NAME = p_nome_tabela
			ORDER BY ordinal_position DESC
			LIMIT 1);
	
	SET @sql = CONCAT(' ALTER TABLE base_web_control.', p_nome_tabela, ' ADD COLUMN data_alteracao DATETIME AFTER `', nome_coluna, '`');
	PREPARE stmt_sql FROM @sql;
	EXECUTE stmt_sql;
	DEALLOCATE PREPARE stmt_sql;
	
	SET @sql2 = CONCAT(' ALTER TABLE base_web_control.', p_nome_tabela, ' ADD COLUMN data_sincronismo DATETIME AFTER data_alteracao');
	PREPARE stmt_sql2 FROM @sql2;
	EXECUTE stmt_sql2;
	DEALLOCATE PREPARE stmt_sql2;
	
	SET @sql2 = CONCAT(' ALTER TABLE base_web_control.', p_nome_tabela, ' ADD COLUMN id_off INT AFTER data_sincronismo');
	PREPARE stmt_sql2 FROM @sql2;
	EXECUTE stmt_sql2;
	DEALLOCATE PREPARE stmt_sql2;
	
	
	SET @sql3 = CONCAT('ALTER TABLE base_web_control.', p_nome_tabela, ' 
		CHANGE data_alteracao
			data_alteracao TIMESTAMP NOT NULL
				       DEFAULT CURRENT_TIMESTAMP 
				       ON UPDATE CURRENT_TIMESTAMP');
	PREPARE stmt_sql3 FROM @sql3;
	EXECUTE stmt_sql3;
	DEALLOCATE PREPARE stmt_sql3;
end;

#
# Procedure "sp_criar_index_id_off"
#

CREATE PROCEDURE `base_web_control`.`sp_criar_index_id_off`()
BEGIN
	DECLARE nome_coluna VARCHAR(255);
	DECLARE nome_tabela VARCHAR(255);
	DECLARE pronto INT DEFAULT 0;
	DECLARE tem_coluna_alteracao INT;
	DECLARE tem_coluna_sinc INT;
	DECLARE tem_id_off INT;
	DECLARE cur_tabelas CURSOR FOR SELECT
						TABLE_NAME
					FROM information_schema.COLUMNS
					WHERE TABLE_SCHEMA = 'base_web_control'
					GROUP BY TABLE_NAME;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	OPEN cur_tabelas;
		REPEAT	
			FETCH cur_tabelas INTO nome_tabela; 
			IF NOT pronto THEN
			
				SET tem_id_off = (SELECT
						IF(COUNT(*) > 0,1,0)
					 FROM information_schema.COLUMNS
					 WHERE TABLE_SCHEMA = 'base_web_control'
					 AND TABLE_NAME = nome_tabela
					 AND COLUMN_NAME = 'id_off');
						
				IF tem_id_off = 1 then
				
					SET @sql = CONCAT(' ALTER TABLE `base_web_control`.`',nome_tabela,'` ADD INDEX `idx_id_off` (`id_off`); ');
					PREPARE stmt_sql FROM @sql;
					EXECUTE stmt_sql;
					DEALLOCATE PREPARE stmt_sql;
					
				end if;
				
			
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_tabelas;
END;

#
# Procedure "sp_criar_lista_fixa"
#

CREATE PROCEDURE `base_web_control`.`sp_criar_lista_fixa`(
	p_id_cadastro int
)
begin
	declare v_lista int;
	declare v_lista_email int;
    declare v_lista_whatsapp int;
	set v_lista = (select 
				if(count(*) > 0,1,0) 
		      from base_web_control.torpedo_lista 
		      where id_cadastro = p_id_cadastro 
		      and fixa = 'S');
		      
	set v_lista_email = (select
				if(count(*) > 0,1,0)
			    from base_web_control.mailmkt_lista
			    where id_cadastro = p_id_cadastro
			    and fixa = 'S');
                
	set v_lista_whatsapp = (select
				if(count(*) > 0,1,0)
			    from base_web_control.whatsapp_lista
			    where id_cadastro = p_id_cadastro
			    and fixa = 'S');
		      
		      
	if v_lista = 0 then
	
		insert into base_web_control.torpedo_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		values (
			p_id_cadastro,
			'Lista dos Meus Clientes',
			'C',
			now(),
			now(),
			'S',
			'A');
			
		INSERT INTO base_web_control.torpedo_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Futuros Clientes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.torpedo_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Inadimplentes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.torpedo_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Aniversariantes do Dia',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
	
	end if;
	
	if v_lista_email = 0 then
	
	
		INSERT INTO base_web_control.mailmkt_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista dos Meus Clientes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		INSERT INTO base_web_control.mailmkt_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Futuros Clientes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.mailmkt_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Inadimplentes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.mailmkt_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Aniversariantes do Dia',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
	
	
	end if;
    
    	if v_lista_whatsapp = 0 then
	
	
		INSERT INTO base_web_control.whatsapp_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista dos Meus Clientes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		INSERT INTO base_web_control.whatsapp_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Futuros Clientes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.whatsapp_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Inadimplentes',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
			
		
		INSERT INTO base_web_control.whatsapp_lista(
			id_cadastro,
			nome_lista,			
			tipo_lista,
			dt_creation,
			dt_last_update,
			fixa,
			`status`)
		VALUES (
			p_id_cadastro,
			'Lista de Aniversariantes do Dia',
			'C',
			NOW(),
			NOW(),
			'S',
			'A');
	
	
	end if;
	
end;

#
# Procedure "sp_dashboard_franquias"
#

CREATE PROCEDURE `base_web_control`.`sp_dashboard_franquias`(
	p_id_franquia INT, 
	p_id_agendador INT)
begin
	declare v_visitas_realizadas int;
	declare v_visitas_nao_realizadas int;
	declare v_total_agendamento int;
	declare v_total_agendamento_dia int;
	declare v_meus_agendamentos int;
	declare v_agendamento_manha int;
	declare v_agendamento_tarde int;
	declare v_porcentagem_meus_agendamentos decimal(5,2);
	

SELECT
	COUNT(*)
into v_visitas_realizadas
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
INNER JOIN franquias.com_cartao_agendamento_conferencia_resp cr
ON `base_web_control`.cr.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
AND `base_web_control`.chis.id_status = 7
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador)
AND (`base_web_control`.ca.data_agendamento BETWEEN '2017-05-01' AND NOW() OR `base_web_control`.chis.data_reagendamento BETWEEN '2017-05-01' AND NOW());

SELECT
	COUNT(*)
into v_visitas_nao_realizadas
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_conferencia_resp cr
ON `base_web_control`.cr.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
AND `base_web_control`.chis.id_status = 7
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador)
AND (`base_web_control`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `base_web_control`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW())
AND `base_web_control`.cr.id IS NULL;

SELECT
	COUNT(*)
into v_total_agendamento
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (`base_web_control`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `base_web_control`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW());

SELECT
	COUNT(*)
into v_meus_agendamentos
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (`base_web_control`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `base_web_control`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW())
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador);

set v_porcentagem_meus_agendamentos = (v_meus_agendamentos / v_total_agendamento) * 100;
select
	count(*)
into v_total_agendamento_dia
from franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (DATE(`base_web_control`.ca.data_agendamento) = DATE(NOW()) OR DATE(`base_web_control`.chis.data_reagendamento) = DATE(NOW()))
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador);

SELECT
	COUNT(*)
INTO v_agendamento_manha
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (date(`base_web_control`.ca.data_agendamento) = DATE(NOW()) and `base_web_control`.ca.data_agendamento <= CONCAT(date(NOW()), ' 12:00:00') OR DATE(`base_web_control`.chis.data_reagendamento) = DATE(NOW()) AND `base_web_control`.chis.data_reagendamento <= CONCAT(DATE(NOW()), ' 12:00:00'))
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador);

SELECT
	COUNT(*)
INTO v_agendamento_tarde
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `base_web_control`.ca.id_cartao = `base_web_control`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `base_web_control`.chis.id_cartao_agendamento = `base_web_control`.ca.id
WHERE `base_web_control`.c.id_franquia = p_id_franquia
AND (DATE(`base_web_control`.ca.data_agendamento) = DATE(NOW()) AND `base_web_control`.ca.data_agendamento > CONCAT(DATE(NOW()), ' 12:00:00') OR DATE(`base_web_control`.chis.data_reagendamento) = DATE(NOW()) AND `base_web_control`.chis.data_reagendamento > CONCAT(DATE(NOW()), ' 12:00:00'))
AND (`base_web_control`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador);
	SELECT  
		v_visitas_realizadas AS visitas_realizadas,
	v_visitas_nao_realizadas AS visitas_nao_realizadas,
	v_total_agendamento AS total_agendamento,
	v_total_agendamento_dia AS total_agendamento_dia,
	v_meus_agendamentos AS meus_agendamentos,
	v_agendamento_manha AS agendamento_manha,
	v_agendamento_tarde AS agendamento_tarde,
	v_porcentagem_meus_agendamentos AS porcentagem_meus_agendamentos;
end;

#
# Procedure "sp_del_produtos_cliente"
#

CREATE PROCEDURE `base_web_control`.`sp_del_produtos_cliente`(
	id_cadastro_dest INT
)
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE id_prod_del INT;
	
	DECLARE cur_produtos CURSOR FOR SELECT
						id
					FROM `base_web_control`.produto
					WHERE id_cadastro = id_cadastro_dest
					;
					
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	
	OPEN cur_produtos;
		REPEAT
			FETCH cur_produtos INTO id_prod_del;
			IF NOT pronto THEN
			
				DELETE FROM `base_web_control`.produto WHERE id = id_prod_del;
			
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_produtos;
END;

#
# Procedure "sp_deleta_logDuplicada"
#

CREATE PROCEDURE `base_web_control`.`sp_deleta_logDuplicada`(callid int(11))
BEGIN
  DELETE FROM `base_web_control`.`log_acesso_offline` WHERE `id` = callid;
END;

#
# Procedure "sp_diminui_qtd_grade_venda"
#

CREATE PROCEDURE `base_web_control`.`sp_diminui_qtd_grade_venda`(
	v_id_venda INT
)
BEGIN
	DECLARE pronto INT DEFAULT 0;
    DECLARE tipo_venda INT DEFAULT 0;
	DECLARE v_id_grade INT;
	DECLARE v_id_venda_item INT;
    DECLARE v_tipo_venda INT DEFAULT 0;
	DECLARE cont INT DEFAULT 1;
	DECLARE cont_total INT;
	DECLARE cur_venda_itens CURSOR FOR SELECT
						`base_web_control`.i.id,
						`base_web_control`.i.id_grade,
                        `base_web_control`.v.id_tipo_venda
					   FROM `base_web_control`.venda_itens i
                       inner join `base_web_control`.venda v on `base_web_control`.v.id = `base_web_control`.i.id_venda
					   WHERE `base_web_control`.i.id_venda = v_id_venda;
					   
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	SET cont_total = (SELECT
				COUNT(id)
			 FROM `base_web_control`.venda_itens
			 WHERE id_venda = v_id_venda);
	
	OPEN cur_venda_itens;
		REPEAT
		
			IF NOT pronto THEN
			FETCH cur_venda_itens INTO v_id_venda_item, v_id_grade, v_tipo_venda;
				
                IF v_tipo_venda = 4 THEN
					SET tipo_venda = 0;
                ELSE
					UPDATE `base_web_control`.grade g
					INNER JOIN `base_web_control`.venda_itens vi ON `base_web_control`.g.id_grade = `base_web_control`.vi.id_grade
					SET `base_web_control`.g.qtd_atual = qtd_atual - `base_web_control`.vi.qtd
					WHERE `base_web_control`.vi.id = v_id_venda_item;
                END IF;			
			
				IF cont = cont_total THEN
					SET pronto = 1;
				END IF;
				SET cont = cont + 1;
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_venda_itens;
END;

#
# Procedure "sp_diminuir_estoque_nf_entrada"
#

CREATE PROCEDURE `base_web_control`.`sp_diminuir_estoque_nf_entrada`(id_nota int)
BEGIN
  UPDATE
    `base_web_control`.`grade` g
      INNER JOIN `base_web_control`.`nf_entrada_itens` nfi ON `base_web_control`.`g`.`id_produto` = `base_web_control`.`nfi`.`id_produto` AND `base_web_control`.`g`.`codigo_barra` = `base_web_control`.`nfi`.`codigo_barra` AND `base_web_control`.`g`.`ativo` = '1'
  SET
    `base_web_control`.`g`.`qtd_atual` = `base_web_control`.`g`.`qtd_atual` - `base_web_control`.`nfi`.`qtd`
  WHERE
    `id_nota_entrada` = id_nota;
  INSERT
    INTO `base_web_control`.`grade_historico`
    (`id_grade`, `id_cadastro`, `id_usuario`, `qtd_antigo`, `qtd_atual`, `codigo_barra_antigo`, `codigo_barra`, `valor_custo_antigo`, `valor_custo`, `valor_varejo_aprazo_antigo`, `valor_varejo_aprazo`, `ativo_antigo`, `ativo`, `data_hora_alteracao`, `origem_alteracao`)
    SELECT
      `base_web_control`.`g`.`id_grade`,
      `base_web_control`.`g`.`id_cadastro`,
      `base_web_control`.`g`.`id_usuario_alterou`,
      `base_web_control`.`g`.`qtd_atual`,
      `base_web_control`.`g`.`qtd_atual` - `base_web_control`.`nfi`.`qtd`,
      `base_web_control`.`g`.`codigo_barra` AS 'codigo_barra_antigo',
      `base_web_control`.`g`.`codigo_barra`,
      `base_web_control`.`g`.`valor_custo` AS 'valor_custo_antigo',
      `base_web_control`.`g`.`valor_custo`,
      `base_web_control`.`g`.`valor_varejo_aprazo` AS 'valor_varejo_aprazo_antigo',
      `base_web_control`.`g`.`valor_varejo_aprazo`,
      `base_web_control`.`g`.`ativo` AS 'ativo_antigo',
      `base_web_control`.`g`.`ativo`,
      NOW(),
      CONCAT('Nota Saida Estoque ', id_nota)
    FROM
      `base_web_control`.`grade` g
        INNER JOIN `base_web_control`.`nf_entrada_itens` nfi ON `base_web_control`.`g`.`id_produto` = `base_web_control`.`nfi`.`id_produto` AND `base_web_control`.`g`.`codigo_barra` = `base_web_control`.`nfi`.`codigo_barra` AND `base_web_control`.`g`.`ativo` = '1'
    WHERE
      `base_web_control`.`nfi`.`id_nota_entrada` = id_nota;
END;

#
# Procedure "sp_distribuir_quantidade"
#

CREATE PROCEDURE `base_web_control`.`sp_distribuir_quantidade`(
	p_id_venda INT, 
	p_id_cadastro INT)
BEGIN
	
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_qtd_promo_aplicada INT;
	DECLARE v_valor_desconto DECIMAL(15,3);
	DECLARE v_quantidade_item INT;
	DECLARE v_id_grade INT;
	DECLARE v_qtd_promo INT;
	DECLARE v_cont_insert INT DEFAULT 0;
	DECLARE v_cont_insert_aux INT DEFAULT 0;
	DECLARE v_cont_insert_alterado INT DEFAULT 0;
	DECLARE v_cont_insert_alterado_aux INT DEFAULT 0;
	
	
	
	DECLARE v_qtd_venda INT;
	DECLARE v_nome_produto VARCHAR(255);
	DECLARE v_preco_tabela DECIMAL(25,15);
	DECLARE v_preco_venda DECIMAL(25,15);
	DECLARE v_codigo_barra VARCHAR(25);
	DECLARE v_id_unidade INT;
	DECLARE v_preco_desconto DECIMAL(25,15);
	DECLARE v_diferenca DECIMAL(13,2);
	DECLARE v_preco_inserir DECIMAL(25,15);
	DECLARE v_preco_custo DECIMAL(25,15);
	DECLARE v_id_produto INT;
	declare v_id_cadastro int;	
	DECLARE cur_valores CURSOR FOR
	
	SELECT
		TRUNCATE(SUM(`base_web_control`.vi.qtd) /`base_web_control`.pq.qtd_promocao,0) qtd_promo_aplicada,
		valor_desconto AS valor_desconto,
		SUM(`base_web_control`.vi.qtd) AS quantidade_item,
		`base_web_control`.vi.id_grade,
		qtd_promocao
	FROM base_web_control.promocao_quantidade pq
	INNER JOIN `base_web_control`.venda_itens vi
	ON `base_web_control`.pq.id_grade = `base_web_control`.vi.id_grade
	WHERE `base_web_control`.pq.id_cadastro = v_id_cadastro
	
	AND `base_web_control`.vi.id_venda = p_id_venda
	AND `base_web_control`.vi.estornado <> 'S'
	AND NOW() BETWEEN data_inicio AND data_fim
	and `base_web_control`.pq.ativo = 'A'
	GROUP BY `base_web_control`.pq.id_grade;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	set v_id_cadastro = (select id_cadastro from `base_web_control`.venda where id = p_id_venda);
	OPEN cur_valores;
		REPEAT
			FETCH cur_valores INTO v_qtd_promo_aplicada, v_valor_desconto, v_quantidade_item, v_id_grade, v_qtd_promo;
			IF NOT v_pronto THEN
				
				SET v_preco_desconto = (v_qtd_promo_aplicada * v_valor_desconto) / (v_qtd_promo * v_qtd_promo_aplicada);
			
				SET v_cont_insert_alterado = v_qtd_promo_aplicada * v_qtd_promo;
				SET v_cont_insert = v_quantidade_item - (v_qtd_promo_aplicada * v_qtd_promo);
				
				
				SELECT
					v_cont_insert,
					`base_web_control`.vi.nome_produto,
					`base_web_control`.vi.preco_tabela,
					`base_web_control`.vi.preco_venda,
					`base_web_control`.vi.codigo_barra,
					`base_web_control`.vi.id_unidade,
					`base_web_control`.vi.valor_preco_custo,
					`base_web_control`.vi.id_produto
				INTO 
					v_qtd_venda,
					v_nome_produto,
					v_preco_tabela,
					v_preco_venda,
					v_codigo_barra,
					v_id_unidade,
					v_preco_custo,
					v_id_produto
				FROM `base_web_control`.venda_itens vi
				WHERE `base_web_control`.vi.id_venda = p_id_venda
				AND `base_web_control`.vi.id_grade = v_id_grade
				LIMIT 1;
				
				
				DELETE FROM `base_web_control`.venda_itens WHERE id_venda = p_id_venda AND id_grade = v_id_grade;
					
				SET v_diferenca = (v_valor_desconto * v_qtd_promo_aplicada) - (TRUNCATE(v_preco_desconto,2) * v_cont_insert_alterado);
				select 	v_diferenca;			 										
				WHILE v_cont_insert_alterado > v_cont_insert_alterado_aux DO
				
					SET v_preco_inserir = v_preco_tabela - truncate(v_preco_desconto,2);
					
					if v_cont_insert_alterado = v_cont_insert_alterado_aux + 1 then
					
						set v_preco_inserir = (v_preco_tabela - TRUNCATE(v_preco_desconto,2)) - v_diferenca;
						
					end if;
									
					INSERT INTO `base_web_control`.venda_itens(
						id_venda, 
						qtd, 
						nome_produto, 
						preco_tabela, 
						preco_venda, 
						codigo_barra, 
						id_unidade, 
						id_grade,
						valor_preco_custo,
						id_produto
					)
					VALUES(
						p_id_venda,
						1,
						v_nome_produto,
						v_preco_tabela,
						v_preco_inserir,
						v_codigo_barra,
						v_id_unidade,
						v_id_grade,
						v_preco_custo,
						v_id_produto
						);
				
					SET v_cont_insert_alterado_aux = v_cont_insert_alterado_aux + 1;
					
				END WHILE;
				
				IF v_cont_insert > 0 THEN
				
					INSERT INTO `base_web_control`.venda_itens(
							id_venda, 
							qtd, 
							nome_produto, 
							preco_tabela, 
							preco_venda, 
							codigo_barra, 
							id_unidade, 
							id_grade,
							valor_preco_custo,
							id_produto
						)
						VALUES(
							p_id_venda,
							v_cont_insert,
							v_nome_produto,
							v_preco_tabela,
							v_preco_tabela,
							v_codigo_barra,
							v_id_unidade,
							v_id_grade,
							v_preco_custo,
							v_id_produto
							);
				END IF;
							
				
				SET v_cont_insert_aux = 0;
				SET v_cont_insert_alterado_aux = 0;
				
				
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_valores;
END;

#
# Procedure "sp_exc_script_clientes_ativos"
#

CREATE PROCEDURE `base_web_control`.`sp_exc_script_clientes_ativos`(p_script text)
begin
	declare v_id_cadastro int;
	declare v_pronto int default 0;
	declare cur_cadastro cursor for select
						codLoja
					from cs2.cadastro
					where sitcli = 0 ;					
	
	declare continue handler for not found set v_pronto = 1;
	
	open cur_cadastro;
		repeat
			fetch cur_cadastro into v_id_cadastro;
			if not v_pronto then
			
				
				set @sql = replace(p_script,':parametro', v_id_cadastro);
				prepare stmt_exc from @sql;
				execute stmt_exc;
				deallocate prepare stmt_exc;
				
			
			end if;
		until v_pronto end repeat;
	close cur_cadastro;
			
end;

#
# Procedure "sp_exportacao_engine"
#

CREATE PROCEDURE `base_web_control`.`sp_exportacao_engine`()
BEGIN
	DECLARE v_nome_tabela VARCHAR(255);
	DECLARE v_nome_campo VARCHAR(255);
	DECLARE v_default VARCHAR(255);
	DECLARE v_nullable VARCHAR(255);
	DECLARE v_tipo_campo VARCHAR(255);
	DECLARE v_extra VARCHAR(255);
	DECLARE v_comment VARCHAR(255);
	DECLARE v_pronto INT DEFAULT 0;
	
	DECLARE cur_tabelas CURSOR FOR SELECT
						information_schema.COLUMNS.TABLE_NAME,
						information_schema.COLUMNS.COLUMN_NAME,
						information_schema.COLUMNS.COLUMN_DEFAULT,
						information_schema.COLUMNS.IS_NULLABLE,
						information_schema.COLUMNS.COLUMN_TYPE,
						information_schema.COLUMNS.COLUMN_KEY,
						information_schema.COLUMNS.EXTRA,
						information_schema.COLUMNS.COLUMN_COMMENT
					FROM information_schema.TABLES
					INNER JOIN information_schema.COLUMNS
					ON information_schema.COLUMNS.TABLE_NAME = information_schema.TABLES.TABLE_NAME
					WHERE information_schema.TABLES.TABLE_SCHEMA = 'base_web_control'
					AND information_schema.TABLES.TABLE_NAME = 'produto'
					GROUP BY information_schema.COLUMNS.COLUMN_NAME
					ORDER BY information_schema.COLUMNS.ORDINAL_POSITION ASC;
					
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto =  1;
	
	OPEN cur_tabelas;
	
		REPEAT
			IF NOT pronto THEN
				FETCH cur_tabelas INTO v_nome_tabela, v_nome_campo, v_default, v_nullable,
						       v_tipo_campo, v_extra, v_comment;
						       
			
							SELECT v_nome_tabela;
						       
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_tabelas;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_atendimento"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_atendimento`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
 	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cliente IS NULL || id_cliente = "" || DATE(id_cliente) = "0000-00-00",0,id_cliente) USING utf8)) AS id_cliente 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_atendimento IS NULL || data_atendimento = "" || DATE(data_atendimento) = "0000-00-00","1899-12-30",data_atendimento) USING utf8)) AS data_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(hora_atendimento IS NULL || hora_atendimento = "" || DATE(hora_atendimento) = "0000-00-00","00:00:00",hora_atendimento) USING utf8)) AS hora_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao_atendimento IS NULL || descricao_atendimento = "" || DATE(descricao_atendimento) = "0000-00-00","",descricao_atendimento) USING utf8)) AS descricao_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_atendimento IS NULL || id_tipo_atendimento = "" || DATE(id_tipo_atendimento) = "0000-00-00",0,id_tipo_atendimento) USING utf8)) AS id_tipo_atendimento
				,"" AS alterar  
				,"" AS excluir  
				,id AS id_web 
				,"1899-12-30" AS data_alteracao  
				,"',NOW(), '" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/atendimento_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.atendimento
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO atendimento' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_atendimento_fornecedor"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_atendimento_fornecedor`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor IS NULL || id_fornecedor = "" || DATE(id_fornecedor) = "0000-00-00",0,id_fornecedor) USING utf8)) AS id_fornecedor 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_atendimento IS NULL || data_atendimento = "" || DATE(data_atendimento) = "0000-00-00","1899-12-30",data_atendimento) USING utf8)) AS data_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(hora_atendimento IS NULL || hora_atendimento = "" || DATE(hora_atendimento) = "0000-00-00","00:00:00",hora_atendimento) USING utf8)) AS hora_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao_atendimento IS NULL || descricao_atendimento = "" || DATE(descricao_atendimento) = "0000-00-00","",descricao_atendimento) USING utf8)) AS descricao_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_atendimento IS NULL || id_tipo_atendimento = "" || DATE(id_tipo_atendimento) = "0000-00-00",0,id_tipo_atendimento) USING utf8)) AS id_tipo_atendimento
				,"" AS alterar   
				,"" AS excluir 
				, id AS id_web
				,"1899-12-30" AS data_alteracao 
				,"',NOW(),'" AS data_sincronismo 
			INTO OUTFILE "/var/lib/mysql-files/atendimento_fornecedor_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.atendimento_fornecedor 
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO atendimento_fornecedor' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_atendimento_funcionario"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_atendimento_funcionario`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT 
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_funcionario IS NULL || id_funcionario = "" || DATE(id_funcionario) = "0000-00-00",0,id_funcionario) USING utf8)) AS id_funcionario 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_atendimento IS NULL || data_atendimento = "" || DATE(data_atendimento) = "0000-00-00","1899-12-30",data_atendimento) USING utf8)) AS data_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(hora_atendimento IS NULL || hora_atendimento = "" || DATE(hora_atendimento) = "0000-00-00","00:00:00",hora_atendimento) USING utf8)) AS hora_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao_atendimento IS NULL || descricao_atendimento = "" || DATE(descricao_atendimento) = "0000-00-00","",descricao_atendimento) USING utf8)) AS descricao_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_atendimento IS NULL || id_tipo_atendimento = "" || DATE(id_tipo_atendimento) = "0000-00-00",0,id_tipo_atendimento) USING utf8)) AS id_tipo_atendimento 
				,"" AS alterar   
				,"" AS excluir 
				, id AS id_web
				,"1899-12-30" AS data_alteracao 
				,"',NOW(),'" AS data_sincronismo 
			INTO OUTFILE "/var/lib/mysql-files/atendimento_funcionario_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.atendimento_funcionario
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO atendimento_funcionario' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_atendimento_transportadora"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_atendimento_transportadora`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_transportadora IS NULL || id_transportadora = "" || DATE(id_transportadora) = "0000-00-00",0,id_transportadora) USING utf8)) AS id_transportadora 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_atendimento IS NULL || data_atendimento = "" || DATE(data_atendimento) = "0000-00-00","1899-12-30",data_atendimento) USING utf8)) AS data_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(hora_atendimento IS NULL || hora_atendimento = "" || DATE(hora_atendimento) = "0000-00-00","00:00:00",hora_atendimento) USING utf8)) AS hora_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao_atendimento IS NULL || descricao_atendimento = "" || DATE(descricao_atendimento) = "0000-00-00","",descricao_atendimento) USING utf8)) AS descricao_atendimento 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_atendimento IS NULL || id_tipo_atendimento = "" || DATE(id_tipo_atendimento) = "0000-00-00",0,id_tipo_atendimento) USING utf8)) AS id_tipo_atendimento
								,"" AS alterar   
								,"" AS excluir 
								, id AS id_web
								,"1899-12-30" AS data_alteracao 
								,"',NOW(),'" AS data_sincronismo 
							INTO OUTFILE "/var/lib/mysql-files/atendimento_transportadora_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
				FROM base_web_control.atendimento_transportadora
				WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO atendimento_transportadora' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_cadastro_imposto_padrao"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_cadastro_imposto_padrao`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(origem_nfe IS NULL || origem_nfe = "" || DATE(origem_nfe) = "0000-00-00",0,origem_nfe) USING utf8)) AS origem_nfe
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dentro_estado IS NULL || cfop_dentro_estado = "" || DATE(cfop_dentro_estado) = "0000-00-00","",cfop_dentro_estado) USING utf8)) AS cfop_dentro_estado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_fora_estado IS NULL || cfop_fora_estado = "" || DATE(cfop_fora_estado) = "0000-00-00","",cfop_fora_estado) USING utf8)) AS cfop_fora_estado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_imposto IS NULL || tipo_imposto = "" || DATE(tipo_imposto) = "0000-00-00","I",tipo_imposto) USING utf8)) AS tipo_imposto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms IS NULL || icms = "" || DATE(icms) = "0000-00-00",0,icms) USING utf8)) AS icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_modbc IS NULL || icms_modbc = "" || DATE(icms_modbc) = "0000-00-00","",icms_modbc) USING utf8)) AS icms_modbc
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_predbc IS NULL || icms_predbc = "" || DATE(icms_predbc) = "0000-00-00",0,icms_predbc) USING utf8)) AS icms_predbc
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_pICMS IS NULL || icms_pICMS = "" || DATE(icms_pICMS) = "0000-00-00",0,icms_pICMS) USING utf8)) AS icms_pICMS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_modbcst IS NULL || icms_modbcst = "" || DATE(icms_modbcst) = "0000-00-00","",icms_modbcst) USING utf8)) AS icms_modbcst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_pmvast IS NULL || icms_pmvast = "" || DATE(icms_pmvast) = "0000-00-00",0,icms_pmvast) USING utf8)) AS icms_pmvast
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_predbcst IS NULL || icms_predbcst = "" || DATE(icms_predbcst) = "0000-00-00",0,icms_predbcst) USING utf8)) AS icms_predbcst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_picmsst IS NULL || icms_picmsst = "" || DATE(icms_picmsst) = "0000-00-00",0,icms_picmsst) USING utf8)) AS icms_picmsst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_regimes IS NULL || icms_regimes = "" || DATE(icms_regimes) = "0000-00-00","T",icms_regimes) USING utf8)) AS icms_regimes
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_popepropria IS NULL || icms_popepropria = "" || DATE(icms_popepropria) = "0000-00-00",0,icms_popepropria) USING utf8)) AS icms_popepropria
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_uf IS NULL || icms_uf = "" || DATE(icms_uf) = "0000-00-00","",icms_uf) USING utf8)) AS icms_uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_vl_aliq_calc_cre IS NULL || icms_vl_aliq_calc_cre = "" || DATE(icms_vl_aliq_calc_cre) = "0000-00-00",0,icms_vl_aliq_calc_cre) USING utf8)) AS icms_vl_aliq_calc_cre
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_bc_icms_st_ret_ant IS NULL || icms_bc_icms_st_ret_ant = "" || DATE(icms_bc_icms_st_ret_ant) = "0000-00-00",0,icms_bc_icms_st_ret_ant) USING utf8)) AS icms_bc_icms_st_ret_ant
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_valor_desoneracao IS NULL || icms_valor_desoneracao = "" || DATE(icms_valor_desoneracao) = "0000-00-00",0,icms_valor_desoneracao) USING utf8)) AS icms_valor_desoneracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_motivo_desoneracao IS NULL || icms_motivo_desoneracao = "" || DATE(icms_motivo_desoneracao) = "0000-00-00","",icms_motivo_desoneracao) USING utf8)) AS icms_motivo_desoneracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_percentual_diferimento IS NULL || icms_percentual_diferimento = "" || DATE(icms_percentual_diferimento) = "0000-00-00",0,icms_percentual_diferimento) USING utf8)) AS icms_percentual_diferimento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_st_uf_retido_remetente IS NULL || icms_st_uf_retido_remetente = "" || DATE(icms_st_uf_retido_remetente) = "0000-00-00","",icms_st_uf_retido_remetente) USING utf8)) AS icms_st_uf_retido_remetente
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_st_uf_destino IS NULL || icms_st_uf_destino = "" || DATE(icms_st_uf_destino) = "0000-00-00","",icms_st_uf_destino) USING utf8)) AS icms_st_uf_destino
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi IS NULL || ipi = "" || DATE(ipi) = "0000-00-00",0,ipi) USING utf8)) AS ipi
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_cIEnq IS NULL || ipi_cIEnq = "" || DATE(ipi_cIEnq) = "0000-00-00","",ipi_cIEnq) USING utf8)) AS ipi_cIEnq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_CNPJProd IS NULL || ipi_CNPJProd = "" || DATE(ipi_CNPJProd) = "0000-00-00","",ipi_CNPJProd) USING utf8)) AS ipi_CNPJProd
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_cSelo IS NULL || ipi_cSelo = "" || DATE(ipi_cSelo) = "0000-00-00","",ipi_cSelo) USING utf8)) AS ipi_cSelo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_qSelo IS NULL || ipi_qSelo = "" || DATE(ipi_qSelo) = "0000-00-00",0,ipi_qSelo) USING utf8)) AS ipi_qSelo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_cEnq IS NULL || ipi_cEnq = "" || DATE(ipi_cEnq) = "0000-00-00","",ipi_cEnq) USING utf8)) AS ipi_cEnq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_qUnid IS NULL || ipi_qUnid = "" || DATE(ipi_qUnid) = "0000-00-00",0,ipi_qUnid) USING utf8)) AS ipi_qUnid
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_pIPI IS NULL || ipi_pIPI = "" || DATE(ipi_pIPI) = "0000-00-00",0,ipi_pIPI) USING utf8)) AS ipi_pIPI
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_tp_calculo IS NULL || ipi_tp_calculo = "" || DATE(ipi_tp_calculo) = "0000-00-00","P",ipi_tp_calculo) USING utf8)) AS ipi_tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_v_aliq IS NULL || ipi_v_aliq = "" || DATE(ipi_v_aliq) = "0000-00-00",0,ipi_v_aliq) USING utf8)) AS ipi_v_aliq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis IS NULL || pis = "" || DATE(pis) = "0000-00-00",0,pis) USING utf8)) AS pis
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis_tp_calculo IS NULL || pis_tp_calculo = "" || DATE(pis_tp_calculo) = "0000-00-00","",pis_tp_calculo) USING utf8)) AS pis_tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis_pPIS IS NULL || pis_pPIS = "" || DATE(pis_pPIS) = "0000-00-00",0,pis_pPIS) USING utf8)) AS pis_pPIS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis_v_aliq IS NULL || pis_v_aliq = "" || DATE(pis_v_aliq) = "0000-00-00",0,pis_v_aliq) USING utf8)) AS pis_v_aliq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pisST_tp_calculo IS NULL || pisST_tp_calculo = "" || DATE(pisST_tp_calculo) = "0000-00-00","",pisST_tp_calculo) USING utf8)) AS pisST_tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pisST_pPIS IS NULL || pisST_pPIS = "" || DATE(pisST_pPIS) = "0000-00-00",0,pisST_pPIS) USING utf8)) AS pisST_pPIS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pisST_v_aliq IS NULL || pisST_v_aliq = "" || DATE(pisST_v_aliq) = "0000-00-00",0,pisST_v_aliq) USING utf8)) AS pisST_v_aliq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins IS NULL || cofins = "" || DATE(cofins) = "0000-00-00",0,cofins) USING utf8)) AS cofins
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_tpcalculo IS NULL || cofins_tpcalculo = "" || DATE(cofins_tpcalculo) = "0000-00-00","P",cofins_tpcalculo) USING utf8)) AS cofins_tpcalculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_aliq_perc IS NULL || cofins_aliq_perc = "" || DATE(cofins_aliq_perc) = "0000-00-00",0,cofins_aliq_perc) USING utf8)) AS cofins_aliq_perc
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_aliq_vlr IS NULL || cofins_aliq_vlr = "" || DATE(cofins_aliq_vlr) = "0000-00-00",0,cofins_aliq_vlr) USING utf8)) AS cofins_aliq_vlr
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_st_tpcalculo IS NULL || cofins_st_tpcalculo = "" || DATE(cofins_st_tpcalculo) = "0000-00-00","P",cofins_st_tpcalculo) USING utf8)) AS cofins_st_tpcalculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_st_aliq_perc IS NULL || cofins_st_aliq_perc = "" || DATE(cofins_st_aliq_perc) = "0000-00-00",0,cofins_st_aliq_perc) USING utf8)) AS cofins_st_aliq_perc
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_st_aliq_vlr IS NULL || cofins_st_aliq_vlr = "" || DATE(cofins_st_aliq_vlr) = "0000-00-00",0,cofins_st_aliq_vlr) USING utf8)) AS cofins_st_aliq_vlr
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(regime_tributacao IS NULL || regime_tributacao = "" || DATE(regime_tributacao) = "0000-00-00","",regime_tributacao) USING utf8)) AS regime_tributacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_regime_tributacao IS NULL || issqn_regime_tributacao = "" || DATE(issqn_regime_tributacao) = "0000-00-00","",issqn_regime_tributacao) USING utf8)) AS issqn_regime_tributacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_percentual_aliquota IS NULL || issqn_percentual_aliquota = "" || DATE(issqn_percentual_aliquota) = "0000-00-00",0,issqn_percentual_aliquota) USING utf8)) AS issqn_percentual_aliquota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_uf IS NULL || issqn_uf = "" || DATE(issqn_uf) = "0000-00-00","",issqn_uf) USING utf8)) AS issqn_uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_id_municipio IS NULL || issqn_id_municipio = "" || DATE(issqn_id_municipio) = "0000-00-00","",issqn_id_municipio) USING utf8)) AS issqn_id_municipio
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_id_lista_servicos IS NULL || issqn_id_lista_servicos = "" || DATE(issqn_id_lista_servicos) = "0000-00-00","",issqn_id_lista_servicos) USING utf8)) AS issqn_id_lista_servicos
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_id_exigibilidade IS NULL || issqn_id_exigibilidade = "" || DATE(issqn_id_exigibilidade) = "0000-00-00",0,issqn_id_exigibilidade) USING utf8)) AS issqn_id_exigibilidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_incentivo_fiscal IS NULL || issqn_incentivo_fiscal = "" || DATE(issqn_incentivo_fiscal) = "0000-00-00","S",issqn_incentivo_fiscal) USING utf8)) AS issqn_incentivo_fiscal
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_valor_deducoes IS NULL || issqn_valor_deducoes = "" || DATE(issqn_valor_deducoes) = "0000-00-00",0,issqn_valor_deducoes) USING utf8)) AS issqn_valor_deducoes
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_valor_outras_retencoes IS NULL || issqn_valor_outras_retencoes = "" || DATE(issqn_valor_outras_retencoes) = "0000-00-00",0,issqn_valor_outras_retencoes) USING utf8)) AS issqn_valor_outras_retencoes
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_valor_desconto_condicionado IS NULL || issqn_valor_desconto_condicionado = "" || DATE(issqn_valor_desconto_condicionado) = "0000-00-00",0,issqn_valor_desconto_condicionado) USING utf8)) AS issqn_valor_desconto_condicionado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_valor_retencao IS NULL || issqn_valor_retencao = "" || DATE(issqn_valor_retencao) = "0000-00-00",0,issqn_valor_retencao) USING utf8)) AS issqn_valor_retencao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_codigo_servico IS NULL || issqn_codigo_servico = "" || DATE(issqn_codigo_servico) = "0000-00-00","",issqn_codigo_servico) USING utf8)) AS issqn_codigo_servico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_uf_incidencia IS NULL || issqn_uf_incidencia = "" || DATE(issqn_uf_incidencia) = "0000-00-00","",issqn_uf_incidencia) USING utf8)) AS issqn_uf_incidencia
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_id_municipio_incidencia IS NULL || issqn_id_municipio_incidencia = "" || DATE(issqn_id_municipio_incidencia) = "0000-00-00",0,issqn_id_municipio_incidencia) USING utf8)) AS issqn_id_municipio_incidencia
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_processo IS NULL || issqn_processo = "" || DATE(issqn_processo) = "0000-00-00","",issqn_processo) USING utf8)) AS issqn_processo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_situacao IS NULL || issqn_situacao = "" || DATE(issqn_situacao) = "0000-00-00","t",issqn_situacao) USING utf8)) AS issqn_situacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_cmc IS NULL || issqn_cmc = "" || DATE(issqn_cmc) = "0000-00-00","",issqn_cmc) USING utf8)) AS issqn_cmc
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_cpf IS NULL || issqn_cpf = "" || DATE(issqn_cpf) = "0000-00-00","",issqn_cpf) USING utf8)) AS issqn_cpf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_senha_cmc_cpf IS NULL || issqn_senha_cmc_cpf = "" || DATE(issqn_senha_cmc_cpf) = "0000-00-00","",issqn_senha_cmc_cpf) USING utf8)) AS issqn_senha_cmc_cpf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_padrao IS NULL || issqn_padrao = "" || DATE(issqn_padrao) = "0000-00-00","",issqn_padrao) USING utf8)) AS issqn_padrao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(issqn_assinar_nfs IS NULL || issqn_assinar_nfs = "" || DATE(issqn_assinar_nfs) = "0000-00-00","S",issqn_assinar_nfs) USING utf8)) AS issqn_assinar_nfs
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_d IS NULL || cfop_dev_d = "" || DATE(cfop_dev_d) = "0000-00-00","",cfop_dev_d) USING utf8)) AS cfop_dev_d
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_f IS NULL || cfop_dev_f = "" || DATE(cfop_dev_f) = "0000-00-00","",cfop_dev_f) USING utf8)) AS cfop_dev_f
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_gar_d IS NULL || cfop_dev_gar_d = "" || DATE(cfop_dev_gar_d) = "0000-00-00","",cfop_dev_gar_d) USING utf8)) AS cfop_dev_gar_d
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_gar_f IS NULL || cfop_dev_gar_f = "" || DATE(cfop_dev_gar_f) = "0000-00-00","",cfop_dev_gar_f) USING utf8)) AS cfop_dev_gar_f
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_out_d IS NULL || cfop_dev_out_d = "" || DATE(cfop_dev_out_d) = "0000-00-00","",cfop_dev_out_d) USING utf8)) AS cfop_dev_out_d
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_dev_out_f IS NULL || cfop_dev_out_f = "" || DATE(cfop_dev_out_f) = "0000-00-00","",cfop_dev_out_f) USING utf8)) AS cfop_dev_out_f
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_ent_d IS NULL || cfop_ent_d = "" || DATE(cfop_ent_d) = "0000-00-00","",cfop_ent_d) USING utf8)) AS cfop_ent_d
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cfop_ent_f IS NULL || cfop_ent_f = "" || DATE(cfop_ent_f) = "0000-00-00","",cfop_ent_f) USING utf8)) AS cfop_ent_f
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_arquivo_certificado IS NULL || nome_arquivo_certificado = "" || DATE(nome_arquivo_certificado) = "0000-00-00","",nome_arquivo_certificado) USING utf8)) AS nome_arquivo_certificado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(senha_certificado IS NULL || senha_certificado = "" || DATE(senha_certificado) = "0000-00-00","",senha_certificado) USING utf8)) AS senha_certificado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfe_tipo_ambiente IS NULL || nfe_tipo_ambiente = "" || DATE(nfe_tipo_ambiente) = "0000-00-00","P",nfe_tipo_ambiente) USING utf8)) AS nfe_tipo_ambiente
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfe_sequencia_nota IS NULL || nfe_sequencia_nota = "" || DATE(nfe_sequencia_nota) = "0000-00-00",0,nfe_sequencia_nota) USING utf8)) AS nfe_sequencia_nota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfe_formato IS NULL || nfe_formato = "" || DATE(nfe_formato) = "0000-00-00","R",nfe_formato) USING utf8)) AS nfe_formato
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_tipo_ambiente IS NULL || nfce_tipo_ambiente = "" || DATE(nfce_tipo_ambiente) = "0000-00-00","P",nfce_tipo_ambiente) USING utf8)) AS nfce_tipo_ambiente
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_sequencia_nota IS NULL || nfce_sequencia_nota = "" || DATE(nfce_sequencia_nota) = "0000-00-00",0,nfce_sequencia_nota) USING utf8)) AS nfce_sequencia_nota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_csc_token IS NULL || nfce_csc_token = "" || DATE(nfce_csc_token) = "0000-00-00","",nfce_csc_token) USING utf8)) AS nfce_csc_token
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_idtoken IS NULL || nfce_idtoken = "" || DATE(nfce_idtoken) = "0000-00-00","",nfce_idtoken) USING utf8)) AS nfce_idtoken
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_data_ativacao IS NULL || nfce_data_ativacao = "" || DATE(nfce_data_ativacao) = "0000-00-00","1899-12-30",nfce_data_ativacao) USING utf8)) AS nfce_data_ativacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nfce_hora_ativacao IS NULL || nfce_hora_ativacao = "" || DATE(nfce_hora_ativacao) = "0000-00-00","00:00:00",nfce_hora_ativacao) USING utf8)) AS nfce_hora_ativacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tributacao_lucro IS NULL || tributacao_lucro = "" || DATE(tributacao_lucro) = "0000-00-00","S",tributacao_lucro) USING utf8)) AS tributacao_lucro
				, id AS id_web
				,"1899-12-30" AS data_alteracao 
				,"',NOW(),'" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/cadastro_imposto_padrao_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
				FROM base_web_control.cadastro_imposto_padrao
				WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO cadastro_imposto_padrao' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_classificacao"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_classificacao`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8)) AS descricao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_anterior IS NULL || id_anterior = "" || DATE(id_anterior) = "0000-00-00",0,id_anterior) USING utf8)) AS id_anterior
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ecommerce IS NULL || ecommerce = "" || DATE(ecommerce) = "0000-00-00","S",ecommerce) USING utf8)) AS ecommerce
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(lixo IS NULL || lixo = "" || DATE(lixo) = "0000-00-00","",lixo) USING utf8)) AS lixo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_class_master IS NULL || id_class_master = "" || DATE(id_class_master) = "0000-00-00","",id_class_master) USING utf8)) AS id_class_master
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(imagem IS NULL || imagem = "" || DATE(imagem) = "0000-00-00","",imagem) USING utf8)) AS imagem
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(show_comanda IS NULL || show_comanda = "" || DATE(show_comanda) = "0000-00-00",0,show_comanda) USING utf8)) AS show_comanda
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_importacao IS NULL || id_importacao = "" || DATE(id_importacao) = "0000-00-00",0,id_importacao) USING utf8)) AS id_importacao
				 , "" AS visualizar
				 , "" AS excluir			
				 ,id AS id_web
				 ,"1899-12-30" AS data_alteracao 
				 ,"',NOW(),'" AS data_sincronismo 	 
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_pai IS NULL || id_pai = "" || DATE(id_pai) = "0000-00-00",0,id_pai) USING utf8)) AS id_pai
 							
				INTO OUTFILE "/var/lib/mysql-files/classificacao_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.classificacao
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO classificacao' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_classificacao_alteracao_valores"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_classificacao_alteracao_valores`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_classificacao IS NULL || id_classificacao = "" || DATE(id_classificacao) = "0000-00-00",0,id_classificacao) USING utf8)) AS id_classificacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_alteracao IS NULL || tipo_alteracao = "" || DATE(tipo_alteracao) = "0000-00-00","D",tipo_alteracao) USING utf8)) AS tipo_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fator_alteracao IS NULL || fator_alteracao = "" || DATE(fator_alteracao) = "0000-00-00","P",fator_alteracao) USING utf8)) AS fator_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_alteracao IS NULL || valor_alteracao = "" || DATE(valor_alteracao) = "0000-00-00",0,valor_alteracao) USING utf8)) AS valor_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario_alteracao IS NULL || id_usuario_alteracao = "" || DATE(id_usuario_alteracao) = "0000-00-00",0,id_usuario_alteracao) USING utf8)) AS id_usuario_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_alteracao IS NULL || data_alteracao = "" || DATE(data_alteracao) = "0000-00-00","1899-12-30",data_alteracao) USING utf8)) AS data_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(desfeito IS NULL || desfeito = "" || DATE(desfeito) = "0000-00-00",0,desfeito) USING utf8)) AS desfeito
				, 0 AS imgdesfazer
				, id AS id_web
				,"',NOW(),'" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/classificacao_alteracao_valores_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.classificacao_alteracao_valores
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO classificacao_alteracao_valores' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_cliente"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_cliente`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
					
					 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_pessoa IS NULL || tipo_pessoa = "" || DATE(tipo_pessoa) = "0000-00-00","F",tipo_pessoa) USING utf8)) AS tipo_pessoa
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj_cpf IS NULL || cnpj_cpf = "" || DATE(cnpj_cpf) = "0000-00-00","",cnpj_cpf) USING utf8)) AS cnpj_cpf
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(rg IS NULL || rg = "" || DATE(rg) = "0000-00-00","",rg) USING utf8)) AS rg
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(inscricao_municipal IS NULL || inscricao_municipal = "" || DATE(inscricao_municipal) = "0000-00-00","",inscricao_municipal) USING utf8)) AS inscricao_municipal
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(inscricao_estadual IS NULL || inscricao_estadual = "" || DATE(inscricao_estadual) = "0000-00-00","",inscricao_estadual) USING utf8)) AS inscricao_estadual
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(inscricao_suframa IS NULL || inscricao_suframa = "" || DATE(inscricao_suframa) = "0000-00-00",0,inscricao_suframa) USING utf8)) AS inscricao_suframa
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome IS NULL || nome = "" || DATE(nome) = "0000-00-00","",nome) USING utf8)) AS nome
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(razao_social IS NULL || razao_social = "" || DATE(razao_social) = "0000-00-00","",razao_social) USING utf8)) AS razao_social
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_log IS NULL || id_tipo_log = "" || DATE(id_tipo_log) = "0000-00-00",0,id_tipo_log) USING utf8)) AS id_tipo_log
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(endereco IS NULL || endereco = "" || DATE(endereco) = "0000-00-00","",endereco) USING utf8)) AS endereco
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(numero IS NULL || numero = "" || DATE(numero) = "0000-00-00","",numero) USING utf8)) AS numero
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(complemento IS NULL || complemento = "" || DATE(complemento) = "0000-00-00","",complemento) USING utf8)) AS complemento
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(bairro IS NULL || bairro = "" || DATE(bairro) = "0000-00-00","",bairro) USING utf8)) AS bairro
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cidade IS NULL || cidade = "" || DATE(cidade) = "0000-00-00","",cidade) USING utf8)) AS cidade
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8)) AS uf
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cep IS NULL || cep = "" || DATE(cep) = "0000-00-00","",cep) USING utf8)) AS cep
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pais IS NULL || pais = "" || DATE(pais) = "0000-00-00","",pais) USING utf8)) AS pais
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(informacoes_adicionais IS NULL || informacoes_adicionais = "" || DATE(informacoes_adicionais) = "0000-00-00","",informacoes_adicionais) USING utf8)) AS informacoes_adicionais
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(email IS NULL || email = "" || DATE(email) = "0000-00-00","",email) USING utf8)) AS email
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(telefone IS NULL || telefone = "" || DATE(telefone) = "0000-00-00","",telefone) USING utf8)) AS telefone
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(celular IS NULL || celular = "" || DATE(celular) = "0000-00-00","",celular) USING utf8)) AS celular
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fax IS NULL || fax = "" || DATE(fax) = "0000-00-00","",fax) USING utf8)) AS fax
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(renda_media IS NULL || renda_media = "" || DATE(renda_media) = "0000-00-00",0,renda_media) USING utf8)) AS renda_media
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(empresa_trabalha IS NULL || empresa_trabalha = "" || DATE(empresa_trabalha) = "0000-00-00","",empresa_trabalha) USING utf8)) AS empresa_trabalha
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cargo IS NULL || cargo = "" || DATE(cargo) = "0000-00-00","",cargo) USING utf8)) AS cargo
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_empresa IS NULL || fone_empresa = "" || DATE(fone_empresa) = "0000-00-00","",fone_empresa) USING utf8)) AS fone_empresa
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(endereco_empresa IS NULL || endereco_empresa = "" || DATE(endereco_empresa) = "0000-00-00","",endereco_empresa) USING utf8)) AS endereco_empresa
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_referencia_comercial IS NULL || nome_referencia_comercial = "" || DATE(nome_referencia_comercial) = "0000-00-00","",nome_referencia_comercial) USING utf8)) AS nome_referencia_comercial
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(referencia_comercial IS NULL || referencia_comercial = "" || DATE(referencia_comercial) = "0000-00-00","",referencia_comercial) USING utf8)) AS referencia_comercial
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_referencia IS NULL || nome_referencia = "" || DATE(nome_referencia) = "0000-00-00","",nome_referencia) USING utf8)) AS nome_referencia
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(referencia_pessoal IS NULL || referencia_pessoal = "" || DATE(referencia_pessoal) = "0000-00-00","",referencia_pessoal) USING utf8)) AS referencia_pessoal
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_nascimento IS NULL || data_nascimento = "" || DATE(data_nascimento) = "0000-00-00","1899-12-30",data_nascimento) USING utf8)) AS data_nascimento
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_pai IS NULL || nome_pai = "" || DATE(nome_pai) = "0000-00-00","",nome_pai) USING utf8)) AS nome_pai
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_mae IS NULL || nome_mae = "" || DATE(nome_mae) = "0000-00-00","",nome_mae) USING utf8)) AS nome_mae
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(numero_titulo IS NULL || numero_titulo = "" || DATE(numero_titulo) = "0000-00-00",0,numero_titulo) USING utf8)) AS numero_titulo
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(zona IS NULL || zona = "" || DATE(zona) = "0000-00-00","",zona) USING utf8)) AS zona
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(secao IS NULL || secao = "" || DATE(secao) = "0000-00-00","",secao) USING utf8)) AS secao
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(placa IS NULL || placa = "" || DATE(placa) = "0000-00-00",0,placa) USING utf8)) AS placa
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_pai IS NULL || fone_pai = "" || DATE(fone_pai) = "0000-00-00","",fone_pai) USING utf8)) AS fone_pai
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_mae IS NULL || fone_mae = "" || DATE(fone_mae) = "0000-00-00","",fone_mae) USING utf8)) AS fone_mae
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(socio1 IS NULL || socio1 = "" || DATE(socio1) = "0000-00-00","",socio1) USING utf8)) AS socio1
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(socio2 IS NULL || socio2 = "" || DATE(socio2) = "0000-00-00","",socio2) USING utf8)) AS socio2
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_socio1 IS NULL || fone_socio1 = "" || DATE(fone_socio1) = "0000-00-00","",fone_socio1) USING utf8)) AS fone_socio1
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_socio2 IS NULL || fone_socio2 = "" || DATE(fone_socio2) = "0000-00-00","",fone_socio2) USING utf8)) AS fone_socio2
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(senha_ecommerce IS NULL || senha_ecommerce = "" || DATE(senha_ecommerce) = "0000-00-00","",senha_ecommerce) USING utf8)) AS senha_ecommerce
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(isento_icms IS NULL || isento_icms = "" || DATE(isento_icms) = "0000-00-00","S",isento_icms) USING utf8)) AS isento_icms
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(sincronizado IS NULL || sincronizado = "" || DATE(sincronizado) = "0000-00-00",0,sincronizado) USING utf8)) AS sincronizado
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(obs IS NULL || obs = "" || DATE(obs) = "0000-00-00",0,obs) USING utf8)) AS obs
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tabela_preco IS NULL || tabela_preco = "" || DATE(tabela_preco) = "0000-00-00",0,tabela_preco) USING utf8)) AS tabela_preco
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(estado_civil IS NULL || estado_civil = "" || DATE(estado_civil) = "0000-00-00",0,estado_civil) USING utf8)) AS estado_civil
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_conjuge IS NULL || nome_conjuge = "" || DATE(nome_conjuge) = "0000-00-00","",nome_conjuge) USING utf8)) AS nome_conjuge
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_residencia IS NULL || tipo_residencia = "" || DATE(tipo_residencia) = "0000-00-00","",tipo_residencia) USING utf8)) AS tipo_residencia
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(foto IS NULL || foto = "" || DATE(foto) = "0000-00-00","",foto) USING utf8)) AS foto
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(orgao_expedidor IS NULL || orgao_expedidor = "" || DATE(orgao_expedidor) = "0000-00-00","",orgao_expedidor) USING utf8)) AS orgao_expedidor
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(naturalidade IS NULL || naturalidade = "" || DATE(naturalidade) = "0000-00-00","",naturalidade) USING utf8)) AS naturalidade
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_importacao IS NULL || id_importacao = "" || DATE(id_importacao) = "0000-00-00",0,id_importacao) USING utf8)) AS id_importacao
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_funcionario IS NULL || id_funcionario = "" || DATE(id_funcionario) = "0000-00-00",0,id_funcionario) USING utf8)) AS id_funcionario
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(limite_credito IS NULL || limite_credito = "" || DATE(limite_credito) = "0000-00-00",0,limite_credito) USING utf8)) AS limite_credito
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(limite_credito_cc IS NULL || limite_credito_cc = "" || DATE(limite_credito_cc) = "0000-00-00",0,limite_credito_cc) USING utf8)) AS limite_credito_cc
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_compra IS NULL || tipo_compra = "" || DATE(tipo_compra) = "0000-00-00","A",tipo_compra) USING utf8)) AS tipo_compra
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(origem_cadastro IS NULL || origem_cadastro = "" || DATE(origem_cadastro) = "0000-00-00",0,origem_cadastro) USING utf8)) AS origem_cadastro
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro_user IS NULL || data_cadastro_user = "" || DATE(data_cadastro_user) = "0000-00-00","1899-12-30",data_cadastro_user) USING utf8)) AS data_cadastro_user	
					, "" AS visualizar
					, "" AS excluir
					, id AS id_web
					, "1899-12-30" AS data_alteracao
					, "',NOW(),'" AS data_sincronismo
					INTO OUTFILE "/var/lib/mysql-files/cliente_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
				FROM base_web_control.cliente
				WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO cliente' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_cliente_forma_pagamento"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_cliente_forma_pagamento`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
 	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT('SELECT  
				
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_forma_pagamento IS NULL || id_forma_pagamento = "" || DATE(id_forma_pagamento) = "0000-00-00",0,id_forma_pagamento) USING utf8)) AS id_forma_pagamento
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(num_parcelas IS NULL || num_parcelas = "" || DATE(num_parcelas) = "0000-00-00",0,num_parcelas) USING utf8)) AS num_parcelas
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(juro_mes IS NULL || juro_mes = "" || DATE(juro_mes) = "0000-00-00",0,juro_mes) USING utf8)) AS juro_mes
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cod_convenio IS NULL || cod_convenio = "" || DATE(cod_convenio) = "0000-00-00","",cod_convenio) USING utf8)) AS cod_convenio
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj_adm IS NULL || cnpj_adm = "" || DATE(cnpj_adm) = "0000-00-00","",cnpj_adm) USING utf8)) AS cnpj_adm
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(chave_e_commerce IS NULL || chave_e_commerce = "" || DATE(chave_e_commerce) = "0000-00-00","",chave_e_commerce) USING utf8)) AS chave_e_commerce
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(entrada IS NULL || entrada = "" || DATE(entrada) = "0000-00-00",0,entrada) USING utf8)) AS entrada
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ordem_visual IS NULL || ordem_visual = "" || DATE(ordem_visual) = "0000-00-00",0,ordem_visual) USING utf8)) AS ordem_visual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro				 
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(loja_virtual IS NULL || loja_virtual = "" || DATE(loja_virtual) = "0000-00-00",0,loja_virtual) USING utf8)) AS loja_virtual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00",0,ativo) USING utf8)) AS ativo
				  ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(baixa_automatica IS NULL || baixa_automatica = "" || DATE(baixa_automatica) = "0000-00-00","S",baixa_automatica) USING utf8)) AS baixa_automatica
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/cliente_forma_pagamento_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.cliente_forma_pagamento
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO cliente_forma_pagamento' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_cliente_veiculo"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_cliente_veiculo`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cliente IS NULL || id_cliente = "" || DATE(id_cliente) = "0000-00-00",0,id_cliente) USING utf8)) AS id_cliente
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cv.placa IS NULL || cv.placa = "" || DATE(cv.placa) = "0000-00-00","",cv.placa) USING utf8)) AS placa
				, "" AS modelo
				, cv.id AS id_web
				,"1899-12-30" AS data_alteracao 
				,"',NOW(),'" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/cliente_veiculo_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.cliente_veiculo cv
			INNER JOIN base_web_control.cliente c
			ON c.id = cv.id_cliente
			WHERE c.id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO cliente_veiculo' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_contas_empresa"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_contas_empresa`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				  base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(agencia IS NULL || agencia = "" || DATE(agencia) = "0000-00-00",0,agencia) USING utf8)) AS agencia
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(conta IS NULL || conta = "" || DATE(conta) = "0000-00-00",0,conta) USING utf8)) AS conta
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(saldo_inicial IS NULL || saldo_inicial = "" || DATE(saldo_inicial) = "0000-00-00",0,saldo_inicial) USING utf8)) AS saldo_inicial
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(limite IS NULL || limite = "" || DATE(limite) = "0000-00-00",0,limite) USING utf8)) AS limite
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(status_conta IS NULL || status_conta = "" || DATE(status_conta) = "0000-00-00","",status_conta) USING utf8)) AS status_conta
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(dt_criacao IS NULL || dt_criacao = "" || DATE(dt_criacao) = "0000-00-00","1899-12-30",dt_criacao) USING utf8)) AS data_criacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_banco IS NULL || id_banco = "" || DATE(id_banco) = "0000-00-00","",id_banco) USING utf8)) AS id_banco
				,id AS id_web 
				,"1899-12-30" AS data_alteracao  
				,"',NOW(), '" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/contas_empresa_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.contas_empresa
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO contas_empresas' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_credenciadora_cartao"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_credenciadora_cartao`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				 
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome IS NULL || nome = "" || DATE(nome) = "0000-00-00","",nome) USING utf8)) AS nome
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj IS NULL || cnpj = "" || DATE(cnpj) = "0000-00-00","",cnpj) USING utf8)) AS cnpj
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				, id AS id_web
				,"1899-12-30" AS data_alteracao 
				,"',NOW(),'" AS data_sincronismo 
				INTO OUTFILE "/var/lib/mysql-files/credenciadora_cartao_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
				FROM base_web_control.credenciadora_cartao
				WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO credenciadora_cartao' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_credenciadoras_fixas_ignorar"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_credenciadoras_fixas_ignorar`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
			base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_credenciadora_fixa IS NULL || id_credenciadora_fixa = "" || DATE(id_credenciadora_fixa) = "0000-00-00",0,id_credenciadora_fixa) USING utf8)) AS id_credenciadora_fixa
			, id AS id_web
			, "1899-12-30" AS data_alteracao
			, "',NOW(),'" AS data_sincronismo
		INTO OUTFILE "/var/lib/mysql-files/credenciadoras_fixas_ignorar_',p_id_cadastro,'.csv"
		FIELDS TERMINATED BY ";" 
		LINES TERMINATED BY "\n"
		FROM base_web_control.credenciadoras_fixas_ignorar
		WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO credenciadoras_fixas_ignorar' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_fornecedor"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_fornecedor`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(razao_social IS NULL || razao_social = "" || DATE(razao_social) = "0000-00-00","",razao_social) USING utf8)) AS razao_social
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fantasia IS NULL || fantasia = "" || DATE(fantasia) = "0000-00-00","",fantasia) USING utf8)) AS fantasia
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(contato IS NULL || contato = "" || DATE(contato) = "0000-00-00","",contato) USING utf8)) AS contato
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj_cpf IS NULL || cnpj_cpf = "" || DATE(cnpj_cpf) = "0000-00-00","",cnpj_cpf) USING utf8)) AS cnpj_cpf
,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(email IS NULL || email = "" || DATE(email) = "0000-00-00","",email) USING utf8)) AS email
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(site IS NULL || site = "" || DATE(site) = "0000-00-00","",site) USING utf8)) AS site
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(skype IS NULL || skype = "" || DATE(skype) = "0000-00-00","",skype) USING utf8)) AS skype
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(endereco IS NULL || endereco = "" || DATE(endereco) = "0000-00-00","",endereco) USING utf8)) AS endereco
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(numero IS NULL || numero = "" || DATE(numero) = "0000-00-00","",numero) USING utf8)) AS numero
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(complemento IS NULL || complemento = "" || DATE(complemento) = "0000-00-00","",complemento) USING utf8)) AS complemento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cep IS NULL || cep = "" || DATE(cep) = "0000-00-00","",cep) USING utf8)) AS cep
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(bairro IS NULL || bairro = "" || DATE(bairro) = "0000-00-00","",bairro) USING utf8)) AS bairro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cidade IS NULL || cidade = "" || DATE(cidade) = "0000-00-00","",cidade) USING utf8)) AS cidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8)) AS uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(informacoes_adicionais IS NULL || informacoes_adicionais = "" || DATE(informacoes_adicionais) = "0000-00-00","",informacoes_adicionais) USING utf8)) AS informacoes_adicionais				 
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_log IS NULL || id_tipo_log = "" || DATE(id_tipo_log) = "0000-00-00",0,id_tipo_log) USING utf8)) AS id_tipo_log
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_cadastro IS NULL || tipo_cadastro = "" || DATE(tipo_cadastro) = "0000-00-00","F",tipo_cadastro) USING utf8)) AS tipo_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tmp IS NULL || id_tmp = "" || DATE(id_tmp) = "0000-00-00",0,id_tmp) USING utf8)) AS id_tmp
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(rgie IS NULL || rgie = "" || DATE(rgie) = "0000-00-00","",rgie) USING utf8)) AS rgie
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(insc_estadual IS NULL || insc_estadual = "" || DATE(insc_estadual) = "0000-00-00","",insc_estadual) USING utf8)) AS insc_estadual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(insc_municipal IS NULL || insc_municipal = "" || DATE(insc_municipal) = "0000-00-00","",insc_municipal) USING utf8)) AS insc_municipal
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_forn_master IS NULL || id_forn_master = "" || DATE(id_forn_master) = "0000-00-00",0,id_forn_master) USING utf8)) AS id_forn_master
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_fundacao IS NULL || data_fundacao = "" || DATE(data_fundacao) = "0000-00-00","1899-12-30",data_fundacao) USING utf8)) AS data_fundacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(prazo_entrega_produtos IS NULL || prazo_entrega_produtos = "" || DATE(prazo_entrega_produtos) = "0000-00-00",0,prazo_entrega_produtos) USING utf8)) AS prazo_entrega_produtos
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(telefone IS NULL || telefone = "" || DATE(telefone) = "0000-00-00","",telefone) USING utf8)) AS telefone
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fax IS NULL || fax = "" || DATE(fax) = "0000-00-00","",fax) USING utf8)) AS fax
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(celular IS NULL || celular = "" || DATE(celular) = "0000-00-00","",celular) USING utf8)) AS celular				 
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor_servico IS NULL || id_fornecedor_servico = "" || DATE(id_fornecedor_servico) = "0000-00-00",0,id_fornecedor_servico) USING utf8)) AS id_fornecedor_servico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_tmp IS NULL || fone_tmp = "" || DATE(fone_tmp) = "0000-00-00","",fone_tmp) USING utf8)) AS fone_tmp
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_importacao IS NULL || id_importacao = "" || DATE(id_importacao) = "0000-00-00",0,id_importacao) USING utf8)) AS id_importacao
				 , "" AS visualizar
				 , "" AS excluir
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(isento_icms IS NULL || isento_icms = "" || DATE(isento_icms) = "0000-00-00","S",isento_icms) USING utf8)) AS isento_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_pessoa IS NULL || tipo_pessoa = "" || DATE(tipo_pessoa) = "0000-00-00","F",tipo_pessoa) USING utf8)) AS tipo_pessoa
				 , id AS id_web
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_alteracao IS NULL || data_alteracao = "" || DATE(data_alteracao) = "0000-00-00","1899-12-30",data_alteracao) USING utf8)) AS data_alteracao
				 ,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/fornecedor_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
		FROM base_web_control.fornecedor
		WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO fornecedor' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_fornecedor_banco"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_fornecedor_banco`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
		
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	
			
	SET @sql = CONCAT(' SELECT  
					
					 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor IS NULL || id_fornecedor = "" || DATE(id_fornecedor) = "0000-00-00",0,id_fornecedor) USING utf8)) AS id_fornecedor
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_banco IS NULL || id_banco = "" || DATE(id_banco) = "0000-00-00",0,id_banco) USING utf8)) AS id_banco
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(agencia IS NULL || agencia = "" || DATE(agencia) = "0000-00-00","",agencia) USING utf8)) AS agencia
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(conta IS NULL || conta = "" || DATE(conta) = "0000-00-00","",conta) USING utf8)) AS conta
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(titular IS NULL || titular = "" || DATE(titular) = "0000-00-00","",titular) USING utf8)) AS titular
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(titular_cpfcnpj IS NULL || titular_cpfcnpj = "" || DATE(titular_cpfcnpj) = "0000-00-00","",titular_cpfcnpj) USING utf8)) AS titular_cpfcnpj
					 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_conta IS NULL || tipo_conta = "" || DATE(tipo_conta) = "0000-00-00","C",tipo_conta) USING utf8)) AS tipo_conta
					, "" AS insere
					, "" AS excluir
					, "" AS situacao
					, fb.id AS id_web
					, "1899-12-30" AS data_alteracao
					, "',NOW(),'" AS data_sincronismo
					INTO OUTFILE "/var/lib/mysql-files/fornecedor_banco_',p_id_cadastro,'.csv"
								FIELDS TERMINATED BY ";" 
								LINES TERMINATED BY "\n"
				FROM base_web_control.fornecedor_banco fb
				INNER JOIN base_web_control.fornecedor f
				ON f.id = fb.id_fornecedor
				WHERE f.id_cadastro = ',p_id_cadastro,'');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO fornecedor_banco' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_fornecedor_produto"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_fornecedor_produto`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
			base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor IS NULL || id_fornecedor = "" || DATE(id_fornecedor) = "0000-00-00",0,id_fornecedor) USING utf8)) AS id_fornecedor
			,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8)) AS descricao
			,"" AS insere
			,"" AS excluir
			,"" AS situacao
			,fp.id AS id_web
			,"1899-12-30" AS data_alteracao
			,"',NOW(),'" AS data_sincronismo
			INTO OUTFILE "/var/lib/mysql-files/fornecedor_produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
		FROM base_web_control.fornecedor_produto fp
		INNER JOIN base_web_control.fornecedor f	
		ON f.id = fp.id_fornecedor
		WHERE f.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO fornecedor_produto' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_fornecedor_transportadora"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_fornecedor_transportadora`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
			base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor IS NULL || id_fornecedor = "" || DATE(id_fornecedor) = "0000-00-00",0,id_fornecedor) USING utf8)) AS id_fornecedor
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8)) AS descricao
			, "" AS insere
			, "" AS excluir
			, "" AS situacao
			, ft.id_transportadora AS id_web
			, "1899-12-30" AS data_alteracao
			, "',NOW(),'" AS data_sincronismo
			INTO OUTFILE "/var/lib/mysql-files/fornecedor_transportadora_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
		FROM base_web_control.fornecedor_transportadora ft
		INNER JOIN fornecedor f 
		ON f.id = ft.id_fornecedor
		WHERE f.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO fornecedor_transportadora' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_funcionario"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_funcionario`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome IS NULL || nome = "" || DATE(nome) = "0000-00-00","",nome) USING utf8)) AS nome
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(funcao IS NULL || funcao = "" || DATE(funcao) = "0000-00-00","",funcao) USING utf8)) AS funcao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(email IS NULL || email = "" || DATE(email) = "0000-00-00","",email) USING utf8)) AS email
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_nascimento IS NULL || data_nascimento = "" || DATE(data_nascimento) = "0000-00-00","1899-12-30",data_nascimento) USING utf8)) AS data_nascimento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(sexo IS NULL || sexo = "" || DATE(sexo) = "0000-00-00","",sexo) USING utf8)) AS sexo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_pai IS NULL || nome_pai = "" || DATE(nome_pai) = "0000-00-00","",nome_pai) USING utf8)) AS nome_pai
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_mae IS NULL || nome_mae = "" || DATE(nome_mae) = "0000-00-00","",nome_mae) USING utf8)) AS nome_mae
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(naturalidade IS NULL || naturalidade = "" || DATE(naturalidade) = "0000-00-00","",naturalidade) USING utf8)) AS naturalidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nacionalidade IS NULL || nacionalidade = "" || DATE(nacionalidade) = "0000-00-00","",nacionalidade) USING utf8)) AS nacionalidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(estado_civil IS NULL || estado_civil = "" || DATE(estado_civil) = "0000-00-00",0,estado_civil) USING utf8)) AS estado_civil
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(grau_instrucao IS NULL || grau_instrucao = "" || DATE(grau_instrucao) = "0000-00-00",0,grau_instrucao) USING utf8)) AS grau_instrucao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_log IS NULL || id_tipo_log = "" || DATE(id_tipo_log) = "0000-00-00",0,id_tipo_log) USING utf8)) AS id_tipo_log
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cpf IS NULL || cpf = "" || DATE(cpf) = "0000-00-00","",cpf) USING utf8)) AS cpf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(rg IS NULL || rg = "" || DATE(rg) = "0000-00-00","",rg) USING utf8)) AS rg
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_admissao IS NULL || data_admissao = "" || DATE(data_admissao) = "0000-00-00","1899-12-30",data_admissao) USING utf8)) AS data_admissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(informacoes_adicionais IS NULL || informacoes_adicionais = "" || DATE(informacoes_adicionais) = "0000-00-00","",informacoes_adicionais) USING utf8)) AS informacoes_adicionais
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario_excluir IS NULL || id_usuario_excluir = "" || DATE(id_usuario_excluir) = "0000-00-00",0,id_usuario_excluir) USING utf8)) AS id_usuario_excluir
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis IS NULL || pis = "" || DATE(pis) = "0000-00-00","",pis) USING utf8)) AS pis
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(classificacao IS NULL || classificacao = "" || DATE(classificacao) = "0000-00-00",0,classificacao) USING utf8)) AS classificacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(comissao IS NULL || comissao = "" || DATE(comissao) = "0000-00-00",0,comissao) USING utf8)) AS comissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(comissao_servico IS NULL || comissao_servico = "" || DATE(comissao_servico) = "0000-00-00",0,comissao_servico) USING utf8)) AS comissao_servico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pessoa_recado1 IS NULL || pessoa_recado1 = "" || DATE(pessoa_recado1) = "0000-00-00","",pessoa_recado1) USING utf8)) AS pessoa_recado1
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pessoa_recado2 IS NULL || pessoa_recado2 = "" || DATE(pessoa_recado2) = "0000-00-00","",pessoa_recado2) USING utf8)) AS pessoa_recado2
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_banco IS NULL || id_banco = "" || DATE(id_banco) = "0000-00-00",0,id_banco) USING utf8)) AS id_banco
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(agencia IS NULL || agencia = "" || DATE(agencia) = "0000-00-00","",agencia) USING utf8)) AS agencia
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(conta IS NULL || conta = "" || DATE(conta) = "0000-00-00","",conta) USING utf8)) AS conta
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(titular IS NULL || titular = "" || DATE(titular) = "0000-00-00","",titular) USING utf8)) AS titular
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(titular_cpfcnpj IS NULL || titular_cpfcnpj = "" || DATE(titular_cpfcnpj) = "0000-00-00","",titular_cpfcnpj) USING utf8)) AS titular_cpfcnpj
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(salario IS NULL || salario = "" || DATE(salario) = "0000-00-00",0,salario) USING utf8)) AS salario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(mot_demissao IS NULL || mot_demissao = "" || DATE(mot_demissao) = "0000-00-00","",mot_demissao) USING utf8)) AS mot_demissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_demissao IS NULL || data_demissao = "" || DATE(data_demissao) = "0000-00-00","1899-12-30",data_demissao) USING utf8)) AS data_demissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(foto IS NULL || foto = "" || DATE(foto) = "0000-00-00","",foto) USING utf8)) AS foto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(orgao_expedidor IS NULL || orgao_expedidor = "" || DATE(orgao_expedidor) = "0000-00-00","",orgao_expedidor) USING utf8)) AS orgao_expedidor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(agenda IS NULL || agenda = "" || DATE(agenda) = "0000-00-00",0,agenda) USING utf8)) AS agenda				 
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(endereco IS NULL || endereco = "" || DATE(endereco) = "0000-00-00","",endereco) USING utf8)) AS endereco
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(numero IS NULL || numero = "" || DATE(numero) = "0000-00-00","",numero) USING utf8)) AS numero
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(complemento IS NULL || complemento = "" || DATE(complemento) = "0000-00-00","",complemento) USING utf8)) AS complemento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(bairro IS NULL || bairro = "" || DATE(bairro) = "0000-00-00","",bairro) USING utf8)) AS bairro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cidade IS NULL || cidade = "" || DATE(cidade) = "0000-00-00","",cidade) USING utf8)) AS cidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8)) AS uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cep IS NULL || cep = "" || DATE(cep) = "0000-00-00","",cep) USING utf8)) AS cep
				 , "" AS pais
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(telefone IS NULL || telefone = "" || DATE(telefone) = "0000-00-00","",telefone) USING utf8)) AS telefone
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(celular IS NULL || celular = "" || DATE(celular) = "0000-00-00","",celular) USING utf8)) AS celular
				 , "" AS visualizar
				 , "" AS excluir
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtde_filho IS NULL || qtde_filho = "" || DATE(qtde_filho) = "0000-00-00",0,qtde_filho) USING utf8)) AS qtde_filho
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_recado1 IS NULL || fone_recado1 = "" || DATE(fone_recado1) = "0000-00-00","",fone_recado1) USING utf8)) AS fone_recado1
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_recado2 IS NULL || fone_recado2 = "" || DATE(fone_recado2) = "0000-00-00","",fone_recado2) USING utf8)) AS fone_recado2
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(sincronizado IS NULL || sincronizado = "" || DATE(sincronizado) = "0000-00-00",0,sincronizado) USING utf8)) AS sincronizado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_conta IS NULL || tipo_conta = "" || DATE(tipo_conta) = "0000-00-00","C",tipo_conta) USING utf8)) AS tipo_conta
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_comissao IS NULL || tipo_comissao = "" || DATE(tipo_comissao) = "0000-00-00","R",tipo_comissao) USING utf8)) AS tipo_comissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_comissao_servico IS NULL || tipo_comissao_servico = "" || DATE(tipo_comissao_servico) = "0000-00-00","R",tipo_comissao_servico) USING utf8)) AS tipo_comissao_servico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_funcionario IS NULL || tp_funcionario = "" || DATE(tp_funcionario) = "0000-00-00","G",tp_funcionario) USING utf8)) AS tp_funcionario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_alteracao IS NULL || data_alteracao = "" || DATE(data_alteracao) = "0000-00-00","1899-12-30",data_alteracao) USING utf8)) AS data_alteracao
				 , id AS id_web
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf_naturalidade IS NULL || uf_naturalidade = "" || DATE(uf_naturalidade) = "0000-00-00","",uf_naturalidade) USING utf8)) AS uf_naturalidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_sincronismo IS NULL || data_sincronismo = "" || DATE(data_sincronismo) = "0000-00-00","1899-12-30",data_sincronismo) USING utf8)) AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/funcionario_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.funcionario
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO funcionario' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_funcionario_horario_trabalho"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_funcionario_horario_trabalho`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
			
			 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_funcionario IS NULL || id_funcionario = "" || DATE(id_funcionario) = "0000-00-00",0,id_funcionario) USING utf8)) AS id_funcionario
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_semana IS NULL || id_semana = "" || DATE(id_semana) = "0000-00-00","0",id_semana) USING utf8)) AS id_semana
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(entrada_1 IS NULL || entrada_1 = "" || DATE(entrada_1) = "0000-00-00","",entrada_1) USING utf8)) AS entrada_1
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(saida_1 IS NULL || saida_1 = "" || DATE(saida_1) = "0000-00-00","",saida_1) USING utf8)) AS saida_1
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(entrada_2 IS NULL || entrada_2 = "" || DATE(entrada_2) = "0000-00-00","",entrada_2) USING utf8)) AS entrada_2
			 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(saida_2 IS NULL || saida_2 = "" || DATE(saida_2) = "0000-00-00","",saida_2) USING utf8)) AS saida_2
			, Id AS id_web
			, "1899-12-30" AS data_alteracao
			, "',NOW(),'" AS data_sincronismo
			INTO OUTFILE "/var/lib/mysql-files/funcionario_horario_trabalho_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.funcionario_horario_trabalho
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO funcionario_horario_trabalho' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_grade"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_grade`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
				
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8)) AS id_produto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_grade_atributo_valor IS NULL || id_grade_atributo_valor = "" || DATE(id_grade_atributo_valor) = "0000-00-00","",id_grade_atributo_valor) USING utf8)) AS id_grade_atributo_valor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario_alterou IS NULL || id_usuario_alterou = "" || DATE(id_usuario_alterou) = "0000-00-00",0,id_usuario_alterou) USING utf8)) AS id_usuario_alterou
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(codigo_barra_pai IS NULL || codigo_barra_pai = "" || DATE(codigo_barra_pai) = "0000-00-00","",codigo_barra_pai) USING utf8)) AS codigo_barra_pai
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(codigo_barra IS NULL || codigo_barra = "" || DATE(codigo_barra) = "0000-00-00","",codigo_barra) USING utf8)) AS codigo_barra
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(codigo_interno IS NULL || codigo_interno = "" || DATE(codigo_interno) = "0000-00-00","",codigo_interno) USING utf8)) AS codigo_interno
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_atual IS NULL || qtd_atual = "" || DATE(qtd_atual) = "0000-00-00",0,qtd_atual) USING utf8)) AS qtd_atual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_minima IS NULL || qtd_minima = "" || DATE(qtd_minima) = "0000-00-00",0,qtd_minima) USING utf8)) AS qtd_minima
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_locacao IS NULL || qtd_locacao = "" || DATE(qtd_locacao) = "0000-00-00",0,qtd_locacao) USING utf8)) AS qtd_locacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_locacao_locado IS NULL || qtd_locacao_locado = "" || DATE(qtd_locacao_locado) = "0000-00-00",0,qtd_locacao_locado) USING utf8)) AS qtd_locacao_locado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_custo IS NULL || valor_custo = "" || DATE(valor_custo) = "0000-00-00",0,valor_custo) USING utf8)) AS valor_custo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_varejo_avista IS NULL || valor_varejo_avista = "" || DATE(valor_varejo_avista) = "0000-00-00",0,valor_varejo_avista) USING utf8)) AS valor_varejo_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_varejo_aprazo IS NULL || valor_varejo_aprazo = "" || DATE(valor_varejo_aprazo) = "0000-00-00",0,valor_varejo_aprazo) USING utf8)) AS valor_varejo_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_atacado_avista IS NULL || valor_atacado_avista = "" || DATE(valor_atacado_avista) = "0000-00-00",0,valor_atacado_avista) USING utf8)) AS valor_atacado_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_atacado_aprazo IS NULL || valor_atacado_aprazo = "" || DATE(valor_atacado_aprazo) = "0000-00-00",0,valor_atacado_aprazo) USING utf8)) AS valor_atacado_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porc_varejo_avista IS NULL || porc_varejo_avista = "" || DATE(porc_varejo_avista) = "0000-00-00",0,porc_varejo_avista) USING utf8)) AS porc_varejo_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porc_varejo_aprazo IS NULL || porc_varejo_aprazo = "" || DATE(porc_varejo_aprazo) = "0000-00-00",0,porc_varejo_aprazo) USING utf8)) AS porc_varejo_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porc_atacado_avista IS NULL || porc_atacado_avista = "" || DATE(porc_atacado_avista) = "0000-00-00",0,porc_atacado_avista) USING utf8)) AS porc_atacado_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porc_atacado_aprazo IS NULL || porc_atacado_aprazo = "" || DATE(porc_atacado_aprazo) = "0000-00-00",0,porc_atacado_aprazo) USING utf8)) AS porc_atacado_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00",0,ativo) USING utf8)) AS ativo
				, "" AS alt_estoque
				, "" AS editar 
				, "" AS excluir
				, id_grade AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/grade_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
				FROM base_web_control.grade
				WHERE id_cadastro = ',p_id_cadastro,' ;
				');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO grade' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_grade_atributo"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_grade_atributo`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(atributo IS NULL || atributo = "" || DATE(atributo) = "0000-00-00","",atributo) USING utf8)) AS atributo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00",0,ativo) USING utf8)) AS ativo
				, id_grade_atributo AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/grade_atributo_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.grade_atributo
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO grade_atributo' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_grade_atributo_valor"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_grade_atributo_valor`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_atributo IS NULL || id_atributo = "" || DATE(id_atributo) = "0000-00-00",0,id_atributo) USING utf8)) AS id_atributo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor IS NULL || valor = "" || DATE(valor) = "0000-00-00","",valor) USING utf8)) AS valor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(gav.ativo IS NULL || gav.ativo = "" || DATE(gav.ativo) = "0000-00-00",0,gav.ativo) USING utf8)) AS ativo
				, id_grade_atributo_valor AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/grade_atributo_valor_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.grade_atributo_valor gav
			INNER JOIN base_web_control.grade_atributo ga
			ON ga.id_grade_atributo = gav.id_atributo
			WHERE ga.id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO grade_atributo_valor' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_grade_promocao"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_grade_promocao`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(gp.id_grade IS NULL || gp.id_grade = "" || DATE(gp.id_grade) = "0000-00-00",0,gp.id_grade) USING utf8)) AS id_grade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome IS NULL || nome = "" || DATE(nome) = "0000-00-00","",nome) USING utf8)) AS nome
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(disponivel_inicio IS NULL || disponivel_inicio = "" || DATE(disponivel_inicio) = "0000-00-00","1899-12-30",disponivel_inicio) USING utf8)) AS disponivel_inicio
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(disponivel_final IS NULL || disponivel_final = "" || DATE(disponivel_final) = "0000-00-00","1899-12-30",disponivel_final) USING utf8)) AS disponivel_final
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_valor_varejo_avista IS NULL || promo_valor_varejo_avista = "" || DATE(promo_valor_varejo_avista) = "0000-00-00",0,promo_valor_varejo_avista) USING utf8)) AS promo_valor_varejo_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_valor_varejo_aprazo IS NULL || promo_valor_varejo_aprazo = "" || DATE(promo_valor_varejo_aprazo) = "0000-00-00",0,promo_valor_varejo_aprazo) USING utf8)) AS promo_valor_varejo_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_valor_atacado_avista IS NULL || promo_valor_atacado_avista = "" || DATE(promo_valor_atacado_avista) = "0000-00-00",0,promo_valor_atacado_avista) USING utf8)) AS promo_valor_atacado_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_valor_atacado_aprazo IS NULL || promo_valor_atacado_aprazo = "" || DATE(promo_valor_atacado_aprazo) = "0000-00-00",0,promo_valor_atacado_aprazo) USING utf8)) AS promo_valor_atacado_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_porc_varejo_avista IS NULL || promo_porc_varejo_avista = "" || DATE(promo_porc_varejo_avista) = "0000-00-00",0,promo_porc_varejo_avista) USING utf8)) AS promo_porc_varejo_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_porc_varejo_aprazo IS NULL || promo_porc_varejo_aprazo = "" || DATE(promo_porc_varejo_aprazo) = "0000-00-00",0,promo_porc_varejo_aprazo) USING utf8)) AS promo_porc_varejo_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_porc_atacado_avista IS NULL || promo_porc_atacado_avista = "" || DATE(promo_porc_atacado_avista) = "0000-00-00",0,promo_porc_atacado_avista) USING utf8)) AS promo_porc_atacado_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promo_porc_atacado_aprazo IS NULL || promo_porc_atacado_aprazo = "" || DATE(promo_porc_atacado_aprazo) = "0000-00-00",0,promo_porc_atacado_aprazo) USING utf8)) AS promo_porc_atacado_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario_cadastrou IS NULL || id_usuario_cadastrou = "" || DATE(id_usuario_cadastrou) = "0000-00-00",0,id_usuario_cadastrou) USING utf8)) AS id_usuario_cadastrou
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cadastro IS NULL || cadastro = "" || DATE(cadastro) = "0000-00-00","1899-12-30",cadastro) USING utf8)) AS cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario_deletou IS NULL || id_usuario_deletou = "" || DATE(id_usuario_deletou) = "0000-00-00",0,id_usuario_deletou) USING utf8)) AS id_usuario_deletou
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(deletou IS NULL || deletou = "" || DATE(deletou) = "0000-00-00","1899-12-30",deletou) USING utf8)) AS deletou
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(gp.ativo IS NULL || gp.ativo = "" || DATE(gp.ativo) = "0000-00-00","",gp.ativo) USING utf8)) AS ativo
				, "" AS adicionarpromocao
				, id_grade_promocao AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/grade_promocao_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
		FROM base_web_control.grade_promocao gp
		INNER JOIN base_web_control.grade g
		ON g.id_grade = gp.id_grade
		WHERE g.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO grade_promocao' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_lancamentos_empresas"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_lancamentos_empresas`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_lan IS NULL || id_tipo_lan = "" || DATE(id_tipo_lan) = "0000-00-00",0,id_tipo_lan) USING utf8)) AS id_tipo_lan
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_conta IS NULL || id_conta = "" || DATE(id_conta) = "0000-00-00",0,id_conta) USING utf8)) AS id_conta
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor IS NULL || valor = "" || DATE(valor) = "0000-00-00",0,valor) USING utf8)) AS valor
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(operacao IS NULL || operacao = "" || DATE(operacao) = "0000-00-00","I",operacao) USING utf8)) AS operacao
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_lan IS NULL || data_lan = "" || DATE(data_lan) = "0000-00-00","1899-12-30",data_lan) USING utf8)) AS data_lan
				,id AS id_web 
				,"1899-12-30" AS data_alteracao  
				,"',NOW(), '" AS data_sincronismo 
			INTO OUTFILE "/var/lib/mysql-files/lancamentos_empresas_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.lancamentos_empresas
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO lancamentos_empresas' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_limite_funcionario"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_limite_funcionario`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
					
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_funcionario IS NULL || id_funcionario = "" || DATE(id_funcionario) = "0000-00-00",0,id_funcionario) USING utf8)) AS id_funcionario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_inicio IS NULL || data_inicio = "" || DATE(data_inicio) = "0000-00-00","1899-12-30",data_inicio) USING utf8)) AS data_inicio
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_dias IS NULL || qtd_dias = "" || DATE(qtd_dias) = "0000-00-00",0,qtd_dias) USING utf8)) AS qtd_dias
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor IS NULL || valor = "" || DATE(valor) = "0000-00-00",0,valor) USING utf8)) AS valor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(renovar IS NULL || renovar = "" || DATE(renovar) = "0000-00-00","S",renovar) USING utf8)) AS renovar
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/limite_funcionario_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.limite_funcionario
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO limite_funcionario' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_cupom_fiscal"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_cupom_fiscal`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.id_produto IS NULL || ncf.id_produto = "" || DATE(ncf.id_produto) = "0000-00-00",0,ncf.id_produto) USING utf8)) AS id_produto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.id_cfop IS NULL || ncf.id_cfop = "" || DATE(ncf.id_cfop) = "0000-00-00",0,ncf.id_cfop) USING utf8)) AS id_cfop
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.ncm IS NULL || ncf.ncm = "" || DATE(ncf.ncm) = "0000-00-00","",ncf.ncm) USING utf8)) AS ncm
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.sped IS NULL || ncf.sped = "" || DATE(ncf.sped) = "0000-00-00","",ncf.sped) USING utf8)) AS sped
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.percentual_issqn IS NULL || ncf.percentual_issqn = "" || DATE(ncf.percentual_issqn) = "0000-00-00",0,ncf.percentual_issqn) USING utf8)) AS percentual_issqn
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.cst IS NULL || ncf.cst = "" || DATE(ncf.cst) = "0000-00-00",0,ncf.cst) USING utf8)) AS cst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.codigo_balanca IS NULL || ncf.codigo_balanca = "" || DATE(ncf.codigo_balanca) = "0000-00-00","",ncf.codigo_balanca) USING utf8)) AS codigo_balanca
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.percentual_icms IS NULL || ncf.percentual_icms = "" || DATE(ncf.percentual_icms) = "0000-00-00",0,ncf.percentual_icms) USING utf8)) AS percentual_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.percentual_pis IS NULL || ncf.percentual_pis = "" || DATE(ncf.percentual_pis) = "0000-00-00",0,ncf.percentual_pis) USING utf8)) AS percentual_pis
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.csosn IS NULL || ncf.csosn = "" || DATE(ncf.csosn) = "0000-00-00","",ncf.csosn) USING utf8)) AS csosn
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.totalizador_parcial IS NULL || ncf.totalizador_parcial = "" || DATE(ncf.totalizador_parcial) = "0000-00-00","",ncf.totalizador_parcial) USING utf8)) AS totalizador_parcial
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.percentual_ipi IS NULL || ncf.percentual_ipi = "" || DATE(ncf.percentual_ipi) = "0000-00-00",0,ncf.percentual_ipi) USING utf8)) AS percentual_ipi
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.percentual_cofins IS NULL || ncf.percentual_cofins = "" || DATE(ncf.percentual_cofins) = "0000-00-00",0,ncf.percentual_cofins) USING utf8)) AS percentual_cofins
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.icmsst IS NULL || ncf.icmsst = "" || DATE(ncf.icmsst) = "0000-00-00","",ncf.icmsst) USING utf8)) AS icmsst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.situacao_tributaria IS NULL || ncf.situacao_tributaria = "" || DATE(ncf.situacao_tributaria) = "0000-00-00","",ncf.situacao_tributaria) USING utf8)) AS situacao_tributaria
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.iat IS NULL || ncf.iat = "" || DATE(ncf.iat) = "0000-00-00","",ncf.iat) USING utf8)) AS iat
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncf.ippt IS NULL || ncf.ippt = "" || DATE(ncf.ippt) = "0000-00-00","",ncf.ippt) USING utf8)) AS ippt
				, ncf.id_cupom_fiscal AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_cupom_fiscal_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_cupom_fiscal ncf
			INNER JOIN base_web_control.produto p 
			ON p.id = ncf.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_cupom_fiscal' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_cofins"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_cofins`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				id_produto
				, base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(CST IS NULL || CST = "" || DATE(CST) = "0000-00-00",0,CST) USING utf8)) AS CST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pCOFINS IS NULL || pCOFINS = "" || DATE(pCOFINS) = "0000-00-00",0,pCOFINS) USING utf8)) AS pCOFINS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qBCProd IS NULL || qBCProd = "" || DATE(qBCProd) = "0000-00-00",0,qBCProd) USING utf8)) AS qBCProd
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(v_aliq IS NULL || v_aliq = "" || DATE(v_aliq) = "0000-00-00",0,v_aliq) USING utf8)) AS v_aliq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_calculo IS NULL || tp_calculo = "" || DATE(tp_calculo) = "0000-00-00","P",tp_calculo) USING utf8)) AS tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_imposto IS NULL || tp_imposto = "" || DATE(tp_imposto) = "0000-00-00","A",tp_imposto) USING utf8)) AS tp_imposto
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_cofins_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_COFINS nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_COFINS' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_cofinsst"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_cofinsst`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				0 AS imposto_id	
		  		 , base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pCOFINS IS NULL || pCOFINS = "" || DATE(pCOFINS) = "0000-00-00",0,pCOFINS) USING utf8)) AS pCOFINS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qBCProd IS NULL || qBCProd = "" || DATE(qBCProd) = "0000-00-00",0,qBCProd) USING utf8)) AS qBCProd
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(v_aliq IS NULL || v_aliq = "" || DATE(v_aliq) = "0000-00-00",0,v_aliq) USING utf8)) AS v_aliq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_calculo IS NULL || tp_calculo = "" || DATE(tp_calculo) = "0000-00-00","P",tp_calculo) USING utf8)) AS tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(produto_id IS NULL || produto_id = "" || DATE(produto_id) = "0000-00-00",0,produto_id) USING utf8)) AS produto_id
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_imposto IS NULL || tp_imposto = "" || DATE(tp_imposto) = "0000-00-00","A",tp_imposto) USING utf8)) AS tp_imposto
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_cofinsst_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_COFINSST nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.produto_id
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_COFINSST' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_icms"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_icms`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				id_produto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(orig IS NULL || orig = "" || DATE(orig) = "0000-00-00","",orig) USING utf8)) AS orig
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(CST IS NULL || CST = "" || DATE(CST) = "0000-00-00","",CST) USING utf8)) AS CST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(modBC IS NULL || modBC = "" || DATE(modBC) = "0000-00-00","",modBC) USING utf8)) AS modBC
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pRedBC IS NULL || pRedBC = "" || DATE(pRedBC) = "0000-00-00",0,pRedBC) USING utf8)) AS pRedBC
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pICMS IS NULL || pICMS = "" || DATE(pICMS) = "0000-00-00",0,pICMS) USING utf8)) AS pICMS
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(modBCST IS NULL || modBCST = "" || DATE(modBCST) = "0000-00-00","",modBCST) USING utf8)) AS modBCST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pMVAST IS NULL || pMVAST = "" || DATE(pMVAST) = "0000-00-00",0,pMVAST) USING utf8)) AS pMVAST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pRedBCST IS NULL || pRedBCST = "" || DATE(pRedBCST) = "0000-00-00",0,pRedBCST) USING utf8)) AS pRedBCST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pICMSST IS NULL || pICMSST = "" || DATE(pICMSST) = "0000-00-00",0,pICMSST) USING utf8)) AS pICMSST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(regimes IS NULL || regimes = "" || DATE(regimes) = "0000-00-00","T",regimes) USING utf8)) AS regimes
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pOpePropria IS NULL || pOpePropria = "" || DATE(pOpePropria) = "0000-00-00",0,pOpePropria) USING utf8)) AS pOpePropria
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8)) AS uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vl_aliq_calc_cre IS NULL || vl_aliq_calc_cre = "" || DATE(vl_aliq_calc_cre) = "0000-00-00",0,vl_aliq_calc_cre) USING utf8)) AS vl_aliq_calc_cre
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(bc_icms_st_ret_ant IS NULL || bc_icms_st_ret_ant = "" || DATE(bc_icms_st_ret_ant) = "0000-00-00",0,bc_icms_st_ret_ant) USING utf8)) AS bc_icms_st_ret_ant
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pMVAST_LR IS NULL || pMVAST_LR = "" || DATE(pMVAST_LR) = "0000-00-00",0,pMVAST_LR) USING utf8)) AS pMVAST_LR
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_desoneracao_icms IS NULL || valor_desoneracao_icms = "" || DATE(valor_desoneracao_icms) = "0000-00-00",0,valor_desoneracao_icms) USING utf8)) AS valor_desoneracao_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(motivo_desoneracao_icms IS NULL || motivo_desoneracao_icms = "" || DATE(motivo_desoneracao_icms) = "0000-00-00","",motivo_desoneracao_icms) USING utf8)) AS motivo_desoneracao_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(percentual_diferimento_icms IS NULL || percentual_diferimento_icms = "" || DATE(percentual_diferimento_icms) = "0000-00-00",0,percentual_diferimento_icms) USING utf8)) AS percentual_diferimento_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf_retido_remetente_icms_st IS NULL || uf_retido_remetente_icms_st = "" || DATE(uf_retido_remetente_icms_st) = "0000-00-00","",uf_retido_remetente_icms_st) USING utf8)) AS uf_retido_remetente_icms_st
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf_destino_icms_st IS NULL || uf_destino_icms_st = "" || DATE(uf_destino_icms_st) = "0000-00-00","",uf_destino_icms_st) USING utf8)) AS uf_destino_icms_st
								,"1899-12-30" AS data_alteracao
				,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_icms_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_ICMS nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_ICMS' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_ii"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_ii`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8),"\r",""),"\n","") AS id_produto 
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vBC IS NULL || vBC = "" || DATE(vBC) = "0000-00-00",0,vBC) USING utf8)) AS vBC
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vDespAdu IS NULL || vDespAdu = "" || DATE(vDespAdu) = "0000-00-00",0,vDespAdu) USING utf8)) AS vDespAdu
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vII IS NULL || vII = "" || DATE(vII) = "0000-00-00",0,vII) USING utf8)) AS vII
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vIOF IS NULL || vIOF = "" || DATE(vIOF) = "0000-00-00",0,vIOF) USING utf8)) AS vIOF
				,"1899-12-30" AS data_alteracao
				,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_ii_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_II nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_II' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_ipi"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_ipi`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8),"\r",""),"\n","") AS id_produto 
				
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cIEnq IS NULL || cIEnq = "" || DATE(cIEnq) = "0000-00-00","",cIEnq) USING utf8)) AS cIEnq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(CNPJProd IS NULL || CNPJProd = "" || DATE(CNPJProd) = "0000-00-00","",CNPJProd) USING utf8)) AS CNPJProd
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cSelo IS NULL || cSelo = "" || DATE(cSelo) = "0000-00-00","",cSelo) USING utf8)) AS cSelo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qSelo IS NULL || qSelo = "" || DATE(qSelo) = "0000-00-00",0,qSelo) USING utf8)) AS qSelo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cEnq IS NULL || cEnq = "" || DATE(cEnq) = "0000-00-00","",cEnq) USING utf8)) AS cEnq
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(CST IS NULL || CST = "" || DATE(CST) = "0000-00-00",0,CST) USING utf8)) AS CST
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qUnid IS NULL || qUnid = "" || DATE(qUnid) = "0000-00-00",0,qUnid) USING utf8)) AS qUnid
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pIPI IS NULL || pIPI = "" || DATE(pIPI) = "0000-00-00",0,pIPI) USING utf8)) AS pIPI
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tp_calculo IS NULL || tp_calculo = "" || DATE(tp_calculo) = "0000-00-00","P",tp_calculo) USING utf8)) AS tp_calculo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(v_aliq IS NULL || v_aliq = "" || DATE(v_aliq) = "0000-00-00",0,v_aliq) USING utf8)) AS v_aliq
				,"1899-12-30" AS data_alteracao
				,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_ipi_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_IPI nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	SELECT @sql;
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_IPI' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_issqn"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_issqn`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT('SELECT  
				0 AS imposto_id
				, REPLACE(REPLACE(CONVERT(IF(pAliq IS NULL || pAliq = "" || DATE(pAliq) = "0000-00-00",0,pAliq) USING utf8),"\r",""),"\n","") AS pAliq 
				,REPLACE(REPLACE(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8),"\r",""),"\n","") AS uf 
				,REPLACE(REPLACE(CONVERT(IF(cMunFG IS NULL || cMunFG = "" || DATE(cMunFG) = "0000-00-00","",cMunFG) USING utf8),"\r",""),"\n","") AS cMunFG 
				,REPLACE(REPLACE(CONVERT(IF(cListServ IS NULL || cListServ = "" || DATE(cListServ) = "0000-00-00","",cListServ) USING utf8),"\r",""),"\n","") AS cListServ 
				,REPLACE(REPLACE(CONVERT(IF(tributacao IS NULL || tributacao = "" || DATE(tributacao) = "0000-00-00","N",tributacao) USING utf8),"\r",""),"\n","") AS tributacao 
				,REPLACE(REPLACE(CONVERT(IF(produto_id IS NULL || produto_id = "" || DATE(produto_id) = "0000-00-00",0,produto_id) USING utf8),"\r",""),"\n","") AS produto_id 
				,REPLACE(REPLACE(CONVERT(IF(id_exigibilidade IS NULL || id_exigibilidade = "" || DATE(id_exigibilidade) = "0000-00-00",0,id_exigibilidade) USING utf8),"\r",""),"\n","") AS id_exigibilidade 
				,REPLACE(REPLACE(CONVERT(IF(incentivo_fiscal IS NULL || incentivo_fiscal = "" || DATE(incentivo_fiscal) = "0000-00-00","S",incentivo_fiscal) USING utf8),"\r",""),"\n","") AS incentivo_fiscal 
				,REPLACE(REPLACE(CONVERT(IF(valor_deducoes IS NULL || valor_deducoes = "" || DATE(valor_deducoes) = "0000-00-00",0,valor_deducoes) USING utf8),"\r",""),"\n","") AS valor_deducoes 
				,REPLACE(REPLACE(CONVERT(IF(valor_outras_retencoes IS NULL || valor_outras_retencoes = "" || DATE(valor_outras_retencoes) = "0000-00-00",0,valor_outras_retencoes) USING utf8),"\r",""),"\n","") AS valor_outras_retencoes 
				,REPLACE(REPLACE(CONVERT(IF(valor_desconto_condicionado IS NULL || valor_desconto_condicionado = "" || DATE(valor_desconto_condicionado) = "0000-00-00",0,valor_desconto_condicionado) USING utf8),"\r",""),"\n","") AS valor_desconto_condicionado 
				,REPLACE(REPLACE(CONVERT(IF(valor_retencao IS NULL || valor_retencao = "" || DATE(valor_retencao) = "0000-00-00",0,valor_retencao) USING utf8),"\r",""),"\n","") AS valor_retencao 
				,REPLACE(REPLACE(CONVERT(IF(codigo_servico IS NULL || codigo_servico = "" || DATE(codigo_servico) = "0000-00-00","",codigo_servico) USING utf8),"\r",""),"\n","") AS codigo_servico 
				,REPLACE(REPLACE(CONVERT(IF(uf_incidencia IS NULL || uf_incidencia = "" || DATE(uf_incidencia) = "0000-00-00","",uf_incidencia) USING utf8),"\r",""),"\n","") AS uf_incidencia 
				,REPLACE(REPLACE(CONVERT(IF(id_municipio_incidencia IS NULL || id_municipio_incidencia = "" || DATE(id_municipio_incidencia) = "0000-00-00",0,id_municipio_incidencia) USING utf8),"\r",""),"\n","") AS id_municipio_incidencia 
				,REPLACE(REPLACE(CONVERT(IF(processo IS NULL || processo = "" || DATE(processo) = "0000-00-00","",processo) USING utf8),"\r",""),"\n","") AS processo 
				, issqn_id AS id_web
				,"1899-12-30" AS  data_alteracao
				,"',NOW(),'" AS data_sincronismo
								
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_issqn_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_ISSQN nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.produto_id
			WHERE p.id_cadastro = ',p_id_cadastro,'');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_ISSQN' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_pis"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_pis`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT('SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8),"\r",""),"\n","") AS id_produto 
				,REPLACE(REPLACE(CONVERT(IF(tp_calculo IS NULL || tp_calculo = "" || DATE(tp_calculo) = "0000-00-00","",tp_calculo) USING utf8),"\r",""),"\n","") AS tp_calculo 
				,REPLACE(REPLACE(CONVERT(IF(CST IS NULL || CST = "" || DATE(CST) = "0000-00-00",0,CST) USING utf8),"\r",""),"\n","") AS CST 
				,REPLACE(REPLACE(CONVERT(IF(pPIS IS NULL || pPIS = "" || DATE(pPIS) = "0000-00-00",0,pPIS) USING utf8),"\r",""),"\n","") AS pPIS 
				,REPLACE(REPLACE(CONVERT(IF(v_aliq IS NULL || v_aliq = "" || DATE(v_aliq) = "0000-00-00",0,v_aliq) USING utf8),"\r",""),"\n","") AS v_aliq 
				,REPLACE(REPLACE(CONVERT(IF(tp_imposto IS NULL || tp_imposto = "" || DATE(tp_imposto) = "0000-00-00","A",tp_imposto) USING utf8),"\r",""),"\n","") AS tp_imposto 
				,"1899-12-30" AS data_alteracao
				,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_pis_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_PIS nf 
			INNER JOIN base_web_control.produto p
			ON p.id = nf.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_PIS' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_nfe_produto_pisst"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_nfe_produto_pisst`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8),"\r",""),"\n","") AS id_produto 
				,REPLACE(REPLACE(CONVERT(IF(tp_calculo IS NULL || tp_calculo = "" || DATE(tp_calculo) = "0000-00-00","",tp_calculo) USING utf8),"\r",""),"\n","") AS tp_calculo 
				,REPLACE(REPLACE(CONVERT(IF(pPIS IS NULL || pPIS = "" || DATE(pPIS) = "0000-00-00",0,pPIS) USING utf8),"\r",""),"\n","") AS pPIS 
				,REPLACE(REPLACE(CONVERT(IF(qBCProd IS NULL || qBCProd = "" || DATE(qBCProd) = "0000-00-00",0,qBCProd) USING utf8),"\r",""),"\n","") AS qBCProd 
				,REPLACE(REPLACE(CONVERT(IF(vAliqProd IS NULL || vAliqProd = "" || DATE(vAliqProd) = "0000-00-00",0,vAliqProd) USING utf8),"\r",""),"\n","") AS vAliqProd 
				,REPLACE(REPLACE(CONVERT(IF(v_aliq IS NULL || v_aliq = "" || DATE(v_aliq) = "0000-00-00",0,v_aliq) USING utf8),"\r",""),"\n","") AS v_aliq 
				,REPLACE(REPLACE(CONVERT(IF(tp_imposto IS NULL || tp_imposto = "" || DATE(tp_imposto) = "0000-00-00","A",tp_imposto) USING utf8),"\r",""),"\n","") AS tp_imposto 
				,"1899-12-30" AS data_alteracao
				,"',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/nfe_produto_pisst_',p_id_cadastro,'.csv"
							FIELDS TERMINATED BY ";" 
							LINES TERMINATED BY "\n"
			FROM base_web_control.nfe_Produto_PISST nfp
			INNER JOIN base_web_control.produto p
			ON p.id = nfp.id_produto
			WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	SELECT @sql;
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO nfe_Produto_PISST' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_produto"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_produto`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8)) AS descricao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_classificacao IS NULL || id_classificacao = "" || DATE(id_classificacao) = "0000-00-00",0,id_classificacao) USING utf8)) AS id_classificacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cor IS NULL || cor = "" || DATE(cor) = "0000-00-00","",cor) USING utf8)) AS cor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cor IS NULL || id_cor = "" || DATE(id_cor) = "0000-00-00",0,id_cor) USING utf8)) AS id_cor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tamanho IS NULL || tamanho = "" || DATE(tamanho) = "0000-00-00","",tamanho) USING utf8)) AS tamanho
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(custo IS NULL || custo = "" || DATE(custo) = "0000-00-00",0,custo) USING utf8)) AS custo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(custo_medio_venda IS NULL || custo_medio_venda = "" || DATE(custo_medio_venda) = "0000-00-00",0,custo_medio_venda) USING utf8)) AS custo_medio_venda
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(custo_medio_venda_prazo IS NULL || custo_medio_venda_prazo = "" || DATE(custo_medio_venda_prazo) = "0000-00-00",0,custo_medio_venda_prazo) USING utf8)) AS custo_medio_venda_prazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(custo_medio_venda_varejo IS NULL || custo_medio_venda_varejo = "" || DATE(custo_medio_venda_varejo) = "0000-00-00",0,custo_medio_venda_varejo) USING utf8)) AS custo_medio_venda_varejo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(custo_medio_venda_atacado IS NULL || custo_medio_venda_atacado = "" || DATE(custo_medio_venda_atacado) = "0000-00-00",0,custo_medio_venda_atacado) USING utf8)) AS custo_medio_venda_atacado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porcentagem_custo_venda IS NULL || porcentagem_custo_venda = "" || DATE(porcentagem_custo_venda) = "0000-00-00",0,porcentagem_custo_venda) USING utf8)) AS porcentagem_custo_venda
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porcentagem_venda_prazo IS NULL || porcentagem_venda_prazo = "" || DATE(porcentagem_venda_prazo) = "0000-00-00",0,porcentagem_venda_prazo) USING utf8)) AS porcentagem_venda_prazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porcentagem_atacado_avista IS NULL || porcentagem_atacado_avista = "" || DATE(porcentagem_atacado_avista) = "0000-00-00",0,porcentagem_atacado_avista) USING utf8)) AS porcentagem_atacado_avista
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(porcentagem_atacado_aprazo IS NULL || porcentagem_atacado_aprazo = "" || DATE(porcentagem_atacado_aprazo) = "0000-00-00",0,porcentagem_atacado_aprazo) USING utf8)) AS porcentagem_atacado_aprazo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_atacado IS NULL || qtd_atacado = "" || DATE(qtd_atacado) = "0000-00-00",0,qtd_atacado) USING utf8)) AS qtd_atacado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_minima IS NULL || qtd_minima = "" || DATE(qtd_minima) = "0000-00-00",0,qtd_minima) USING utf8)) AS qtd_minima
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(peso IS NULL || peso = "" || DATE(peso) = "0000-00-00","",peso) USING utf8)) AS peso
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(codigo_barra IS NULL || codigo_barra = "" || DATE(codigo_barra) = "0000-00-00","",codigo_barra) USING utf8)) AS codigo_barra
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(barra IS NULL || barra = "" || DATE(barra) = "0000-00-00","",barra) USING utf8)) AS barra
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(sincronizado IS NULL || sincronizado = "" || DATE(sincronizado) = "0000-00-00",0,sincronizado) USING utf8)) AS sincronizado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(iss IS NULL || iss = "" || DATE(iss) = "0000-00-00",0,iss) USING utf8)) AS iss
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms IS NULL || icms = "" || DATE(icms) = "0000-00-00",0,icms) USING utf8)) AS icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_unidade IS NULL || id_unidade = "" || DATE(id_unidade) = "0000-00-00",0,id_unidade) USING utf8)) AS id_unidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(localizacao IS NULL || localizacao = "" || DATE(localizacao) = "0000-00-00","",localizacao) USING utf8)) AS localizacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_fornecedor IS NULL || id_fornecedor = "" || DATE(id_fornecedor) = "0000-00-00",0,id_fornecedor) USING utf8)) AS id_fornecedor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fabricante IS NULL || fabricante = "" || DATE(fabricante) = "0000-00-00","",fabricante) USING utf8)) AS fabricante
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ean IS NULL || ean = "" || DATE(ean) = "0000-00-00","",ean) USING utf8)) AS ean
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ex_tipi IS NULL || ex_tipi = "" || DATE(ex_tipi) = "0000-00-00","",ex_tipi) USING utf8)) AS ex_tipi
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ncm IS NULL || ncm = "" || DATE(ncm) = "0000-00-00","",ncm) USING utf8)) AS ncm
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cest IS NULL || cest = "" || DATE(cest) = "0000-00-00","",cest) USING utf8)) AS cest
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(unidade_trib IS NULL || unidade_trib = "" || DATE(unidade_trib) = "0000-00-00","",unidade_trib) USING utf8)) AS unidade_trib
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_trib IS NULL || qtd_trib = "" || DATE(qtd_trib) = "0000-00-00","",qtd_trib) USING utf8)) AS qtd_trib
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vlr_unit_trib IS NULL || vlr_unit_trib = "" || DATE(vlr_unit_trib) = "0000-00-00",0,vlr_unit_trib) USING utf8)) AS vlr_unit_trib
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(genero_produto IS NULL || genero_produto = "" || DATE(genero_produto) = "0000-00-00",0,genero_produto) USING utf8)) AS genero_produto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tributacao IS NULL || id_tributacao = "" || DATE(id_tributacao) = "0000-00-00",0,id_tributacao) USING utf8)) AS id_tributacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_origem IS NULL || id_origem = "" || DATE(id_origem) = "0000-00-00",0,id_origem) USING utf8)) AS id_origem
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_especifico IS NULL || id_especifico = "" || DATE(id_especifico) = "0000-00-00",0,id_especifico) USING utf8)) AS id_especifico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cfop IS NULL || id_cfop = "" || DATE(id_cfop) = "0000-00-00",0,id_cfop) USING utf8)) AS id_cfop
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cfop_itens IS NULL || id_cfop_itens = "" || DATE(id_cfop_itens) = "0000-00-00",0,id_cfop_itens) USING utf8)) AS id_cfop_itens
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(desconto IS NULL || desconto = "" || DATE(desconto) = "0000-00-00",0,desconto) USING utf8)) AS desconto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(vender_estoque_zerado IS NULL || vender_estoque_zerado = "" || DATE(vender_estoque_zerado) = "0000-00-00","S",vender_estoque_zerado) USING utf8)) AS vender_estoque_zerado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao_detalhada IS NULL || descricao_detalhada = "" || DATE(descricao_detalhada) = "0000-00-00","",descricao_detalhada) USING utf8)) AS descricao_detalhada
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ecommerce IS NULL || ecommerce = "" || DATE(ecommerce) = "0000-00-00","S",ecommerce) USING utf8)) AS ecommerce
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(promocao_ecommerce IS NULL || promocao_ecommerce = "" || DATE(promocao_ecommerce) = "0000-00-00","S",promocao_ecommerce) USING utf8)) AS promocao_ecommerce
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(produto_destaque_ecommerce IS NULL || produto_destaque_ecommerce = "" || DATE(produto_destaque_ecommerce) = "0000-00-00","S",produto_destaque_ecommerce) USING utf8)) AS produto_destaque_ecommerce
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(altura IS NULL || altura = "" || DATE(altura) = "0000-00-00",0,altura) USING utf8)) AS altura
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(largura IS NULL || largura = "" || DATE(largura) = "0000-00-00",0,largura) USING utf8)) AS largura
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(comprimento IS NULL || comprimento = "" || DATE(comprimento) = "0000-00-00",0,comprimento) USING utf8)) AS comprimento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_marca IS NULL || id_marca = "" || DATE(id_marca) = "0000-00-00",0,id_marca) USING utf8)) AS id_marca
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(destaque IS NULL || destaque = "" || DATE(destaque) = "0000-00-00","P",destaque) USING utf8)) AS destaque
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(valor_frete IS NULL || valor_frete = "" || DATE(valor_frete) = "0000-00-00",0,valor_frete) USING utf8)) AS valor_frete
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins IS NULL || cofins = "" || DATE(cofins) = "0000-00-00","",cofins) USING utf8)) AS cofins
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis IS NULL || pis = "" || DATE(pis) = "0000-00-00","",pis) USING utf8)) AS pis
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_fabricacao IS NULL || data_fabricacao = "" || DATE(data_fabricacao) = "0000-00-00","1899-12-30",data_fabricacao) USING utf8)) AS data_fabricacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_validade IS NULL || data_validade = "" || DATE(data_validade) = "0000-00-00","1899-12-30",data_validade) USING utf8)) AS data_validade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(lote_produto IS NULL || lote_produto = "" || DATE(lote_produto) = "0000-00-00","",lote_produto) USING utf8)) AS lote_produto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nr_edicao IS NULL || nr_edicao = "" || DATE(nr_edicao) = "0000-00-00","",nr_edicao) USING utf8)) AS nr_edicao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(peso_bruto IS NULL || peso_bruto = "" || DATE(peso_bruto) = "0000-00-00","",peso_bruto) USING utf8)) AS peso_bruto
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis_aliquota IS NULL || pis_aliquota = "" || DATE(pis_aliquota) = "0000-00-00",0,pis_aliquota) USING utf8)) AS pis_aliquota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pis_cst IS NULL || pis_cst = "" || DATE(pis_cst) = "0000-00-00",0,pis_cst) USING utf8)) AS pis_cst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_aliquota IS NULL || ipi_aliquota = "" || DATE(ipi_aliquota) = "0000-00-00",0,ipi_aliquota) USING utf8)) AS ipi_aliquota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ipi_cst IS NULL || ipi_cst = "" || DATE(ipi_cst) = "0000-00-00",0,ipi_cst) USING utf8)) AS ipi_cst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_aliquota IS NULL || cofins_aliquota = "" || DATE(cofins_aliquota) = "0000-00-00",0,cofins_aliquota) USING utf8)) AS cofins_aliquota
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cofins_cst IS NULL || cofins_cst = "" || DATE(cofins_cst) = "0000-00-00",0,cofins_cst) USING utf8)) AS cofins_cst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_cst IS NULL || icms_cst = "" || DATE(icms_cst) = "0000-00-00",0,icms_cst) USING utf8)) AS icms_cst
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(icms_modalidade IS NULL || icms_modalidade = "" || DATE(icms_modalidade) = "0000-00-00",0,icms_modalidade) USING utf8)) AS icms_modalidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(peso_caixa IS NULL || peso_caixa = "" || DATE(peso_caixa) = "0000-00-00",0,peso_caixa) USING utf8)) AS peso_caixa
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(alt_caixa IS NULL || alt_caixa = "" || DATE(alt_caixa) = "0000-00-00",0,alt_caixa) USING utf8)) AS alt_caixa
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(larg_caixa IS NULL || larg_caixa = "" || DATE(larg_caixa) = "0000-00-00",0,larg_caixa) USING utf8)) AS larg_caixa
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(comp_caixa IS NULL || comp_caixa = "" || DATE(comp_caixa) = "0000-00-00",0,comp_caixa) USING utf8)) AS comp_caixa
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(margem_lucro_tipo IS NULL || margem_lucro_tipo = "" || DATE(margem_lucro_tipo) = "0000-00-00","P",margem_lucro_tipo) USING utf8)) AS margem_lucro_tipo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(margem_lucro_valor IS NULL || margem_lucro_valor = "" || DATE(margem_lucro_valor) = "0000-00-00",0,margem_lucro_valor) USING utf8)) AS margem_lucro_valor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(desconto_maximo_tipo IS NULL || desconto_maximo_tipo = "" || DATE(desconto_maximo_tipo) = "0000-00-00","P",desconto_maximo_tipo) USING utf8)) AS desconto_maximo_tipo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(desconto_maximo_percentual IS NULL || desconto_maximo_percentual = "" || DATE(desconto_maximo_percentual) = "0000-00-00",0,desconto_maximo_percentual) USING utf8)) AS desconto_maximo_percentual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(desconto_maximo_valor IS NULL || desconto_maximo_valor = "" || DATE(desconto_maximo_valor) = "0000-00-00",0,desconto_maximo_valor) USING utf8)) AS desconto_maximo_valor
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(infos_nutricionais IS NULL || infos_nutricionais = "" || DATE(infos_nutricionais) = "0000-00-00","S",infos_nutricionais) USING utf8)) AS infos_nutricionais
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(prod_serv IS NULL || prod_serv = "" || DATE(prod_serv) = "0000-00-00","P",prod_serv) USING utf8)) AS prod_serv
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(identificacao_interna IS NULL || identificacao_interna = "" || DATE(identificacao_interna) = "0000-00-00","",identificacao_interna) USING utf8)) AS identificacao_interna
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(solicitar_vrtotal IS NULL || solicitar_vrtotal = "" || DATE(solicitar_vrtotal) = "0000-00-00","S",solicitar_vrtotal) USING utf8)) AS solicitar_vrtotal
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(casas_decimais IS NULL || casas_decimais = "" || DATE(casas_decimais) = "0000-00-00",0,casas_decimais) USING utf8)) AS casas_decimais
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(locacao_quantidade IS NULL || locacao_quantidade = "" || DATE(locacao_quantidade) = "0000-00-00",0,locacao_quantidade) USING utf8)) AS locacao_quantidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(obs_preco IS NULL || obs_preco = "" || DATE(obs_preco) = "0000-00-00","",obs_preco) USING utf8)) AS obs_preco
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_bomba_bico IS NULL || id_bomba_bico = "" || DATE(id_bomba_bico) = "0000-00-00",0,id_bomba_bico) USING utf8)) AS id_bomba_bico
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_importacao IS NULL || id_importacao = "" || DATE(id_importacao) = "0000-00-00",0,id_importacao) USING utf8)) AS id_importacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_alteracao IS NULL || data_alteracao = "" || DATE(data_alteracao) = "0000-00-00","1899-12-30",data_alteracao) USING utf8)) AS data_alteracao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(perc_dif_uf IS NULL || perc_dif_uf = "" || DATE(perc_dif_uf) = "0000-00-00",0,perc_dif_uf) USING utf8)) AS perc_dif_uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(qtd_unidade IS NULL || qtd_unidade = "" || DATE(qtd_unidade) = "0000-00-00",0,qtd_unidade) USING utf8)) AS qtd_unidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(truncar_vlr_total IS NULL || truncar_vlr_total = "" || DATE(truncar_vlr_total) = "0000-00-00","S",truncar_vlr_total) USING utf8)) AS truncar_vlr_total
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(codigo_anp IS NULL || codigo_anp = "" || DATE(codigo_anp) = "0000-00-00","",codigo_anp) USING utf8)) AS codigo_anp
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(env_prod IS NULL || env_prod = "" || DATE(env_prod) = "0000-00-00","S",env_prod) USING utf8)) AS env_prod
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(peso_liquido IS NULL || peso_liquido = "" || DATE(peso_liquido) = "0000-00-00","",peso_liquido) USING utf8)) AS peso_liquido
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(estoque_lojavirtual IS NULL || estoque_lojavirtual = "" || DATE(estoque_lojavirtual) = "0000-00-00",0,estoque_lojavirtual) USING utf8)) AS estoque_lojavirtual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(deletar IS NULL || deletar = "" || DATE(deletar) = "0000-00-00","S",deletar) USING utf8)) AS deletar
 				,"" AS visualizar 
				,"" AS excluir  
				,FALSE AS possui_trib_especial
				,id AS id_web 
				,"',NOW(),'" AS data_sincronismo 
			INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.produto 
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO produto' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_produto_info_nutricionais"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_produto_info_nutricionais`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
		
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
				
	SET @sql = CONCAT(' SELECT  REPLACE(REPLACE(CONVERT(IF(id_produto IS NULL || id_produto = "" || DATE(id_produto) = "0000-00-00",0,id_produto) USING utf8),"\r",""),"\n","") AS id_produto 
				,REPLACE(REPLACE(CONVERT(IF(dias IS NULL || dias = "" || DATE(dias) = "0000-00-00",0,dias) USING utf8),"\r",""),"\n","") AS dias 
				,REPLACE(REPLACE(CONVERT(IF(porcao IS NULL || porcao = "" || DATE(porcao) = "0000-00-00","",porcao) USING utf8),"\r",""),"\n","") AS porcao 
				,REPLACE(REPLACE(CONVERT(IF(calorias IS NULL || calorias = "" || DATE(calorias) = "0000-00-00",0,calorias) USING utf8),"\r",""),"\n","") AS calorias 
				,REPLACE(REPLACE(CONVERT(IF(caboidrato IS NULL || caboidrato = "" || DATE(caboidrato) = "0000-00-00",0,caboidrato) USING utf8),"\r",""),"\n","") AS caboidrato 
				,REPLACE(REPLACE(CONVERT(IF(proteinas IS NULL || proteinas = "" || DATE(proteinas) = "0000-00-00",0,proteinas) USING utf8),"\r",""),"\n","") AS proteinas 
				,REPLACE(REPLACE(CONVERT(IF(gord_tot IS NULL || gord_tot = "" || DATE(gord_tot) = "0000-00-00",0,gord_tot) USING utf8),"\r",""),"\n","") AS gord_tot 
				,REPLACE(REPLACE(CONVERT(IF(gord_sat IS NULL || gord_sat = "" || DATE(gord_sat) = "0000-00-00",0,gord_sat) USING utf8),"\r",""),"\n","") AS gord_sat 
				,REPLACE(REPLACE(CONVERT(IF(colesterol IS NULL || colesterol = "" || DATE(colesterol) = "0000-00-00",0,colesterol) USING utf8),"\r",""),"\n","") AS colesterol 
				,REPLACE(REPLACE(CONVERT(IF(gord_trans IS NULL || gord_trans = "" || DATE(gord_trans) = "0000-00-00",0,gord_trans) USING utf8),"\r",""),"\n","") AS gord_trans 
				,REPLACE(REPLACE(CONVERT(IF(fibra IS NULL || fibra = "" || DATE(fibra) = "0000-00-00",0,fibra) USING utf8),"\r",""),"\n","") AS fibra 
				,REPLACE(REPLACE(CONVERT(IF(calcio IS NULL || calcio = "" || DATE(calcio) = "0000-00-00",0,calcio) USING utf8),"\r",""),"\n","") AS calcio 
				,REPLACE(REPLACE(CONVERT(IF(ferro IS NULL || ferro = "" || DATE(ferro) = "0000-00-00",0,ferro) USING utf8),"\r",""),"\n","") AS ferro 
				,REPLACE(REPLACE(CONVERT(IF(sodio IS NULL || sodio = "" || DATE(sodio) = "0000-00-00",0,sodio) USING utf8),"\r",""),"\n","") AS sodio 
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/produto_info_nutricionais_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
				FROM base_web_control.produto_info_nutricionais pn
				INNER JOIN base_web_control.produto p 
				ON p.id = pn.id_produto
				WHERE p.id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO produto_info_nutricionais' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_promocao_kit"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_promocao_kit`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8),"\r",""),"\n","") AS id_cadastro 
				,REPLACE(REPLACE(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8),"\r",""),"\n","") AS descricao 
				,REPLACE(REPLACE(CONVERT(IF(codigo_barra IS NULL || codigo_barra = "" || DATE(codigo_barra) = "0000-00-00","",codigo_barra) USING utf8),"\r",""),"\n","") AS codigo_barra 
				,REPLACE(REPLACE(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8),"\r",""),"\n","") AS ativo 
				,REPLACE(REPLACE(CONVERT(IF(id_usuario_alteracao IS NULL || id_usuario_alteracao = "" || DATE(id_usuario_alteracao) = "0000-00-00",0,id_usuario_alteracao) USING utf8),"\r",""),"\n","") AS id_usuario_alteracao 
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/promocao_kit_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.promocao_kit
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO promocao_kit' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_promocao_kit_grade"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_promocao_kit_grade`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8),"\r",""),"\n","") AS id_cadastro 
				,REPLACE(REPLACE(CONVERT(IF(id_promocao_kit IS NULL || id_promocao_kit = "" || DATE(id_promocao_kit) = "0000-00-00",0,id_promocao_kit) USING utf8),"\r",""),"\n","") AS id_promocao_kit 
				,REPLACE(REPLACE(CONVERT(IF(id_grade IS NULL || id_grade = "" || DATE(id_grade) = "0000-00-00",0,id_grade) USING utf8),"\r",""),"\n","") AS id_grade 
				,REPLACE(REPLACE(CONVERT(IF(vlr_custo_original IS NULL || vlr_custo_original = "" || DATE(vlr_custo_original) = "0000-00-00",0,vlr_custo_original) USING utf8),"\r",""),"\n","") AS vlr_custo_original 
				,REPLACE(REPLACE(CONVERT(IF(vlr_custo_promocao IS NULL || vlr_custo_promocao = "" || DATE(vlr_custo_promocao) = "0000-00-00",0,vlr_custo_promocao) USING utf8),"\r",""),"\n","") AS vlr_custo_promocao 
				,REPLACE(REPLACE(CONVERT(IF(preco_fixo IS NULL || preco_fixo = "" || DATE(preco_fixo) = "0000-00-00","S",preco_fixo) USING utf8),"\r",""),"\n","") AS preco_fixo 
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				,REPLACE(REPLACE(CONVERT(IF(valor_desconto_perc IS NULL || valor_desconto_perc = "" || DATE(valor_desconto_perc) = "0000-00-00",0,valor_desconto_perc) USING utf8),"\r",""),"\n","") AS valor_desconto_perc 
				INTO OUTFILE "/var/lib/mysql-files/promocao_kit_grade_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.promocao_kit_grade
			WHERE id_cadastro  = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO promocao_kit_grade' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_promocao_quantidade"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_promocao_quantidade`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8),"\r",""),"\n","") AS id_cadastro 
				,REPLACE(REPLACE(CONVERT(IF(id_grade IS NULL || id_grade = "" || DATE(id_grade) = "0000-00-00",0,id_grade) USING utf8),"\r",""),"\n","") AS id_grade 
				,REPLACE(REPLACE(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8),"\r",""),"\n","") AS id_usuario 
				,REPLACE(REPLACE(CONVERT(IF(data_inicio IS NULL || data_inicio = "" || DATE(data_inicio) = "0000-00-00","1899-12-30",data_inicio) USING utf8),"\r",""),"\n","") AS data_inicio 
				,REPLACE(REPLACE(CONVERT(IF(data_fim IS NULL || data_fim = "" || DATE(data_fim) = "0000-00-00","1899-12-30",data_fim) USING utf8),"\r",""),"\n","") AS data_fim 
				,REPLACE(REPLACE(CONVERT(IF(qtd_promocao IS NULL || qtd_promocao = "" || DATE(qtd_promocao) = "0000-00-00",0,qtd_promocao) USING utf8),"\r",""),"\n","") AS qtd_promocao 
				,REPLACE(REPLACE(CONVERT(IF(valor_desconto IS NULL || valor_desconto = "" || DATE(valor_desconto) = "0000-00-00",0,valor_desconto) USING utf8),"\r",""),"\n","") AS valor_desconto 
				,REPLACE(REPLACE(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8),"\r",""),"\n","") AS ativo 
				,REPLACE(REPLACE(CONVERT(IF(id_usuario_alterou IS NULL || id_usuario_alterou = "" || DATE(id_usuario_alterou) = "0000-00-00",0,id_usuario_alterou) USING utf8),"\r",""),"\n","") AS id_usuario_alterou 
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/promocao_quantidade_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.promocao_quantidade
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO promocao_quantidade' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_tipos_lancamentos"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_tipos_lancamentos`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT
				 
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(descricao IS NULL || descricao = "" || DATE(descricao) = "0000-00-00","",descricao) USING utf8)) AS descricao
				 ,id AS id_web 
				,"1899-12-30" AS data_alteracao  
				,"',NOW(), '" AS data_sincronismo 
			INTO OUTFILE "/var/lib/mysql-files/tipos_lancamentos_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"
			FROM base_web_control.tipos_lancamentos
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO tipos_lancamentos' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_transportadora"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_transportadora`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT('SELECT  
				  base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_cadastro IS NULL || data_cadastro = "" || DATE(data_cadastro) = "0000-00-00","1899-12-30",data_cadastro) USING utf8)) AS data_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_razao_social IS NULL || nome_razao_social = "" || DATE(nome_razao_social) = "0000-00-00","",nome_razao_social) USING utf8)) AS nome_razao_social
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj_cpf IS NULL || cnpj_cpf = "" || DATE(cnpj_cpf) = "0000-00-00","",cnpj_cpf) USING utf8)) AS cnpj_cpf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(endereco IS NULL || endereco = "" || DATE(endereco) = "0000-00-00","",endereco) USING utf8)) AS endereco
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(numero IS NULL || numero = "" || DATE(numero) = "0000-00-00","",numero) USING utf8)) AS numero
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(complemento IS NULL || complemento = "" || DATE(complemento) = "0000-00-00","",complemento) USING utf8)) AS complemento
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cep IS NULL || cep = "" || DATE(cep) = "0000-00-00","",cep) USING utf8)) AS cep
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(bairro IS NULL || bairro = "" || DATE(bairro) = "0000-00-00","",bairro) USING utf8)) AS bairro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cidade IS NULL || cidade = "" || DATE(cidade) = "0000-00-00","",cidade) USING utf8)) AS cidade
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8)) AS uf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(email IS NULL || email = "" || DATE(email) = "0000-00-00","",email) USING utf8)) AS email
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(informacoes_adicionais IS NULL || informacoes_adicionais = "" || DATE(informacoes_adicionais) = "0000-00-00","",informacoes_adicionais) USING utf8)) AS informacoes_adicionais
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(pessoa_contato IS NULL || pessoa_contato = "" || DATE(pessoa_contato) = "0000-00-00","",pessoa_contato) USING utf8)) AS pessoa_contato
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(insc_estadual IS NULL || insc_estadual = "" || DATE(insc_estadual) = "0000-00-00","",insc_estadual) USING utf8)) AS insc_estadual
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ie_rg IS NULL || ie_rg = "" || DATE(ie_rg) = "0000-00-00","",ie_rg) USING utf8)) AS ie_rg
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8)) AS id_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_log IS NULL || id_tipo_log = "" || DATE(id_tipo_log) = "0000-00-00",0,id_tipo_log) USING utf8)) AS id_tipo_log
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(telefone IS NULL || telefone = "" || DATE(telefone) = "0000-00-00","",telefone) USING utf8)) AS telefone
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(celular IS NULL || celular = "" || DATE(celular) = "0000-00-00","",celular) USING utf8)) AS celular 
				 , "" AS visualizar
				 , "" AS excluir
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(situacao IS NULL || situacao = "" || DATE(situacao) = "0000-00-00","A",situacao) USING utf8)) AS situacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fone_gratuito IS NULL || fone_gratuito = "" || DATE(fone_gratuito) = "0000-00-00","",fone_gratuito) USING utf8)) AS fone_gratuito
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(fax IS NULL || fax = "" || DATE(fax) = "0000-00-00","",fax) USING utf8)) AS fax
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(isento_icms IS NULL || isento_icms = "" || DATE(isento_icms) = "0000-00-00","S",isento_icms) USING utf8)) AS isento_icms
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(tipo_pessoa IS NULL || tipo_pessoa = "" || DATE(tipo_pessoa) = "0000-00-00","F",tipo_pessoa) USING utf8)) AS tipo_pessoa
				 , id AS id_web
				 , "1899-12-30" AS data_alteracao
				 , "',NOW(),'" AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/transportadora_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.transportadora
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO transportadora' AS erro;
	END IF;
	
END;

#
# Procedure "sp_gerar_carga_inicial_offline_transportadora_placa"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_transportadora_placa`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE into_out VARCHAR(255);
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET into_out = CONCAT('INTO OUTFILE "/var/lib/mysql-files/produto_',p_id_cadastro,'.csv"
			FIELDS TERMINATED BY ";" 
			LINES TERMINATED BY "\n"');
			
	SET @sql = CONCAT(' SELECT  
				REPLACE(REPLACE(CONVERT(IF(id_transportadora IS NULL || id_transportadora = "" || DATE(id_transportadora) = "0000-00-00",0,id_transportadora) USING utf8),"\r",""),"\n","") AS id_transportadora 
				,REPLACE(REPLACE(CONVERT(IF(placa IS NULL || placa = "" || DATE(placa) = "0000-00-00","",placa) USING utf8),"\r",""),"\n","") AS placa 
				,REPLACE(REPLACE(CONVERT(IF(data_hora_cadastro IS NULL || data_hora_cadastro = "" || DATE(data_hora_cadastro) = "0000-00-00","1899-12-30",data_hora_cadastro) USING utf8),"\r",""),"\n","") AS data_hora_cadastro 
				,REPLACE(REPLACE(CONVERT(IF(situacao IS NULL || situacao = "" || DATE(situacao) = "0000-00-00","A",situacao) USING utf8),"\r",""),"\n","") AS situacao 
				,REPLACE(REPLACE(CONVERT(IF(uf IS NULL || uf = "" || DATE(uf) = "0000-00-00","",uf) USING utf8),"\r",""),"\n","") AS uf 
				,REPLACE(REPLACE(CONVERT(IF(rntc IS NULL || rntc = "" || DATE(rntc) = "0000-00-00","",rntc) USING utf8),"\r",""),"\n","") AS rntc 
				,REPLACE(REPLACE(CONVERT(IF(id_usuario IS NULL || id_usuario = "" || DATE(id_usuario) = "0000-00-00",0,id_usuario) USING utf8),"\r",""),"\n","") AS id_usuario 
				,REPLACE(REPLACE(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8),"\r",""),"\n","") AS id_cadastro 
				, "" AS insere
				, "" AS excluir
				, id AS id_web
				, "1899-12-30" AS data_alteracao
				, "',NOW(),'" AS data_sincronismo
			INTO OUTFILE "/var/lib/mysql-files/transportadora_placa_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.transportadora_placa
			WHERE id_cadastro = ',p_id_cadastro,';');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO transportadora_placa' AS erro;
	END IF;
	
END;

#
# Procedure "sp_first_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_first_sync`(p_id_cadastro INT)
BEGIN
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_atendimento(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_atendimento_fornecedor(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_atendimento_funcionario(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_atendimento_transportadora(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_cadastro_imposto_padrao(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_classificacao(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_classificacao_alteracao_valores(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_cliente(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_cliente_veiculo(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_credenciadora_cartao(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_credenciadoras_fixas_ignorar(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_fornecedor(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_fornecedor_banco(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_fornecedor_produto(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_fornecedor_transportadora(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_funcionario_horario_trabalho(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_grade(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_grade_atributo(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_grade_atributo_valor(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_grade_promocao(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_limite_funcionario(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_cupom_fiscal(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_cofins(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_cofinsst(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_icms(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_ii(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_ipi(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_issqn(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_pis(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_produto(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_produto_info_nutricionais(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_promocao_kit(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_promocao_kit_grade(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_promocao_quantidade(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_transportadora_placa(p_id_cadastro );
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_funcionario(p_id_cadastro);
	call `base_web_control`.sp_gerar_carga_inicial_offline_cliente_forma_pagamento(p_id_cadastro);
	call `base_web_control`.sp_gerar_carga_inicial_offline_transportadora(p_id_cadastro);
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_nfe_produto_pisst(p_id_cadastro);
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_contas_empresa(p_id_cadastro);
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_lancamentos_empresas(p_id_cadastro);
	CALL `base_web_control`.sp_gerar_carga_inicial_offline_tipos_lancamentos(p_id_cadastro);
END;

#
# Procedure "sp_gerar_carga_inicial_offline_webc_usuario"
#

CREATE PROCEDURE `base_web_control`.`sp_gerar_carga_inicial_offline_webc_usuario`(
	p_id_cadastro INT
)
BEGIN
	DECLARE erro INT DEFAULT 0;
	
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	SET @sql = CONCAT(' SELECT  
				
				 base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_cadastro IS NULL || id_cadastro = "" || DATE(id_cadastro) = "0000-00-00",0,id_cadastro) USING utf8)) AS id_cadastro
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(nome_usuario IS NULL || nome_usuario = "" || DATE(nome_usuario) = "0000-00-00","",nome_usuario) USING utf8)) AS nome_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(login IS NULL || login = "" || DATE(login) = "0000-00-00","",login) USING utf8)) AS login
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(senha IS NULL || senha = "" || DATE(senha) = "0000-00-00","",senha) USING utf8)) AS senha
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_criacao IS NULL || data_criacao = "" || DATE(data_criacao) = "0000-00-00","1899-12-30",data_criacao) USING utf8)) AS data_criacao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(ativo IS NULL || ativo = "" || DATE(ativo) = "0000-00-00","A",ativo) USING utf8)) AS ativo
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_funcionario IS NULL || id_funcionario = "" || DATE(id_funcionario) = "0000-00-00",0,id_funcionario) USING utf8)) AS id_funcionario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(login_master IS NULL || login_master = "" || DATE(login_master) = "0000-00-00","S",login_master) USING utf8)) AS login_master
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(email IS NULL || email = "" || DATE(email) = "0000-00-00","",email) USING utf8)) AS email
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_desabilita IS NULL || data_desabilita = "" || DATE(data_desabilita) = "0000-00-00","1899-12-30",data_desabilita) USING utf8)) AS data_desabilita
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(percentual_desconto_autorizado IS NULL || percentual_desconto_autorizado = "" || DATE(percentual_desconto_autorizado) = "0000-00-00",0,percentual_desconto_autorizado) USING utf8)) AS percentual_desconto_autorizado
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(percentual_desconto_item IS NULL || percentual_desconto_item = "" || DATE(percentual_desconto_item) = "0000-00-00",0,percentual_desconto_item) USING utf8)) AS percentual_desconto_item
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(cnpj_cpf IS NULL || cnpj_cpf = "" || DATE(cnpj_cpf) = "0000-00-00","",cnpj_cpf) USING utf8)) AS cnpj_cpf
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(id_tipo_permissao_usuario IS NULL || id_tipo_permissao_usuario = "" || DATE(id_tipo_permissao_usuario) = "0000-00-00",0,id_tipo_permissao_usuario) USING utf8)) AS id_tipo_permissao_usuario
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(array_permissao IS NULL || array_permissao = "" || DATE(array_permissao) = "0000-00-00","",array_permissao) USING utf8)) AS array_permissao
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(agenda IS NULL || agenda = "" || DATE(agenda) = "0000-00-00",0,agenda) USING utf8)) AS agenda
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(horario_inicio IS NULL || horario_inicio = "" || DATE(horario_inicio) = "0000-00-00","00:00:00",horario_inicio) USING utf8)) AS horario_inicio
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(horario_fim IS NULL || horario_fim = "" || DATE(horario_fim) = "0000-00-00","00:00:00",horario_fim) USING utf8)) AS horario_fim
				, "" AS visualizar
				, "" AS excluir
				, id AS id_web
				 ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_alteracao IS NULL || data_alteracao = "" || DATE(data_alteracao) = "0000-00-00","1899-12-30",data_alteracao) USING utf8)) AS data_alteracao
				,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(data_sincronismo IS NULL || data_sincronismo = "" || DATE(data_sincronismo) = "0000-00-00","1899-12-30",data_sincronismo) USING utf8)) AS data_sincronismo
				INTO OUTFILE "/var/lib/mysql-files/webc_usuario_',p_id_cadastro,'.csv"
				FIELDS TERMINATED BY ";" 
				LINES TERMINATED BY "\n"
			FROM base_web_control.webc_usuario
			WHERE id_cadastro = ',p_id_cadastro,' ;');
		PREPARE stmt_sql FROM @sql;
		EXECUTE stmt_sql;
		DEALLOCATE PREPARE stmt_sql;
	
	IF erro = 0 THEN
		SELECT 'OK' AS erro;
	ELSE 
		SELECT 'ERRO' AS erro;
	END IF;
	
END;

#
# Procedure "sp_get_dados_cliente_veiculo"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_cliente_veiculo`(
	p_id_cadastro INT
)
BEGIN
	SELECT
                    `base_web_control`.cv.id AS id,
                    `base_web_control`.cv.id_cliente,
                    `base_web_control`.cv.placa
                 FROM base_web_control.cliente_veiculo cv
                 INNER JOIN base_web_control.cliente c
                 ON (`base_web_control`.cv.id_cliente = `base_web_control`.c.id OR `base_web_control`.cv.id_cliente = `base_web_control`.c.id_off)
                 WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
                 AND (`base_web_control`.c.data_alteracao > `base_web_control`.c.data_sincronismo OR `base_web_control`.c.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_cupom_fiscal_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_cupom_fiscal_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_cupom_fiscal,
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.id_cfop,
		`base_web_control`.nfe.ncm,
		`base_web_control`.nfe.sped,
		`base_web_control`.nfe.percentual_issqn,
		`base_web_control`.nfe.cst,
		`base_web_control`.nfe.codigo_balanca,
		`base_web_control`.nfe.percentual_icms,
		`base_web_control`.nfe.percentual_pis,
		`base_web_control`.nfe.csosn,
		`base_web_control`.nfe.totalizador_parcial,
		`base_web_control`.nfe.percentual_ipi,
		`base_web_control`.nfe.percentual_cofins,
		`base_web_control`.nfe.icmsst,
		`base_web_control`.nfe.situacao_tributaria,
		`base_web_control`.nfe.iat,
		`base_web_control`.nfe.ippt
	FROM `base_web_control`.nfe_cupom_fiscal nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_cofins_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_cofins_sync`(
	p_id_cadastro int
)
begin
	select
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.CST,
		`base_web_control`.nfe.pCOFINS,
		`base_web_control`.nfe.qBCProd,
		`base_web_control`.nfe.v_aliq,
		`base_web_control`.nfe.tp_calculo,
		`base_web_control`.nfe.tp_imposto
	from `base_web_control`.nfe_Produto_COFINS nfe
	inner join `base_web_control`.produto p
	on `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	where `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
end;

#
# Procedure "sp_get_dados_nfe_produto_cofinsst_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_cofinsst_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.imposto_id,
		`base_web_control`.nfe.pCOFINS,
		`base_web_control`.nfe.qBCProd,
		`base_web_control`.nfe.v_aliq,
		`base_web_control`.nfe.tp_calculo,
		`base_web_control`.nfe.produto_id,
		`base_web_control`.nfe.tp_imposto
	FROM `base_web_control`.nfe_Produto_COFINSST nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.produto_id
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_icms_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_icms_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.orig,
		`base_web_control`.nfe.CST,
		`base_web_control`.nfe.modBC,
		`base_web_control`.nfe.pRedBC,
		`base_web_control`.nfe.pICMS,
		`base_web_control`.nfe.modBCST,
		`base_web_control`.nfe.pMVAST,
		`base_web_control`.nfe.pRedBCST,
		`base_web_control`.nfe.pICMSST,
		`base_web_control`.nfe.regimes,
		`base_web_control`.nfe.pOpePropria,
		`base_web_control`.nfe.uf,
		`base_web_control`.nfe.vl_aliq_calc_cre,
		`base_web_control`.nfe.bc_icms_st_ret_ant,
		`base_web_control`.nfe.pMVAST_LR,
		`base_web_control`.nfe.valor_desoneracao_icms,
		`base_web_control`.nfe.motivo_desoneracao_icms,
		`base_web_control`.nfe.percentual_diferimento_icms,
		`base_web_control`.nfe.uf_retido_remetente_icms_st,
		`base_web_control`.nfe.uf_destino_icms_st
	FROM `base_web_control`.nfe_Produto_ICMS nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_ii_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_ii_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.vBC,
		`base_web_control`.nfe.vDespAdu,
		`base_web_control`.nfe.vII,
		`base_web_control`.nfe.vIOF
	FROM `base_web_control`.nfe_Produto_II nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_ipi_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_ipi_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.cIEnq,
		`base_web_control`.nfe.CNPJProd,
		`base_web_control`.nfe.cSelo,
		`base_web_control`.nfe.qSelo,
		`base_web_control`.nfe.cEnq,
		`base_web_control`.nfe.CST,
		`base_web_control`.nfe.qUnid,
		`base_web_control`.nfe.pIPI,
		`base_web_control`.nfe.tp_calculo,
		`base_web_control`.nfe.v_aliq
	FROM `base_web_control`.nfe_Produto_IPI nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_issqn_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_issqn_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.ISSQN_id,
		`base_web_control`.nfe.imposto_id,
		`base_web_control`.nfe.pAliq,
		`base_web_control`.nfe.uf,
		`base_web_control`.nfe.cMunFG,
		`base_web_control`.nfe.cListServ,
		`base_web_control`.nfe.tributacao,
		`base_web_control`.nfe.produto_id,
		`base_web_control`.nfe.id_exigibilidade,
		`base_web_control`.nfe.incentivo_fiscal,
		`base_web_control`.nfe.valor_deducoes,
		`base_web_control`.nfe.valor_outras_retencoes,
		`base_web_control`.nfe.valor_desconto_condicionado,
		`base_web_control`.nfe.valor_retencao,
		`base_web_control`.nfe.codigo_servico,
		`base_web_control`.nfe.uf_incidencia,
		`base_web_control`.nfe.id_municipio_incidencia,
		`base_web_control`.nfe.processo
	FROM `base_web_control`.nfe_Produto_ISSQN nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.produto_id
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_pis_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_pis_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.tp_calculo,
		`base_web_control`.nfe.CST,
		`base_web_control`.nfe.pPIS,
		`base_web_control`.nfe.v_aliq,
		`base_web_control`.nfe.tp_imposto
	FROM `base_web_control`.nfe_Produto_PIS nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_nfe_produto_pisst_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_nfe_produto_pisst_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.tp_calculo,
		`base_web_control`.nfe.pPIS,
		`base_web_control`.nfe.qBCProd,
		`base_web_control`.nfe.vAliqProd,
		`base_web_control`.nfe.v_aliq,
		`base_web_control`.nfe.tp_imposto
	FROM `base_web_control`.nfe_Produto_PISST nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_get_dados_produto_info_nutricionais_sync"
#

CREATE PROCEDURE `base_web_control`.`sp_get_dados_produto_info_nutricionais_sync`(
	p_id_cadastro INT
)
BEGIN
	SELECT
		`base_web_control`.nfe.id_produto,
		`base_web_control`.nfe.dias,
		`base_web_control`.nfe.porcao,
		`base_web_control`.nfe.calorias,
		`base_web_control`.nfe.caboidrato,
		`base_web_control`.nfe.proteinas,
		`base_web_control`.nfe.gord_tot,
		`base_web_control`.nfe.gord_sat,
		`base_web_control`.nfe.colesterol,
		`base_web_control`.nfe.gord_trans,
		`base_web_control`.nfe.fibra,
		`base_web_control`.nfe.calcio,
		`base_web_control`.nfe.ferro,
		`base_web_control`.nfe.sodio
	FROM `base_web_control`.produto_info_nutricionais nfe
	INNER JOIN `base_web_control`.produto p
	ON `base_web_control`.p.id = `base_web_control`.nfe.id_produto
	WHERE `base_web_control`.p.id_cadastro = p_id_cadastro
	AND (`base_web_control`.nfe.data_alteracao > `base_web_control`.nfe.data_sincronismo OR `base_web_control`.nfe.data_sincronismo IS NULL);
END;

#
# Procedure "sp_grafico_cancelamentos"
#

CREATE PROCEDURE `base_web_control`.`sp_grafico_cancelamentos`(
	p_id_franquia INT
)
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_adicionar DATETIME;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_total_meses INT;
	DECLARE v_data_inicio DATETIME;
	DECLARE v_data_fim DATETIME;
	DECLARE v_falta INT;
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	declare v_ano int;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas_cancelamentos
				     ORDER BY data_inicio ASC;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
		
	SET v_mes_atual = MONTH(NOW());
	set v_ano = year(now());
	
	


	
	WHILE v_while -1 <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) -1,'-12-01 00:00:00');
				SET v_data_fim = CONCAT(YEAR(NOW())-1 ,'-12-', DAY(LAST_DAY(v_data_inicio)) ,' 23:59:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-01 00:00:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-',DAY(LAST_DAY(v_data_inicio)) ,' 23:59:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas_cancelamentos(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_while = v_while + 1;
			
			
			
	END WHILE;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_cancelamentos);
	
	SET v_while = 1;
	
	WHILE v_falta +1 <= 12 DO
	
		
		SET v_data_inicio = CONCAT(YEAR(NOW()) -1,'-', LPAD(v_falta,2,0),'-01 00:00:00');
		SET v_data_fim = CONCAT(YEAR(NOW()) -1,'-',LPAD(v_falta,2,0),'-',DAY(LAST_DAY(v_data_inicio)) ,' 23:59:00');
	
		INSERT INTO `base_web_control`.tmp_datas_cancelamentos(data_inicio, data_fim)
		VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;
	
	
	
	
	


	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_grafico_cancelados(valor, data_inicio, data_fim)
				SELECT 
					COUNT(*),
					v_data_inicio,
					v_data_fim
				FROM cs2.cadastro a
				INNER JOIN cs2.pedidos_cancelamento d ON `base_web_control`.a.codloja = `base_web_control`.d.codloja
				WHERE MONTH(`base_web_control`.d.data_documento) = MONTH(v_data_fim) 
				and year(`base_web_control`.d.data_documento) = year(v_data_fim)
				AND `base_web_control`.a.sitcli = 2  
				AND `base_web_control`.a.id_franquia= p_id_franquia;
                
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	

	
	SELECT
		valor AS VALUE,
		data_inicio,
		data_fim,
		CASE MONTH(data_fim)
		WHEN 1 THEN
		'JAN'
		WHEN 2 THEN
		'FEV'
		WHEN 3 THEN
		'MAR'
		WHEN 4 THEN
		'ABR'
		WHEN 5 THEN
		'MAI'
		WHEN 6 THEN
		'JUN'
		WHEN 7 THEN
		'JUL'
		WHEN 8 THEN
		'AGO'
		WHEN 9 THEN
		'SET'
		WHEN 10 THEN
		'OUT'
		WHEN 11 THEN
		'NOV'
		ELSE
		'DEZ'
		END AS label
		
	FROM `base_web_control`.tmp_grafico_cancelados;


DELETE FROM base_web_control.tmp_grafico_cancelados;
DELETE FROM base_web_control.tmp_datas_cancelamentos;
END;

#
# Procedure "sp_grafico_vendas_equipamento_anual"
#

CREATE PROCEDURE `base_web_control`.`sp_grafico_vendas_equipamento_anual`(
	IN `p_id_franquia` INT
)
BEGIN
  DECLARE v_mes_atual INT;
  DECLARE v_data_adicionar DATETIME;
  DECLARE v_while INT DEFAULT 1;
  DECLARE v_total_meses INT;
  DECLARE v_data_inicio DATETIME;
  DECLARE v_data_fim DATETIME;
  DECLARE v_falta INT;
  DECLARE v_qtd_contratos INT;
  DECLARE v_pronto INT DEFAULT 0;
	
  DECLARE cur_datas CURSOR FOR SELECT
                                     data_inicio,
                                     data_fim
                               FROM `base_web_control`.tmp_datas_equipamentos
                               ORDER BY data_inicio ASC;
	
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
		
   SET v_mes_atual = MONTH(NOW());
	
   WHILE v_while  <= v_mes_atual DO
	
      IF v_while = 1 THEN
         SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-26 00:00:01');
         SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 23:59:59');
      ELSE
         SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-26');
         SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25');
      END IF;
			
      INSERT INTO `base_web_control`.tmp_datas_equipamentos(data_inicio, data_fim)
      VALUES(v_data_inicio, v_data_fim);
		
      SET v_while = v_while + 1;
   END WHILE;
	
   SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_equipamentos);
	
   SET v_while = 1;
	
   WHILE v_falta +1 <= 12 DO
      SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-26');
      SET v_data_fim = CONCAT(YEAR(NOW()) -1,'-',LPAD(v_falta+1,2,0),'-25');
      INSERT INTO `base_web_control`.tmp_datas_equipamentos(data_inicio, data_fim)
      VALUES(v_data_inicio, v_data_fim);
      SET v_falta = v_falta + 1;
   END WHILE;
	 
   OPEN cur_datas;
   REPEAT
   FETCH cur_datas INTO v_data_inicio, v_data_fim;
   IF NOT v_pronto THEN
      INSERT INTO `base_web_control`.tmp_grafico_afiliacoes_consultor(valor, data_inicio, data_fim)
      SELECT
         			SUM(
                (SELECT
                COUNT(`base_web_control`.ced.id) AS qtd

                FROM cs2.cadastro_equipamento ce
                LEFT JOIN cs2.cadastro_equipamento_descricao ced ON `base_web_control`.ced.id_cadastro_equipamento = `base_web_control`.ce.id
                LEFT JOIN base_web_control.produto p ON `base_web_control`.p.id_cadastro=62735 and (`base_web_control`.ced.codigo_barra = `base_web_control`.p.codigo_barra)
                WHERE ( `base_web_control`.ce.id_consultor = `base_web_control`.c.id or `base_web_control`.ce.id_consultor = if(`base_web_control`.c.id_consultor_assistente = 0,`base_web_control`.c.id,`base_web_control`.c.id_consultor_assistente) ) AND `base_web_control`.ce.venda_finalizada = 'S'
                      AND
                      `base_web_control`.ce.data_venda BETWEEN v_data_inicio AND v_data_fim
                      AND `base_web_control`.p.exibir_grafico = 1
                ) ) AS qtd,
         v_data_inicio,
         v_data_fim
				 	FROM cs2.funcionario c
				WHERE `base_web_control`.c.ativo = 'S'
				AND `base_web_control`.c.id_franqueado = p_id_franquia
            AND (`base_web_control`.c.funcao = 'Auxiliar de Departamento Fiscal' OR `base_web_control`.c.funcao = 'Auxiliar Administrativo' OR `base_web_control`.c.funcao =9 OR `base_web_control`.c.funcao =10
                 OR `base_web_control`.c.funcao='ATENDIMENTO ADMINISTRATIVO EXTERNO' OR `base_web_control`.c.funcao='ASSISTENTE COMERCIAL' OR `base_web_control`.c.funcao=17 OR `base_web_control`.c.funcao=13 OR `base_web_control`.c.funcao=18 OR `base_web_control`.c.funcao=19)

				ORDER BY qtd DESC;
				
                
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	SELECT
		valor AS VALUE,
		data_inicio,
		data_fim,
		CASE MONTH(data_fim)
		WHEN 1 THEN
		'JAN'
		WHEN 2 THEN
		'FEV'
		WHEN 3 THEN
		'MAR'
		WHEN 4 THEN
		'ABR'
		WHEN 5 THEN
		'MAI'
		WHEN 6 THEN
		'JUN'
		WHEN 7 THEN
		'JUL'
		WHEN 8 THEN
		'AGO'
		WHEN 9 THEN
		'SET'
		WHEN 10 THEN
		'OUT'
		WHEN 11 THEN
		'NOV'
		ELSE
		'DEZ'
		END AS label
		
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor;
	DELETE FROM base_web_control.tmp_datas_equipamentos;
	DELETE FROM base_web_control.tmp_grafico_afiliacoes_consultor;
END;

#
# Procedure "sp_importacao_dados_de_para"
#

CREATE PROCEDURE `base_web_control`.`sp_importacao_dados_de_para`(
	id_cadastro_de INT,
	id_cadastro_para INT
)
BEGIN
	
	DECLARE id_usuario_para INT;
	DECLARE error INT DEFAULT 0;
	
	
	
	
	

	
	
	SET id_usuario_para = (SELECT
				id
			 FROM base_web_control.webc_usuario
			 WHERE id_cadastro = id_cadastro_para
			 AND nome_usuario  = 'USUARIO MASTER');
	
	INSERT INTO `base_web_control`.fornecedor
       (
	       id_usuario, 
	       razao_social,
	       fantasia,
	       contato,
	       cnpj_cpf,
	       telefone,
	       fax,
	       celular,
	       email,
	       site,
	       skype,
	       endereco,
	       numero,
	       complemento,
	       cep,
	       bairro,
	       cidade,
	       uf,
	       informacoes_adicionais,
	       id_cadastro,
	       tipo_pessoa,
	       data_cadastro,
	       id_tipo_log,
	       id_fornecedor_servico,
	       id_forn_master
       )
	SELECT 
		id_usuario_para, 
		`base_web_control`.f.razao_social, 
		`base_web_control`.f.fantasia, 
		`base_web_control`.f.contato, 
		`base_web_control`.f.cnpj_cpf, 
		`base_web_control`.f.telefone, 
		`base_web_control`.f.fax, 
		`base_web_control`.f.celular, 
		`base_web_control`.f.email, 
		`base_web_control`.f.site, 
		`base_web_control`.f.skype,
		`base_web_control`.f.endereco,
		`base_web_control`.f.numero,
		`base_web_control`.f.complemento,
		`base_web_control`.f.cep,
		`base_web_control`.f.bairro,
		`base_web_control`.f.cidade,
		`base_web_control`.f.uf,
		`base_web_control`.f.informacoes_adicionais,
		id_cadastro_para, 
		`base_web_control`.f.tipo_pessoa,
		NOW(), 
		`base_web_control`.f.id_tipo_log, 
		`base_web_control`.f.id_fornecedor_servico,
		`base_web_control`.f.id
	FROM `base_web_control`.fornecedor f
  
	WHERE `base_web_control`.f.id_cadastro = id_cadastro_de
	AND (razao_social NOT IN(SELECT razao_social FROM `base_web_control`.fornecedor WHERE razao_social = `base_web_control`.f.razao_social AND id_cadastro = id_cadastro_para)
	AND fantasia NOT IN(SELECT fantasia FROM `base_web_control`.fornecedor WHERE fantasia = `base_web_control`.f.fantasia AND id_cadastro = id_cadastro_para)
	);
	
	INSERT INTO `base_web_control`.classificacao(
		descricao,
		id_cadastro,
		ativo,
		data_cadastro,
		ecommerce,
		id_class_master, 
		id_usuario
	       )
	SELECT 
		descricao, 
		id_cadastro_para, 
		ativo, 
		NOW(), 
		ecommerce, 
		id, 
		id_usuario_para
	FROM `base_web_control`.classificacao 
	WHERE id_cadastro = id_cadastro_de and descricao not in (select descricao from `base_web_control`.classificacao where id_cadastro = id_cadastro_para);
  update `base_web_control`.classificacao c 
  inner join `base_web_control`.classificacao c2 on `base_web_control`.c2.id_cadastro = id_cadastro_de and `base_web_control`.c2.descricao = `base_web_control`.c.descricao
  set `base_web_control`.c.id_class_master = `base_web_control`.c2.id
  where `base_web_control`.c.id_cadastro = id_cadastro_para;
  
	
	INSERT INTO `base_web_control`.produto(
		descricao, 
		id_cadastro, 
		data_cadastro, 
		id_classificacao, 
		tamanho, 
		custo, 
		custo_medio_venda, 
		porcentagem_custo_venda, 
		peso,
		codigo_barra, 
		icms, 
		id_unidade, 
		id_cfop, 
		peso_bruto, 
		id_fornecedor,
		id_usuario, 
		ncm,
		prod_serv
	       )
	SELECT
	      `base_web_control`.a.descricao, 
	      id_cadastro_para, 
	      NOW(), 
	      `base_web_control`.b.id, 
	      `base_web_control`.a.tamanho,
	      `base_web_control`.a.custo, 
	      `base_web_control`.a.custo_medio_venda, 
	      `base_web_control`.a.porcentagem_custo_venda, 
	      `base_web_control`.a.peso,`base_web_control`.a.codigo_barra, 
	      `base_web_control`.a.icms, 
	      `base_web_control`.a.id_unidade, 
	      `base_web_control`.a.id_cfop, 
	      `base_web_control`.a.peso_bruto, 
	      `base_web_control`.c.id,
	      id_usuario_para, 
	      ncm,
		  `base_web_control`.a.prod_serv
	FROM `base_web_control`.produto a
	LEFT JOIN `base_web_control`.classificacao b ON `base_web_control`.a.id_classificacao = `base_web_control`.b.id_class_master 
	AND `base_web_control`.b.id_cadastro = id_cadastro_para
	LEFT JOIN `base_web_control`.fornecedor c ON `base_web_control`.a.id_fornecedor = `base_web_control`.c.id_forn_master
	AND `base_web_control`.c.id_cadastro = id_cadastro_para
	WHERE `base_web_control`.a.id_cadastro = id_cadastro_de
	and `base_web_control`.a.codigo_barra not in( select codigo_barra from `base_web_control`.produto where id_cadastro = id_cadastro_para);
	
	UPDATE 
		`base_web_control`.classificacao 
	SET id_class_master = NULL 
	WHERE id_cadastro = id_cadastro_para;
	
	UPDATE 
		`base_web_control`.fornecedor 
	SET id_forn_master = NULL 
	WHERE id_cadastro = id_cadastro_para;
	









END;

#
# Procedure "sp_importar_dados_franquia"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_dados_franquia`(
	v_id_agendamento INT
)
begin
	select
		*
	from cs2.controle_comercial_visitas cv
	inner join cs2.consultores_assistentes ca
		on `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	inner join cs2.consultores_assistentes ca2
		on `base_web_control`.cv.id_consultor = `base_web_control`.ca2.id
	where `base_web_control`.cv.id = v_id_agendamento or 0 = v_id_agendamento;	
		
end;

#
# Procedure "sp_importar_nf_devolucao"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_nf_devolucao`()
BEGIN
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_id_nota INT;
	DECLARE v_id_nota_new INT;
	
	DECLARE cur_notas CURSOR FOR SELECT
					   id
				      FROM `base_web_control`.nf_devolucao
				      WHERE id_cadastro = 62920
				      AND finalidade = 'D'
				      AND finalizada = 'S';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	OPEN cur_notas;
		REPEAT
			IF NOT v_pronto THEN
			FETCH cur_notas INTO v_id_nota;
			
				
				
				INSERT INTO base_web_control.nf_devolucao(
					id_cadastro,
					`data`,
					hora,
					id_fornecedor,
					id_cliente,
					id_natureza,
					id_transportadora,
					modalidade_frete,
					info_adicionais,
					danfe_saida,
					num_nota_saida,
					finalizada,
					danfe_entrada,
					outras_despesas,
					tipo_nota,
					id_venda,
					`status`,
					finalidade,
					natureza,
					qtd_volume,
					descricao_volume,
					numero_nota_sefaz,
					vlr_base_calc_st,
					vlr_icms_st,
					peso_bruto,
					peso_liquido,
					valor_desconto,
					tipo_finalidade,
					ambiente,
					valor_frete
				)
				SELECT
					764,
					`data`,
					hora,
					(SELECT id FROM `base_web_control`.fornecedor WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.fornecedor WHERE id = `base_web_control`.nf.id_fornecedor ) LIMIT 1),
					(SELECT id FROM `base_web_control`.cliente WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.cliente WHERE id = `base_web_control`.nf.id_fornecedor ) LIMIT 1),
					id_natureza,
					id_transportadora,
					modalidade_frete,
					info_adicionais,
					danfe_saida,
					num_nota_saida,
					finalizada,
					danfe_entrada,
					outras_despesas,
					tipo_nota,
					id_venda,
					`status`,
					finalidade,
					natureza,
					qtd_volume,
					descricao_volume,
					numero_nota_sefaz,
					vlr_base_calc_st,
					vlr_icms_st,
					peso_bruto,
					peso_liquido,
					valor_desconto,
					tipo_finalidade,
					ambiente,
					valor_frete
				FROM base_web_control.nf_devolucao nf
				WHERE id = v_id_nota;
				
				SET v_id_nota_new = (SELECT MAX(id) FROM `base_web_control`.nf_devolucao WHERE id_cadastro = 764);
				
				
				INSERT INTO `base_web_control`.nf_devolucao_itens(
					id_nota_devolucao,
					numero_nota,
					id_cadastro,
					codigo_barra,
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi,
					finalizado,
					id_grade,
					vlr_base_calc_st,
					vlr_icms_st
					)
				SELECT
					v_id_nota_new,
					numero_nota,
					764,
					codigo_barra,
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi,
					finalizado,
					(SELECT id_grade FROM `base_web_control`.grade WHERE id_cadastro = 764 AND codigo_barra = `base_web_control`.nfi.codigo_barra LIMIT 1),
					vlr_base_calc_st,
					vlr_icms_st
				FROM `base_web_control`.nf_devolucao_itens nfi
				WHERE id_nota_devolucao = v_id_nota;
					
			
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_notas;
					
END;

#
# Procedure "sp_importar_nf_entrada"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_nf_entrada`()
BEGIN
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_id_nota INT;
	DECLARE v_id_nota_new INT;
	
	DECLARE cur_notas CURSOR FOR SELECT
					   id
				      FROM `base_web_control`.nf_entrada
				      WHERE id_cadastro = 65523
				      AND finalizado = 'S'
				      AND `status` = 'S';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	OPEN cur_notas;
		REPEAT
			IF NOT v_pronto THEN
			FETCH cur_notas INTO v_id_nota;
			
				
				
				INSERT INTO base_web_control.nf_entrada(
					id_cadastro,
					id_cliente,
					id_fornecedor,
					data_cadastro,
					hora_cadastro,
					numero_nota,
					vr_icms,
					vr_icms_st,
					vr_ipi,
					vr_pis,
					vr_cofins,
					vr_frete,
					vr_seguro,
					outras_despesas,
					informacoes_adicionais,
					finalizado,
					`status`,
					ambiente,
					numero_nota_sefaz,
					natureza_operacao,
					finalidade_nota,
					vlr_total_nota,
					danfe
				)
				SELECT
					764,
					(SELECT id FROM `base_web_control`.cliente WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.cliente WHERE id = `base_web_control`.nf.id_cliente) LIMIT 1),
					id_fornecedor,
					data_cadastro,
					hora_cadastro,
					numero_nota,
					vr_icms,
					vr_icms_st,
					vr_ipi,
					vr_pis,
					vr_cofins,
					vr_frete,
					vr_seguro,
					outras_despesas,
					informacoes_adicionais,
					finalizado,
					`status`,
					ambiente,
					numero_nota_sefaz,
					natureza_operacao,
					finalidade_nota,
					vlr_total_nota,
					danfe			
				FROM base_web_control.nf_entrada nf
				WHERE id = v_id_nota;
				
				SET v_id_nota_new = (SELECT MAX(id) FROM `base_web_control`.nf_entrada WHERE id_cadastro = 764);
				
				
				INSERT INTO `base_web_control`.nf_entrada_itens(
					id_cadastro,
					id_nota_entrada,
					codigo_barra,
					id_produto,
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi
					)
				SELECT
					764,
					v_id_nota_new,
					codigo_barra,
					(SELECT id FROM `base_web_control`.produto WHERE id_cadastro = 764 AND codigo_barra = `base_web_control`.nfi.codigo_barra LIMIT 1),
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi
				FROM `base_web_control`.nf_entrada_itens nfi
				WHERE id_nota_entrada = v_id_nota;
					
			
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_notas;
					
END;

#
# Procedure "sp_importar_nf_saida"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_nf_saida`()
BEGIN
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_id_nota INT;
	DECLARE v_id_nota_new INT;
	
	DECLARE cur_notas CURSOR FOR SELECT
					   id
				      FROM `base_web_control`.nf_devolucao
				      WHERE id_cadastro = 62644
				      AND finalidade = 'S'
				      AND finalizada = 'S';
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	OPEN cur_notas;
		REPEAT
			IF NOT v_pronto THEN
			FETCH cur_notas INTO v_id_nota;
			
				
				
				INSERT INTO base_web_control.nf_devolucao(
					id_cadastro,
					`data`,
					hora,
					id_fornecedor,
					id_cliente,
					id_natureza,
					id_transportadora,
					modalidade_frete,
					info_adicionais,
					danfe_saida,
					num_nota_saida,
					finalizada,
					danfe_entrada,
					outras_despesas,
					tipo_nota,
					id_venda,
					`status`,
					finalidade,
					natureza,
					qtd_volume,
					descricao_volume,
					numero_nota_sefaz,
					vlr_base_calc_st,
					vlr_icms_st,
					peso_bruto,
					peso_liquido,
					valor_desconto,
					tipo_finalidade,
					ambiente,
					valor_frete
				)
				SELECT
					764,
					`data`,
					hora,
					(SELECT id FROM `base_web_control`.fornecedor WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.fornecedor WHERE id = `base_web_control`.nf.id_fornecedor ) LIMIT 1),
					(SELECT id FROM `base_web_control`.cliente WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.cliente WHERE id = `base_web_control`.nf.id_fornecedor ) LIMIT 1),
					id_natureza,
					id_transportadora,
					modalidade_frete,
					info_adicionais,
					danfe_saida,
					num_nota_saida,
					finalizada,
					danfe_entrada,
					outras_despesas,
					tipo_nota,
					id_venda,
					`status`,
					finalidade,
					natureza,
					qtd_volume,
					descricao_volume,
					numero_nota_sefaz,
					vlr_base_calc_st,
					vlr_icms_st,
					peso_bruto,
					peso_liquido,
					valor_desconto,
					tipo_finalidade,
					ambiente,
					valor_frete
				FROM base_web_control.nf_devolucao nf
				WHERE id = v_id_nota;
				
				SET v_id_nota_new = (SELECT MAX(id) FROM `base_web_control`.nf_devolucao WHERE id_cadastro = 764);
				
				
				INSERT INTO `base_web_control`.nf_devolucao_itens(
					id_nota_devolucao,
					numero_nota,
					id_cadastro,
					codigo_barra,
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi,
					finalizado,
					id_grade,
					vlr_base_calc_st,
					vlr_icms_st
					)
				SELECT
					v_id_nota_new,
					numero_nota,
					764,
					codigo_barra,
					qtd,
					vr_unit,
					cfop,
					icms,
					pis,
					cofins,
					ipi,
					finalizado,
					(SELECT id_grade FROM `base_web_control`.grade WHERE id_cadastro = 764 AND codigo_barra = `base_web_control`.nfi.codigo_barra LIMIT 1),
					vlr_base_calc_st,
					vlr_icms_st
				FROM `base_web_control`.nf_devolucao_itens nfi
				WHERE id_nota_devolucao = v_id_nota;
					
			
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_notas;
					
END;

#
# Procedure "sp_importar_produtos_para_grade"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_produtos_para_grade`(v_id_cadastro INT)
BEGIN
	DECLARE erro INT DEFAULT 0;
	DECLARE pronto INT DEFAULT 0;
	DECLARE id_cadastro_imp INT;
	DECLARE cur_cadastros CURSOR FOR SELECT
						codLoja
					 FROM cs2.cadastro
					 WHERE sitcli = 0
					 AND IF(v_id_cadastro = 0,0=0,codLoja = v_id_cadastro);
					 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET erro = 1;
	
	OPEN cur_cadastros;
		REPEAT
			IF NOT pronto THEN
			FETCH cur_cadastros INTO id_cadastro_imp;
			
				
				DELETE FROM `base_web_control`.grade WHERE id_cadastro = id_cadastro_imp;
				
				
				INSERT INTO `base_web_control`.grade(id_cadastro, id_produto, codigo_barra_pai, codigo_barra, codigo_interno,qtd_atual, qtd_minima,ativo,valor_custo, valor_varejo_aprazo,porc_varejo_aprazo)
				SELECT
					`base_web_control`.aux.id_cadastro,
					`base_web_control`.aux.id,
					`base_web_control`.aux.codigo_barra AS codigo_barra_pai,
					`base_web_control`.aux.codigo_barra,
					`base_web_control`.aux.identificacao_interna,
					`base_web_control`.aux.qtd_atual,
					`base_web_control`.aux.quantidadeMinima,
					IF(`base_web_control`.aux.ativo = 'A','1','0') AS ativo,
					`base_web_control`.aux.custo,
					`base_web_control`.aux.custo_medio_venda,
					IF(
						`base_web_control`.aux.custo_medio_venda <> '0.00' 
						AND `base_web_control`.aux.custo_medio_venda IS NOT NULL 
						AND `base_web_control`.aux.porcentagem_custo_venda <> '0.00' 
						AND `base_web_control`.aux.porcentagem_custo_venda IS NOT NULL,
					((custo_medio_venda / custo) * 100) - 100,
					IF(`base_web_control`.aux.porcentagem_custo_venda = '0.00' OR `base_web_control`.aux.porcentagem_custo_venda IS NULL,((custo_medio_venda / custo) * 100) - 100,`base_web_control`.aux.porcentagem_custo_venda)
				 ) AS porcentagem
				FROM(
					SELECT
						    `base_web_control`.a.id_cadastro,
						    `base_web_control`.g.id_grade,
						    `base_web_control`.a.codigo_barra,
						    `base_web_control`.a.qtd_minima,
						    `base_web_control`.a.descricao,
						    TRUNCATE(`base_web_control`.a.custo,2) AS custo,
						    TRUNCATE(`base_web_control`.a.custo_medio_venda,2) AS custo_medio_venda,
						    `base_web_control`.c.descricao AS classificacao,
						    `base_web_control`.a.id,
						    `base_web_control`.a.ncm,
						    `base_web_control`.a.ativo,
						    `base_web_control`.a.porcentagem_custo_venda,
						    `base_web_control`.a.qtd_minima AS quantidadeMinima
						    , IFNULL(`base_web_control`.a.identificacao_interna,'') AS identificacao_interna
						    ,@adquirido:= IF (
							(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
								WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id ) IS NULL,
							0,
								(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id )
							)
							 AS tot_nt_entrada
						    ,@ajustee:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							 WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I')
						    ) AS ajuste_entrada
						    ,@vend:=IF (
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra) IS NULL,
							0,
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra)
						    ) AS tot_venda
						    ,@ajustes:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R')
						    ) AS ajuste_saida,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) AS qtd_atual,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) * TRUNCATE(`base_web_control`.a.custo,2) AS custo_quantidade
						    FROM base_web_control.produto a
						    LEFT JOIN base_web_control.classificacao c ON `base_web_control`.a.id_classificacao = `base_web_control`.c.id
						    LEFT JOIN base_web_control.grade g ON `base_web_control`.g.id_produto = `base_web_control`.a.id
						    WHERE `base_web_control`.a.id_cadastro = id_cadastro_imp
						   
						     ) AS aux;
						     
						     
				
						     
				INSERT INTO `base_web_control`.grade(id_cadastro, id_produto, ativo, codigo_barra_pai, codigo_barra, codigo_interno,qtd_atual, qtd_minima,ativo,valor_custo, valor_varejo_aprazo,porc_varejo_aprazo)
				SELECT
					`base_web_control`.aux.id_cadastro,
					`base_web_control`.aux.id,
					'0',
					`base_web_control`.aux.codigo_barra AS codigo_barra_pai,
					`base_web_control`.aux.codigo_barra,
					`base_web_control`.aux.identificacao_interna,
					`base_web_control`.aux.qtd_atual,
					`base_web_control`.aux.quantidadeMinima,
					IF(`base_web_control`.aux.ativo = 'A','1','0') AS ativo,
					`base_web_control`.aux.custo,
					`base_web_control`.aux.custo_medio_venda,
					IF(
						`base_web_control`.aux.custo_medio_venda <> '0.00' 
						AND `base_web_control`.aux.custo_medio_venda IS NOT NULL 
						AND `base_web_control`.aux.porcentagem_custo_venda <> '0.00' 
						AND `base_web_control`.aux.porcentagem_custo_venda IS NOT NULL,
					((custo_medio_venda / custo) * 100) - 100,
					IF(`base_web_control`.aux.porcentagem_custo_venda = '0.00' OR `base_web_control`.aux.porcentagem_custo_venda IS NULL,((custo_medio_venda / custo) * 100) - 100,`base_web_control`.aux.porcentagem_custo_venda)
				 ) AS porcentagem
				FROM(
					SELECT
						    `base_web_control`.a.id_cadastro,
						    `base_web_control`.g.id_grade,
						    `base_web_control`.a.codigo_barra,
						    `base_web_control`.a.qtd_minima,
						    `base_web_control`.a.descricao,
						    TRUNCATE(`base_web_control`.a.custo,2) AS custo,
						    TRUNCATE(`base_web_control`.a.custo_medio_venda,2) AS custo_medio_venda,
						    `base_web_control`.c.descricao AS classificacao,
						    `base_web_control`.a.id,
						    `base_web_control`.a.ncm,
						    `base_web_control`.a.ativo,
						    `base_web_control`.a.porcentagem_custo_venda,
						    `base_web_control`.a.qtd_minima AS quantidadeMinima
						    , IFNULL(`base_web_control`.a.identificacao_interna,'') AS identificacao_interna
						    ,@adquirido:= IF (
							(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
								WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id ) IS NULL,
							0,
								(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id )
							)
							 AS tot_nt_entrada
						    ,@ajustee:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							 WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I')
						    ) AS ajuste_entrada
						    ,@vend:=IF (
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra) IS NULL,
							0,
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra)
						    ) AS tot_venda
						    ,@ajustes:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R')
						    ) AS ajuste_saida,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) AS qtd_atual,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) * TRUNCATE(`base_web_control`.a.custo,2) AS custo_quantidade
						    FROM base_web_control.produtos_excluidos a
						    LEFT JOIN base_web_control.classificacao c ON `base_web_control`.a.id_classificacao = `base_web_control`.c.id
						    LEFT JOIN base_web_control.grade g ON `base_web_control`.g.id_produto = `base_web_control`.a.id
						    WHERE `base_web_control`.a.id_cadastro = id_cadastro_imp
						   
						     ) AS aux;
					
					
		
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_cadastros;
	
	
	
	SELECT v_excecao AS erro;
					 
	
END;

#
# Procedure "sp_importar_vendas"
#

CREATE PROCEDURE `base_web_control`.`sp_importar_vendas`()
BEGIN
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_id_venda INT;
	DECLARE v_id_venda_new INT;
	
	DECLARE cur_vendas CURSOR FOR SELECT
					    id_venda
			              FROM base_web_control.venda v
			              INNER JOIN base_web_control.venda_notas_eletronicas vnf
			              ON `base_web_control`.vnf.id_venda = `base_web_control`.v.id
			              WHERE `base_web_control`.v.id_cadastro = 62404
			              AND `base_web_control`.v.situacao = 'C'
			              AND `base_web_control`.vnf.status = '5'
			              AND `base_web_control`.v.data_venda > '2016-07-01 00:00:00'
			              order by `base_web_control`.v.id desc;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	OPEN cur_vendas;
		REPEAT
			IF NOT v_pronto THEN
			FETCH cur_vendas INTO v_id_venda;
			
				
				
				INSERT INTO base_web_control.venda(
					id_tipo_venda,
					id_cadastro,
					id_usuario,
					id_usuario_fecha_venda,
					id_usuario_orcamento,
					id_usuario_extorno,
					id_usuario_autoriza_desconto,
					id_usuario_exclusao,
					id_funcionario,
					id_cliente,
					id_venda_local,
					id_forma_pagamento,
					id_parcela,
					id_nota_devolucao,
					data_venda,
					hora_venda,
					situacao,
					tipo_pgto,
					sessao_venda,
					data_orcamento,
					hora_orcamento,
					orcamento,
					data_validade,
					data_hora_extorno,
					descricao_extorno,
					descricao_venda,
					a_vista,
					origem_venda,
					pago,
					valor_final_desconto,
					nfe_status,
					troco,
					tp_nf,
					ambiente_nf,
					observacao,
					data_previsao_entrega,
					hora_precisao_entrega,
					prazo_devolucao,
					valor_multa_diaria,
					valor_comissao_percentual,
					valor_comissao_em_reais,
					qtd_garantia,
					tp_garantia,
					numero_nota_sefaz,
					id_comanda,
					id_abertura_caixa,
					data_excluido,
					id_comandas_agrupadas,
					id_venda_destino,
					valor_entrada,
					id_cupom_venda,
					id_objeto_cliente
					
				)
				SELECT
					id_tipo_venda,
					764,
					766,
					766,
					id_usuario_orcamento,
					id_usuario_extorno,
					id_usuario_autoriza_desconto,
					id_usuario_exclusao,
					159015,
					(SELECT id FROM `base_web_control`.cliente WHERE id_cadastro = 764 AND cnpj_cpf = (SELECT cnpj_cpf FROM `base_web_control`.cliente WHERE id = `base_web_control`.v.id_cliente) AND tipo_pessoa = (SELECT tipo_pessoa FROM `base_web_control`.cliente WHERE id = `base_web_control`.v.id_cliente) LIMIT 1),
					id_venda_local,
					id_forma_pagamento,
					id_parcela,
					id_nota_devolucao,
					data_venda,
					hora_venda,
					situacao,
					tipo_pgto,
					sessao_venda,
					data_orcamento,
					hora_orcamento,
					orcamento,
					data_validade,
					data_hora_extorno,
					descricao_extorno,
					descricao_venda,
					a_vista,
					origem_venda,
					pago,
					valor_final_desconto,
					nfe_status,
					troco,
					tp_nf,
					ambiente_nf,
					observacao,
					data_previsao_entrega,
					hora_precisao_entrega,
					prazo_devolucao,
					valor_multa_diaria,
					valor_comissao_percentual,
					valor_comissao_em_reais,
					qtd_garantia,
					tp_garantia,
					numero_nota_sefaz,
					id_comanda,
					id_abertura_caixa,
					data_excluido,
					id_comandas_agrupadas,
					id_venda_destino,
					valor_entrada,
					id_cupom_venda,
					id_objeto_cliente
				FROM base_web_control.venda v
				WHERE id = v_id_venda;
				
				SET v_id_venda_new = (SELECT MAX(id) FROM base_web_control.venda WHERE id_cadastro = 764)				;
				
				
				INSERT INTO `base_web_control`.venda_itens(
					qtd,
					id_venda,
					id_produto,
					nome_produto,
					preco_tabela,
					nome_classificacao,
					codigo_barra,
					preco_venda,
					id_autoriza_desconto,
					id_autoriza_cancelamento,
					id_unidade,
					estornado,
					data_hora_estorno,
					desconto,
					cfop,
					percentual_desconto,
					valor_preco_custo,
					seq_ecf,
					observacoes_cozinha,
					id_grade,
					id_promocao,
					id_kit,
					informacoes_item,
					atacado_varejo
				)
				SELECT
					qtd,
					v_id_venda_new,
					(SELECT id FROM `base_web_control`.produto WHERE id_cadastro = 764 AND codigo_barra = (SELECT codigo_barra FROM `base_web_control`.produto WHERE id = `base_web_control`.vi.id_produto) LIMIT 1),
					nome_produto,
					preco_tabela,
					nome_classificacao,
					codigo_barra,
					preco_venda,
					id_autoriza_desconto,
					id_autoriza_cancelamento,
					id_unidade,
					estornado,
					data_hora_estorno,
					desconto,
					cfop,
					percentual_desconto,
					valor_preco_custo,
					seq_ecf,
					observacoes_cozinha,
					(SELECT id_grade FROM `base_web_control`.grade WHERE id_cadastro = 764 AND codigo_barra = (SELECT codigo_barra FROM `base_web_control`.produto WHERE id = `base_web_control`.vi.id_produto) LIMIT 1),
					id_promocao,
					id_kit,
					informacoes_item,
					atacado_varejo
				FROM base_web_control.venda_itens vi
				WHERE id_venda = v_id_venda;
				
				
				INSERT INTO base_web_control.venda_pagamento(
					id_venda,
					id_forma_pgto,
					valor_pgto,
					cmc7,
					vencimento,
					doc_cheque,
					codigo_consulta,
					qtd_parcela,
					cod_aut_cartao,
					id_credenciadora,
					data_cadastro,
					cnpj_credenciadora,
					vlr_troco
				)
				SELECT
					v_id_venda_new,
					id_forma_pgto,
					valor_pgto,
					cmc7,
					vencimento,
					doc_cheque,
					codigo_consulta,
					qtd_parcela,
					cod_aut_cartao,
					id_credenciadora,
					data_cadastro,
					cnpj_credenciadora,
					vlr_troco
				FROM base_web_control.venda_pagamento
				WHERE id_venda = v_id_venda;
				
				INSERT INTO base_web_control.venda_notas_eletronicas(
					id_venda,
					data_hora,
					tipo_nota,
					`status`,
					numero_nota,
					ambiente_nf,
					danfe,
					xml,
					LOTE,
					QTDE,
					ARQUIVO,
					RETORNO,
					LINK_NFS,
					data_cancelamento,
					xml_cancelamento,
					retorno_cancelamento_prefeitura,
					protocolo									
				)
				SELECT
					v_id_venda_new,
					data_hora,
					tipo_nota,
					`status`,
					numero_nota,
					ambiente_nf,
					danfe,
					xml,
					LOTE,
					QTDE,
					ARQUIVO,
					RETORNO,
					LINK_NFS,
					data_cancelamento,
					xml_cancelamento,
					retorno_cancelamento_prefeitura,
					protocolo
				FROM base_web_control.venda_notas_eletronicas
				WHERE id_venda = v_id_venda;
			
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_vendas;
					
END;

#
# Procedure "sp_in_email_aniversariantes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_email_aniversariantes`(
	p_id_cadastro INT
)
BEGIN
	DECLARE v_id_lista INT;
	
	
	SET v_id_lista = (SELECT 
				id
			 FROM base_web_control.mailmkt_lista
			 WHERE id_cadastro = p_id_cadastro 
			 AND nome_lista = 'Lista de Aniversariantes do Dia');
             
	DELETE FROM base_web_control.mailmkt_lista_emails
    WHERE id_lista = v_id_lista
	AND id_cadastro = p_id_cadastro;
			 
			 
	INSERT INTO base_web_control.mailmkt_lista_emails(
		id_cadastro,
		id_lista,
		nome,
		email
		)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		email
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND email != ''
	AND email IS NOT NULL
	AND DATE_FORMAT(data_nascimento,'%m%d') = DATE_FORMAT(now(),'%m%d')
	AND email NOT IN(SELECT email FROM `base_web_control`.mailmkt_lista_emails WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista);
		
END;

#
# Procedure "sp_in_email_clientes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_email_clientes`(
	p_id_cadastro INT
)
BEGIN
	DECLARE v_id_lista INT;
	
	
	SET v_id_lista = (SELECT 
				id
			 FROM base_web_control.mailmkt_lista
			 WHERE id_cadastro = p_id_cadastro 
			 AND nome_lista = 'Lista dos meus clientes');
			 
			 
	INSERT INTO base_web_control.mailmkt_lista_emails(
		id_cadastro,
		id_lista,
		nome,
		email
		)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		email
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND email != ''
	AND email IS NOT NULL
	AND email NOT IN(SELECT email FROM `base_web_control`.mailmkt_lista_emails WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista);
		
END;

#
# Procedure "sp_in_email_inadimplentes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_email_inadimplentes`(
	p_id_cadastro int
)
begin
	DECLARE v_id_lista_mail INT;
	
	SET v_id_lista_mail = (SELECT
				     id
				FROM base_web_control.mailmkt_lista
				WHERE id_cadastro = p_id_cadastro
				AND nome_lista = 'Lista de Inadimplentes');
				
	delete from base_web_control.mailmkt_lista_emails WHERE id_lista = v_id_lista_mail;
				
	INSERT INTO base_web_control.mailmkt_lista_emails(
		id_cadastro,
		id_lista,
		nome,
		email
		)
	SELECT
		p_id_cadastro,
		v_id_lista_mail,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,nome) AS nome,
		`base_web_control`.c.email
	FROM base_web_control.cliente c
	INNER JOIN base_web_control.contas_pagar cp
	ON `base_web_control`.cp.id_cliente = `base_web_control`.c.id
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.data_vencimento < NOW()
	AND (`base_web_control`.cp.data_baixa IS NULL OR `base_web_control`.cp.valor_baixa IS NULL)
	AND `base_web_control`.cp.situacao = 'A'
	AND `base_web_control`.c.email != ''
	AND `base_web_control`.c.email IS NOT NULL
	AND `base_web_control`.c.email NOT IN(SELECT email FROM `base_web_control`.mailmkt_lista_emails WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista_mail)
	GROUP BY email, nome;
	
	
	INSERT INTO base_web_control.mailmkt_lista_emails(
		id_cadastro,
		id_lista,
		nome,
		email
	)
	SELECT
		p_id_cadastro,
		v_id_lista_mail,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,`base_web_control`.c.nome) AS nome,
		`base_web_control`.c.email
	FROM base_web_control.cliente c
	LEFT JOIN base_web_control.titulos_recebafacil cp
	ON `base_web_control`.cp.codLoja = p_id_cadastro
	AND `base_web_control`.cp.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
    LEFT JOIN cs2.titulos_recebafacil cp2
	ON `base_web_control`.cp2.codLoja = p_id_cadastro
	AND `base_web_control`.cp2.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.vencimento < NOW()
    AND `base_web_control`.cp2.vencimento < NOW()
	AND (`base_web_control`.cp.datapg IS NULL OR `base_web_control`.cp.valorpg IS NULL)
	AND `base_web_control`.c.email != ''
	AND `base_web_control`.c.email IS NOT NULL
	AND `base_web_control`.c.email NOT IN(SELECT email FROM `base_web_control`.mailmkt_lista_emails WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista_mail)
	GROUP BY email, nome;
end;

#
# Procedure "sp_in_estoque_importacao"
#

CREATE PROCEDURE `base_web_control`.`sp_in_estoque_importacao`(
	p_id_cadastro INT,
	p_id_importacao INT
)
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE v_id_cadastro INT;
	DECLARE v_id_usuario INT;
	DECLARE v_id_produto INT;
	DECLARE v_qtd_atual DECIMAL(10,3);
	DECLARE v_qtd_retirou_inseriu DECIMAL(10,3);
	DECLARE v_fico DECIMAL(10,3);
	
	DECLARE cur_estoque CURSOR FOR SELECT
						id_cadastro,
						id_usuario,
						id_produto,
						qtd_atual,
						qtd_retiro_inseriu,
						fico
					FROM `base_web_control`.tmp_imp_estoque
					WHERE id_cadastro = p_id_cadastro;
					
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	OPEN cur_estoque;
		REPEAT
			FETCH cur_estoque INTO v_id_cadastro,
						       v_id_usuario,
						       v_id_produto,
						       v_qtd_atual,
						       v_qtd_retirou_inseriu,
						       v_fico;
			IF NOT pronto THEN
			
					       
			INSERT INTO `base_web_control`.produto_arrumar_estoque(id_cadastro,id_usuario,id_produto,qtd_atual,qtd_retiro_inseriu,fico)
			VALUES(v_id_cadastro,v_id_usuario,v_id_produto,v_qtd_atual,v_qtd_retirou_inseriu,v_fico);
					       
			
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_estoque;
	
	DELETE FROM `base_web_control`.tmp_imp_estoque WHERE id_cadastro = p_id_cadastro;
END;

#
# Procedure "sp_in_numeros_aniversariantes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_numeros_aniversariantes`(
	p_id_cadastro int
)
begin
	declare v_id_lista int;
	declare a_id_lista int;
	
	set v_id_lista = (select 
				id
			 from base_web_control.torpedo_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista de Aniversariantes do Dia'),
		a_id_lista = (select 
				id
			 from base_web_control.whatsapp_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista de Aniversariantes do Dia');
             
	DELETE FROM base_web_control.torpedo_lista_telefones
    WHERE id_lista = v_id_lista
	AND id_cadastro = p_id_cadastro;
			
	DELETE FROM base_web_control.whatsapp_lista_telefones
    WHERE id_lista = a_id_lista
	AND id_cadastro = p_id_cadastro;
			 
	insert into base_web_control.torpedo_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	AND celular not in(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	AND ativo = 'A'
    AND DATE_FORMAT(data_nascimento,'%m%d') = DATE_FORMAT(now(),'%m%d')
	group by celular;
    
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		a_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	AND celular not in(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = a_id_lista)
	AND ativo = 'A'
    AND DATE_FORMAT(data_nascimento,'%m%d') = DATE_FORMAT(now(),'%m%d')
	group by celular;
		
end;

#
# Procedure "sp_in_numeros_clientes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_numeros_clientes`(
	p_id_cadastro int
)
begin
	declare v_id_lista int;
    declare a_id_lista int;
	
	
	set v_id_lista = (select 
				id
			 from base_web_control.torpedo_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista dos meus clientes'),
		a_id_lista = (select 
				id
			 from base_web_control.whatsapp_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista dos meus clientes');
			 
			 
	insert into base_web_control.torpedo_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		IF((LENGTH(celular)=10 AND ( SUBSTRING(celular,3,1)=9 OR SUBSTRING(celular,3,1)=8 )), 
                            CONCAT(SUBSTRING(celular,1,2),'9',SUBSTRING(celular,3,8)) , 
                            celular) as celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	and celular not in(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	aND ativo = 'A'
	group by celular;
    
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		a_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	AND celular not in(SELECT telefone FROM `base_web_control`.whatsapp_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = a_id_lista)
	AND ativo = 'A'
	group by celular;
		
end;

#
# Procedure "sp_in_numeros_inadimplentes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_numeros_inadimplentes`(
	p_id_cadastro INT
)
BEGIN
	DECLARE v_id_lista INT;
	DECLARE a_id_lista INT;
	
	SET v_id_lista = (SELECT 
				id
			 FROM base_web_control.torpedo_lista
			 WHERE id_cadastro = p_id_cadastro 
			 AND nome_lista = 'Lista de Inadimplentes'),
		a_id_lista = (SELECT 
				id
			 FROM base_web_control.whatsapp_lista
			 WHERE id_cadastro = p_id_cadastro 
			 AND nome_lista = 'Lista de Inadimplentes');
			 
	delete from base_web_control.torpedo_lista_telefones WHERE id_lista = v_id_lista;
    delete from base_web_control.whatsapp_lista_telefones WHERE id_lista = a_id_lista;
			 
	INSERT INTO base_web_control.torpedo_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	INNER JOIN base_web_control.contas_pagar cp
	ON `base_web_control`.cp.id_cliente = `base_web_control`.c.id
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.data_vencimento < NOW()
	AND (`base_web_control`.cp.data_baixa IS NULL OR `base_web_control`.cp.valor_baixa IS NULL)
	AND `base_web_control`.cp.situacao = 'A'
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	GROUP BY celular, nome;
	
	
	insert into base_web_control.torpedo_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
	)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,`base_web_control`.c.nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	LEFT JOIN base_web_control.titulos_recebafacil cp
	ON `base_web_control`.cp.codLoja = p_id_cadastro
	AND `base_web_control`.cp.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	LEFT JOIN cs2.titulos_recebafacil cp2
	ON `base_web_control`.cp2.codLoja = p_id_cadastro
	AND `base_web_control`.cp2.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.vencimento < NOW()
	AND (`base_web_control`.cp.datapg IS NULL OR `base_web_control`.cp.valorpg IS NULL)
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	GROUP BY celular, nome;
    
    INSERT INTO base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	SELECT
		p_id_cadastro,
		a_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	INNER JOIN base_web_control.contas_pagar cp
	ON `base_web_control`.cp.id_cliente = `base_web_control`.c.id
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.data_vencimento < NOW()
	AND (`base_web_control`.cp.data_baixa IS NULL OR `base_web_control`.cp.valor_baixa IS NULL)
	AND `base_web_control`.cp.situacao = 'A'
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = a_id_lista)
	GROUP BY celular, nome;
	
	
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
	)
	SELECT
		p_id_cadastro,
		a_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,`base_web_control`.c.nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	LEFT JOIN base_web_control.titulos_recebafacil cp
	ON `base_web_control`.cp.codLoja = p_id_cadastro
	AND `base_web_control`.cp.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	LEFT JOIN cs2.titulos_recebafacil cp2
	ON `base_web_control`.cp2.codLoja = p_id_cadastro
	AND `base_web_control`.cp2.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.vencimento < NOW()
	AND (`base_web_control`.cp.datapg IS NULL OR `base_web_control`.cp.valorpg IS NULL)
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = a_id_lista)
	GROUP BY celular, nome;
		
END;

#
# Procedure "sp_in_produtos_importacao"
#

CREATE PROCEDURE `base_web_control`.`sp_in_produtos_importacao`(
	p_id_cadastro INT,
	p_id_importacao INT
)
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE v_id_cadastro INT;
	DECLARE v_id_usuario INT;
	DECLARE v_codigo_barra CHAR(30);
	DECLARE v_descricao TEXT;
	DECLARE v_descricao_detalhada TEXT;
	DECLARE v_id_unidade INT;
	DECLARE v_id_classificacao INT;
	DECLARE v_id_fornecedor INT;
	DECLARE v_custo DECIMAL(10,2);
	DECLARE v_custo_medio_venda DECIMAL(10,2);
	DECLARE v_ncm TEXT;
	DECLARE v_fabricante TEXT;
	DECLARE v_id_cfop TEXT;
	DECLARE v_identificacao_interna VARCHAR(255);
	DECLARE v_margem_lucro_valor DECIMAL(10,2);
	DECLARE v_localizacao VARCHAR(50);
	DECLARE v_prod_serv VARCHAR(2);
	DECLARE v_qtd_minima VARCHAR(15);
	DECLARE v_tamanho VARCHAR(50);
	DECLARE v_cor VARCHAR(50);
	DECLARE v_barra VARCHAR(25);
	DECLARE v_cest VARCHAR(10);
	DECLARE v_ean VARCHAR(25);
	DECLARE cur_produtos CURSOR FOR SELECT
						id_cadastro,
						id_usuario,
						codigo_barra,
						`base_web_control`.fn_remover_acentos(descricao),
						`base_web_control`.fn_remover_acentos(descricao_detalhada),
						id_unidade,
						id_classificacao,
						id_fornecedor,
						replace(replace(custo,'R$',''),',','.'),
						replace(replace(custo_medio_venda,'R$',''),',','.'),
						replace(ncm,'.',''),
						fabricante,
						id_cfop,
					  `base_web_control`.fn_remover_acentos(identificacao_interna),
						margem_valor_lucro,						
						localizacao,
						prod_serv,
						replace(qtd_minima,',','.'),
						tamanho,
						cor,
						barra,
						cest,
						ean
					FROM `base_web_control`.tmp_imp_produto
					WHERE id_cadastro = p_id_cadastro;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;			
					
	OPEN cur_produtos;
		REPEAT
				FETCH cur_produtos INTO v_id_cadastro,
						v_id_usuario,
						v_codigo_barra,
						v_descricao,
						v_descricao_detalhada,
						v_id_unidade,
						v_id_classificacao,
						v_id_fornecedor,
						v_custo,
						v_custo_medio_venda,
						v_ncm,
						v_fabricante,
						v_id_cfop,
						v_identificacao_interna,
						v_margem_lucro_valor,
						v_localizacao,
						v_prod_serv,
						v_qtd_minima,
						v_tamanho,
						v_cor,
						v_barra,
						v_cest,
						v_ean;			
			IF NOT pronto THEN
			
			
			INSERT INTO `base_web_control`.produto(id_cadastro,id_usuario,codigo_barra,descricao,descricao_detalhada,
					    id_unidade,id_classificacao,id_fornecedor, custo, custo_medio_venda, ncm, fabricante,
					    id_cfop,identificacao_interna,localizacao,prod_serv,qtd_minima,tamanho,cor,barra,id_importacao,cest,ean)
			VALUES(v_id_cadastro,v_id_usuario,v_codigo_barra,v_descricao,v_descricao_detalhada,
					    v_id_unidade,v_id_classificacao,v_id_fornecedor, v_custo, v_custo_medio_venda, v_ncm, v_fabricante,
					    v_id_cfop,v_identificacao_interna,v_localizacao,v_prod_serv,v_qtd_minima,v_tamanho,v_cor,v_barra,p_id_importacao,v_cest,v_ean);			
						
						
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_produtos;
	
	DELETE FROM base_web_control.tmp_imp_produto WHERE (id_cadastro = p_id_cadastro) AND STATUS = 'AP';
						
						
						
END;

#
# Procedure "sp_in_whatsapp_aniversariantes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_whatsapp_aniversariantes`(
	p_id_cadastro int
)
begin
	declare v_id_lista int;
	
	
	set v_id_lista = (select 
				id
			 from base_web_control.whatsapp_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista de Aniversariantes do Dia');
             
	DELETE FROM base_web_control.whatsapp_lista_telefones
    WHERE id_lista = v_id_lista
	AND id_cadastro = p_id_cadastro;
			 
			 
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	AND celular not in(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	AND ativo = 'A'
    AND DATE_FORMAT(data_nascimento,'%m%d') = DATE_FORMAT(now(),'%m%d')
	group by celular;
		
end;

#
# Procedure "sp_in_whatsapp_clientes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_whatsapp_clientes`(
	p_id_cadastro int
)
begin
	declare v_id_lista int;
	
	
	set v_id_lista = (select 
				id
			 from base_web_control.whatsapp_lista
			 where id_cadastro = p_id_cadastro 
			 and nome_lista = 'Lista dos meus clientes');
			 
			 
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	select
		p_id_cadastro,
		v_id_lista,
		IF(nome = '' OR nome IS NULL,razao_social,nome) AS nome,
		celular
	FROM base_web_control.cliente
	WHERE id_cadastro = p_id_cadastro
	AND celular != ''
	AND celular IS NOT NULL
	AND celular not in(SELECT telefone FROM `base_web_control`.whatsapp_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	AND ativo = 'A'
	group by celular;
		
end;

#
# Procedure "sp_in_whatsapp_inadimplentes"
#

CREATE PROCEDURE `base_web_control`.`sp_in_whatsapp_inadimplentes`(
	p_id_cadastro INT
)
BEGIN
	DECLARE v_id_lista INT;
	
	
	SET v_id_lista = (SELECT 
				id
			 FROM base_web_control.whatsapp_lista
			 WHERE id_cadastro = p_id_cadastro 
			 AND nome_lista = 'Lista de Inadimplentes');
			 
	delete from base_web_control.whatsapp_lista_telefones WHERE id_lista = v_id_lista;
			 
	INSERT INTO base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
		)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	INNER JOIN base_web_control.contas_pagar cp
	ON `base_web_control`.cp.id_cliente = `base_web_control`.c.id
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.data_vencimento < NOW()
	AND (`base_web_control`.cp.data_baixa IS NULL OR `base_web_control`.cp.valor_baixa IS NULL)
	AND `base_web_control`.cp.situacao = 'A'
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	GROUP BY celular, nome;
	
	
	insert into base_web_control.whatsapp_lista_telefones(
		id_cadastro,
		id_lista,
		nome,
		telefone
	)
	SELECT
		p_id_cadastro,
		v_id_lista,
		IF(`base_web_control`.c.nome = '' OR `base_web_control`.c.nome IS NULL,`base_web_control`.c.razao_social,`base_web_control`.c.nome) AS nome,
		`base_web_control`.c.celular
	FROM base_web_control.cliente c
	LEFT JOIN base_web_control.titulos_recebafacil cp
	ON `base_web_control`.cp.codLoja = p_id_cadastro
	AND `base_web_control`.cp.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	LEFT JOIN cs2.titulos_recebafacil cp2
	ON `base_web_control`.cp2.codLoja = p_id_cadastro
	AND `base_web_control`.cp2.cpfcnpj_devedor = `base_web_control`.c.cnpj_cpf
	WHERE `base_web_control`.c.id_cadastro = p_id_cadastro
	AND `base_web_control`.cp.vencimento < NOW()
	AND (`base_web_control`.cp.datapg IS NULL OR `base_web_control`.cp.valorpg IS NULL)
	AND `base_web_control`.c.celular != ''
	AND `base_web_control`.c.celular IS NOT NULL
	AND `base_web_control`.c.celular NOT IN(SELECT telefone FROM `base_web_control`.torpedo_lista_telefones WHERE id_cadastro = p_id_cadastro AND id_lista = v_id_lista)
	GROUP BY celular, nome;
		
END;

#
# Procedure "sp_inativar_replicar_limite_funcionario"
#

CREATE PROCEDURE `base_web_control`.`sp_inativar_replicar_limite_funcionario`()
BEGIN
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_id_funcionario INT;
	DECLARE v_qtd_dias INT;
	DECLARE v_valor DECIMAL(15,2);
	DECLARE v_renovar ENUM('S','N');
	DECLARE v_id_cadastro INT;
	DECLARE v_id_limite INT;
	
	DECLARE cur_limites_inativos CURSOR FOR SELECT
							id,
							id_funcionario,
							qtd_dias,
							valor,
							id_cadastro,
							renovar
						FROM `base_web_control`.limite_funcionario
						WHERE data_inicio + INTERVAL qtd_dias DAY <= NOW();
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	OPEN cur_limites_inativos;
		REPEAT
			FETCH cur_limites_inativos INTO v_id_limite, v_id_funcionario,v_qtd_dias,v_valor,v_id_cadastro,v_renovar;
			IF NOT v_pronto THEN
			
				UPDATE 
					base_web_control.limite_funcionario
				SET ativo = 'I'
				WHERE id = v_id_limite;
				
				IF v_renovar = 'S' THEN
				
					INSERT INTO base_web_control.limite_funcionario(
						
						id_funcionario,
						id_cadastro,
						data_inicio,
						qtd_dias,
						valor,
						renovar
						)
					VALUES(
						v_id_funcionario,
						v_id_cadastro,
						NOW(),
						v_qtd_dias,
						v_valor,
						v_renovar);
				
				END IF;
			
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_limites_inativos;
			
	
END;

#
# Procedure "sp_ins_forma_pagamento"
#

CREATE PROCEDURE `base_web_control`.`sp_ins_forma_pagamento`()
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE v_id_cadastro INT;
	DECLARE cur_cadastros CURSOR FOR SELECT
						codLoja
					FROM cs2.cadastro
					WHERE sitcli = 0;			
					
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	
	OPEN cur_cadastros;
		REPEAT
			IF NOT pronto THEN
			
			FETCH cur_cadastros INTO v_id_cadastro;
			
				INSERT INTO `base_web_control`.cliente_forma_pagamento(
					id_cadastro,
					id_forma_pagamento,
					num_parcelas,
					juro_mes,
					cod_convenio,
					cnpj_adm,
					chave_e_commerce,
					ativo,
					loja_virtual
				)
				SELECT
						v_id_cadastro,
						id,
						12,
						0.00,
						'',
						'',
						'',
						1,
						0
				FROM `base_web_control`.forma_pagamento
				WHERE id NOT IN (SELECT IFNULL(tp_pgto,0) FROM `base_web_control`.forma_pagamento_ecommerce WHERE id_cadastro = v_id_cadastro)
				;
			
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_cadastros;
END;

#
# Procedure "sp_insere_produtos_grade"
#

CREATE PROCEDURE `base_web_control`.`sp_insere_produtos_grade`()
BEGIN
	DECLARE pronto INT DEFAULT 0;
	DECLARE v_id_produto INT;
	DECLARE v_id_cadastro INT;
	DECLARE v_qtd_atual DECIMAL(10,2);
	DECLARE cur_produtos CURSOR FOR SELECT
						id_cadastro,
						id_produto
					FROM `base_web_control`.grade
					WHERE ativo = '1'
					ORDER BY id_grade ASC;
					
					
					
						
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	OPEN cur_produtos;
		REPEAT
			IF NOT pronto THEN
			FETCH cur_produtos INTO v_id_cadastro, v_id_produto;
			
			SET v_qtd_atual = (SELECT
						`base_web_control`.aux.qtd_atual
					
					FROM(
					SELECT
						    `base_web_control`.a.id_cadastro,
						     `base_web_control`.a.codigo_barra,
						    `base_web_control`.a.qtd_minima,
						    `base_web_control`.a.descricao,
						    TRUNCATE(`base_web_control`.a.custo,2) AS custo,
						    TRUNCATE(`base_web_control`.a.custo_medio_venda,2) AS custo_medio_venda,
						    `base_web_control`.c.descricao AS classificacao,
						    `base_web_control`.a.id,
						    `base_web_control`.a.ncm,
						    `base_web_control`.a.ativo,
						    `base_web_control`.a.porcentagem_custo_venda,
						    `base_web_control`.a.qtd_minima AS quantidadeMinima
						    , IFNULL(`base_web_control`.a.identificacao_interna,'') AS identificacao_interna
						    ,@adquirido:= IF (
							(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
								WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id ) IS NULL,
							0,
								(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto = `base_web_control`.a.id )
							)
							 AS tot_nt_entrada
						    ,@ajustee:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							 WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'I')
						    ) AS ajuste_entrada
						    ,@vend:=IF (
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra) IS NULL,
							0,
							(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
							    INNER JOIN base_web_control.venda_itens vi ON `base_web_control`.v.id = `base_web_control`.vi.id_venda
							    WHERE `base_web_control`.v.id_cadastro  = `base_web_control`.a.id_cadastro AND `base_web_control`.v.situacao  = 'C' AND   `base_web_control`.vi.estornado = 'N' AND
							    codigo_barra = `base_web_control`.a.codigo_barra)
						    ) AS tot_venda
						    ,@ajustes:=IF (
							(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							    WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R') IS NULL,
							    0,
							    (SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
							WHERE id_cadastro = `base_web_control`.a.id_cadastro AND id_produto  = `base_web_control`.a.id AND inserir_retirar = 'R')
						    ) AS ajuste_saida,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) AS qtd_atual,
						    (( @adquirido + @ajustee ) - (@vend + @ajustes )  ) * TRUNCATE(`base_web_control`.a.custo,2) AS custo_quantidade
						    FROM base_web_control.produto a
						    LEFT JOIN base_web_control.classificacao c ON `base_web_control`.a.id_classificacao = `base_web_control`.c.id
						    WHERE `base_web_control`.a.id_cadastro = v_id_cadastro
						    AND `base_web_control`.a.id = v_id_produto
						    ) AS aux);
						    
				UPDATE 
					`base_web_control`.grade 
				SET qtd_atual = v_qtd_atual 
				WHERE id_cadastro = v_id_cadastro 
				AND id_produto = v_id_produto;
			
			
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_produtos;
END;

#
# Procedure "sp_inserir_id_cadastro"
#

CREATE PROCEDURE `base_web_control`.`sp_inserir_id_cadastro`()
begin
	
	
	
	ALTER TABLE `base_web_control`.nfe_Produto_ISSQN ADD COLUMN id_cadastro INT AFTER data_sincronismo;
	ALTER TABLE `base_web_control`.venda_itens ADD COLUMN id_cadastro INT AFTER id_off;
	ALTER TABLE `base_web_control`.venda_pagamento ADD COLUMN id_cadastro INT AFTER id_off;
	
	
end;

#
# Procedure "sp_inutilizacao_sequencia"
#

CREATE PROCEDURE `base_web_control`.`sp_inutilizacao_sequencia`(
	p_id_cadastro INT,
	p_inicio INT,
	p_fim INT
)
begin
	
	while p_inicio <= p_fim do
	
	insert into base_web_control.nf_inutilizadas(
		id_cadastro,
		num_nota,
		tipo_nota,
		data_hora_inutilizacao,
		protocolo,
		motivo_inutilizacao)
	values(
		p_id_cadastro,
		p_inicio,
		'NFC',
		now(),
		'0000000000000000',
		'Emitida por outro sistema'
		);
		
		SET p_inicio = p_inicio + 1;
	
	end while;
	
	
	
end;

#
# Procedure "sp_migracao_clientes_inativos"
#

CREATE PROCEDURE `base_web_control`.`sp_migracao_clientes_inativos`()
BEGIN
	DECLARE v_id_cadastro INT;
	DECLARE v_nome_tabela VARCHAR(255);
	DECLARE v_coluna VARCHAR(255);
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_pronto_aux INT DEFAULT 0;
	DECLARE v_cont_cli INT DEFAULT 0;
	DECLARE v_cont_cli_aux INT DEFAULT 0;
	DECLARE v_cont_tabelas INT DEFAULT 0;
	DECLARE v_cont_tabelas_aux INT DEFAULT 0;
	
	DECLARE cur_clientes_inativos CURSOR FOR SELECT
							codLoja
						 FROM cs2.cadastro
						 WHERE sitcli = 2
						 AND codLoja NOT IN(SELECT id_cadastro FROM base_web_control_inativos.log_migracao);
	
	DECLARE cur_tabelas CURSOR FOR SELECT
						`base_web_control`.t.TABLE_NAME,
						`base_web_control`.c.COLUMN_NAME
					FROM information_schema.TABLES t
					INNER JOIN information_schema.COLUMNS c
					ON `base_web_control`.t.TABLE_NAME = `base_web_control`.c.TABLE_NAME
					AND (`base_web_control`.c.COLUMN_NAME = 'id_cadastro' OR `base_web_control`.c.COLUMN_NAME = 'codLoja')
					AND `base_web_control`.t.TABLE_SCHEMA = 'base_web_control'
					WHERE `base_web_control`.t.TABLE_SCHEMA = 'base_web_control'
					AND `base_web_control`.c.TABLE_SCHEMA = 'base_web_control';
					
	SET v_cont_cli = (SELECT
				count(codLoja)
			 FROM cs2.cadastro
			 WHERE sitcli = 2
			 AND codLoja NOT IN(SELECT id_cadastro FROM base_web_control_inativos.log_migracao)
			 );
			 
	SET v_cont_tabelas = (SELECT
					COUNT(`base_web_control`.t.TABLE_NAME)
				FROM information_schema.TABLES t
				INNER JOIN information_schema.COLUMNS c
				ON `base_web_control`.t.TABLE_NAME = `base_web_control`.c.TABLE_NAME
				AND (`base_web_control`.c.COLUMN_NAME = 'id_cadastro' OR `base_web_control`.c.COLUMN_NAME = 'codLoja' )
				AND `base_web_control`.t.TABLE_SCHEMA = 'base_web_control'
				WHERE `base_web_control`.t.TABLE_SCHEMA = 'base_web_control'
				AND `base_web_control`.c.TABLE_SCHEMA = 'base_web_control');
				
	
	





	OPEN cur_clientes_inativos;
		REPEAT
			FETCH cur_clientes_inativos INTO v_id_cadastro;
			IF NOT v_pronto THEN
			
				set v_cont_cli_aux = v_cont_cli_aux + 1;
			
				OPEN cur_tabelas;
					REPEAT
						FETCH cur_tabelas INTO v_nome_tabela, v_coluna;
						IF NOT v_pronto_aux THEN
						
							set v_cont_tabelas_aux = v_cont_tabelas_aux + 1;
							
							SET @sql = CONCAT('INSERT INTO base_web_control_inativos.',v_nome_tabela, '
									   SELECT
										*
									   FROM base_web_control.', v_nome_tabela, 
									   ' WHERE ', v_coluna, ' = ', v_id_cadastro);
							prepare stmt_insert from @sql;
							execute stmt_insert;
							deallocate prepare stmt_insert;
							
							INSERT INTO base_web_control_inativos.log_migracao(id_cadastro,nome_tabela)
							VALUES(v_id_cadastro,v_nome_tabela );
											   
							if v_cont_tabelas_aux = v_cont_tabelas then
							
								set v_pronto_aux = 1;
							
							end if;
							
						
						END IF;
					UNTIL v_pronto_aux END REPEAT;
				CLOSE cur_tabelas;
				
				SET v_pronto_aux = 0;
				set v_cont_tabelas_aux = 0;
				
				
				
				if v_cont_cli_aux = v_cont_cli then
				
					set v_pronto = 1;
									
				end if;
				select v_cont_cli_aux, v_cont_cli;
				
									
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_clientes_inativos;
END;

#
# Procedure "sp_ranking_afiliacoes"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_afiliacoes`(
	p_id_franquia int
)
begin
	DECLARE v_mes_atual INT;
	DECLARE v_data_adicionar DATETIME;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_total_meses INT;
	DECLARE v_data_inicio DATETIME;
	DECLARE v_data_fim DATETIME;
	DECLARE v_falta INT;
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas_afiliacoes1
				     ORDER BY data_inicio ASC;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
		
	SET v_mes_atual = MONTH(NOW());
		
	
 	


	
	WHILE v_while <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-01 18:01:59');
				SET v_data_fim = CONCAT(YEAR(NOW()) -1,'-12-',DAY(LAST_DAY(v_data_inicio)), ' 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-01 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-', DAY(LAST_DAY(v_data_inicio)),' 18:00:00');
			
			END IF;
			
			
		
			SET v_while = v_while + 1;
	END WHILE;
	
	DELETE FROM base_web_control.tmp_grafico_afiliacoes;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_afiliacoes1);
	
	SET v_while = 1;
	
	WHILE v_falta +2 <= 12 DO
	
		if v_falta = 0 then
			
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 2,'-12-25 18:01:59');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:59');
		
		else
		
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-25 18:01:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:59:00');
		
		end if;
	
  INSERT INTO `base_web_control`.tmp_datas_afiliacoes1(data_inicio, data_fim)
 VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;	
	


	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
				
				INSERT INTO `base_web_control`.tmp_datas_afiliacoes1(valor, data_inicio, data_fim)
				SELECT
				    COUNT(*) AS VALUE,
				    v_data_inicio,
				    v_data_fim
				    
				FROM cs2.cadastro
				WHERE id_franquia = p_id_franquia
				AND dt_cad BETWEEN v_data_inicio AND v_data_fim ;
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	SELECT
		valor AS VALUE,
		data_inicio,
		data_fim,
		CASE MONTH(data_fim)
		WHEN 1 THEN
		'JAN'
		WHEN 2 THEN
		'FEV'
		WHEN 3 THEN
		'MAR'
		WHEN 4 THEN
		'ABR'
		WHEN 5 THEN
		'MAI'
		WHEN 6 THEN
		'JUN'
		WHEN 7 THEN
		'JUL'
		WHEN 8 THEN
		'AGO'
		WHEN 9 THEN
		'SET'
		WHEN 10 THEN
		'OUT'
		WHEN 11 THEN
		'NOV'
		ELSE
		'DEZ'
		END AS label
		
	FROM `base_web_control`.tmp_datas_afiliacoes1;
	DELETE FROM base_web_control.tmp_datas_afiliacoes1;
		
end;

#
# Procedure "sp_ranking_afiliacoes_comparar"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_afiliacoes_comparar`(p_id_franquia int)
BEGIN
  DECLARE v_mes_atual int;
  DECLARE v_data_adicionar datetime;
  DECLARE v_while int DEFAULT 1;
  DECLARE v_total_meses int;
  DECLARE v_data_inicio datetime;
  DECLARE v_data_fim datetime;
  DECLARE v_falta int;
  DECLARE v_qtd_contratos int;
  DECLARE v_pronto int DEFAULT 0;
  DECLARE cur_datas CURSOR FOR
    SELECT
      `data_inicio`, `data_fim`
    FROM
      `base_web_control`.`tmp_datas_afiliacoes_comparar`
    ORDER BY `data_inicio` ASC;
  DECLARE CONTINUE HANDLER FOR NOT FOUND
    SET v_pronto = 1;
  SET v_mes_atual = MONTH(NOW());
  
  
  WHILE v_while -1  <= v_mes_atual DO
    IF v_while = 1 THEN
				SET v_data_inicio = CONCAT(YEAR(NOW()) -1,'-12-01 00:00:00');
				SET v_data_fim = CONCAT(YEAR(NOW()) -1,'-12-',DAY(LAST_DAY(v_data_inicio)),' 23:59:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-01 00:00:00');
				SET v_data_fim = CONCAT(YEAR(v_data_inicio),'-',LPAD(v_while -1,2,0),'-',DAY(LAST_DAY(v_data_inicio)),' 23:59:00');
    END IF;
    INSERT
      INTO `base_web_control`.`tmp_datas_afiliacoes_comparar`
      (`data_inicio`, `data_fim`)
    VALUES
      (v_data_inicio, v_data_fim);
    SET v_while = v_while + 1;
  END WHILE;
  SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.`tmp_datas_afiliacoes_comparar`);
  SET v_while = 1;
  WHILE v_falta +1 <= 12 DO
		SET v_data_inicio = CONCAT(YEAR(NOW()) -1,'-', LPAD(v_falta,2,0),'-01 00:00:00');
		SET v_data_fim = CONCAT(YEAR(NOW()) -1,'-',LPAD(v_falta,2,0),'-',DAY(LAST_DAY(v_data_inicio)),' 23:59:00');
    INSERT
      INTO `base_web_control`.`tmp_datas_afiliacoes_comparar`
      (`data_inicio`, `data_fim`)
    VALUES
      (v_data_inicio, v_data_fim);
    SET v_falta = v_falta + 1;
  END WHILE;
  
  
  OPEN cur_datas;
  REPEAT
    FETCH cur_datas INTO v_data_inicio, v_data_fim;
    IF NOT v_pronto THEN
      INSERT
        INTO `base_web_control`.`tmp_grafico_afiliacoes`
        (`valor`, `data_inicio`, `data_fim`)
        SELECT
          COUNT(*) AS 'VALUE', v_data_inicio, v_data_fim
        FROM
          `cs2`.`cadastro`
        WHERE
          `id_franquia` = p_id_franquia AND `dt_cad` BETWEEN v_data_inicio AND v_data_fim;
    END IF;
  UNTIL v_pronto END REPEAT;
  CLOSE cur_datas;
  SELECT
    `valor` AS 'VALUE', `data_inicio`, `data_fim`, CASE MONTH(`data_fim`)
      WHEN 1 THEN 'JAN'
      WHEN 2 THEN 'FEV'
      WHEN 3 THEN 'MAR'
      WHEN 4 THEN 'ABR'
      WHEN 5 THEN 'MAI'
      WHEN 6 THEN 'JUN'
      WHEN 7 THEN 'JUL'
      WHEN 8 THEN 'AGO'
      WHEN 9 THEN 'SET'
      WHEN 10 THEN 'OUT'
      WHEN 11 THEN 'NOV'
      ELSE 'DEZ'
    END AS 'label'
  FROM
    `base_web_control`.`tmp_grafico_afiliacoes`;
  DELETE FROM `base_web_control`.`tmp_grafico_afiliacoes`;
	DELETE FROM `base_web_control`.`tmp_datas_afiliacoes_comparar`;
END;

#
# Procedure "sp_ranking_afiliacoes_consultor"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_afiliacoes_consultor`(IN `p_id_franquia` INT
)
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_inicio VARCHAR(25);
	DECLARE v_data_fim VARCHAR(25);
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_aux_while INT DEFAULT 1;
	DECLARE v_aux_mes INT DEFAULT 1;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_falta INT;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas_equi_cons;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_datas_equi_cons;
	
	CREATE TEMPORARY TABLE `base_web_control`.tmp_datas_equi_cons(data_inicio VARCHAR(25), data_fim VARCHAR(25));
	
	
	SET v_mes_atual = MONTH(NOW());
	
	SET v_mes_atual = (v_mes_atual -1);
	
		
	WHILE v_while <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas_equi_cons(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_while = v_while + 1;
	END WHILE;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_equi_cons);
	
	SET v_while = 1;
	
	WHILE v_falta +1 <= 12 DO
	
		
		IF v_falta = 0 THEN
			
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 2,'-12-25 18:01:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:00');
		
		ELSE
		
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-25 18:01:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:00');
		
		END IF;
	
		INSERT INTO `base_web_control`.tmp_datas_equi_cons(data_inicio, data_fim)
		VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_grafico_afiliacoes_consultor;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_grafico_afiliacoes_consultor(valor INT, data_inicio VARCHAR(25), data_fim VARCHAR(25), mes INT, id_consultor INT);
	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_grafico_afiliacoes_consultor(valor, data_inicio, data_fim, mes, id_consultor)
				SELECT
					COUNT(`base_web_control`.c.codLoja) AS VALUE,
					v_data_inicio,
					v_data_fim,
					v_aux_mes,
					`base_web_control`.c.id_consultor
				FROM cs2.consultores_assistente ca
				LEFT JOIN cs2.cadastro c
				ON `base_web_control`.ca.id = `base_web_control`.c.id_consultor
				AND `base_web_control`.c.id_franquia = p_id_franquia
				AND `base_web_control`.c.dt_cad BETWEEN v_data_inicio AND v_data_fim
				AND `base_web_control`.ca.situacao = 0
				and `base_web_control`.c.contadorsn != 'S'
				WHERE `base_web_control`.ca.id_franquia = p_id_franquia
				GROUP BY `base_web_control`.c.id_consultor;
					  
				    
				    
				
				
				
				SET v_aux_mes = v_aux_mes + 1;
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_ranking_geral;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_ranking_geral(
		id_consultor INT, 
		total INT DEFAULT 0,
		mes1 INT DEFAULT 0,
		mes1_label VARCHAR(11), 
		mes2 INT DEFAULT 0, 
		mes2_label VARCHAR(11), 
		mes3 INT DEFAULT 0, 
		mes3_label VARCHAR(11), 
		mes4 INT DEFAULT 0, 
		mes4_label VARCHAR(11), 
		mes5 INT DEFAULT 0, 
		mes5_label VARCHAR(11), 
		mes6 INT DEFAULT 0, 
		mes6_label VARCHAR(11), 
		mes7 INT DEFAULT 0, 
		mes7_label VARCHAR(11), 
		mes8 INT DEFAULT 0, 
		mes8_label VARCHAR(11), 
		mes9 INT DEFAULT 0, 
		mes9_label VARCHAR(11), 
		mes10 INT DEFAULT 0, 
		mes10_label VARCHAR(11), 
		mes11 INT DEFAULT 0, 
		mes11_label VARCHAR(11), 
		mes12 INT DEFAULT 0,
		mes12_label VARCHAR(11), 
		nome VARCHAR(50));
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, total, nome)
	SELECT
		id_consultor,
		SUM(`base_web_control`.a.valor) AS total,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	GROUP BY `base_web_control`.a.id_consultor
	ORDER BY total DESC;
	
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes1, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 1
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes2, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 2
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes3, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 3
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes4, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 4
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes5, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 5
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes6, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 6
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes7, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 7
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes8, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 8
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes9, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 9
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes10, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 10
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes11, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 11
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes12, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 12
	GROUP BY `base_web_control`.a.id_consultor;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes1_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 1
	
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes2_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 2
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes3_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 3
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes4_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 4
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes5_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 5
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes6_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 6
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes7_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 7
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes8_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 8
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes9_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 9
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes10_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes =10
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes11_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 11
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes12_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 12
	LIMIT 1) ;
	
	
	SELECT
		id_consultor,
		SUM(total) AS total,
		SUM(mes1) AS mes1,
		MAX(mes1_label) AS mes1_label,		
		SUM(mes2) AS mes2,
		MAX(mes2_label) AS mes2_label,
		SUM(mes3) AS mes3,
		MAX(mes3_label) AS mes3_label,
		SUM(mes4) AS mes4,
		MAX(mes4_label) AS mes4_label,
		SUM(mes5) AS mes5,
		MAX(mes5_label) AS mes5_label,
		SUM(mes6) AS mes6,
		MAX(mes6_label) AS mes6_label,
		SUM(mes7) AS mes7,
		MAX(mes7_label) AS mes7_label,
		SUM(mes8) AS mes8,
		MAX(mes8_label) AS mes8_label,
		SUM(mes9) AS mes9,
		MAX(mes9_label) AS mes9_label,
		SUM(mes10) AS mes10,
		MAX(mes10_label) AS mes10_label,
		SUM(mes11) AS mes11,
		MAX(mes11_label) AS mes11_label,
		SUM(mes12) AS mes12,
		MAX(mes12_label) AS mes12_label,
		nome
	
	FROM `base_web_control`.tmp_ranking_geral
	WHERE nome != ''
	GROUP BY id_consultor
	ORDER BY total DESC;

		
END;

#
# Procedure "sp_ranking_afiliacoes_consultorteste"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_afiliacoes_consultorteste`(
	p_id_franquia INT
)
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_inicio VARCHAR(25);
	DECLARE v_data_fim VARCHAR(25);
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_aux_while INT DEFAULT 1;
	DECLARE v_aux_mes INT DEFAULT 1;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_datas;
	
	CREATE TEMPORARY TABLE `base_web_control`.tmp_datas(data_inicio VARCHAR(25), data_fim VARCHAR(25));
	
	SET v_mes_atual = MONTH(NOW()) +1;
	
	WHILE v_aux_while <= v_mes_atual DO
	
		IF v_aux_while = v_mes_atual AND DAY(NOW()) < 25 THEN
		
			SET v_aux_while = v_aux_while + 1;
		
		ELSE
	
			IF v_aux_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_aux_while,2,0),'-25 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_aux_while -1,2,0),'-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_aux_while,2,0),'-25 18:00:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_aux_while = v_aux_while + 1;
		END IF;
		
		
	
	END WHILE ; 
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_grafico_afiliacoes_consultor;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_grafico_afiliacoes_consultor(valor INT, data_inicio VARCHAR(25), data_fim VARCHAR(25), mes INT, id_consultor INT);
	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_grafico_afiliacoes_consultor(valor, data_inicio, data_fim, mes, id_consultor)
				SELECT
				    COUNT(*) AS VALUE,
				    v_data_inicio,
				    v_data_fim,
				    v_aux_mes,
				    `base_web_control`.c.id_consultor
				FROM cs2.cadastro c
				INNER JOIN cs2.consultores_assistente ca
				ON `base_web_control`.ca.id = `base_web_control`.c.id_consultor
				AND `base_web_control`.ca.situacao = 0
				WHERE `base_web_control`.c.id_franquia = p_id_franquia
				and `base_web_control`.ca.id_franquia = p_id_franquia
				AND `base_web_control`.c.dt_cad BETWEEN v_data_inicio AND v_data_fim 
				GROUP BY `base_web_control`.c.id_consultor;
				
				SET v_aux_mes = v_aux_mes + 1;
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_ranking_geral;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_ranking_geral(
		id_consultor INT, 
		total INT DEFAULT 0,
		jan INT DEFAULT 0, 
		fev INT DEFAULT 0, 
		mar INT DEFAULT 0, 
		abr INT DEFAULT 0, 
		mai INT DEFAULT 0, 
		jun INT DEFAULT 0, 
		jul INT DEFAULT 0, 
		ago INT DEFAULT 0, 
		sete INT DEFAULT 0, 
		outu INT DEFAULT 0, 
		nov INT DEFAULT 0, 
		dez INT DEFAULT 0,
		nome VARCHAR(50));
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, total, nome)
	SELECT
		id_consultor,
		SUM(`base_web_control`.a.valor) AS total,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	GROUP BY `base_web_control`.a.id_consultor
	ORDER BY total DESC;
	
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, jan, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 1
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, fev, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 2
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mar, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 3
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, abr, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 4
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mai, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 5
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, jun, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 6
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, jul, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 7
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, ago, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 8
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, sete, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 9
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, outu, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 10
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, nov, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 11
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, dez, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 12
	AND `base_web_control`.ca.id_franquia = p_id_franquia
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	SELECT
		id_consultor,
		SUM(total) AS total,
		SUM(jan) AS jan,		
		SUM(fev) AS fev,
		SUM(mar) AS mar,
		SUM(abr) AS abr,
		SUM(mai) AS mai,
		SUM(jun) AS jun,
		SUM(jul) AS jul,
		SUM(ago) AS ago,
		SUM(sete) AS sete,
		SUM(outu) AS outu,
		SUM(nov) AS nov,
		SUM(dez) AS dez,
		nome
	
	FROM `base_web_control`.tmp_ranking_geral
	WHERE nome != ''
	GROUP BY id_consultor
	ORDER BY total DESC;

		
END;

#
# Procedure "sp_ranking_atendimento_externo"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_atendimento_externo`()
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_inicio VARCHAR(25);
	DECLARE v_data_fim VARCHAR(25);
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_aux_while INT DEFAULT 1;
	DECLARE v_aux_mes INT DEFAULT 1;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_falta INT;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas_atendimento;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
		DELETE FROM base_web_control.tmp_datas_atendimento;


	
	SET v_mes_atual = MONTH(NOW());
	
		
	
	
	WHILE v_while <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas_atendimento(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_while = v_while + 1;
	END WHILE;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_atendimento);
	
	SET v_while = 1;
	
	WHILE v_falta +1 <= 12 DO
	
		
		IF v_falta = 0 THEN
			
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 2,'-12-26 00:00:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 23:59:00');
		
		ELSE
		
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-26 00:00:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 :00:00');
		
		END IF;
	
		INSERT INTO `base_web_control`.tmp_datas_atendimento(data_inicio, data_fim)
		VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;
	
	
	
  DELETE FROM base_web_control.tmp_ranking_atendimento;


	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_ranking_atendimento(valor, data_inicio, data_fim, mes, nome)
				SELECT
				    (select COUNT(*) from base_inform.cadastro_imagem where data_consultoria between v_data_inicio AND v_data_fim and consultora = SUBSTRING_INDEX(`base_web_control`.f.nome, ' ', 1) and consultoria_realizada = 1)AS VALUE,
				    v_data_inicio,
				    v_data_fim,
				    v_aux_mes,
				    `base_web_control`.ci.consultora
				    
				FROM cs2.funcionario f
				LEFT JOIN base_inform.cadastro_imagem ci
				ON substring_index(`base_web_control`.f.nome, ' ', 1) = `base_web_control`.ci.consultora
				and `base_web_control`.ci.data_consultoria BETWEEN v_data_inicio AND v_data_fim
				wHERE `base_web_control`.f.ativo = 'S' and `base_web_control`.f.funcao = 19 #(f.id = 212 or f.id = 250 or f.id = 230 or f.id = 297)
				gROUP BY `base_web_control`.ci.consultora;
				
				SET v_aux_mes = v_aux_mes + 1;
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	
	
  DELETE FROM base_web_control.tmp_ranking_geral;	




























		

	INSERT INTO `base_web_control`.tmp_ranking_geral(total, nome)
	SELECT
		SUM(`base_web_control`.a.valor) AS total,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	GROUP BY `base_web_control`.a.nome
	ORDER BY total DESC;
	
 	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes1, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	where `base_web_control`.a.mes = 1
	gROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes2, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 2
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes3, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 3
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes4, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 4
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes5, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 5
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes6, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 6
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes7, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 7
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes8, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 8
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes9, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 9
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes10, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 10
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes11, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 11
	GROUP BY `base_web_control`.a.nome;
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(mes12, nome)
	SELECT
		`base_web_control`.a.valor,
		`base_web_control`.a.nome
	FROM `base_web_control`.tmp_ranking_atendimento a
	WHERE `base_web_control`.a.mes = 12
	GROUP BY `base_web_control`.a.nome;
	
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes1_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 1
	
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes2_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 2
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes3_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 3
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes4_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 4
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes5_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 5
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes6_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 6
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes7_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 7
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes8_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 8
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes9_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 9
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes10_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes =10
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes11_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 11
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes12_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_ranking_atendimento
	WHERE mes = 12
	LIMIT 1) ;



	SELECT
		
		SUM(total) AS total,
		SUM(mes1) AS mes1,
		MAX(mes1_label) AS mes1_label,		
		SUM(mes2) AS mes2,
		MAX(mes2_label) AS mes2_label,
		SUM(mes3) AS mes3,
		MAX(mes3_label) AS mes3_label,
		SUM(mes4) AS mes4,
		MAX(mes4_label) AS mes4_label,
		SUM(mes5) AS mes5,
		MAX(mes5_label) AS mes5_label,
		SUM(mes6) AS mes6,
		MAX(mes6_label) AS mes6_label,
		SUM(mes7) AS mes7,
		MAX(mes7_label) AS mes7_label,
		SUM(mes8) AS mes8,
		MAX(mes8_label) AS mes8_label,
		SUM(mes9) AS mes9,
		MAX(mes9_label) AS mes9_label,
		SUM(mes10) AS mes10,
		MAX(mes10_label) AS mes10_label,
		SUM(mes11) AS mes11,
		MAX(mes11_label) AS mes11_label,
		SUM(mes12) AS mes12,
		MAX(mes12_label) AS mes12_label,
		nome
	
	FROM `base_web_control`.tmp_ranking_geral
	WHERE nome != ''
	and nome is not null
	GROUP BY nome
	ORDER BY total DESC;		
	
END;

#
# Procedure "sp_ranking_equipamentos_consultor"
#

CREATE PROCEDURE `base_web_control`.`sp_ranking_equipamentos_consultor`(IN `p_id_franquia` INT
)
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_inicio VARCHAR(25);
	DECLARE v_data_fim VARCHAR(25);
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	DECLARE v_aux_while INT DEFAULT 1;
	DECLARE v_aux_mes INT DEFAULT 1;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_falta INT;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas_equi_cons;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_datas_equi_cons;
	
	CREATE TEMPORARY TABLE `base_web_control`.tmp_datas_equi_cons(data_inicio VARCHAR(25), data_fim VARCHAR(25));
	
	
	SET v_mes_atual = MONTH(NOW());
	
	SET v_mes_atual = (v_mes_atual -1);
	
		
	WHILE v_while <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas_equi_cons(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_while = v_while + 1;
	END WHILE;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas_equi_cons);
	
	SET v_while = 1;
	
	WHILE v_falta +1 <= 12 DO
	
		
		IF v_falta = 0 THEN
			
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 2,'-12-25 18:01:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:00');
		
		ELSE
		
			SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-25 18:01:00');
			SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:00');
		
		END IF;
	
		INSERT INTO `base_web_control`.tmp_datas_equi_cons(data_inicio, data_fim)
		VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_grafico_afiliacoes_consultor;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_grafico_afiliacoes_consultor(valor INT, data_inicio VARCHAR(25), data_fim VARCHAR(25), mes INT, id_consultor INT);
	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_grafico_afiliacoes_consultor(valor, data_inicio, data_fim, mes, id_consultor)
				SELECT
				
				
				(SELECT
             COUNT(`base_web_control`.ced.id) AS qtd
     	 FROM cs2.cadastro_equipamento ce
     	 LEFT JOIN cs2.cadastro_equipamento_descricao ced ON `base_web_control`.ced.id_cadastro_equipamento = `base_web_control`.ce.id
       LEFT JOIN base_web_control.produto p ON `base_web_control`.p.id_cadastro=62735 and (`base_web_control`.ced.codigo_barra = `base_web_control`.p.codigo_barra OR `base_web_control`.ced.codigo_barra = `base_web_control`.p.identificacao_interna)
       WHERE ( `base_web_control`.ce.id_consultor = `base_web_control`.c.id or `base_web_control`.ce.id_consultor = `base_web_control`.c.id_consultor_assistente )
               AND `base_web_control`.ce.data_venda BETWEEN v_data_inicio AND v_data_fim
               AND (`base_web_control`.p.codigo_barra = '7897013555428'   
                OR `base_web_control`.p.codigo_barra = '7892237023227'   
                OR `base_web_control`.p.codigo_barra = '7898378253325'   
                OR `base_web_control`.p.codigo_barra = 'OS214PLUS'       
                OR `base_web_control`.p.codigo_barra = '7898378250515'   
                OR `base_web_control`.p.codigo_barra = '7898378250676'   
                OR `base_web_control`.p.codigo_barra = '7898378252168'   
                OR `base_web_control`.p.codigo_barra = '7898378252519'   
                OR `base_web_control`.p.codigo_barra = '7898378250508'   
                OR `base_web_control`.p.codigo_barra = '8806087771695'   
                OR `base_web_control`.p.codigo_barra = '6935364050542'   
                OR `base_web_control`.p.codigo_barra = '7898378253950'   
              )
       ) AS qtd,
					     v_data_inicio,
					     v_data_fim,
					     v_aux_mes,
					     `base_web_control`.c.id_consultor_assistente AS id
				FROM cs2.funcionario c
				WHERE `base_web_control`.c.ativo = 'S'
				AND `base_web_control`.c.consultor_assistente = 'C'
				AND `base_web_control`.c.id_franqueado = p_id_franquia
				ORDER BY qtd DESC;
				
				
				SET v_aux_mes = v_aux_mes + 1;
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_ranking_geral;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_ranking_geral(
		id_consultor INT, 
		total INT DEFAULT 0,
		mes1 INT DEFAULT 0,
		mes1_label VARCHAR(11), 
		mes2 INT DEFAULT 0, 
		mes2_label VARCHAR(11), 
		mes3 INT DEFAULT 0, 
		mes3_label VARCHAR(11), 
		mes4 INT DEFAULT 0, 
		mes4_label VARCHAR(11), 
		mes5 INT DEFAULT 0, 
		mes5_label VARCHAR(11), 
		mes6 INT DEFAULT 0, 
		mes6_label VARCHAR(11), 
		mes7 INT DEFAULT 0, 
		mes7_label VARCHAR(11), 
		mes8 INT DEFAULT 0, 
		mes8_label VARCHAR(11), 
		mes9 INT DEFAULT 0, 
		mes9_label VARCHAR(11), 
		mes10 INT DEFAULT 0, 
		mes10_label VARCHAR(11), 
		mes11 INT DEFAULT 0, 
		mes11_label VARCHAR(11), 
		mes12 INT DEFAULT 0,
		mes12_label VARCHAR(11), 
		nome VARCHAR(50));
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, total, nome)
	SELECT
		id_consultor,
		SUM(`base_web_control`.a.valor) AS total,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	GROUP BY `base_web_control`.a.id_consultor
	ORDER BY total DESC;
	
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes1, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 1
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes2, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 2
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes3, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 3
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes4, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 4
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes5, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 5
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes6, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 6
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes7, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 7
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes8, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 8
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes9, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 9
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes10, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 10
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes11, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 11
	GROUP BY `base_web_control`.a.id_consultor;
	
	
	INSERT INTO `base_web_control`.tmp_ranking_geral(id_consultor, mes12, nome)
	SELECT
		id_consultor,
		`base_web_control`.a.valor,
		`base_web_control`.ca.nome
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor a
	INNER JOIN cs2.consultores_assistente ca
	ON `base_web_control`.ca.id = `base_web_control`.a.id_consultor
	WHERE `base_web_control`.ca.situacao = 0
	AND `base_web_control`.ca.tipo_cliente = 0
	AND `base_web_control`.ca.tipo_funcionario = 'I'
	AND `base_web_control`.a.mes = 12
	GROUP BY `base_web_control`.a.id_consultor;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes1_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 1
	
	LIMIT 1) ;
	
	UPDATE `base_web_control`.tmp_ranking_geral SET mes2_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 2
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes3_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 3
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes4_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 4
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes5_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 5
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes6_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 6
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes7_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 7
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes8_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 8
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes9_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 9
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes10_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes =10
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes11_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 11
	LIMIT 1) ;
	UPDATE `base_web_control`.tmp_ranking_geral SET mes12_label = (SELECT
	CONCAT(CASE MONTH(data_fim)
	WHEN 1 THEN
	'JAN'
	WHEN 2 THEN
	'FEV'
	WHEN 3 THEN
	'MAR'
	WHEN 4 THEN
	'ABR'
	WHEN 5 THEN
	'MAI'
	WHEN 6 THEN
	'JUN'
	WHEN 7 THEN
	'JUL'
	WHEN 8 THEN
	'AGO'
	WHEN 9 THEN
	'SET'
	WHEN 10 THEN
	'OUT'
	WHEN 11 THEN
	'NOV'
	ELSE
	'DEZ'
	END, '/', YEAR(data_fim)) AS label
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor
	WHERE mes = 12
	LIMIT 1) ;
	
	
	SELECT
		id_consultor,
		SUM(total) AS total,
		SUM(mes1) AS mes1,
		MAX(mes1_label) AS mes1_label,		
		SUM(mes2) AS mes2,
		MAX(mes2_label) AS mes2_label,
		SUM(mes3) AS mes3,
		MAX(mes3_label) AS mes3_label,
		SUM(mes4) AS mes4,
		MAX(mes4_label) AS mes4_label,
		SUM(mes5) AS mes5,
		MAX(mes5_label) AS mes5_label,
		SUM(mes6) AS mes6,
		MAX(mes6_label) AS mes6_label,
		SUM(mes7) AS mes7,
		MAX(mes7_label) AS mes7_label,
		SUM(mes8) AS mes8,
		MAX(mes8_label) AS mes8_label,
		SUM(mes9) AS mes9,
		MAX(mes9_label) AS mes9_label,
		SUM(mes10) AS mes10,
		MAX(mes10_label) AS mes10_label,
		SUM(mes11) AS mes11,
		MAX(mes11_label) AS mes11_label,
		SUM(mes12) AS mes12,
		MAX(mes12_label) AS mes12_label,
		nome
	
	FROM `base_web_control`.tmp_ranking_geral
	WHERE nome != ''
	GROUP BY id_consultor
	ORDER BY total DESC;

		
END;

#
# Procedure "sp_remover_dados_imposto_prod"
#

CREATE PROCEDURE `base_web_control`.`sp_remover_dados_imposto_prod`(
	IN `v_id_cadastro` INT
)
BEGIN

DECLARE error INT DEFAULT 0;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;	

delete from `base_web_control`.nfe_Produto_COFINS where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_COFINS c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_COFINSST where produto_id in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_COFINSST c on `base_web_control`.p.id = `base_web_control`.c.produto_id where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_ICMS where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_ICMS c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_II where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_II c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_IPI where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_IPI c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_ISSQN where produto_id in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_ISSQN c on `base_web_control`.p.id = `base_web_control`.c.produto_id where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_PIS where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_PIS c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

delete from `base_web_control`.nfe_Produto_PISST where id_produto in (select * from (
select `base_web_control`.p.id from `base_web_control`.produto p inner join `base_web_control`.nfe_Produto_PISST c on `base_web_control`.p.id = `base_web_control`.c.id_produto where `base_web_control`.p.id_cadastro = v_id_cadastro
) as t);

IF error = 0 THEN	
	SELECT error AS erro;
ELSE
	SELECT error AS erro;
ENd if;
		
END;

#
# Procedure "sp_replicar_dados_imposto_prod"
#

CREATE PROCEDURE `base_web_control`.`sp_replicar_dados_imposto_prod`(
	IN `v_id_cadastro` INT,
	IN `v_codigo_barra` varchar(25)

)
BEGIN
	DECLARE v_id_produto INT;
	DECLARE error INT DEFAULT 0;



 	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET error = 1;	

	SELECT
		id
	INTO v_id_produto
	FROM `base_web_control`.produto
	WHERE id_cadastro = v_id_cadastro
	AND codigo_barra = v_codigo_barra;
	
	
	
	INSERT INTO `base_web_control`.nfe_Produto_COFINS(
		id_produto,
		CST,
		pCOFINS,
		qBCProd,
		v_aliq,
		tp_calculo,
		tp_imposto)
	SELECT
		`base_web_control`.p.id,
		(SELECT CST FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto),
		(SELECT pCOFINS FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto),
		(SELECT qBCProd FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto),
		(SELECT v_aliq FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto),
		(SELECT tp_calculo FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto),
		(SELECT tp_imposto FROM `base_web_control`.nfe_Produto_COFINS WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_COFINS pim
	ON `base_web_control`.pim.id_produto = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	
	
	
	INSERT INTO `base_web_control`.nfe_Produto_COFINSST(
		imposto_id,
		pCOFINS,
		qBCProd,
		v_aliq,
		tp_calculo,
		produto_id,
		tp_imposto
	)
	SELECT
		(SELECT imposto_id FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto),
		(SELECT pCOFINS FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto),
		(SELECT qBCProd FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto),
		(SELECT v_aliq FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto),
		(SELECT tp_calculo FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto),
		`base_web_control`.p.id,
		(SELECT tp_imposto FROM `base_web_control`.nfe_Produto_COFINSST WHERE produto_id = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_COFINSST pim
	ON `base_web_control`.pim.produto_id = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.produto_id IS NULL;
	
	
	INSERT INTO `base_web_control`.nfe_Produto_ICMS(
		id_produto,
		orig,
		CST,
		modBC,
		pRedBC,
		pICMS,
		modBCST,
		pMVAST,
		pRedBCST,
		pICMSST,
		regimes,
		pOpePropria,
		uf,
		vl_aliq_calc_cre,
		bc_icms_st_ret_ant,
		pMVAST_LR,
		valor_desoneracao_icms,
		motivo_desoneracao_icms,
		percentual_diferimento_icms,
		uf_retido_remetente_icms_st,
		uf_destino_icms_st
	)
	SELECT
		`base_web_control`.p.id,
		(SELECT orig FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT CST FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT modBC FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pRedBC FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pICMS FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT modBCST FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pMVAST FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pRedBCST FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pICMSST FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT regimes FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pOpePropria FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT uf FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT vl_aliq_calc_cre FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT bc_icms_st_ret_ant FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT pMVAST_LR FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT valor_desoneracao_icms FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT motivo_desoneracao_icms FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT percentual_diferimento_icms FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT uf_retido_remetente_icms_st FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto),
		(SELECT uf_destino_icms_st FROM `base_web_control`.nfe_Produto_ICMS WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_ICMS pim
	ON `base_web_control`.p.id = `base_web_control`.pim.id_produto
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	
	
	INSERT INTO `base_web_control`.nfe_Produto_II(
		id_produto,
		vBC,
		vDespAdu,
		vII,
		vIOF
	)
	SELECT
		`base_web_control`.p.id,
		(SELECT vBC FROM `base_web_control`.nfe_Produto_II WHERE id_produto = v_id_produto),
		(SELECT vDespAdu FROM `base_web_control`.nfe_Produto_II WHERE id_produto = v_id_produto),
		(SELECT vII FROM `base_web_control`.nfe_Produto_II WHERE id_produto = v_id_produto),
		(SELECT vIOF FROM `base_web_control`.nfe_Produto_II WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_II pim
	ON `base_web_control`.pim.id_produto = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	
	
	
	INSERT INTO `base_web_control`.nfe_Produto_IPI(
		id_produto,
		cIEnq,
		CNPJProd,
		cSelo,
		qSelo,
		cEnq,
		CST,qUnid,
		pIPI,
		tp_calculo,
		v_aliq
	)
	SELECT
		`base_web_control`.p.id,
		(SELECT cIEnq FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT CNPJProd FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT cSelo FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT qSelo FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT cEnq FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT CST FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT qUnid FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT pIPI FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT tp_calculo FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto),
		(SELECT v_aliq FROM `base_web_control`.nfe_Produto_IPI WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_IPI pim
	ON `base_web_control`.pim.id_produto = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	
	
	INSERT INTO `base_web_control`.nfe_Produto_ISSQN(
		ISSQN_Id,
		imposto_id,
		pAliq,
		uf,
		cMunFG,
		cListServ,
		tributacao,
		produto_id,
		id_exigibilidade,
		incentivo_fiscal,
		valor_deducoes,
		valor_outras_retencoes,
		valor_desconto_condicionado,
		valor_retencao,
		codigo_servico,
		uf_incidencia,
		id_municipio_incidencia,
		processo)
	SELECT
		NULL,
		(SELECT imposto_id FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT pAliq FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT uf FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT cMunFG FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT cListServ FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT tributacao FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT ISSQN_id FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT id_exigibilidade FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT incentivo_fiscal FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT valor_deducoes FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT valor_outras_retencoes FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT valor_desconto_condicionado FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT valor_retencao FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT codigo_servico FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT uf_incidencia FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT id_municipio_incidencia FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto),
		(SELECT processo FROM `base_web_control`.nfe_Produto_ISSQN WHERE produto_id = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_ISSQN pim
	ON `base_web_control`.pim.produto_id = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.produto_id IS NULL;
	
	
	INSERT INTO `base_web_control`.nfe_Produto_PIS(
		id_produto,
		tp_calculo,
		CST,
		pPIS,
		v_aliq,
		tp_imposto
		)
	SELECT
		`base_web_control`.p.id,
		(SELECT tp_calculo FROM `base_web_control`.nfe_Produto_PIS WHERE id_produto = v_id_produto),
		(SELECT CST FROM `base_web_control`.nfe_Produto_PIS WHERE id_produto = v_id_produto),
		(SELECT pPIS  FROM `base_web_control`.nfe_Produto_PIS WHERE id_produto = v_id_produto),
		(SELECT v_aliq FROM `base_web_control`.nfe_Produto_PIS WHERE id_produto = v_id_produto),
		(SELECT tp_imposto FROM `base_web_control`.nfe_Produto_PIS WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_PIS pim
	ON `base_web_control`.pim.id_produto = `base_web_control`.p.id
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	
	INSERT INTO `base_web_control`.nfe_Produto_PISST(
		id_produto,
		tp_calculo,
		pPIS,
		qBCProd,
		vAliqProd,
		v_aliq,
		tp_imposto
		)
	SELECT
		`base_web_control`.p.id,
		(SELECT tp_calculo FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto),
		(SELECT tp_calculo pPIS FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto),
		(SELECT tp_calculo qBCProd FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto),
		(SELECT tp_calculo vAliqProd FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto),
		(SELECT tp_calculo v_aliq FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto),
		(SELECT tp_calculo tp_imposto FROM `base_web_control`.nfe_Produto_PISST WHERE id_produto = v_id_produto)
	FROM `base_web_control`.produto p
	LEFT JOIN `base_web_control`.nfe_Produto_PISST pim
	ON `base_web_control`.p.id = `base_web_control`.pim.id_produto
	WHERE `base_web_control`.p.id_cadastro = v_id_cadastro
	AND `base_web_control`.pim.id_produto IS NULL;
	
	IF error = 0 THEN
			

		SELECT error AS erro;
	ELSE
		

		SELECT error AS erro;
	ENd if;
		
END;

#
# Procedure "sp_retorna_array_ultimo_ano"
#

CREATE PROCEDURE `base_web_control`.`sp_retorna_array_ultimo_ano`(
	p_id_franquia INT
)
BEGIN
	DECLARE v_mes_atual INT;
	DECLARE v_data_adicionar DATETIME;
	DECLARE v_while INT DEFAULT 1;
	DECLARE v_total_meses INT;
	DECLARE v_data_inicio DATETIME;
	DECLARE v_data_fim DATETIME;
	DECLARE v_falta INT;
	DECLARE v_qtd_contratos INT;
	DECLARE v_pronto INT DEFAULT 0;
	
	DECLARE cur_datas CURSOR FOR SELECT
					data_inicio,
					data_fim
				     FROM `base_web_control`.tmp_datas
				     ORDER BY data_inicio ASC;
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET v_pronto = 1;
		
	SET v_mes_atual = MONTH(NOW());
	
	IF (v_mes_atual - 1 ) = 0 THEN
	
		SET v_mes_atual = 12;
	
	ELSE 
	
		SET v_mes_atual = (v_mes_atual -1);
		
	END IF;
	DROP TABLE IF EXISTS `base_web_control`.tmp_datas;
	CREATE TABLE `base_web_control`.tmp_datas(data_inicio DATETIME, data_fim DATETIME);
	
	WHILE v_while <= v_mes_atual DO
	
		IF v_while = 1 THEN
			
				SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-12-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			ELSE
				SET v_data_inicio = CONCAT(YEAR(NOW()),'-',LPAD(v_while -1,2,0),'-25 18:01:00');
				SET v_data_fim = CONCAT(YEAR(NOW()),'-',LPAD(v_while,2,0),'-25 18:00:00');
			
			END IF;
			
			INSERT INTO `base_web_control`.tmp_datas(data_inicio, data_fim)
			VALUES(v_data_inicio, v_data_fim);
		
			SET v_while = v_while + 1;
	END WHILE;
	
	SET v_falta = (SELECT COUNT(*) FROM `base_web_control`.tmp_datas);
	
	SET v_while = 1;
	
	WHILE v_falta +1 <= 12 DO
	
		
		SET v_data_inicio = CONCAT(YEAR(NOW()) - 1,'-', LPAD(v_falta,2,0),'-25 18:01:00');
		SET v_data_fim = CONCAT(YEAR(NOW()) -1 ,'-',LPAD(v_falta+1,2,0),'-25 18:00:00');
	
		INSERT INTO `base_web_control`.tmp_datas(data_inicio, data_fim)
		VALUES(v_data_inicio, v_data_fim);
		
		SET v_falta = v_falta + 1;
	END WHILE;
	
	
	
	
	
	DROP TEMPORARY TABLE IF EXISTS `base_web_control`.tmp_grafico_afiliacoes_consultor;
	CREATE TEMPORARY TABLE `base_web_control`.tmp_grafico_afiliacoes_consultor(valor INT, data_inicio VARCHAR(25), data_fim VARCHAR(25));
	
	OPEN cur_datas;
		REPEAT
			FETCH cur_datas INTO v_data_inicio, v_data_fim;
			IF NOT v_pronto THEN
			
			
				
				INSERT INTO `base_web_control`.tmp_grafico_afiliacoes_consultor(valor, data_inicio, data_fim)
				SELECT
				sum((SELECT
				    COUNT(`base_web_control`.ced.id) AS qtd
				FROM cs2.cadastro_equipamento ce
				INNER JOIN cs2.consultores_assistente ca
				ON `base_web_control`.ca.id = `base_web_control`.ce.id_consultor
				LEFT JOIN cs2.cadastro_equipamento_descricao ced
				ON `base_web_control`.ced.id_cadastro_equipamento = `base_web_control`.ce.id
				LEFT JOIN cs2.produto p
				ON `base_web_control`.ced.codigo_barra = `base_web_control`.p.codigo
				WHERE `base_web_control`.ca.id = `base_web_control`.c.id
				AND `base_web_control`.ce.data_venda BETWEEN v_data_inicio AND v_data_fim
				 AND (`base_web_control`.p.descricao = 'BALANÇA ELGIN SA 110'
                            OR `base_web_control`.p.descricao = 'COMPUTADOR BEMATECH RC8400 4GB 2 SERIAIS'
                            OR `base_web_control`.p.descricao = 'IMPRESSORA DE ETIQUETAS ARGOX OS 214 PLUS'
                             OR `base_web_control`.p.descricao = 'GAVETA DE DINHEIRO BEMATECH GD 56'
                             OR `base_web_control`.p.descricao = 'IMPRESSORA TÉRMICA BEMATECH MP4200 TH USB'
                             OR `base_web_control`.p.descricao = 'LEITOR DE CÓDIGO DE BARRAS BEMATECH BR400'
                             OR `base_web_control`.p.descricao = 'LEITOR DE CODIGO DE BARRAS C/ SUPORTE S-500'
                             OR `base_web_control`.p.descricao = 'MONITOR OAC LED WIDSCREEN 15 POL'
                             OR `base_web_control`.p.descricao = 'ANTENA WIRELESS TPLINK'
                              OR `base_web_control`.p.descricao = 'IMPRESSORA TERMICA BEMATECH MP100S SERRILHA'))) AS qtd,
					     v_data_inicio,
					     v_data_fim
				FROM cs2.consultores_assistente c
				WHERE `base_web_control`.c.situacao = 0
				AND `base_web_control`.c.tipo_cliente = 0
				AND `base_web_control`.c.tipo_funcionario = 'I'
				AND `base_web_control`.c.id_franquia = p_id_franquia
				ORDER BY qtd DESC;
				
				
				
				
				
			END IF;
		UNTIL v_pronto END REPEAT;
	CLOSE cur_datas;
	
	SELECT
		valor AS VALUE,
		data_inicio,
		data_fim,
		CASE MONTH(data_fim)
		WHEN 1 THEN
		'JAN'
		WHEN 2 THEN
		'FEV'
		WHEN 3 THEN
		'MAR'
		WHEN 4 THEN
		'ABR'
		WHEN 5 THEN
		'MAI'
		WHEN 6 THEN
		'JUN'
		WHEN 7 THEN
		'JUL'
		WHEN 8 THEN
		'AGO'
		WHEN 9 THEN
		'SET'
		WHEN 10 THEN
		'OUT'
		WHEN 11 THEN
		'NOV'
		ELSE
		'DEZ'
		END AS label
		
	FROM `base_web_control`.tmp_grafico_afiliacoes_consultor;
END;

#
# Procedure "sp_retorna_campos_alias"
#

CREATE PROCEDURE `base_web_control`.`sp_retorna_campos_alias`(
	p_schema VARCHAR(255),
	p_table VARCHAR(255),
	p_alias VARCHAR(50)
)
BEGIN
	DECLARE columnDoctrine VARCHAR(255);
	DECLARE columnDataBase VARCHAR(255);
	DECLARE pronto INT DEFAULT 0;
	DECLARE contUnderline INT;
	DECLARE lengthColumn INT;
	DECLARE strCampos TEXT DEFAULT '';
	DECLARE cur_columns CURSOR FOR SELECT
						column_name
					FROM information_schema.COLUMNS
					WHERE TABLE_SCHEMA = p_schema
					AND TABLE_NAME = p_table;
					
	
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	OPEN cur_columns;
		REPEAT
			FETCH cur_columns INTO columnDataBase;
			IF NOT pronto THEN
			
				SET columnDoctrine = columnDataBase;
				SET contUnderline = LOCATE('_', columnDoctrine);
				SET lengthColumn = LENGTH(columnDoctrine);
				
				WHILE contUnderline > 0 DO
				
					SET columnDoctrine = CONCAT(SUBSTR(columnDoctrine,1,(contUnderline - 1)),UPPER(SUBSTR(columnDoctrine,(contUnderline + 1),1)), SUBSTR(columnDoctrine,(contUnderline + 2),lengthColumn));
					SET contUnderline = LOCATE('_', columnDoctrine);
				
				END WHILE;
				
				SET strCampos = CONCAT(strCampos, p_alias,'.',columnDoctrine, ' AS ', columnDataBase, ',\r\n');
				
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_columns;
	
	SELECT strCampos;
	
END;

#
# Procedure "sp_retorna_campos_alias_objeto"
#

CREATE PROCEDURE `base_web_control`.`sp_retorna_campos_alias_objeto`(
	p_schema VARCHAR(255),
	p_table VARCHAR(255),
	p_alias VARCHAR(50)
)
BEGIN
	DECLARE columnDoctrine VARCHAR(255);
	DECLARE columnDataBase VARCHAR(255);
	DECLARE pronto INT DEFAULT 0;
	DECLARE contUnderline INT;
	DECLARE lengthColumn INT;
	DECLARE strCampos TEXT DEFAULT '';
	DECLARE cur_columns CURSOR FOR SELECT
						column_name
					FROM information_schema.COLUMNS
					WHERE TABLE_SCHEMA = p_schema
					AND TABLE_NAME = p_table;
					
	
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET pronto = 1;
	
	OPEN cur_columns;
		REPEAT
			FETCH cur_columns INTO columnDataBase;
			IF NOT pronto THEN
			
				SET columnDoctrine = columnDataBase;
				SET contUnderline = LOCATE('_', columnDoctrine);
				SET lengthColumn = LENGTH(columnDoctrine);
				
				WHILE contUnderline > 0 DO
				
					SET columnDoctrine = CONCAT(SUBSTR(columnDoctrine,1,(contUnderline - 1)),UPPER(SUBSTR(columnDoctrine,(contUnderline + 1),1)), SUBSTR(columnDoctrine,(contUnderline + 2),lengthColumn));
					SET contUnderline = LOCATE('_', columnDoctrine);
				
				END WHILE;
				
				SET strCampos = CONCAT(strCampos,p_alias, '->set', UCASE(SUBSTR(columnDoctrine,1,1)) , SUBSTR(columnDoctrine,2), '($values->', columnDataBase, ');\r\n');
				
			END IF;
		UNTIL pronto END REPEAT;
	CLOSE cur_columns;
	
	SELECT strCampos;
	
END;

#
# Procedure "sp_retorna_campos_com_validacao_postgree"
#

CREATE PROCEDURE `base_web_control`.`sp_retorna_campos_com_validacao_postgree`(
	base_name varchar(255),
	table_name varchar(255)
)
begin
	declare pronto int default 0;
	declare nome_coluna varchar(255);
	declare tipo_coluna varchar(255);
	declare padrao varchar(20);
	declare qry text;
	declare cont int default 0;
	declare comand_convert varchar(25);
	declare end_convert varchar(25);
	declare cur_colunas cursor for SELECT
						`base_web_control`.c.COLUMN_NAME,
						`base_web_control`.c.DATA_TYPE
					FROM information_schema.TABLES AS t
					INNER JOIN information_schema.COLUMNS AS c
					ON `base_web_control`.t.TABLE_NAME = `base_web_control`.c.TABLE_NAME
					AND `base_web_control`.c.TABLE_SCHEMA = base_name
					WHERE `base_web_control`.t.TABLE_SCHEMA = base_name
					AND `base_web_control`.t.TABLE_NAME = table_name
					AND `base_web_control`.c.COLUMN_KEY != 'PRI'
					GROUP BY `base_web_control`.c.COLUMN_NAME
					order by `base_web_control`.c.ORDINAL_POSITION ASC;
	
	declare continue handler for not found set pronto = 1;
	set qry = '';
	OPEN cur_colunas;
		repeat
			FETCH cur_colunas INTO nome_coluna, tipo_coluna;
			if not pronto then
			
			
			
			CASE tipo_coluna
			
				WHEN 'bigint' THEN 
					set padrao = 0;
				WHEN 'char' THEN 
					SET padrao = '""';
				WHEN 'date' THEN 
					SET padrao = '"1899-12-30"';
				
				WHEN 'datetime' THEN 
					SET padrao = '"1899-12-30"';
					
				WHEN 'decimal' THEN 
					SET padrao = 0;
					
				WHEN 'double' THEN 
					SET padrao = 0;
					
				WHEN 'enum' THEN 
				
					SET padrao = CONCAT('"',(SELECT
								SUBSTR(REPLACE(`base_web_control`.c.COLUMN_TYPE,"enum('", ""),1,1)
							FROM information_schema.TABLES AS t
							INNER JOIN information_schema.COLUMNS AS c
							ON `base_web_control`.t.TABLE_NAME = `base_web_control`.c.TABLE_NAME
							WHERE `base_web_control`.t.TABLE_SCHEMA = 'base_web_control'
							AND `base_web_control`.t.TABLE_NAME = 'lancamentos_empresas'
							AND `base_web_control`.c.COLUMN_NAME = 'operacao'
							GROUP BY `base_web_control`.c.COLUMN_NAME
							),'"');
							
					
				WHEN 'float' THEN 
					SET padrao = 0;
					
				WHEN 'int' THEN 
					SET padrao = 0;
					
				WHEN 'json' THEN 
					SET padrao = '""';
					
				WHEN 'longtext' THEN 
					SET padrao = '0';
					
				WHEN 'mediumtext' THEN 
					SET padrao = '""';
					
				WHEN 'smallint' THEN 
					SET padrao = 0;
					
				WHEN 'text' THEN 
					SET padrao = '""';
				
				WHEN 'time' THEN 
					SET padrao = '"00:00:00"';
				
				WHEN 'timestamp' THEN 
					SET padrao = concat('"','1899-12-30"');
				 
				WHEN 'tinyint' THEN 
					SET padrao = 0;					
				
				WHEN 'tinytext' THEN 
					SET padrao = '""';					
				
				WHEN 'varchar' THEN 
					SET padrao = '""';					
				
					
				else
					set padrao = '';
			    
			END CASE;
			
			IF cont = 0 then
				
				set qry = concat(qry, '\r\n base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(', nome_coluna , ' IS NULL || ', nome_coluna, ' = "" || DATE(', nome_coluna , ') = "0000-00-00",',padrao,',',nome_coluna,') USING utf8)) AS ', nome_coluna);
			
			ELSE 
				SET qry = CONCAT(qry, '\r\n ,base_web_control.fn_retira_caracteres_sincronismo(CONVERT(IF(', nome_coluna , ' IS NULL || ', nome_coluna, ' = "" || DATE(', nome_coluna , ') = "0000-00-00",',padrao,',',nome_coluna,') USING utf8)) AS ', nome_coluna);
			end if;
			
					
			set cont  = cont + 1;
			
			
			
			
			
			
			end if;
		until pronto end repeat;
	close cur_colunas;
	
	
	
	select qry;
end;

#
# Procedure "sp_se_ranking_agendamento_diario"
#

CREATE PROCEDURE `base_web_control`.`sp_se_ranking_agendamento_diario`(
	p_id_franquia int
)
begin
	declare v1 datetime;
	declare v2 datetime;
	declare v3 datetime;
	declare v4 datetime;
	declare v5 datetime;
	declare v6 datetime;
	declare v7 datetime;
	
	
	set v1 = now() - interval 3 day;
	SET v2 = NOW() - INTERVAL 2 DAY;
	SET v3 = NOW() - INTERVAL 1 DAY;
	SET v4 = NOW();
	SET v5 = NOW() + INTERVAL 1 DAY;
	SET v6 = NOW() + INTERVAL 2 DAY;
	SET v7 = NOW() + INTERVAL 3 DAY;
	


















	
	INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d1, d1_label)
	select
		`base_web_control`.ca.id,
		count(`base_web_control`.cv.id) as qtd,
		date_format(v1, '%d/%m')
	from cs2.consultores_assistente ca
	left join cs2.controle_comercial_visitas cv
	on `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	and `base_web_control`.cv.data_agendamento = date(v1)
	where `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d2, d2_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v2, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v2)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d3, d3_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v3, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v3)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d4, d4_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v4, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v4)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d5, d5_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v5, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v5)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d6, d6_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v6, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v6)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        GROUP BY `base_web_control`.ca.id;
        
        INSERT INTO `base_web_control`.tmp_ranking_agendamento_diario(id_assistente, d7, d7_label)
	SELECT
		`base_web_control`.ca.id,
		COUNT(`base_web_control`.cv.id) AS qtd,
		DATE_FORMAT(v7, '%d/%m')
	FROM cs2.consultores_assistente ca
	LEFT JOIN cs2.controle_comercial_visitas cv
	ON `base_web_control`.cv.id_assistente = `base_web_control`.ca.id
	AND `base_web_control`.cv.data_agendamento = DATE(v7)
	WHERE `base_web_control`.ca.id_franquia = p_id_franquia
	AND `base_web_control`.ca.situacao = 0
        AND `base_web_control`.ca.tipo_cliente = 1
        group by `base_web_control`.ca.id;
	
	select
		id_assistente,
		nome,
		data_inicio,
		d1,
		d2,
		d3,
		d4,
		d5,
		d6,
		d7,
		d1_label,
		d2_label,
		d3_label,
		d4_label,
		d5_label,
		d6_label,
		d7_label,
		(d1 + d2 + d3 + d4 + d5 + d6 + d7) as total
	from(
	select
		id_assistente,
		`base_web_control`.ca.nome,
		`base_web_control`.ca.data_inicio,
		sum(d1) as d1,
		SUM(d2) AS d2,
		SUM(d3) AS d3,
		SUM(d4) AS d4,
		SUM(d5) AS d5,
		SUM(d6) AS d6,
		SUM(d7) AS d7,
		max(d1_label) as d1_label,
		max(d2_label) AS d2_label,
		MAX(d3_label) AS d3_label, 
		MAX(d4_label) AS d4_label,
		MAX(d5_label) AS d5_label,
		MAX(d6_label) AS d6_label,
		MAX(d7_label) AS d7_label		
	from `base_web_control`.tmp_ranking_agendamento_diario tmp
	INNER JOIN cs2.consultores_assistente ca
		on `base_web_control`.ca.id = `base_web_control`.tmp.id_assistente
	group by id_assistente	) as aux
	order by d4 desc;
	
	delete from `base_web_control`.tmp_ranking_agendamento_diario;
end;

#
# Procedure "sp_set_credito_gasto_CF"
#

CREATE PROCEDURE `base_web_control`.`sp_set_credito_gasto_CF`(IN `id_cadastro_empresa` VARCHAR(20), IN `numero_cartao` VARCHAR(30), IN `valor_a_pagar` DECIMAL(10,2), IN `prazo_vencimento` INT)
    COMMENT 'Percorre os creditos do CartaoFidelidade e atualizando com o val'
BEGIN	
	DECLARE valorTotalCredito DECIMAL(10,2);
	DECLARE somaCredito DECIMAL(10,2);
	DECLARE valorCredito DECIMAL(10,2);	
	DECLARE valorPontos DECIMAL(10,4);	
	
	SET somaCredito = 0;
	
	SET valorTotalCredito = (SELECT 		
		SUM((IF(`base_web_control`.ch.pontos_ganhos_venda IS NULL, 0, `base_web_control`.ch.pontos_ganhos_venda) - 
		IF(`base_web_control`.ch.pontos_gastos_venda IS NULL, 0, `base_web_control`.ch.pontos_gastos_venda))*`base_web_control`.ch.valor_conversao_pr) AS creditos      
    FROM base_web_control.cartaofid_historico AS ch    
    WHERE	    
        `base_web_control`.ch.id_cadastro = id_cadastro_empresa AND 
		-- ch.dt_creation BETWEEN DATE_SUB(NOW(), INTERVAL prazo_vencimento DAY) AND DATE_FORMAT(NOW(),'%Y-%m-%d 23:59:59') AND		 
		`base_web_control`.ch.num_cartao = numero_cartao);
	
	WHILE valor_a_pagar > 0 AND somaCredito < valorTotalCredito DO
	
		
		SET valorCredito = (SELECT 
				(IF(`base_web_control`.ch.pontos_ganhos_venda IS NULL, 0, `base_web_control`.ch.pontos_ganhos_venda) - 
				IF(`base_web_control`.ch.pontos_gastos_venda IS NULL, 0, `base_web_control`.ch.pontos_gastos_venda))*`base_web_control`.ch.valor_conversao_pr AS valordisponivel				
			FROM base_web_control.cartaofid_historico AS ch    
			WHERE	    
				`base_web_control`.ch.id_cadastro = id_cadastro_empresa AND 
				-- ch.dt_creation BETWEEN DATE_SUB(NOW(), INTERVAL prazo_vencimento DAY) AND DATE_FORMAT(NOW(),'%Y-%m-%d 23:59:59') AND
				(IF(`base_web_control`.ch.pontos_ganhos_venda IS NULL, 0, `base_web_control`.ch.pontos_ganhos_venda) > 
				IF(`base_web_control`.ch.pontos_gastos_venda IS NULL, 0, `base_web_control`.ch.pontos_gastos_venda)) AND
				`base_web_control`.ch.num_cartao = numero_cartao ORDER BY `base_web_control`.ch.dt_creation ASC LIMIT 1);	
			
		 
		SET somaCredito = somaCredito + valorCredito;
		
				
		IF valor_a_pagar >= valorCredito THEN
		
			UPDATE base_web_control.cartaofid_historico AS ch 
			SET `base_web_control`.ch.pontos_gastos_venda = `base_web_control`.ch.pontos_ganhos_venda
			WHERE `base_web_control`.ch.id_cadastro = id_cadastro_empresa AND 
				-- ch.dt_creation BETWEEN DATE_SUB(NOW(), INTERVAL prazo_vencimento DAY) AND DATE_FORMAT(NOW(),'%Y-%m-%d 23:59:59') AND
				(IF(`base_web_control`.ch.pontos_ganhos_venda IS NULL, 0, `base_web_control`.ch.pontos_ganhos_venda) > 
				IF(`base_web_control`.ch.pontos_gastos_venda IS NULL, 0, `base_web_control`.ch.pontos_gastos_venda)) AND
				`base_web_control`.ch.num_cartao = numero_cartao ORDER BY `base_web_control`.ch.dt_creation ASC LIMIT 1;
				
				COMMIT;		
		ELSE
			
			SET valorPontos = (((valorCredito - valor_a_pagar))/valorCredito);
			
			UPDATE base_web_control.cartaofid_historico AS ch 
			SET `base_web_control`.ch.pontos_gastos_venda = `base_web_control`.ch.pontos_ganhos_venda - (`base_web_control`.ch.pontos_ganhos_venda * valorPontos)
			WHERE `base_web_control`.ch.id_cadastro = id_cadastro_empresa AND 
				-- ch.dt_creation BETWEEN DATE_SUB(NOW(), INTERVAL prazo_vencimento DAY) AND DATE_FORMAT(NOW(),'%Y-%m-%d 23:59:59') AND
				(IF(`base_web_control`.ch.pontos_ganhos_venda IS NULL, 0, `base_web_control`.ch.pontos_ganhos_venda) > 
				IF(`base_web_control`.ch.pontos_gastos_venda IS NULL, 0, `base_web_control`.ch.pontos_gastos_venda)) AND
				`base_web_control`.ch.num_cartao = numero_cartao ORDER BY `base_web_control`.ch.dt_creation ASC LIMIT 1;
				
			COMMIT;			
		END IF;
		
		SET valor_a_pagar = valor_a_pagar - valorCredito;	
	END WHILE;	   
END;

#
# Procedure "sp_verificar_criar_taxa_servico"
#

CREATE PROCEDURE `base_web_control`.`sp_verificar_criar_taxa_servico`(
	p_id_cadastro int
)
begin
	declare v_id_classificacao int;
	declare v_id_usuario int;
	DECLARE v_servico_existe int;
	
	select
		id
	into v_id_classificacao
	from `base_web_control`.classificacao 
	where id_cadastro = p_id_cadastro
	and descricao = 'TAXA DE SERVIÇO'
	limit 1;
	
	
	select 
		id
	into v_id_usuario
	from `base_web_control`.webc_usuario
	where id_cadastro = p_id_cadastro
	and login_master = 'S'
	limit 1;
	
	
	if v_id_classificacao is null then
		
		insert into `base_web_control`.classificacao(descricao, id_cadastro, id_usuario)
		values('TAXA DE SERVIÇO', p_id_cadastro, v_id_usuario);
		
		SELECT
			id
		INTO v_id_classificacao
		FROM `base_web_control`.classificacao 
		WHERE id_cadastro = p_id_cadastro
		AND descricao = 'TAXA DE SERVIÇO'
		LIMIT 1;
	
	end if;
				
				
	select
		if(count(*) > 0,1,0)
	INTO v_servico_existe
	from `base_web_control`.produto
	where id_cadastro = p_id_cadastro
	and prod_serv = 'S'
	and deletar = 'N';
	
	
	if v_servico_existe = 0 then
	
		INSERT INTO `base_web_control`.produto(
			descricao,
			id_cadastro, 
			id_usuario, 
			data_cadastro, 
			id_classificacao, 
			custo, 
			custo_medio_venda, 
			id_unidade, 
			vender_estoque_zerado, 
			prod_serv, 
			data_alteracao,
			deletar
		)
		VALUES
		(
			'TAXA DE SERVIÇO',
			p_id_cadastro,
			v_id_usuario,
			NOW(),
			v_id_classificacao,
			'0.00',
			'0.00',
			2,
			'S',
			'S',
			NOW(),
			'N'
		);
					
	
	end if;
				
	
end;

#
# Procedure "zera_estoque_inteiros"
#

CREATE PROCEDURE `zera_estoque_inteiros`(IN idcadastro BIGINT)
BEGIN
	DECLARE done INT DEFAULT FALSE;  
  	DECLARE valorContrarioAtual DECIMAL(10,2);
	DECLARE tot_e_1 DECIMAL(10,3);
	DECLARE tot_e_2 DECIMAL(10,3);
	DECLARE tot_s_1 DECIMAL(10,3);
	DECLARE tot_s_2 DECIMAL(10,3);
  	DECLARE idAtual BIGINT;
  	DECLARE ResultadoEstoque CURSOR FOR
  
    SELECT
		a.id      
		,@teste1:=(SELECT SUM(qtd_produto) AS total_adquirido FROM base_web_control.nota_fiscal
		WHERE id_cadastro = a.id_cadastro AND id_produto = a.id ) AS tot_nt_entrada
		,@teste2:=(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
		WHERE id_cadastro = a.id_cadastro AND id_produto  = a.id AND inserir_retirar = 'I') AS
		ajuste_entrada
		,@teste3:=(SELECT SUM(qtd)AS total_vendido FROM   base_web_control.venda v
		INNER JOIN base_web_control.venda_itens vi ON v.id = vi.id_venda
		WHERE v.id_cadastro  = a.id_cadastro AND v.situacao  = 'C' AND   vi.estornado = 'N' AND   codigo_barra
		= a.codigo_barra) AS tot_venda
		,@teste4:=(SELECT SUM(qtd_retiro_inseriu) AS inseriu FROM base_web_control.produto_arrumar_estoque
		WHERE id_cadastro = a.id_cadastro AND id_produto  = a.id AND inserir_retirar = 'R') AS
		ajuste_saida      
		  
		,((IF(ISNULL(@teste1),0,CAST(@teste1 AS DECIMAL(10.3))) + 
		IF(ISNULL(@teste2),0,CAST(@teste2 AS DECIMAL(10.3)))) - 
		(IF(ISNULL(@teste3),0,CAST(@teste3 AS DECIMAL(10.3))) + 
		IF(ISNULL(@teste4),0,CAST(@teste4 AS DECIMAL(10.3)))))*-1 AS valorContrario 	     
	FROM
		base_web_control.produto a
	WHERE
		a.id_cadastro = idcadastro;	  
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
  OPEN ResultadoEstoque;
  REPEAT 
    FETCH ResultadoEstoque INTO idAtual, tot_e_1, tot_e_2, tot_s_1, tot_s_2,valorContrarioAtual;
    IF NOT done THEN      
		INSERT INTO base_web_control.produto_arrumar_estoque 
		(id_cadastro, id_produto, qtd_retiro_inseriu, inserir_retirar)
		VALUES(idcadastro,idAtual,CAST(ABS(valorContrarioAtual) AS DECIMAL(10.2)), IF(valorContrarioAtual < 0, 'R', 'I'));				
    END IF;
   UNTIL done END REPEAT;
   CLOSE ResultadoEstoque;  
END;

#
# Trigger "nota_fiscal_AFTER_INSERT"
#

base_web_control

#
# Trigger "tgr_grade_ins"
#

base_web_control

#
# Trigger "tgr_grade_up"
#

base_web_control

#
# Trigger "tgr_ins_conta_corrente_movimentacao"
#

base_web_control

#
# Trigger "tgr_nf_devolucao_itens_del"
#

base_web_control

#
# Trigger "tgr_nf_devolucao_itens_ins"
#

base_web_control

#
# Trigger "tgr_nf_devolucao_itens_up"
#

base_web_control

#
# Trigger "tgr_nf_entrada_up"
#

base_web_control

#
# Trigger "tgr_nota_fiscal_del"
#

base_web_control

#
# Trigger "tgr_nota_fiscal_up"
#

base_web_control

#
# Trigger "tgr_produto_arrumar_estoque_del"
#

base_web_control

#
# Trigger "tgr_produto_arrumar_estoque_ins"
#

base_web_control

#
# Trigger "tgr_produto_del"
#

base_web_control

#
# Trigger "tgr_produto_in_bef"
#

base_web_control

#
# Trigger "tgr_produto_ins"
#

base_web_control

#
# Trigger "tgr_produto_up"
#

base_web_control

#
# Trigger "tgr_produto_up_bef"
#

base_web_control

#
# Trigger "tgr_produtos_excluidos"
#

base_web_control

#
# Trigger "tgr_remove_caracter_invalido_up"
#

base_web_control

#
# Trigger "tgr_up_cadastro_imposto_padrao"
#

base_web_control

#
# Trigger "tgr_valor_extra_caixa_ins"
#

base_web_control

#
# Trigger "tgr_venda_item_in"
#

base_web_control

#
# Trigger "tgr_venda_itens_del"
#

base_web_control

#
# Trigger "tgr_venda_itens_devolucao_del"
#

base_web_control

#
# Trigger "tgr_venda_itens_devolucao_ins"
#

base_web_control

#
# Trigger "tgr_venda_itens_devolucao_up"
#

base_web_control

#
# Trigger "tgr_venda_itens_up"
#

base_web_control

#
# Trigger "tgr_venda_pagamento_in"
#

base_web_control

#
# Trigger "tgr_venda_up"
#

base_web_control

#
# Trigger "tgr_webc_usuario_bef_ins"
#

base_web_control

#
# Trigger "tgr_webc_usuario_bef_up"
#

base_web_control

#
# Trigger "trg_baixa_estoque_up"
#

base_web_control

#
# Trigger "trg_insert_vendaItens"
#

base_web_control

#
# Trigger "trg_recicla_prod_excluido"
#

base_web_control

#
# Trigger "trg_remove_acentos_ins"
#

base_web_control

#
# Trigger "trg_remove_acentos_up"
#

base_web_control

#
# Trigger "trg_retira_acentos_ins"
#

base_web_control

#
# Trigger "trg_retira_acentos_up"
#

base_web_control

#
# Trigger "trg_up_status_grade"
#

base_web_control

#
# Event "e_unid_trib"
#

CREATE EVENT `base_web_control`.`e_unid_trib` ON SCHEDULE AT '2020-07-10 02:00:00' ON COMPLETION NOT PRESERVE DISABLE DO update base_web_control.produto set id_unidade_trib = id_unidade 
where id_unidade_trib is null;
