# Host: 10.2.2.3  (Version 5.7.20-log)
# Date: 2020-12-24 10:53:31
# Generator: MySQL-Front 6.0  (Build 2.20)


CREATE DATABASE IF NOT EXISTS `franquias`;

#
# Structure for table "atn_atendimento"
#

CREATE TABLE `franquias`.`atn_atendimento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_cliente` int(11) DEFAULT NULL,
  `id_usuario_cadastro` int(11) NOT NULL,
  `id_usuario_atendimento` int(11) DEFAULT NULL,
  `data_hora_cadastro` datetime DEFAULT CURRENT_TIMESTAMP,
  `atendimento_inicio` datetime DEFAULT NULL,
  `atendimento_fim` datetime DEFAULT NULL,
  `solicitante` varchar(250) NOT NULL,
  `fone` varchar(15) NOT NULL,
  `solicitacao` enum('FC','LV','NF','S','AS','RF','ES','HN','T','C','O') NOT NULL DEFAULT 'O' COMMENT 'FC - Frente Caixa | LV -Loja Virtual | NF - Nota Fiscal | S - Site | AS - Ajuda do Supervisor | RF - Relatório Financeiro | ES - Estoque | HN - Habilitação de Nota | T - Treinamento | C - Cancelamento | O - Outros',
  `status` enum('A','I','C','R') NOT NULL DEFAULT 'A' COMMENT 'A - Aguardando Atendimento | I - Iniciado o atendimento | C - concluído o Atendimento | R - Reagendado',
  `observacao` text,
  `motivo_reagendamento` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5251 DEFAULT CHARSET=latin1 COMMENT='Tabela  com registro de contato dos clientes que não obtiveram atendimento';

#
# Structure for table "com_cartao_agendamento_checklist"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_conferencia"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_conferencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_justificativa"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_justificativa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(55) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_posicionamento"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_posicionamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_reagendar"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_reagendar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(55) DEFAULT NULL,
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='gerenciamento de informações reagendar cartão';

#
# Structure for table "com_cartao_agendamento_status"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  `propriedade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "dev_banco"
#

CREATE TABLE `franquias`.`dev_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_banco` varchar(10) NOT NULL,
  `nome` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=274 DEFAULT CHARSET=latin1;

#
# Structure for table "dev_tipo_contato"
#

CREATE TABLE `franquias`.`dev_tipo_contato` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `mascara` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

#
# Structure for table "outros_sistemas"
#

CREATE TABLE `franquias`.`outros_sistemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(245) DEFAULT NULL,
  `website` varchar(145) DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

#
# Structure for table "outros_sistemas_checklist"
#

CREATE TABLE `franquias`.`outros_sistemas_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COMMENT='tabela de opções que alimentão o CONTROLE COMERCIAL';

#
# Structure for table "outros_sistemas_checklist_resp"
#

CREATE TABLE `franquias`.`outros_sistemas_checklist_resp` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Id`),
  CONSTRAINT `fk_checklist` FOREIGN KEY (`Id`) REFERENCES `franquias`.`outros_sistemas_checklist` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Structure for table "sys_funcao"
#

CREATE TABLE `franquias`.`sys_funcao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_setor` int(11) NOT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `nome` varchar(75) NOT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  PRIMARY KEY (`id`),
  KEY `fk_funcao_sys_setor1_idx` (`id_setor`),
  KEY `FK_sys_funcao_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_sys_funcao_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcao_sys_setor1` FOREIGN KEY (`id_setor`) REFERENCES `franquias`.`sys_setor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_usuario"
#

CREATE TABLE `franquias`.`sys_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL DEFAULT '0' COMMENT '1 - Administrador,',
  `id_funcao` int(11) NOT NULL,
  `id_perfil` int(11) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(25) NOT NULL,
  `senha` varchar(64) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` enum('F','M') NOT NULL DEFAULT 'M',
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `id_usuario_cad` int(11) DEFAULT NULL,
  `id_sistema` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `foto_1` varchar(245) DEFAULT NULL,
  `foto_2` varchar(245) DEFAULT NULL,
  `id_franquias_atendente` int(11) DEFAULT NULL COMMENT 'id ATENDENTE da base cs2',
  PRIMARY KEY (`id`),
  KEY `fk_usuario_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_sys_usuario_sys_funcao1_idx` (`id_funcao`),
  KEY `fk_usuario_sistema` (`id_sistema`),
  KEY `fk_usuario_franquia` (`id_franquia`),
  KEY `FK_sys_usuario_sys_usuario` (`id_usuario_alt`),
  KEY `fk_usuario_usuario_perfil_idx` (`id_perfil`),
  CONSTRAINT `FK_sys_usuario_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_usuario_sys_funcao1` FOREIGN KEY (`id_funcao`) REFERENCES `franquias`.`sys_funcao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`),
  CONSTRAINT `fk_usuario_sistema` FOREIGN KEY (`id_sistema`) REFERENCES `franquias`.`sys_sistema` (`id`),
  CONSTRAINT `fk_usuario_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_usuario_perfil` FOREIGN KEY (`id_perfil`) REFERENCES `franquias`.`sys_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_setor"
#

CREATE TABLE `franquias`.`sys_setor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sys_setor_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_sys_setor_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_sistema"
#

