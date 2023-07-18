-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 16-Jul-2023 às 10:44
-- Versão do servidor: 10.3.28-MariaDB
-- versão do PHP: 7.2.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `ctrlpatio`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_perfil`
--

CREATE TABLE `adm_perfil` (
  `idPerfil` varchar(15) NOT NULL,
  `Descricao` varchar(100) NOT NULL,
  `StatusPerfil` enum('Ativo','Inativo') NOT NULL,
  `DataStatus` date DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm_perfil`
--

INSERT INTO `adm_perfil` (`idPerfil`, `Descricao`, `StatusPerfil`, `DataStatus`, `dtCriacao`, `dtAtualizacao`) VALUES
('Admin', 'Admin', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('Balanceiro', 'Balanceiro', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('Classificador', 'Classificador', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('Masterdata', 'Masterdata', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('Portaria', 'Portaria', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_perfilprocesso`
--

CREATE TABLE `adm_perfilprocesso` (
  `idPerfil` varchar(15) NOT NULL,
  `idProcesso` char(30) DEFAULT NULL,
  `PermConsultar` enum('S','N') NOT NULL,
  `PermIncluir` enum('S','N') NOT NULL,
  `PermAlterar` enum('S','N') NOT NULL,
  `PermExcluir` enum('S','N') NOT NULL,
  `PermBT00` enum('S','N') NOT NULL,
  `PermBT01` enum('S','N') NOT NULL,
  `PermBT02` enum('S','N') NOT NULL,
  `PermBT03` enum('S','N') NOT NULL,
  `PermBT04` enum('S','N') NOT NULL,
  `PermBT05` enum('S','N') NOT NULL,
  `PermBT06` enum('S','N') NOT NULL,
  `PermBT07` enum('S','N') NOT NULL,
  `PermBT08` enum('S','N') NOT NULL,
  `PermBT09` enum('S','N') NOT NULL,
  `idAuditUsu` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_processo`
--

CREATE TABLE `adm_processo` (
  `idProcesso` char(30) NOT NULL,
  `descProcesso` varchar(100) DEFAULT NULL,
  `StatusProcesso` enum('Ativo','Inativo') NOT NULL,
  `DataStatus` date DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm_processo`
--

INSERT INTO `adm_processo` (`idProcesso`, `descProcesso`, `StatusProcesso`, `DataStatus`, `dtCriacao`, `dtAtualizacao`) VALUES
('CadPerfil', 'Cadastro Perfil', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('CadProcesso', 'Cadastro de Processos', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('CadRelPerfilProcesso', 'Cadastro de Usuários', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15'),
('CadUsuario', 'Cadastro de Usuários', 'Ativo', '2023-07-15', '2023-07-15', '2023-07-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_user_perfil`
--

CREATE TABLE `adm_user_perfil` (
  `idUsuario` char(20) NOT NULL,
  `idPerfil` varchar(15) NOT NULL,
  `StatusPerfil` enum('Ativo','Inativo') NOT NULL,
  `DataStatus` date DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_usuario`
--

CREATE TABLE `adm_usuario` (
  `idUsuario` char(20) NOT NULL,
  `nmUsuario` varchar(50) DEFAULT NULL,
  `senha` char(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `dtnascimento` date DEFAULT NULL,
  `StatusUsuario` enum('Ativo','Inativo') NOT NULL,
  `DataStatus` date DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `adm_usuario`
--

INSERT INTO `adm_usuario` (`idUsuario`, `nmUsuario`, `senha`, `email`, `fone`, `dtnascimento`, `StatusUsuario`, `DataStatus`, `dtCriacao`, `dtAtualizacao`) VALUES
('admin', 'admin', 'admin', 'admin@mail.com', '5511999999999', '2013-07-01', 'Ativo', '2023-07-17', '2023-07-15', '2023-07-15'),
('masterdata', 'masterdata', 'masterdata', 'masterdata@mail.com', '5511777777777', '2001-01-01', 'Ativo', '2023-01-01', '2023-07-15', '2023-07-15'),
('user', 'user', 'user', 'user@mail.com', '5511888888888', '2001-01-01', 'Ativo', '2023-01-01', '2023-07-15', '2023-07-15');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadItem`
--

CREATE TABLE `CadItem` (
  `idItem` int(8) NOT NULL,
  `codItem` char(25) DEFAULT NULL,
  `descItem` char(60) DEFAULT NULL,
  `GrupoItem` char(10) DEFAULT NULL,
  `TipoEmb` char(3) DEFAULT NULL,
  `UMEstoque` char(3) DEFAULT NULL,
  `UMPreco` char(3) DEFAULT NULL,
  `StatusItem` char(1) DEFAULT NULL,
  `DataStatus` date DEFAULT NULL,
  `CodBolsa` char(10) DEFAULT NULL,
  `CodItemBolsa` char(10) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadItem`
--

INSERT INTO `CadItem` (`idItem`, `codItem`, `descItem`, `GrupoItem`, `TipoEmb`, `UMEstoque`, `UMPreco`, `StatusItem`, `DataStatus`, `CodBolsa`, `CodItemBolsa`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
(1, 'SOJA', 'SOJA EM GRÃOS', 'SOJA', 'GRA', 'KG', 'SC', 'A', '2023-07-16', 'CBOT', 'SY', 'admin', '2023-07-16', '2023-07-16'),
(2, 'MILHO', 'MILHO EM GRÃOS', 'MILHO', 'GRA', 'KG', 'SC', 'A', '2023-07-16', 'CBOT', 'ZC', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadPessoaCEP`
--

CREATE TABLE `CadPessoaCEP` (
  `CEP` char(12) NOT NULL,
  `Logradouro` char(80) DEFAULT NULL,
  `Cidade` char(40) DEFAULT NULL,
  `Estado` char(3) DEFAULT NULL,
  `Pais` char(2) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadPessoaContato`
--

CREATE TABLE `CadPessoaContato` (
  `Abook` int(10) NOT NULL,
  `Tipo` char(10) DEFAULT NULL,
  `Opcao` char(10) DEFAULT NULL COMMENT 'Tipo do contato : DG - ABTipo, Fone, Email, Pagina web, etc.',
  `Sequencia` int(11) DEFAULT NULL,
  `Contato` char(50) DEFAULT NULL,
  `StatusContato` char(1) DEFAULT NULL,
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadPessoaEndereco`
--

CREATE TABLE `CadPessoaEndereco` (
  `Abook` int(10) DEFAULT NULL,
  `dtInicio` date DEFAULT NULL,
  `dtFinal` date DEFAULT NULL,
  `Logradouro` char(80) DEFAULT NULL,
  `Numero` char(10) DEFAULT NULL,
  `Complemento` char(10) DEFAULT NULL,
  `Cidade` char(40) DEFAULT NULL,
  `Estado` char(3) DEFAULT NULL,
  `Pais` char(2) DEFAULT NULL,
  `CEP` char(12) DEFAULT NULL,
  `Latitude` decimal(12,0) DEFAULT NULL,
  `Longitude` decimal(12,0) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadPessoaMaster`
--

CREATE TABLE `CadPessoaMaster` (
  `Abook` int(10) NOT NULL,
  `Nome` char(50) DEFAULT NULL,
  `Apelido` char(50) DEFAULT NULL,
  `TpDocFiscalFed` char(10) DEFAULT NULL COMMENT 'Tipo documento Fiscal Federal : DG - TPDocFed, CNPJ/CPF, etc',
  `CodFiscalFed` char(20) DEFAULT NULL,
  `TpDocFiscalEstadual` char(10) DEFAULT NULL COMMENT 'Tipo documento Fiscal Federal : DG - TPDocEst, IE/RG, etc',
  `CodFiscalEstadual` char(20) DEFAULT NULL,
  `TpDocFiscalMunicipal` char(10) DEFAULT NULL COMMENT 'Tipo documento Fiscal Municipal : DG - TPDocMun',
  `CodFiscalMunicipal` char(20) DEFAULT NULL,
  `StatusAbook` char(1) DEFAULT NULL COMMENT 'Status da Pessoa : DG - Ativo/Inativo',
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadPessoaMaster`
--

INSERT INTO `CadPessoaMaster` (`Abook`, `Nome`, `Apelido`, `TpDocFiscalFed`, `CodFiscalFed`, `TpDocFiscalEstadual`, `CodFiscalEstadual`, `TpDocFiscalMunicipal`, `CodFiscalMunicipal`, `StatusAbook`, `DataStatus`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
(1, 'ACTION SYSTEMS SERVICOS EM INFORMATICA LTDA', 'ACTION SYSTEMS - Matriz', NULL, NULL, NULL, NULL, NULL, NULL, 'A', '2023-07-16', '2023-07-16', '2023-07-16', '2023-07-16'),
(2, 'ACTION SYSTEMS SERVICOS EM INFORMATICA LTDA', 'ACTION SYSTEMS - Sta Cruz', NULL, NULL, NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadQualItem`
--

CREATE TABLE `CadQualItem` (
  `idItem` int(8) NOT NULL,
  `CodTeste` char(25) NOT NULL,
  `dtInicio` date DEFAULT NULL,
  `dtFinal` date DEFAULT NULL,
  `FlagOpReq` char(1) DEFAULT NULL,
  `ValMinimo` char(20) DEFAULT NULL,
  `ValMaximo` char(20) DEFAULT NULL,
  `ValPreferido` char(20) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadQualItem`
--

INSERT INTO `CadQualItem` (`idItem`, `CodTeste`, `dtInicio`, `dtFinal`, `FlagOpReq`, `ValMinimo`, `ValMaximo`, `ValPreferido`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
(1, 'IMPUREZA', '2023-01-01', '2050-12-31', 'R', '0,00', '1,00', '1,00', 'admin', '2023-07-16', '2023-07-16'),
(1, 'PARTIDO', '2023-01-01', '2050-12-31', 'R', '0,00', '30,00', '3,00', 'admin', '2023-07-16', '2023-07-16'),
(1, 'UMIDADE', '2023-01-01', '2050-12-31', 'R', '12,00', '24,00', '14,00', 'admin', '2023-07-16', '2023-07-16'),
(2, 'IMPUREZA', '2023-01-01', '2050-12-31', 'R', '0,00', '1,00', '1,00', 'admin', '2023-07-16', '2023-07-16'),
(2, 'PARTIDO', '2023-01-01', '2050-12-31', 'R', '0,00', '30,00', '3,00', 'admin', '2023-07-16', '2023-07-16'),
(2, 'UMIDADE', '2023-01-01', '2050-12-31', 'R', '12,00', '24,00', '14,00', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadQualMaster`
--

CREATE TABLE `CadQualMaster` (
  `CodTeste` char(25) NOT NULL,
  `DescTeste` char(50) DEFAULT NULL,
  `StatusQualidade` char(1) DEFAULT NULL,
  `dtInicio` date DEFAULT NULL,
  `dtFinal` date DEFAULT NULL,
  `FlagOpReq` char(1) DEFAULT NULL COMMENT 'DG - Opcional / Requerido',
  `TipoResultado` char(1) DEFAULT NULL COMMENT 'DG - Tipo de Resultado Qualidade (Numerico, Texto, Data)',
  `FormatoResultado` char(60) DEFAULT NULL,
  `ValMinimo` char(20) DEFAULT NULL,
  `ValMaximo` char(20) DEFAULT NULL,
  `ValPreferido` char(20) DEFAULT NULL,
  `UMMedida` char(3) DEFAULT NULL COMMENT 'DG - Unidade Medida',
  `dtusr` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadQualMaster`
--

INSERT INTO `CadQualMaster` (`CodTeste`, `DescTeste`, `StatusQualidade`, `dtInicio`, `dtFinal`, `FlagOpReq`, `TipoResultado`, `FormatoResultado`, `ValMinimo`, `ValMaximo`, `ValPreferido`, `UMMedida`, `dtusr`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('IMPUREZA', 'IMPUREZA', 'A', '2023-01-01', '2050-12-31', 'R', 'N', '999,99', '0,00', '1,00', '1,00', '%', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('PARTIDO', 'PARTIDO', 'A', '2023-01-01', '2050-12-31', 'R', 'N', '999,99', '0,00', '30,00', '3,00', '%', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('UMIDADE', 'UMIDADE', 'A', '2023-01-01', '2050-12-31', 'R', 'N', '999,99', '12,00', '24,00', '14,00', '%', '2023-07-16', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadQualRange`
--

CREATE TABLE `CadQualRange` (
  `idItem` int(8) NOT NULL,
  `CodTeste` char(25) NOT NULL,
  `ValCalcMin` decimal(9,2) NOT NULL,
  `ValCalcDescto` decimal(7,3) DEFAULT NULL,
  `ValCalcMax` decimal(9,2) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadQualRange`
--

INSERT INTO `CadQualRange` (`idItem`, `CodTeste`, `ValCalcMin`, `ValCalcDescto`, `ValCalcMax`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
(1, 'IMPUREZA', '0.00', '0.000', '1.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'IMPUREZA', '1.01', '0.010', '5.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'IMPUREZA', '5.01', '0.020', '99.99', 'admin', '2023-07-17', '2023-07-17'),
(1, 'PARTIDO', '0.00', '0.000', '3.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'PARTIDO', '3.01', '0.010', '99.99', 'admin', '2023-07-17', '2023-07-17'),
(1, 'UMIDADE', '0.00', '0.000', '14.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'UMIDADE', '14.01', '1.500', '16.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'UMIDADE', '16.01', '1.750', '20.00', 'admin', '2023-07-17', '2023-07-17'),
(1, 'UMIDADE', '20.01', '2.000', '99.99', 'admin', '2023-07-17', '2023-07-17'),
(2, 'IMPUREZA', '0.00', '0.000', '1.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'IMPUREZA', '1.01', '0.010', '5.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'IMPUREZA', '5.01', '0.020', '99.99', 'admin', '2023-07-17', '2023-07-17'),
(2, 'PARTIDO', '0.00', '0.000', '3.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'PARTIDO', '3.01', '0.010', '99.99', 'admin', '2023-07-17', '2023-07-17'),
(2, 'UMIDADE', '0.00', '0.000', '14.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'UMIDADE', '14.01', '1.500', '16.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'UMIDADE', '16.01', '1.750', '20.00', 'admin', '2023-07-17', '2023-07-17'),
(2, 'UMIDADE', '20.01', '2.000', '99.99', 'admin', '2023-07-17', '2023-07-17');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadTipoVeiculo`
--

CREATE TABLE `CadTipoVeiculo` (
  `TipoVeiculo` char(12) NOT NULL,
  `Modal` char(4) DEFAULT NULL COMMENT 'DG - Modal : Rodoviario, Ferroviario, Hdroviario, Maritimo, etc.',
  `PesoTara` decimal(15,3) DEFAULT NULL,
  `PesoBruto` decimal(15,3) DEFAULT NULL,
  `PesoCarga` decimal(15,3) DEFAULT NULL,
  `CapacidadeCubica` decimal(15,3) DEFAULT NULL,
  `Altura` decimal(4,2) DEFAULT NULL,
  `Largura` decimal(4,2) DEFAULT NULL,
  `Comprimento` decimal(4,2) DEFAULT NULL,
  `StatusTipoVeiculo` char(1) DEFAULT NULL COMMENT 'DG - Ativo/Inativo',
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `CadTipoVeiculo`
--

INSERT INTO `CadTipoVeiculo` (`TipoVeiculo`, `Modal`, `PesoTara`, `PesoBruto`, `PesoCarga`, `CapacidadeCubica`, `Altura`, `Largura`, `Comprimento`, `StatusTipoVeiculo`, `DataStatus`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('30TON', 'R', '15.000', '45.000', '30.000', NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('40TON', 'R', '15.000', '55.000', '40.000', NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('BA3K', 'F', NULL, NULL, '3000.000', NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('BI50TON', 'R', '25.000', '75.000', '50.000', NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `CadVeiculo`
--

CREATE TABLE `CadVeiculo` (
  `VeicPlaca` char(12) NOT NULL,
  `VeicSerial` char(25) DEFAULT NULL,
  `VeicDesc` char(30) DEFAULT NULL,
  `VeicObs` char(60) DEFAULT NULL,
  `TipoVeiculo` char(12) DEFAULT NULL,
  `AbookTransportadora` int(8) DEFAULT NULL,
  `Fabricante` char(10) DEFAULT NULL COMMENT 'DG - FabVeiculo',
  `Modelo` char(20) DEFAULT NULL,
  `AnoFabricacao` int(4) DEFAULT NULL,
  `AnoModelo` int(4) DEFAULT NULL,
  `StatusItem` char(1) DEFAULT NULL COMMENT 'DG - Ativo/Inativo',
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Companhia`
--

CREATE TABLE `Companhia` (
  `Companhia` char(10) NOT NULL,
  `DescCompanhia` char(50) DEFAULT NULL,
  `DtInicioOperacao` date DEFAULT NULL,
  `DtFinalOperacao` date DEFAULT NULL,
  `StatusCompanhia` char(1) DEFAULT NULL,
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Companhia`
--

INSERT INTO `Companhia` (`Companhia`, `DescCompanhia`, `DtInicioOperacao`, `DtFinalOperacao`, `StatusCompanhia`, `DataStatus`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('ACTION', 'ActionSys', '2008-01-03', NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `DadosGerais`
--

CREATE TABLE `DadosGerais` (
  `Atributo` char(20) NOT NULL,
  `Chave` char(20) NOT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `flag01` char(1) DEFAULT NULL,
  `flag02` char(1) DEFAULT NULL,
  `flag03` char(1) DEFAULT NULL,
  `flag04` char(1) DEFAULT NULL,
  `flag05` char(1) DEFAULT NULL,
  `atchar01` varchar(50) DEFAULT NULL,
  `atchar02` varchar(50) DEFAULT NULL,
  `atchar03` varchar(50) DEFAULT NULL,
  `atchar04` varchar(50) DEFAULT NULL,
  `atchar05` varchar(50) DEFAULT NULL,
  `atNum0d01` decimal(15,0) DEFAULT NULL,
  `atNum0d02` decimal(15,0) DEFAULT NULL,
  `atNum0d03` decimal(15,0) DEFAULT NULL,
  `atNum0d04` decimal(15,0) DEFAULT NULL,
  `atNum0d05` decimal(15,0) DEFAULT NULL,
  `atNum2d01` decimal(15,2) DEFAULT NULL,
  `atNum2d02` decimal(15,2) DEFAULT NULL,
  `atNum2d03` decimal(15,2) DEFAULT NULL,
  `atNum2d04` decimal(15,2) DEFAULT NULL,
  `atNum2d05` decimal(15,2) DEFAULT NULL,
  `atNum4d01` decimal(15,4) DEFAULT NULL,
  `atNum4d02` decimal(15,4) DEFAULT NULL,
  `atNum4d03` decimal(15,4) DEFAULT NULL,
  `atNum4d04` decimal(15,4) DEFAULT NULL,
  `atNum4d05` decimal(15,4) DEFAULT NULL,
  `dtInicio` date DEFAULT NULL,
  `dtFinal` date DEFAULT NULL,
  `dtusr` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `DadosGerais`
--

INSERT INTO `DadosGerais` (`Atributo`, `Chave`, `Descricao`, `flag01`, `flag02`, `flag03`, `flag04`, `flag05`, `atchar01`, `atchar02`, `atchar03`, `atchar04`, `atchar05`, `atNum0d01`, `atNum0d02`, `atNum0d03`, `atNum0d04`, `atNum0d05`, `atNum2d01`, `atNum2d02`, `atNum2d03`, `atNum2d04`, `atNum2d05`, `atNum4d01`, `atNum4d02`, `atNum4d03`, `atNum4d04`, `atNum4d05`, `dtInicio`, `dtFinal`, `dtusr`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('ABTipo', 'Email', 'Email', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('ABTipo', 'Fone', 'Fone', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('ABTipo', 'Web', 'Endereço Web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('Ativo/Inativo', 'A', 'Ativo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('Ativo/Inativo', 'I', 'Inativo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocEst', 'IE', 'IE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocEst', 'RG', 'RG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocFed', 'CNPJ', 'CNPJ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocFed', 'CPF', 'CPF', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocMun', 'Insc.Mun.', 'Insc.Mun.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'AC', 'Acre', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'AL', 'Alagoas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'AM', 'Amazonas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'AP', 'Amapá', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'BA', 'Bahia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'CE', 'Ceará', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'DF', 'Brasília', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '53', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'ES', 'Espírito Santo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'GO', 'Goiás', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'MA', 'Maranhão', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'MG', 'Minas Gerais', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'MS', 'Mato Grosso do Sul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '50', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'MT', 'Mato Grosso', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '51', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'PA', 'Pará', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '15', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'PB', 'Paraíba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'PE', 'Pernambuco', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'PI', 'Piauí', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'PR', 'Paraná', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'RJ', 'Rio de Janeiro', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'RN', 'Rio Grande do Norte', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'RO', 'Rondônia', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'RR', 'Roraima', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'RS', 'Rio Grande do Sul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'SC', 'Santa Catarina', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'SE', 'Sergipe', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'SP', 'São Paulo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 'TO', 'Tocantins', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Filial`
--

CREATE TABLE `Filial` (
  `CodFilial` char(20) NOT NULL,
  `DescFilial` char(50) DEFAULT NULL,
  `Companhia` char(10) DEFAULT NULL,
  `Abook` int(10) DEFAULT NULL,
  `DtInicioOperacao` date DEFAULT NULL,
  `DtFinalOperacao` date DEFAULT NULL,
  `CodusuFilial01` char(10) DEFAULT NULL,
  `CodusuFilial02` char(10) DEFAULT NULL,
  `CodusuFilial03` char(10) DEFAULT NULL,
  `CodusuFilial04` char(10) DEFAULT NULL,
  `CodusuFilial05` char(10) DEFAULT NULL,
  `CodusuFilial06` char(10) DEFAULT NULL,
  `CodusuFilial07` char(10) DEFAULT NULL,
  `CodusuFilial08` char(10) DEFAULT NULL,
  `CodusuFilial09` char(10) DEFAULT NULL,
  `CodusuFilial10` char(10) DEFAULT NULL,
  `FlagFilial01` char(1) DEFAULT NULL,
  `FlagFilial02` char(1) DEFAULT NULL,
  `FlagFilial03` char(1) DEFAULT NULL,
  `FlagFilial04` char(1) DEFAULT NULL,
  `FlagFilial05` char(1) DEFAULT NULL,
  `DataFilial01` date DEFAULT NULL,
  `DataFilial02` date DEFAULT NULL,
  `DataFilial03` date DEFAULT NULL,
  `DataFilial04` date DEFAULT NULL,
  `DataFilial05` date DEFAULT NULL,
  `StatusFilial` char(1) DEFAULT NULL,
  `DataStatus` date DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `Filial`
--

INSERT INTO `Filial` (`CodFilial`, `DescFilial`, `Companhia`, `Abook`, `DtInicioOperacao`, `DtFinalOperacao`, `CodusuFilial01`, `CodusuFilial02`, `CodusuFilial03`, `CodusuFilial04`, `CodusuFilial05`, `CodusuFilial06`, `CodusuFilial07`, `CodusuFilial08`, `CodusuFilial09`, `CodusuFilial10`, `FlagFilial01`, `FlagFilial02`, `FlagFilial03`, `FlagFilial04`, `FlagFilial05`, `DataFilial01`, `DataFilial02`, `DataFilial03`, `DataFilial04`, `DataFilial05`, `StatusFilial`, `DataStatus`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('Matriz', 'Action Systems Servicos Em Informatica Ltda', 'ACTION', 1, '2008-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16'),
('Sta Cruz', 'Sta Cruz do Rio Pardo', 'ACTION', 2, '2018-06-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', '2023-07-16', 'admin', '2023-07-16', '2023-07-16');

-- --------------------------------------------------------

--
-- Estrutura da tabela `SetupDadosGerais`
--

CREATE TABLE `SetupDadosGerais` (
  `Atributo` char(20) DEFAULT NULL,
  `chave_tamanho` int(3) DEFAULT NULL,
  `chave_tipo` enum('Numerico','Caracter Mai/Min','Caracter Maiusculo') DEFAULT NULL,
  `chave_upper` enum('S','N') DEFAULT NULL,
  `Descricao` varchar(50) DEFAULT NULL,
  `Desc_flag01` varchar(20) DEFAULT NULL,
  `Desc_flag02` varchar(20) DEFAULT NULL,
  `Desc_flag03` varchar(20) DEFAULT NULL,
  `Desc_flag04` varchar(20) DEFAULT NULL,
  `Desc_flag05` varchar(20) DEFAULT NULL,
  `Desc_atchar01` varchar(20) DEFAULT NULL,
  `Desc_atchar02` varchar(20) DEFAULT NULL,
  `Desc_atchar03` varchar(20) DEFAULT NULL,
  `Desc_atchar04` varchar(20) DEFAULT NULL,
  `Desc_atchar05` varchar(20) DEFAULT NULL,
  `Desc_atNum0d01` varchar(20) DEFAULT NULL,
  `Desc_atNum0d02` varchar(20) DEFAULT NULL,
  `Desc_atNum0d03` varchar(20) DEFAULT NULL,
  `Desc_atNum0d04` varchar(20) DEFAULT NULL,
  `Desc_atNum0d05` varchar(20) DEFAULT NULL,
  `Desc_atNum2d01` varchar(20) DEFAULT NULL,
  `Desc_atNum2d02` varchar(20) DEFAULT NULL,
  `Desc_atNum2d03` varchar(20) DEFAULT NULL,
  `Desc_atNum2d04` varchar(20) DEFAULT NULL,
  `Desc_atNum2d05` varchar(20) DEFAULT NULL,
  `Desc_atNum4d01` varchar(20) DEFAULT NULL,
  `Desc_atNum4d02` varchar(20) DEFAULT NULL,
  `Desc_atNum4d03` varchar(20) DEFAULT NULL,
  `Desc_atNum4d04` varchar(20) DEFAULT NULL,
  `Desc_atNum4d05` varchar(20) DEFAULT NULL,
  `Desc_dtInicio` varchar(20) DEFAULT NULL,
  `Desc_dtFinal` varchar(20) DEFAULT NULL,
  `Desc_dtusr` varchar(20) DEFAULT NULL,
  `usuario` char(20) DEFAULT NULL,
  `dtCriacao` date DEFAULT NULL,
  `dtAtualizacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `SetupDadosGerais`
--

INSERT INTO `SetupDadosGerais` (`Atributo`, `chave_tamanho`, `chave_tipo`, `chave_upper`, `Descricao`, `Desc_flag01`, `Desc_flag02`, `Desc_flag03`, `Desc_flag04`, `Desc_flag05`, `Desc_atchar01`, `Desc_atchar02`, `Desc_atchar03`, `Desc_atchar04`, `Desc_atchar05`, `Desc_atNum0d01`, `Desc_atNum0d02`, `Desc_atNum0d03`, `Desc_atNum0d04`, `Desc_atNum0d05`, `Desc_atNum2d01`, `Desc_atNum2d02`, `Desc_atNum2d03`, `Desc_atNum2d04`, `Desc_atNum2d05`, `Desc_atNum4d01`, `Desc_atNum4d02`, `Desc_atNum4d03`, `Desc_atNum4d04`, `Desc_atNum4d05`, `Desc_dtInicio`, `Desc_dtFinal`, `Desc_dtusr`, `usuario`, `dtCriacao`, `dtAtualizacao`) VALUES
('ABTipo', 10, 'Caracter Mai/Min', 'S', 'Tipo Contato', NULL, NULL, NULL, NULL, NULL, 'Tipo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-15', '2023-07-15'),
('ABOpcao', 10, 'Caracter Mai/Min', 'S', 'Tipo Contato', NULL, NULL, NULL, NULL, NULL, 'Opção', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('Ativo/Inativo', 1, 'Caracter Mai/Min', 'S', 'Tipo Contato', NULL, NULL, NULL, NULL, NULL, 'Status', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocFed', 10, 'Caracter Mai/Min', 'S', 'Tipo Doc Federal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocEst', 10, 'Caracter Mai/Min', 'S', 'Tipo Documento Estadual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('TPDocMun', 10, 'Caracter Mai/Min', 'S', 'Tipo Documento Municipal', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16'),
('UF-Estados', 2, 'Caracter Mai/Min', 'S', 'Estados - UF', NULL, NULL, NULL, NULL, NULL, 'Cod.IBGE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2023-07-16', '2023-07-16');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `adm_perfil`
--
ALTER TABLE `adm_perfil`
  ADD PRIMARY KEY (`idPerfil`);

--
-- Índices para tabela `adm_perfilprocesso`
--
ALTER TABLE `adm_perfilprocesso`
  ADD PRIMARY KEY (`idPerfil`),
  ADD KEY `adm_perfilprocesso_ibfk_2` (`idProcesso`);

--
-- Índices para tabela `adm_processo`
--
ALTER TABLE `adm_processo`
  ADD PRIMARY KEY (`idProcesso`);

--
-- Índices para tabela `adm_user_perfil`
--
ALTER TABLE `adm_user_perfil`
  ADD PRIMARY KEY (`idUsuario`,`idPerfil`),
  ADD KEY `adm_user_perfil_ibfk_2` (`idPerfil`);

--
-- Índices para tabela `adm_usuario`
--
ALTER TABLE `adm_usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Índices para tabela `CadItem`
--
ALTER TABLE `CadItem`
  ADD PRIMARY KEY (`idItem`);

--
-- Índices para tabela `CadPessoaCEP`
--
ALTER TABLE `CadPessoaCEP`
  ADD PRIMARY KEY (`CEP`);

--
-- Índices para tabela `CadPessoaContato`
--
ALTER TABLE `CadPessoaContato`
  ADD PRIMARY KEY (`Abook`);

--
-- Índices para tabela `CadPessoaEndereco`
--
ALTER TABLE `CadPessoaEndereco`
  ADD KEY `Abook` (`Abook`),
  ADD KEY `CEP` (`CEP`);

--
-- Índices para tabela `CadPessoaMaster`
--
ALTER TABLE `CadPessoaMaster`
  ADD PRIMARY KEY (`Abook`);

--
-- Índices para tabela `CadQualItem`
--
ALTER TABLE `CadQualItem`
  ADD PRIMARY KEY (`idItem`,`CodTeste`) USING BTREE,
  ADD KEY `CodTeste` (`CodTeste`);

--
-- Índices para tabela `CadQualMaster`
--
ALTER TABLE `CadQualMaster`
  ADD PRIMARY KEY (`CodTeste`);

--
-- Índices para tabela `CadQualRange`
--
ALTER TABLE `CadQualRange`
  ADD PRIMARY KEY (`idItem`,`CodTeste`,`ValCalcMin`) USING BTREE;

--
-- Índices para tabela `CadTipoVeiculo`
--
ALTER TABLE `CadTipoVeiculo`
  ADD PRIMARY KEY (`TipoVeiculo`);

--
-- Índices para tabela `CadVeiculo`
--
ALTER TABLE `CadVeiculo`
  ADD PRIMARY KEY (`VeicPlaca`),
  ADD KEY `TipoVeiculo` (`TipoVeiculo`),
  ADD KEY `AbookTransportadora` (`AbookTransportadora`);

--
-- Índices para tabela `Companhia`
--
ALTER TABLE `Companhia`
  ADD PRIMARY KEY (`Companhia`);

--
-- Índices para tabela `DadosGerais`
--
ALTER TABLE `DadosGerais`
  ADD PRIMARY KEY (`Atributo`,`Chave`);

--
-- Índices para tabela `Filial`
--
ALTER TABLE `Filial`
  ADD PRIMARY KEY (`CodFilial`),
  ADD KEY `Abook` (`Abook`),
  ADD KEY `Companhia` (`Companhia`);

--
-- Índices para tabela `SetupDadosGerais`
--
ALTER TABLE `SetupDadosGerais`
  ADD UNIQUE KEY `SetupDadosGerais_0` (`Atributo`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `CadItem`
--
ALTER TABLE `CadItem`
  MODIFY `idItem` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `CadPessoaMaster`
--
ALTER TABLE `CadPessoaMaster`
  MODIFY `Abook` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `adm_perfilprocesso`
--
ALTER TABLE `adm_perfilprocesso`
  ADD CONSTRAINT `adm_perfilprocesso_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `adm_perfil` (`idPerfil`),
  ADD CONSTRAINT `adm_perfilprocesso_ibfk_2` FOREIGN KEY (`idProcesso`) REFERENCES `adm_processo` (`idProcesso`);

--
-- Limitadores para a tabela `adm_user_perfil`
--
ALTER TABLE `adm_user_perfil`
  ADD CONSTRAINT `adm_user_perfil_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `adm_usuario` (`idUsuario`),
  ADD CONSTRAINT `adm_user_perfil_ibfk_2` FOREIGN KEY (`idPerfil`) REFERENCES `adm_perfil` (`idPerfil`);

--
-- Limitadores para a tabela `CadPessoaContato`
--
ALTER TABLE `CadPessoaContato`
  ADD CONSTRAINT `CadPessoaContato_ibfk_1` FOREIGN KEY (`Abook`) REFERENCES `CadPessoaMaster` (`Abook`);

--
-- Limitadores para a tabela `CadPessoaEndereco`
--
ALTER TABLE `CadPessoaEndereco`
  ADD CONSTRAINT `CadPessoaEndereco_ibfk_1` FOREIGN KEY (`Abook`) REFERENCES `CadPessoaMaster` (`Abook`),
  ADD CONSTRAINT `CadPessoaEndereco_ibfk_2` FOREIGN KEY (`CEP`) REFERENCES `CadPessoaCEP` (`CEP`),
  ADD CONSTRAINT `CadPessoaEndereco_ibfk_3` FOREIGN KEY (`CEP`) REFERENCES `CadPessoaCEP` (`CEP`),
  ADD CONSTRAINT `CadPessoaEndereco_ibfk_4` FOREIGN KEY (`CEP`) REFERENCES `CadPessoaCEP` (`CEP`),
  ADD CONSTRAINT `CadPessoaEndereco_ibfk_5` FOREIGN KEY (`CEP`) REFERENCES `CadPessoaCEP` (`CEP`);

--
-- Limitadores para a tabela `CadQualItem`
--
ALTER TABLE `CadQualItem`
  ADD CONSTRAINT `CadQualItem_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `CadItem` (`idItem`),
  ADD CONSTRAINT `CadQualItem_ibfk_2` FOREIGN KEY (`CodTeste`) REFERENCES `CadQualMaster` (`CodTeste`);

--
-- Limitadores para a tabela `CadQualRange`
--
ALTER TABLE `CadQualRange`
  ADD CONSTRAINT `CadQualRange_ibfk_1` FOREIGN KEY (`idItem`) REFERENCES `CadItem` (`idItem`),
  ADD CONSTRAINT `CadQualRange_ibfk_2` FOREIGN KEY (`CodTeste`) REFERENCES `CadQualMaster` (`CodTeste`);

--
-- Limitadores para a tabela `CadVeiculo`
--
ALTER TABLE `CadVeiculo`
  ADD CONSTRAINT `CadVeiculo_ibfk_1` FOREIGN KEY (`TipoVeiculo`) REFERENCES `CadTipoVeiculo` (`TipoVeiculo`),
  ADD CONSTRAINT `CadVeiculo_ibfk_2` FOREIGN KEY (`AbookTransportadora`) REFERENCES `CadPessoaMaster` (`Abook`);

--
-- Limitadores para a tabela `DadosGerais`
--
ALTER TABLE `DadosGerais`
  ADD CONSTRAINT `DadosGerais_ibfk_1` FOREIGN KEY (`Atributo`) REFERENCES `SetupDadosGerais` (`Atributo`);

--
-- Limitadores para a tabela `Filial`
--
ALTER TABLE `Filial`
  ADD CONSTRAINT `Filial_ibfk_1` FOREIGN KEY (`Abook`) REFERENCES `CadPessoaMaster` (`Abook`),
  ADD CONSTRAINT `Filial_ibfk_2` FOREIGN KEY (`Companhia`) REFERENCES `Companhia` (`Companhia`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