CREATE TABLE `franquias`.`sys_sistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_sys_sistema_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_sys_sistema_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_perfil"
#

CREATE TABLE `franquias`.`sys_perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sistema` int(11) DEFAULT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(45) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'A - Ativo I - Inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `id_usuario_cad` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perfil_sistema_idx` (`id_sistema`),
  KEY `fk_perfil_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_perfil_usuario2_idx` (`id_usuario_alt`),
  CONSTRAINT `fk_perfil_sistema` FOREIGN KEY (`id_sistema`) REFERENCES `franquias`.`sys_sistema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_usuario2` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_perfil_has_usuario"
#

CREATE TABLE `franquias`.`sys_perfil_has_usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `data_cadastro` datetime NOT NULL,
  `id_usuario_cad` int(11) NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perfil_has_usuario_usuario1_idx` (`id_usuario`),
  KEY `fk_perfil_has_usuario_perfil1_idx` (`id_perfil`),
  KEY `fk_perfil_has_usuario_usuario2_idx` (`id_usuario_cad`),
  KEY `fk_perfil_has_usuario_usuario3_idx` (`id_usuario_alt`),
  CONSTRAINT `fk_perfil_has_usuario_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `franquias`.`sys_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_usuario_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_usuario_usuario2` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_usuario_usuario3` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_perfil_has_tela"
#

CREATE TABLE `franquias`.`sys_perfil_has_tela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_perfil` int(11) NOT NULL,
  `id_tela` int(11) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `data_cadastro` datetime NOT NULL,
  `id_usuario_cad` int(11) NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_perfil_has_tela_tela1_idx` (`id_tela`),
  KEY `fk_perfil_has_tela_perfil1_idx` (`id_perfil`),
  KEY `fk_perfil_has_tela_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_perfil_has_tela_usuario2_idx` (`id_usuario_alt`),
  CONSTRAINT `fk_perfil_has_tela_perfil1` FOREIGN KEY (`id_perfil`) REFERENCES `franquias`.`sys_perfil` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_tela_tela1` FOREIGN KEY (`id_tela`) REFERENCES `franquias`.`sys_tela` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_tela_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_perfil_has_tela_usuario2` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3313 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_modulos"
#

CREATE TABLE `franquias`.`sys_modulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sistema` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `id_usuario_cad` int(11) NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_modulos_usuario1_idx` (`id_usuario_alt`),
  KEY `fk_modulos_usuario2_idx` (`id_usuario_cad`),
  KEY `fk_modulos_sistema` (`id_sistema`),
  CONSTRAINT `fk_modulos_sistema` FOREIGN KEY (`id_sistema`) REFERENCES `franquias`.`sys_sistema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_modulos_usuario1` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_modulos_usuario2` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_menu"
#

CREATE TABLE `franquias`.`sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Coluna 12` int(11) NOT NULL,
  `id_sistema` int(11) DEFAULT NULL,
  `id_modulo` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `id_usuario_cad` int(11) NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `icone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_menu_sistema1_idx` (`id_sistema`),
  KEY `fk_menu_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_menu_usuario2_idx` (`id_usuario_alt`),
  KEY `fk_menu_modulos1_idx` (`id_modulo`),
  CONSTRAINT `fk_menu_modulos1` FOREIGN KEY (`id_modulo`) REFERENCES `franquias`.`sys_modulos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_sistema1` FOREIGN KEY (`id_sistema`) REFERENCES `franquias`.`sys_sistema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_usuario2` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_submenu"
#

CREATE TABLE `franquias`.`sys_submenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `alias` varchar(50) NOT NULL,
  `id_usuario_cad` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_submenu_menu1_idx` (`id_menu`),
  KEY `fk_submenu_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_submenu_usuario2_idx` (`id_usuario_alt`),
  CONSTRAINT `fk_submenu_menu1` FOREIGN KEY (`id_menu`) REFERENCES `franquias`.`sys_menu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_submenu_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_submenu_usuario2` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_tela"
#

CREATE TABLE `franquias`.`sys_tela` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_submenu` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `alias` varchar(100) NOT NULL,
  `objeto` varchar(100) DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `data_cadastro` datetime DEFAULT NULL,
  `id_usuario_cad` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `permissao` varchar(20) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tela_submenu1_idx` (`id_submenu`),
  KEY `fk_tela_usuario1_idx` (`id_usuario_cad`),
  KEY `fk_tela_usuario2_idx` (`id_usuario_alt`),
  CONSTRAINT `fk_tela_submenu1` FOREIGN KEY (`id_submenu`) REFERENCES `franquias`.`sys_submenu` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tela_usuario1` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tela_usuario2` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

#
# Structure for table "com_desafio"
#

CREATE TABLE `franquias`.`com_desafio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  `premio` varchar(150) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `id_franquia` int(11) DEFAULT NULL,
  `ativo` enum('A','I','E') DEFAULT NULL COMMENT 'Ativo, Inativo, Excluido',
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`),
  KEY `fk_desafio_franquia` (`id_franquia`),
  KEY `FK_com_desafio_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_com_desafio_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_desafio_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_reagendar_resp"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_reagendar_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cartao` int(11) DEFAULT NULL,
  `id_reagendar` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1 - Não visualizado\n2 - Visualizado',
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agendamento_resp_reagendar` (`id_reagendar`),
  KEY `fk_agendamento_resp_cartao` (`id_cartao`),
  KEY `fk_agendamento_res_usuario` (`id_usuario`),
  CONSTRAINT `fk_agendamento_res_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_resp_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamento_resp_reagendar` FOREIGN KEY (`id_reagendar`) REFERENCES `franquias`.`com_cartao_agendamento_reagendar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=latin1 COMMENT='Cartão Agendamento Reagendar Resposta.';

#
# Structure for table "com_cartao"
#

CREATE TABLE `franquias`.`com_cartao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) DEFAULT NULL,
  `telefone` varchar(20) NOT NULL,
  `id_agendador` int(11) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  `nome_responsavel` varchar(100) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `nome_empresa` varchar(150) DEFAULT NULL,
  `cep` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(100) DEFAULT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `uf` char(3) DEFAULT NULL,
  `ponto_referencia` varchar(150) DEFAULT NULL,
  `informacoes_adicionais` text,
  `qtd_cartao` int(11) DEFAULT NULL,
  `id_importacao` int(11) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `situacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartao` (`id_agendador`),
  KEY `fk_cartao_franquia` (`id_franquia`),
  KEY `FK_com_cartao_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_com_cartao_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartao` FOREIGN KEY (`id_agendador`) REFERENCES `franquias`.`sys_usuario` (`id`),
  CONSTRAINT `fk_cartao_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1570 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_posicionamento_resp"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_posicionamento_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) DEFAULT NULL,
  `id_posicionamento` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `data` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posicionamento_resp_posicionamento` (`id_posicionamento`),
  KEY `fk_posicionamento_resp_cartao` (`id_cartao`),
  CONSTRAINT `fk_posicionamento_resp_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_posicionamento_resp_posicionamento` FOREIGN KEY (`id_posicionamento`) REFERENCES `franquias`.`com_cartao_agendamento_posicionamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=915 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_ocorrencia"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_ocorrencia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `mensagem` text,
  `id_cartao` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_cartao_agendament_idx` (`id_cartao`),
  KEY `fk_com_cartao_usuario_idx` (`id_usuario`),
  CONSTRAINT `fk_com_cartao_agendament` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_justificativa_resp"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_justificativa_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) NOT NULL,
  `id_justificativa` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_justificativa_resp_justificativa` (`id_justificativa`),
  KEY `fk_justificativa_resp_cartao` (`id_cartao`),
  CONSTRAINT `fk_justificativa_resp_cartao` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`),
  CONSTRAINT `fk_justificativa_resp_justificativa` FOREIGN KEY (`id_justificativa`) REFERENCES `franquias`.`com_cartao_agendamento_justificativa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_conferencia_resp"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_conferencia_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) NOT NULL,
  `id_justificativa` int(11) NOT NULL,
  `valor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_cartao_agendamento_conferencia_resp_com_cartao_agend_idx` (`id_justificativa`),
  KEY `fk_com_cartao_agendamento_conferencia_resp_com_cartao1_idx` (`id_cartao`),
  CONSTRAINT `fk_com_cartao_agendamento_conferencia_resp_com_cartao1` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_conferencia_resp_com_cartao_agendam1` FOREIGN KEY (`id_justificativa`) REFERENCES `franquias`.`com_cartao_agendamento_conferencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=656 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_checklist_resp"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_checklist_resp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) NOT NULL,
  `id_checklist` int(11) NOT NULL,
  `resposta` enum('S','N') DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_com_cartao_agendamento_checklist_resp_com_cartao_agendam_idx` (`id_checklist`),
  KEY `fk_com_cartao_agendamento_checklist_resp_com_cartao1_idx` (`id_cartao`),
  CONSTRAINT `fk_com_cartao_agendamento_checklist_resp_com_cartao1` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_checklist_resp_com_cartao_agendamen1` FOREIGN KEY (`id_checklist`) REFERENCES `franquias`.`com_cartao_agendamento_checklist` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=913 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento"
#

CREATE TABLE `franquias`.`com_cartao_agendamento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao` int(11) NOT NULL,
  `id_consultor` int(11) NOT NULL,
  `data_agendamento` datetime DEFAULT NULL,
  `status` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_cartao_agendamento_com_cartao1_idx` (`id_cartao`),
  KEY `fk_com_cartao_agendamento_sys_usuario1_idx` (`id_consultor`),
  CONSTRAINT `FK_com_cartao_agendamento_sys_usuario` FOREIGN KEY (`id_consultor`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_com_cartao1` FOREIGN KEY (`id_cartao`) REFERENCES `franquias`.`com_cartao` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1141 DEFAULT CHARSET=latin1;

#
# Structure for table "com_cartao_agendamento_hist"
#

CREATE TABLE `franquias`.`com_cartao_agendamento_hist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cartao_agendamento` int(11) NOT NULL,
  `informacoes_adicionais` text,
  `id_consultor` int(11) NOT NULL,
  `id_status` int(11) DEFAULT NULL,
  `id_justificativa` int(11) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `codigo_venda` int(11) DEFAULT NULL,
  `data_desinteresse` date DEFAULT NULL,
  `motivo_desinteresse` int(11) DEFAULT NULL,
  `data_reagendamento` date DEFAULT NULL,
  `data_create` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_com_cartao_agendamento_hist_com_cartao_agendamento1_idx` (`id_cartao_agendamento`),
  KEY `fk_com_cartao_agendamento_hist_com_cartao_agendamento_statu_idx` (`id_status`),
  KEY `fk_com_cartao_agendamento_hist_com_cartao_agendamento_justi_idx` (`id_justificativa`),
  KEY `fk_com_cartao_agendamento_hist_sys_usuario1_idx` (`id_consultor`),
  CONSTRAINT `fk_com_cartao_agendamento_hist_com_cartao_agendamento1` FOREIGN KEY (`id_cartao_agendamento`) REFERENCES `franquias`.`com_cartao_agendamento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_hist_com_cartao_agendamento_justifi1` FOREIGN KEY (`id_justificativa`) REFERENCES `franquias`.`com_cartao_agendamento_justificativa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_hist_com_cartao_agendamento_status1` FOREIGN KEY (`id_status`) REFERENCES `franquias`.`com_cartao_agendamento_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_com_cartao_agendamento_hist_sys_usuario1` FOREIGN KEY (`id_consultor`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=212 DEFAULT CHARSET=latin1;

#
# Structure for table "cad_franquia_gestor"
#

CREATE TABLE `franquias`.`cad_franquia_gestor` (
  `id_usuario` int(11) NOT NULL,
  `id_franquia_usuario` int(11) NOT NULL,
  `informacoes_adicionais` varchar(255) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id_usuario`,`id_franquia_usuario`),
  KEY `fk_sys_usuario_has_cad_franquia_cad_franquia1_idx` (`id_franquia_usuario`),
  KEY `fk_sys_usuario_has_cad_franquia_sys_usuario1_idx` (`id_usuario`),
  KEY `FK_cad_franquia_gestor_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_cad_franquia_gestor_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_usuario_has_cad_franquia_cad_franquia1` FOREIGN KEY (`id_franquia_usuario`) REFERENCES `franquias`.`cad_franquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_usuario_has_cad_franquia_sys_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#
# Structure for table "aux_tipo_franquia"
#

CREATE TABLE `franquias`.`aux_tipo_franquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_franquia` varchar(75) NOT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`),
  KEY `FK_aux_tipo_franquia_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_aux_tipo_franquia_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "aux_franquia_taxa"
#

CREATE TABLE `franquias`.`aux_franquia_taxa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxa_adesao` decimal(15,2) DEFAULT '0.00',
  `taxa_pacote` decimal(15,2) DEFAULT '0.00',
  `taxa_software` decimal(15,2) DEFAULT '0.00',
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`),
  KEY `FK_aux_franquia_taxa_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_aux_franquia_taxa_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

#
# Structure for table "cad_franquia"
#

CREATE TABLE `franquias`.`cad_franquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_franquia` int(11) NOT NULL,
  `id_franquia_taxa` int(11) NOT NULL,
  `razao_social` varchar(75) NOT NULL,
  `fantasia` varchar(75) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  `bairro` varchar(75) NOT NULL,
  `cidade` varchar(75) NOT NULL,
  `uf` varchar(3) NOT NULL,
  `cep` varchar(8) NOT NULL,
  `mensalidade` decimal(12,2) NOT NULL,
  `dia_pgto` int(11) NOT NULL,
  `cpfcnpj` varchar(14) NOT NULL,
  `data_cadastro` date NOT NULL,
  `limite_credito` decimal(15,2) NOT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  `ref_cs2` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cad_franquia_aux_tipo_franquia1_idx` (`id_tipo_franquia`),
  KEY `fk_cad_franquia_aux_franquia_taxa1_idx` (`id_franquia_taxa`),
  KEY `FK_cad_franquia_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_cad_franquia_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cad_franquia_aux_franquia_taxa1` FOREIGN KEY (`id_franquia_taxa`) REFERENCES `franquias`.`aux_franquia_taxa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cad_franquia_aux_tipo_franquia1` FOREIGN KEY (`id_tipo_franquia`) REFERENCES `franquias`.`aux_tipo_franquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=latin1;

#
# Structure for table "aux_franquia_banco"
#

CREATE TABLE `franquias`.`aux_franquia_banco` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `agencia` varchar(10) NOT NULL,
  `tp_conta` varchar(3) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `nome_titular` varchar(100) NOT NULL,
  `cpf_titular` varchar(11) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'A = Ativo / I = Inativo',
  PRIMARY KEY (`id`),
  KEY `fk_aux_franquia_banco_cad_franquia1_idx` (`id_franquia`),
  KEY `fk_aux_franquia_banco_banco` (`id_banco`),
  KEY `FK_aux_franquia_banco_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_aux_franquia_banco_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aux_franquia_banco_banco` FOREIGN KEY (`id_banco`) REFERENCES `franquias`.`dev_banco` (`id`),
  CONSTRAINT `fk_aux_franquia_banco_cad_franquia1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Structure for table "com_campeao"
#

CREATE TABLE `franquias`.`com_campeao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `data_cadastro` datetime DEFAULT NULL,
  `id_franquia` int(11) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  PRIMARY KEY (`id`),
  KEY `fk_campeao_franquia` (`id_franquia`),
  KEY `FK_com_campeao_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_com_campeao_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_campeao_franquia` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

#
# Structure for table "aux_contato_franquia"
#

CREATE TABLE `franquias`.`aux_contato_franquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipo_contato` int(11) NOT NULL,
  `id_franquia` int(11) NOT NULL,
  `contato` varchar(100) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'A = Ativo / I = inativo',
  PRIMARY KEY (`id`),
  KEY `fk_aux_contato_franquia_dev_tipo_contato_idx` (`id_tipo_contato`),
  KEY `fk_aux_contato_franquia_cad_franquia1_idx` (`id_franquia`),
  KEY `fk_sys_usuario_id` (`id_usuario_alt`),
  CONSTRAINT `fk_aux_contato_franquia_cad_franquia1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aux_contato_franquia_dev_tipo_contato` FOREIGN KEY (`id_tipo_contato`) REFERENCES `franquias`.`dev_tipo_contato` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_sys_usuario_id` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

#
# Structure for table "aux_socio_franquia"
#

CREATE TABLE `franquias`.`aux_socio_franquia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_franquia` int(11) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  `data_alteracao` datetime DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / inativo',
  PRIMARY KEY (`id`),
  KEY `fk_aux_socio_franquia_cad_franquia1_idx` (`id_franquia`),
  KEY `FK_aux_socio_franquia_sys_usuario` (`id_usuario_alt`),
  CONSTRAINT `FK_aux_socio_franquia_sys_usuario` FOREIGN KEY (`id_usuario_alt`) REFERENCES `franquias`.`sys_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_aux_socio_franquia_cad_franquia1` FOREIGN KEY (`id_franquia`) REFERENCES `franquias`.`cad_franquia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Structure for table "sys_versao"
#

CREATE TABLE `franquias`.`sys_versao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sistema` int(11) NOT NULL,
  `versao` varchar(45) NOT NULL,
  `data_cadastro` datetime NOT NULL,
  `data_alteracao` datetime DEFAULT NULL,
  `status` enum('A','I') DEFAULT 'A' COMMENT 'Ativo / Inativo',
  `id_usuario_cad` int(11) DEFAULT NULL,
  `id_usuario_alt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_versao_sistema1_idx` (`id_sistema`),
  KEY `fk_usuario` (`id_usuario_cad`),
  CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario_cad`) REFERENCES `franquias`.`sys_usuario` (`id`),
  CONSTRAINT `fk_versao_sistema1` FOREIGN KEY (`id_sistema`) REFERENCES `franquias`.`sys_sistema` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

#
# Procedure "sp_dashboard_atendimento_retorno"
#

CREATE PROCEDURE `franquias`.`sp_dashboard_atendimento_retorno`(
	IN `p_id_atendente` INT

)
begin
	declare v_total_retorno int;
	declare v_meus_retornos_realizados int;
	declare v_meus_retornos_pendentes int;
	declare v_meus_retornos int;
	declare v_porcentagem_meus_retornos decimal(5,2);
	declare v_porcentagem_meus_retornos_realizados decimal(5,2);	
	declare v_porcentagem_meus_retornos_pendentes decimal(5,2);	
	



SELECT	COUNT(id) INTO	v_total_retorno	FROM 	`franquias`.atn_atendimento WHERE  	status != 'C'	;

SELECT	COUNT(id) INTO	v_meus_retornos_realizados		FROM 	`franquias`.atn_atendimento WHERE 	id_usuario_atendimento = p_id_atendente	AND 	status = 'C'	;

SELECT	COUNT(id) INTO	v_meus_retornos_pendentes		FROM 	`franquias`.atn_atendimento WHERE 	id_usuario_atendimento = p_id_atendente	AND 	(status = 'R' OR status = 'I');

SET v_meus_retornos = v_meus_retornos_pendentes + v_meus_retornos_realizados; 







SET v_porcentagem_meus_retornos_realizados = (v_meus_retornos_realizados / v_meus_retornos) * 100;
SET v_porcentagem_meus_retornos_pendentes = (v_meus_retornos_pendentes / v_meus_retornos) * 100;
SET v_porcentagem_meus_retornos = (v_meus_retornos / v_total_retorno) * 100;


	SELECT  
		ifnull(v_total_retorno,0) AS v_total_retorno,
		IFNULL(v_meus_retornos_realizados,0) AS v_meus_retornos_realizados,
		IFNULL(v_meus_retornos_pendentes,0) AS v_meus_retornos_pendentes,
		IFNULL(v_meus_retornos,0) AS v_meus_retornos,
		IFNULL(v_porcentagem_meus_retornos_realizados,0) AS v_porcentagem_meus_retornos_realizados,
		IFNULL(v_porcentagem_meus_retornos_pendentes,0) as v_porcentagem_meus_retornos_pendentes,
		IFNULL(v_porcentagem_meus_retornos,0) AS v_porcentagem_meus_retornos;
end;

#
# Procedure "sp_dashboard_franquias"
#

CREATE PROCEDURE `franquias`.`sp_dashboard_franquias`(
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
	declare v_percentual_visitas decimal(5,2);
	DECLARE v_percentual_nao_visitas DECIMAL(5,2);
	declare v_percentual_dia decimal(5,2);
	

SELECT
	COUNT(*)
INTO v_visitas_realizadas
FROM (
SELECT
	COUNT(*)

FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
INNER JOIN franquias.com_cartao_agendamento_conferencia_resp cr
ON `franquias`.cr.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
AND `franquias`.chis.id_status = 7
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (`franquias`.c.id_agendador = p_id_agendador OR p_id_agendador = 0)
AND (`franquias`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `franquias`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW())
GROUP BY `franquias`.c.id) as aux;

SELECT
	COUNT(*)
INTO v_total_agendamento
FROM(
SELECT
	COUNT(*)
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (`franquias`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `franquias`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW())
GROUP BY `franquias`.c.id)
AS aux;

SELECT
	COUNT(*)
INTO v_meus_agendamentos
FROM(
SELECT
	`franquias`.c.*
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
AND `franquias`.chis.id_status = 7
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (`franquias`.ca.data_agendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW() OR `franquias`.chis.data_reagendamento BETWEEN base_web_control.fn_get_mes_inicio_filtro() AND NOW())
AND (`franquias`.c.id_agendador = p_id_agendador OR p_id_agendador  = 0)
GROUP BY `franquias`.c.id)
AS aux;
SET v_visitas_nao_realizadas = v_meus_agendamentos - v_visitas_realizadas;

set v_porcentagem_meus_agendamentos = (v_meus_agendamentos / v_total_agendamento) * 100;
select 
	count(*)
INTO v_total_agendamento_dia
from(
select
	count(*)
from franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (DATE(`franquias`.ca.data_agendamento) = DATE(NOW()) OR DATE(`franquias`.chis.data_reagendamento) = DATE(NOW()))
AND (`franquias`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador)
GROUP BY `franquias`.c.id)
as aux;

select 
	count(*)
INTO v_agendamento_manha
from(
SELECT
	COUNT(*)
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (date(`franquias`.ca.data_agendamento) = DATE(NOW()) and `franquias`.ca.data_agendamento <= CONCAT(date(NOW()), ' 12:00:00') OR DATE(`franquias`.chis.data_reagendamento) = DATE(NOW()) AND `franquias`.chis.data_reagendamento <= CONCAT(DATE(NOW()), ' 12:00:00'))
AND (`franquias`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador)
GROUP BY `franquias`.c.id) as aux;

select 
	count(*)
INTO v_agendamento_tarde
from(
SELECT
	COUNT(*)
FROM franquias.com_cartao c
INNER JOIN franquias.com_cartao_agendamento ca
ON `franquias`.ca.id_cartao = `franquias`.c.id
LEFT JOIN franquias.com_cartao_agendamento_hist chis
ON `franquias`.chis.id_cartao_agendamento = `franquias`.ca.id
WHERE `franquias`.c.id_franquia = p_id_franquia
AND (DATE(`franquias`.ca.data_agendamento) = DATE(NOW()) AND `franquias`.ca.data_agendamento > CONCAT(DATE(NOW()), ' 12:00:00') OR DATE(`franquias`.chis.data_reagendamento) = DATE(NOW()) AND `franquias`.chis.data_reagendamento > CONCAT(DATE(NOW()), ' 12:00:00'))
AND (`franquias`.ca.id_consultor = p_id_agendador OR 0 = p_id_agendador)
GROUP BY `franquias`.c.id
) as aux;
set v_percentual_visitas = (v_visitas_realizadas / v_total_agendamento) * 100;
set v_percentual_dia = (v_total_agendamento_dia / v_meus_agendamentos) * 100;
SET v_percentual_nao_visitas = (v_visitas_nao_realizadas / v_total_agendamento) * 100;
	SELECT  
		ifnull(v_visitas_realizadas,0) AS visitas_realizadas,
	IFNULL(v_visitas_nao_realizadas,0) AS visitas_nao_realizadas,
	IFNULL(v_total_agendamento,0) AS total_agendamento,
	IFNULL(v_total_agendamento_dia,0) AS total_agendamento_dia,
	IFNULL(v_meus_agendamentos,0) AS meus_agendamentos,
	IFNULL(v_agendamento_manha,0)AS agendamento_manha,
	IFNULL(v_agendamento_tarde,0) AS agendamento_tarde,
	IFNULL(v_porcentagem_meus_agendamentos,0) AS porcentagem_meus_agendamentos,
	IFNULL(v_percentual_visitas,0) as percentual_visitas,
	IFNULL(v_percentual_nao_visitas,0) AS percentual_nao_visitas,
	IFNULL(v_percentual_dia,0) as percentual_dia;
	
	
end;
