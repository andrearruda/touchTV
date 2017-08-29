-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 29-Ago-2017 às 15:52
-- Versão do servidor: 10.1.13-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `nivea_touch`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `scheduling_start` datetime NOT NULL,
  `scheduling_end` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `activity`
--

INSERT INTO `activity` (`id`, `label`, `title`, `text`, `image`, `active`, `scheduling_start`, `scheduling_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '123', '123', '123', 'img_59a5b356a89d95_06444547.png', 1, '2017-08-01 00:00:00', '2017-08-31 00:00:00', '2017-08-29 15:32:55', '2017-08-29 15:32:59', NULL),
(2, '321', '321', '321', 'img_59a5b47c36ead6_01077707.jpg', 1, '2017-08-01 00:00:00', '2017-08-31 00:00:00', '2017-08-29 15:37:48', '2017-08-29 15:37:52', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `scheduling_start` datetime NOT NULL,
  `scheduling_end` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `article`
--

INSERT INTO `article` (`id`, `label`, `title`, `text`, `image`, `scheduling_start`, `scheduling_end`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'O que é Lorem Ipsum?', 'Lorem Ipsum é simplesmente uma simulação', 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.\r\n\r\nLorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'img_57e937a5883ce.jpg', '2016-09-01 00:00:00', '2016-09-30 00:00:00', 1, '2016-09-26 10:35:25', '2016-09-26 11:58:45', NULL),
(2, 'Porque nós o usamos?', 'É um fato conhecido de todos que um leitor', 'É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de \"Conteúdo aqui, conteúdo aqui\", fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por \'lorem ipsum\' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).', 'img_57f7cef09d7ce.jpg', '2017-08-01 00:00:00', '2017-08-31 00:00:00', 1, '2016-09-26 11:59:24', '2017-08-29 15:41:12', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `employee_unit_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `department` varchar(45) NOT NULL,
  `born_at` date NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `employee`
--

INSERT INTO `employee` (`id`, `employee_unit_id`, `name`, `department`, `born_at`, `image`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 3, 'Andrea Nitrini', 'Vendas', '2016-06-01', 'img_5750774fadb6a.jpg', 1, '2016-06-02 15:12:40', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(2, 3, 'Guilherme Pinheiro', 'Filling & Packing', '2016-06-01', 'img_575077ba126dc.jpg', 1, '2016-06-02 15:15:22', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(3, 3, 'Sidneia Ribeiro', 'Filling Management', '2016-06-01', 'img_5750781c5f38a.jpg', 1, '2016-06-02 15:17:00', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(4, 3, 'Hildalete Sousa', 'Filling & Packing', '2016-06-03', 'img_5750787b43dba.jpg', 1, '2016-06-02 15:18:35', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(5, 3, 'Rodrigo Moreira', 'Vendas', '2016-06-02', 'img_575078ecc090e.jpg', 1, '2016-06-02 15:20:28', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(6, 3, 'Aline Motta', 'Anl. Logistica PL', '2016-06-04', 'img_575079b46bd3e.jpg', 1, '2016-06-02 15:23:48', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(7, 3, 'Marcelo Zuchetto', 'Filling & Packing', '2016-06-04', 'img_57507a12eb466.jpg', 1, '2016-06-02 15:25:23', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(8, 3, 'Rosemeri Matias', 'Vendas', '2016-06-04', 'img_57507a5810417.jpg', 1, '2016-06-02 15:26:32', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(9, 3, 'Fernando Ferroni', 'Controladoria', '2016-06-04', 'img_57507c44d200a.jpg', 1, '2016-06-02 15:34:44', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(10, 3, 'Heliana Guilherme', 'Diretoria Financeira', '2016-06-04', 'img_57507ca35f054.jpg', 1, '2016-06-02 15:36:19', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(11, 3, 'Soraya Barros', 'Qualidade', '2016-06-07', 'img_57507d00a0010.jpg', 1, '2016-06-02 15:37:52', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(12, 3, 'Ricardo Carvalho', 'Vendas', '2016-06-07', 'img_57507d86b547c.jpg', 1, '2016-06-02 15:40:06', '2017-06-12 16:19:13', '2017-06-12 16:19:12'),
(13, 3, 'João Franceschetto', 'Vendas', '2016-06-07', 'img_57507dd13d818.jpg', 1, '2016-06-02 15:41:21', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(14, 3, 'Francisco Pereira', 'Vendas', '2016-06-07', 'img_57507e229ca91.jpg', 1, '2016-06-02 15:42:42', '2017-06-12 16:19:12', '2017-06-12 16:19:12'),
(15, 3, 'Ana Paula Alves', 'Trade Marketing', '2016-06-08', 'img_57507e67cfb63.jpg', 1, '2016-06-02 15:43:51', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(16, 3, 'Viviane Contar', 'Mkt Direction', '2016-04-02', 'img_57508baec3b9b.jpg', 1, '2016-06-02 16:40:30', '2017-04-07 10:16:20', '2017-04-07 10:16:19'),
(17, 3, 'Luiz Caram', 'Controladoria', '2016-04-04', 'img_57508c1be06db.jpg', 1, '2016-06-02 16:42:20', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(18, 3, 'Ana Paula Pelegrini', 'Indireto Atacado Farma', '2016-04-04', 'img_57508c8c19b80.jpg', 1, '2016-06-02 16:44:12', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(19, 3, 'Nathalia Weber', 'Marketing', '2016-06-09', 'img_57585aa4335c0.jpg', 1, '2016-06-08 14:49:24', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(20, 3, 'Lucas Ortega', 'Comunicação', '2016-06-09', 'img_57585b1e5b25e.jpg', 1, '2016-06-08 14:51:26', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(21, 3, 'Jeffer Anthony', 'Controladoria', '2016-06-11', 'img_57585bd58f559.jpg', 1, '2016-06-08 14:54:29', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(22, 3, 'Gabriel Nucci', 'Vendas', '2016-06-12', 'img_57585ca287b35.jpg', 1, '2016-06-08 14:57:54', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(23, 3, 'Giseli Oliveira', 'Planejamento De Materiais', '2016-06-13', 'img_57585d316a0a4.jpg', 1, '2016-06-08 15:00:17', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(24, 3, 'Paula Mazzini', 'Planejamento De Materiais', '2016-06-13', 'img_57585e10c3627.jpg', 1, '2016-06-08 15:04:00', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(25, 3, 'Vivian Louise', 'Marketing', '2016-06-14', 'img_57585ecfbcbae.jpg', 1, '2016-06-08 15:07:11', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(26, 3, 'Mariana Brancatte', 'Controles Internos', '2016-06-14', 'img_57585f94dc75b.jpg', 1, '2016-06-08 15:10:28', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(27, 3, 'Flavio Cunha', 'Vendas', '2016-06-14', 'img_575860127b98a.jpg', 1, '2016-06-08 15:12:34', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(28, 3, 'Lilian Hossoi', 'Tecnologia Da Informação', '2016-06-15', 'img_575860e108809.jpg', 1, '2016-06-08 15:16:01', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(29, 3, 'Julio Abrunhosa', 'Vendas', '2016-06-16', 'img_575862915b8f8.jpg', 1, '2016-06-08 15:23:13', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(30, 3, 'Celso Oliveira', 'Compounding', '2016-06-16', 'img_57596106eae96.jpg', 1, '2016-06-09 09:28:55', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(31, 3, 'Priscilla Cardoso', 'Marketing', '2016-06-17', 'img_575acb3d5d0b0.jpg', 1, '2016-06-10 11:14:21', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(32, 3, 'Lilian Silva', 'Vendas', '2016-06-19', 'img_575acba7ae7a8.jpg', 1, '2016-06-10 11:16:07', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(33, 3, 'Marjorie Oliveira', 'Trade Marketing', '2016-06-19', 'img_575acc2170677.jpg', 1, '2016-06-10 11:18:09', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(34, 3, 'Julio Boiarenco', 'Vendas', '2016-06-21', 'img_575acc8238339.jpg', 1, '2016-06-10 11:19:46', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(35, 3, 'Marilia Campolino', 'Vendas', '2016-06-23', 'img_575acccf4e4c4.jpg', 1, '2016-06-10 11:21:03', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(36, 3, 'Helena Camargo', 'Marketing', '2016-06-23', 'img_575acd286b60a.jpg', 1, '2016-06-10 11:22:32', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(37, 3, 'Paula Campos', 'Fiscal', '2016-06-23', 'img_575acd70866e8.jpg', 1, '2016-06-10 11:23:44', '2017-06-12 16:19:14', '2017-06-12 16:19:13'),
(38, 3, 'Nathalie Metzler', 'Marketing', '2016-06-24', 'img_575acdae42761.jpg', 1, '2016-06-10 11:24:46', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(39, 3, 'Rodrigo Burgos', 'Vendas', '2016-06-24', 'img_575acdf62cbd5.jpg', 1, '2016-06-10 11:25:58', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(40, 3, 'Augusto Cesar Da Silva', 'Vendas', '2016-06-24', 'img_575ace35b71c0.jpg', 1, '2016-06-10 11:27:01', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(41, 3, 'Liege Slomp', 'Vendas', '2016-06-24', 'img_575ace9eeade2.jpg', 1, '2016-06-10 11:28:47', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(42, 3, 'Juliana Sbrussi', 'Qualidade', '2016-06-25', 'img_575acf119428f.jpg', 1, '2016-06-10 11:30:41', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(43, 3, 'Andreia Melo', 'Tesouraria', '2016-06-27', 'img_575acf5017ad5.jpg', 1, '2016-06-10 11:31:44', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(44, 3, 'Thiago Bilges', 'Vendas', '2016-06-27', 'img_575acf9716be1.jpg', 1, '2016-06-10 11:32:55', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(45, 3, 'Joelma Bufalo', 'Filling & Packing', '2016-06-28', 'img_575ad04b62b27.jpg', 1, '2016-06-10 11:35:55', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(46, 3, 'Manoel Crisostomo', 'Filling & Packing', '2016-06-28', 'img_575ad0906df76.jpg', 1, '2016-06-10 11:37:04', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(47, 3, 'Vagner Cunha', 'Compras', '2016-06-28', 'img_575ad0e2904a5.jpg', 1, '2016-06-10 11:38:26', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(48, 3, 'Pedro Silva', 'Customer Service', '2016-06-29', 'img_575ad11f77c36.jpg', 1, '2016-06-10 11:39:27', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(49, 3, 'Juliana Omizu', 'Marketing', '2016-06-30', 'img_575ad165a7d8a.jpg', 1, '2016-06-10 11:40:37', '2017-06-12 16:19:15', '2017-06-12 16:19:14'),
(50, 3, 'Denise Oliveira', 'Recursos Humanos', '2016-06-30', 'img_575ad1d5a422e.jpg', 1, '2016-06-10 11:42:29', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(51, 3, 'Viviane Contar', 'MKT Direction', '2016-04-02', 'img_575af7131093a.jpg', 1, '2016-06-10 14:21:23', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(52, 3, 'Luiz Caram', 'Controladoria', '2016-04-04', 'img_575af7722640b.jpg', 1, '2016-06-10 14:22:58', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(53, 3, 'Ana Paula Pelegrin', 'Indireto Atacado Farma', '2016-04-04', 'img_575af7d4dd2cf.jpg', 1, '2016-06-10 14:24:36', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(54, 3, 'Rodolfo Rigoni', 'Indireto Leste', '2016-04-04', 'img_575af81bad164.jpg', 1, '2016-06-10 14:25:47', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(55, 3, 'Ramon Gil', 'Qualidade', '2016-04-05', 'img_575af858508ce.jpg', 1, '2016-06-10 14:26:48', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(56, 3, 'Vinicius Cardoso', 'Customer Service Nivea', '2016-04-05', 'img_575af8a033d68.jpg', 1, '2016-06-10 14:28:00', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(57, 3, 'Bryanne Calandrello', 'Recursos Humanos', '2016-04-07', 'img_575af8eb1a879.jpg', 1, '2016-06-10 14:29:15', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(58, 3, 'Bruno Ogata', 'Continuos Improvement', '2016-04-07', 'img_575af92bb205b.jpg', 1, '2016-06-10 14:30:19', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(59, 3, 'Vinicius Piccoli', 'EUC_Demand', '2016-04-07', 'img_575af9950610e.jpg', 1, '2016-06-10 14:32:05', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(60, 3, 'Julia Bueno', 'MKT Deo', '2016-04-08', 'img_575af9e5578a6.jpg', 1, '2016-06-10 14:33:25', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(61, 3, 'Juliana Santos', 'Supply DC Regional', '2016-04-08', 'img_575afa2eba9d5.jpg', 1, '2016-06-10 14:34:38', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(62, 3, 'Michelle Guersoni', 'Recursos Humanos', '2016-04-08', 'img_575afa79259b5.jpg', 1, '2016-06-10 14:35:53', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(63, 3, 'Andrea Almeida', 'MKT Skin Care', '2016-04-09', 'img_575afac0e6804.jpg', 1, '2016-06-10 14:37:04', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(64, 3, 'Fernanda Kalil', 'Shopper & Customer', '2016-04-09', 'img_575afb30323b4.jpg', 1, '2016-06-10 14:38:56', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(65, 3, 'Willian Castro', 'Filling & Packing', '2016-04-10', 'img_575afb7219128.jpg', 1, '2016-06-10 14:40:02', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(66, 3, 'Jonny Rodrigues', 'Filling & Packing', '2016-04-12', 'img_575afbd491a5e.jpg', 1, '2016-06-10 14:41:40', '2017-04-07 10:16:20', '2017-04-07 10:16:20'),
(67, 3, 'Victor Almeida', 'Nordeste II', '2016-04-14', 'img_575afc4c25d5a.jpg', 1, '2016-06-10 14:43:40', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(68, 3, 'Maisa Nascimento', 'EUC_Demand', '2016-04-14', 'img_575afc83d83ca.jpg', 1, '2016-06-10 14:44:35', '2017-04-07 10:16:21', '2017-04-07 10:16:20'),
(69, 3, 'Vanessa Garci', 'Quality DC', '2016-04-14', 'img_575afcc71278f.jpg', 1, '2016-06-10 14:45:43', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(70, 3, 'Mariana Ferreira', 'Clientes Regionais', '2016-04-15', 'img_575afd09171d5.jpg', 1, '2016-06-10 14:46:49', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(71, 3, 'Juliana Rossi', 'Shopper & Customer - PDV', '2016-04-16', 'img_575afd55b7b6c.jpg', 1, '2016-06-10 14:48:05', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(72, 3, 'Leticia Guiti', 'Shopper & Customer - Canal Indireto', '2016-04-17', 'img_575afda67627a.jpg', 1, '2016-06-10 14:49:26', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(73, 3, 'Lauriane Barros', 'EUC_Demand', '2016-04-17', 'img_575afe135bb58.jpg', 1, '2016-06-10 14:51:15', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(74, 3, 'Elaine Ribeiro', 'Filling & Packing', '2016-04-18', 'img_575afe8bbb295.jpg', 1, '2016-06-10 14:53:15', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(75, 3, 'Sergio Vano', 'Shopper & Customer - Canal Indireto', '2016-04-18', 'img_575afed439c45.jpg', 1, '2016-06-10 14:54:28', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(76, 3, 'Siloel Souza', 'Clientes Regionais SP', '2016-04-18', 'img_575aff4e27e5d.jpg', 1, '2016-06-10 14:56:30', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(77, 3, 'William Barbosa', 'Indireto Leste', '2016-04-19', 'img_575b00544c09e.jpg', 1, '2016-06-10 15:00:52', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(78, 3, 'Paulo Frazão', 'Clientes Regionais Sul', '2016-04-20', 'img_575b00c5c17f9.jpg', 1, '2016-06-10 15:02:45', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(79, 3, 'Ana Batista', 'Recursos Humanos', '2016-04-21', 'img_575b0117074ff.jpg', 1, '2016-06-10 15:04:07', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(80, 3, 'Marcela Trausola', 'Fiscal PC', '2016-06-23', 'img_575b01795ff8a.jpg', 1, '2016-06-10 15:05:45', '2017-06-12 16:19:13', '2017-06-12 16:19:13'),
(81, 3, 'Patricia Rocha', 'Compouding', '2016-04-28', 'img_575b01cd16e7f.jpg', 1, '2016-06-10 15:07:09', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(82, 3, 'Luiza Iasi', 'Shopper & Customer - Intelligence', '2016-06-29', 'img_575b0224779be.jpg', 1, '2016-06-10 15:08:36', '2017-06-12 16:19:14', '2017-06-12 16:19:14'),
(83, 3, 'Alfio Mazzini', 'Technical Management', '2016-04-29', 'img_575b027c2cb92.jpg', 1, '2016-06-10 15:10:04', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(84, 3, 'Maria Santos', 'Filling & Packing', '2016-04-29', 'img_575b02ccccfcf.jpg', 1, '2016-06-10 15:11:24', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(85, 3, 'Camila Almeida', 'Controladoria', '2016-04-30', 'img_575b031741611.jpg', 1, '2016-06-10 15:12:39', '2017-04-07 10:16:21', '2017-04-07 10:16:21'),
(86, 3, 'Tatiana Pedroso', 'Planejamento de Materiais - PCP', '2016-04-30', 'img_575b037596129.jpg', 1, '2016-06-10 15:14:13', '2017-04-07 10:16:23', '2017-04-07 10:16:21'),
(87, 3, 'Rafhael Tavarayama', 'Supply Chain', '2016-01-01', 'img_575eae3c5703c.jpg', 1, '2016-06-13 09:59:40', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(88, 3, 'Carlos Pereira', 'Administração Financeira', '2016-01-02', 'img_575eae5dd697e.jpg', 1, '2016-06-13 10:00:13', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(89, 3, 'Carolina Rodrigues', 'Supply Chain', '2016-01-05', 'img_575eaea9ae73e.jpg', 1, '2016-06-13 10:01:29', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(90, 3, 'Ligia Annunziato', 'Marketing', '2016-01-06', 'img_575eaeff4d315.jpg', 1, '2016-06-13 10:02:55', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(91, 3, 'Eliciane Teles', 'Filling & Packing', '2016-01-06', 'img_575eaf51ebfe6.jpg', 1, '2016-06-13 10:04:18', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(92, 3, 'Eder Ribeiro', 'Supply Chain', '2016-01-08', 'img_575eaf9964f7d.jpg', 1, '2016-06-13 10:05:29', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(93, 3, 'Guilherme Bissaco', 'Compounding', '2016-01-10', 'img_575eb1f0e2ee4.jpg', 1, '2016-06-13 10:15:28', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(94, 3, 'Camila Saturnino', 'Fiscal', '2016-01-11', 'img_575eb239a90a6.jpg', 1, '2016-06-13 10:16:41', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(95, 3, 'Diogo Fabres', 'Vendas', '2016-01-13', 'img_575eb2cca0cf5.jpg', 1, '2016-06-13 10:19:08', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(96, 3, 'Isabela Cerqueira', 'Planejamento de Materiais - PCP', '2016-01-14', 'img_575eb926eb7f3.jpg', 1, '2016-06-13 10:46:15', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(97, 3, 'Alexandre John', 'Shopper & Customer', '2016-01-15', 'img_575eb96bb428f.jpg', 1, '2016-06-13 10:47:23', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(98, 3, 'Gabriel Pereira', 'Vendas', '2016-01-15', 'img_575eb9b669353.jpg', 1, '2016-06-13 10:48:38', '2017-01-16 15:12:39', '2017-01-16 15:12:38'),
(99, 3, 'Daniela Melo', 'Tesouraria', '2016-01-15', 'img_575eb9fe82122.jpg', 1, '2016-06-13 10:49:50', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(100, 3, 'Maria Amelia Lauriano', 'Farma Sudeste', '2016-01-17', 'img_575eba6b951df.jpg', 0, '2016-06-13 10:51:39', '2017-01-16 13:47:48', NULL),
(101, 3, 'Gisele Fola', 'Logistics DC Jundiai', '2016-01-20', 'img_575ebac8a445c.jpg', 1, '2016-06-13 10:53:12', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(102, 3, 'Marcia Brum', 'Vendas', '2016-01-20', 'img_575ebdc27a33e.jpg', 1, '2016-06-13 11:05:54', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(103, 3, 'Mariane Perassolo', 'Contabilidade', '2016-01-21', 'img_575ebe5248b67.jpg', 1, '2016-06-13 11:08:18', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(104, 3, 'Luana Pereira', 'Fiscal', '2015-01-23', 'img_575ebeb3b99f1.jpg', 1, '2016-06-13 11:09:55', '2017-01-16 15:12:38', '2017-01-16 15:12:38'),
(105, 3, 'Lucas Moreira', 'Controladoria', '2016-01-23', 'img_575ebf162ccb7.jpg', 1, '2016-06-13 11:11:34', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(106, 3, 'Mayra Dietzold', 'Marketing', '2016-01-24', 'img_575ebf7dd0309.jpg', 1, '2016-06-13 11:13:17', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(107, 3, 'Christian Furigato', 'Engenharia', '2016-01-24', 'img_575ebfdf24274.jpg', 1, '2016-06-13 11:14:55', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(108, 3, 'Daniela Mendes', 'Administração Financeira', '2016-01-27', 'img_575ec0459f54d.jpg', 1, '2016-06-13 11:16:37', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(109, 3, 'Carla Macedo', 'Vendas', '2016-01-27', 'img_575ec090b19ba.jpg', 1, '2016-06-13 11:17:52', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(110, 3, 'Claudia Silva', 'Administração de Vendas', '2016-01-28', 'img_575ec0dab9ec2.jpg', 1, '2016-06-13 11:19:06', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(111, 3, 'Natalia Paixão', 'Vendas', '2016-01-29', 'img_575ec11d9f57c.jpg', 1, '2016-06-13 11:20:13', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(112, 3, 'Michelle Texeira', 'Compras', '2016-01-29', 'img_575ec181a458e.jpg', 1, '2016-06-13 11:21:53', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(113, 3, 'Nathalia Torres', 'Compras', '2016-01-31', 'img_575ec1daa4790.jpg', 1, '2016-06-13 11:23:22', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(114, 3, 'Wilson Humberto', 'Logistics DC Jundiai', '2016-01-31', 'img_575ec3286f6db.jpg', 1, '2016-06-13 11:28:56', '2017-01-16 15:12:39', '2017-01-16 15:12:39'),
(115, 3, 'Luiz Nunes', 'Vendas', '2016-07-01', 'img_577a65442001a.jpg', 1, '2016-07-04 13:31:48', '2016-07-04 14:06:58', NULL),
(116, 3, 'Isabela Padovan', 'Filling & Packing', '2016-07-01', 'img_577a657b42d04.jpg', 1, '2016-07-04 13:32:43', '2016-07-04 14:06:45', NULL),
(117, 3, 'Aline Walter', 'Supply Chain', '2016-07-03', 'img_577a65a4c4403.jpg', 1, '2016-07-04 13:33:24', '2016-07-04 13:33:29', NULL),
(118, 3, 'Fabiola Artoni', 'Marketing', '2016-07-03', 'img_577a65ccdbe50.jpg', 1, '2016-07-04 13:34:04', '2016-07-04 14:06:33', NULL),
(119, 3, 'Luciano Nogueira', 'Vendas', '2016-07-03', 'img_577a65fc603d6.jpg', 1, '2016-07-04 13:34:52', '2016-07-04 14:06:55', NULL),
(120, 3, 'Alex Farias', 'Filling & Packing', '2016-07-04', 'img_577a6614746b6.jpg', 1, '2016-07-04 13:35:16', '2016-07-04 13:35:22', NULL),
(121, 3, 'Silvia Moraes', 'Fiscal PC', '2016-07-05', 'img_577a6643bd057.jpg', 1, '2016-07-04 13:36:03', '2016-07-04 14:07:39', NULL),
(122, 3, 'Débora Melo', 'Trade Marketing', '2016-07-05', 'img_577a66c805989.jpg', 1, '2016-07-04 13:38:16', '2016-07-04 14:06:32', NULL),
(123, 3, 'Marina Fernandes', 'Trade Marketing', '2016-07-05', 'img_577a66e5c6f9d.jpg', 1, '2016-07-04 13:38:45', '2016-07-04 14:07:20', NULL),
(124, 3, 'Fernando Marafon', 'Vendas', '2016-07-06', 'img_577a6722e2287.jpg', 1, '2016-07-04 13:39:46', '2016-07-04 14:06:36', NULL),
(125, 3, 'Leandro Sampaio', 'Controladoria', '2016-07-06', 'img_577a6755a32c6.jpg', 1, '2016-07-04 13:40:37', '2016-07-04 14:06:49', NULL),
(126, 3, 'Marília Barbosa', 'Adm Interna', '2016-07-06', 'img_577a6787393b1.jpg', 1, '2016-07-04 13:41:27', '2016-07-04 14:07:18', NULL),
(127, 3, 'Melina Navarro', 'Marketing', '2016-07-06', 'img_577a67bb887a9.jpg', 1, '2016-07-04 13:42:19', '2016-07-04 14:07:26', NULL),
(128, 3, 'Michelle Ribeiro', 'Vendas', '2016-07-06', 'img_577a67dd26e89.jpg', 1, '2016-07-04 13:42:53', '2016-07-04 14:07:26', NULL),
(129, 3, 'Renato Berdichevski', 'Vendas', '2016-07-06', 'img_577a68067f7e5.jpg', 1, '2016-07-04 13:43:34', '2016-07-04 14:07:32', NULL),
(130, 3, 'Emerson Casanova', 'Technical Management', '2016-07-07', 'img_577a683825c53.jpg', 1, '2016-07-04 13:44:24', '2016-07-04 14:06:33', NULL),
(131, 3, 'Mayra Calazans', 'TPI Regional', '2016-07-07', 'img_577a686a5428e.jpg', 1, '2016-07-04 13:45:14', '2016-07-04 14:07:25', NULL),
(132, 3, 'Pauline Guazeli', 'Vendas', '2016-07-09', 'img_577a6898ef028.jpg', 1, '2016-07-04 13:46:01', '2016-07-04 14:07:30', NULL),
(133, 3, 'Samara Fontinele', 'Vendas', '2016-07-10', 'img_577a68d5f29f0.jpg', 1, '2016-07-04 13:47:02', '2016-07-04 14:07:34', NULL),
(134, 3, 'Luiza Foz', 'Marketing', '2016-07-13', 'img_577d18abe729a.jpg', 1, '2016-07-04 13:47:35', '2016-07-06 14:41:48', NULL),
(135, 3, 'Carina Marques', 'Recursos Humanos', '2016-07-16', 'img_577a6924c6d37.jpg', 1, '2016-07-04 13:48:20', '2016-07-04 14:06:27', NULL),
(136, 3, 'Danilo Nogueira', 'Vendas', '2016-07-17', 'img_577a694ba6a5a.jpg', 1, '2016-07-04 13:48:59', '2016-07-04 14:06:31', NULL),
(137, 3, 'Antonio Puppi', 'Vendas', '2016-07-18', 'img_577a696b0699b.jpg', 1, '2016-07-04 13:49:31', '2016-07-04 14:06:22', NULL),
(138, 3, 'Flávia Pereira', 'Marketing', '2016-07-18', 'img_577a698e51f6e.jpg', 1, '2016-07-04 13:50:06', '2016-07-04 14:06:36', NULL),
(139, 3, 'Matheus Machado', 'Trade Marketing', '2016-07-18', 'img_577d39df1553e.jpg', 1, '2016-07-04 13:51:20', '2016-07-06 17:03:27', NULL),
(140, 3, 'Roberto Cremasco', 'Supply Chain', '2016-07-18', 'img_577a69fbe6ddd.jpg', 1, '2016-07-04 13:51:55', '2016-07-04 14:07:33', NULL),
(141, 3, 'Vanessa Tome', 'Adm Interna', '2016-07-18', 'img_577a6a1f4b9bd.jpg', 1, '2016-07-04 13:52:31', '2016-07-04 14:07:42', NULL),
(142, 3, 'Luiz Dalceno', 'Controladoria', '2016-07-18', 'img_577a6a4c04db5.jpg', 1, '2016-07-04 13:53:16', '2016-07-04 14:06:56', NULL),
(143, 3, 'Maurício Souza', 'Supply Chain', '2016-07-19', 'img_577a6a6c99e84.jpg', 1, '2016-07-04 13:53:48', '2016-07-04 14:07:25', NULL),
(144, 3, 'Alexandre Bravo', 'Qualidade', '2016-07-20', 'img_577a6a9083085.jpg', 1, '2016-07-04 13:54:24', '2016-07-04 13:55:06', NULL),
(145, 3, 'Luiz Cipolli', 'Qualidade', '2016-07-20', 'img_578696646646d.JPG', 1, '2016-07-04 13:55:02', '2016-07-13 19:28:36', NULL),
(146, 3, 'Vânia Campos', 'Recursos Humanos', '2016-07-20', 'img_577a6ad9112c0.jpg', 1, '2016-07-04 13:55:37', '2016-07-04 14:07:43', NULL),
(147, 3, 'Thais Alves', 'Supply Chain', '2016-07-21', 'img_577a6b20b26d4.jpg', 1, '2016-07-04 13:56:48', '2016-07-04 14:07:40', NULL),
(148, 3, 'Marcelo Feliciano', 'Qualidade', '2016-07-21', 'img_577a6b43f01ef.jpg', 1, '2016-07-04 13:57:24', '2016-07-04 14:07:09', NULL),
(149, 3, 'Paula Fonseca', 'Planejamento', '2016-07-21', 'img_577a6b684b2df.jpg', 1, '2016-07-04 13:58:00', '2016-07-04 14:07:29', NULL),
(150, 3, 'Cleverson Bollmann', 'Trade Marketing', '2016-07-22', 'img_577d39bab3e91.jpg', 1, '2016-07-04 13:58:33', '2016-07-06 17:02:50', NULL),
(151, 3, 'Frederico Moraes', 'Vendas', '2016-07-22', 'img_577a6bd11e68b.jpg', 1, '2016-07-04 13:59:45', '2016-07-04 14:06:37', NULL),
(152, 3, 'Igor Oliveira', 'Adm Interna', '2016-07-24', 'img_577a6bee8335a.jpg', 1, '2016-07-04 14:00:14', '2016-07-04 14:06:41', NULL),
(153, 3, 'Gustavo Flores', 'Controladoria', '2016-07-29', 'img_577a6c1cd8aa4.jpg', 1, '2016-07-04 14:01:00', '2016-07-04 14:06:40', NULL),
(154, 3, 'Antonio Sarmento', 'Filling & Packing', '2016-07-29', 'img_577a6c45c6c04.jpg', 1, '2016-07-04 14:01:41', '2016-07-04 14:06:23', NULL),
(155, 3, 'Simone Velozo', 'Marketing', '2016-07-30', 'img_577a6c6148f71.jpg', 1, '2016-07-04 14:02:09', '2016-07-04 14:07:38', NULL),
(156, 3, 'Harlem Cogo', 'Planejamento', '2016-07-30', 'img_57869678867c9.JPG', 1, '2016-07-04 14:03:05', '2016-07-13 19:28:57', NULL),
(157, 3, 'Kleber Fernandes', 'Filling & Packing', '2016-07-30', 'img_577a6cbb9405b.jpg', 1, '2016-07-04 14:03:39', '2016-07-04 14:06:48', NULL),
(158, 3, 'Debora Dietrich', 'Marketing', '2016-07-31', 'img_577a6ce29687c.jpg', 1, '2016-07-04 14:04:18', '2016-07-04 14:06:31', '2016-07-06 14:40:59'),
(159, 3, 'Joaquim Alves', 'Vendas', '2016-07-31', 'img_577a6cfd869a0.jpg', 1, '2016-07-04 14:04:45', '2016-07-04 14:06:45', NULL),
(160, 3, 'Leila Almeida', 'Marketing - SAC', '2016-07-31', 'img_577a6d1d4cabf.jpg', 1, '2016-07-04 14:05:17', '2016-07-04 14:06:50', NULL),
(161, 3, 'Maurício Braga', 'Vendas', '2016-07-31', 'img_577a6d3ab046d.jpg', 1, '2016-07-04 14:05:46', '2016-07-04 14:07:21', NULL),
(162, 3, 'Sâmia Oliveira', 'Vendas', '2016-07-31', 'img_577a6d5880741.jpg', 1, '2016-07-04 14:06:16', '2016-07-04 14:07:35', NULL),
(163, 3, 'Stefane Machtans', 'S&CM', '2016-08-03', 'img_579b7fcf096a7.jpg', 1, '2016-07-29 13:09:51', '2016-07-29 14:14:21', NULL),
(164, 3, 'Paulo Morelli', 'Logística', '2016-07-05', 'img_579b806792740.jpg', 1, '2016-07-29 13:10:21', '2016-07-29 14:14:11', NULL),
(165, 3, 'Alexandre Leal', 'Vendas', '2016-08-06', 'img_579b804a37194.jpg', 1, '2016-07-29 13:11:54', '2016-07-29 14:13:22', NULL),
(166, 3, 'Fernando Ferrari', 'Finanças', '2016-08-06', 'img_579b8090ad1e5.jpg', 1, '2016-07-29 13:13:04', '2016-07-29 14:13:42', NULL),
(167, 3, 'Natalia Silveira', 'Marketing', '2016-08-08', 'img_579b80b6267ce.jpg', 1, '2016-07-29 13:13:42', '2016-07-29 14:14:08', NULL),
(168, 3, 'Henrique Andreoli', 'Logística', '2016-08-09', 'img_579b80fc2c956.jpg', 1, '2016-07-29 13:14:52', '2016-07-29 14:13:45', NULL),
(169, 3, 'Henrique Santos', 'Produção', '2016-08-09', 'img_579b81210726d.jpg', 1, '2016-07-29 13:15:29', '2016-07-29 14:13:46', NULL),
(170, 3, 'José Fernandes', 'Qualidade', '2016-08-09', 'img_579b813e32498.jpg', 1, '2016-07-29 13:15:58', '2016-07-29 14:13:53', NULL),
(171, 3, 'Willian Goulart Navarro', 'S&CM', '2016-08-10', 'img_579b820346545.jpg', 1, '2016-07-29 13:19:15', '2016-07-29 14:14:28', NULL),
(172, 3, 'Monique Sasso', 'Contabilidade', '2016-08-11', 'img_579b840705937.jpg', 1, '2016-07-29 13:27:51', '2016-07-29 14:14:07', NULL),
(173, 3, 'Barbara Prudente', 'S&CM', '2016-08-12', 'img_579b84dc60a40.jpg', 1, '2016-07-29 13:31:24', '2016-07-29 14:13:31', NULL),
(174, 3, 'Marcelo Marques', 'Vendas', '2016-08-12', 'img_579b85997e954.jpg', 1, '2016-07-29 13:34:33', '2016-07-29 14:14:02', NULL),
(175, 3, 'Julian Padilla', 'Vendas', '2016-08-15', 'img_579b8611ec021.jpg', 1, '2016-07-29 13:36:34', '2016-07-29 14:13:54', NULL),
(176, 3, 'Andrea Lima', 'Supply Chain', '2016-07-15', 'img_579b8678b8f79.jpg', 1, '2016-07-29 13:37:55', '2016-07-29 14:13:26', NULL),
(177, 3, 'Wagner Rodrigues', 'Produção', '2016-07-16', 'img_579b86a1d14c7.jpg', 1, '2016-07-29 13:38:57', '2016-07-29 14:14:25', NULL),
(178, 3, 'Erica Flor', 'S&CM', '2016-08-16', 'img_579b86d56e79c.jpg', 1, '2016-07-29 13:39:49', '2016-07-29 14:13:38', NULL),
(179, 3, 'Luciana Liano', 'Vendas', '2016-08-16', 'img_579b87528948b.jpg', 1, '2016-07-29 13:41:54', '2016-07-29 14:13:59', NULL),
(180, 3, 'Thais Pitsch', 'Marketing', '2016-08-17', 'img_579b87a9bc71a.jpg', 1, '2016-07-29 13:43:21', '2016-07-29 14:14:22', NULL),
(181, 3, 'Andrea Vidigal', 'S&CM', '2016-08-17', 'img_579b87ef5bcbb.jpg', 1, '2016-07-29 13:44:31', '2016-07-29 14:13:27', NULL),
(182, 3, 'Camila Pacheco', 'Supply Chain', '2016-08-18', 'img_579b88261984c.jpg', 1, '2016-07-29 13:45:26', '2016-07-29 14:13:32', NULL),
(183, 3, 'Juliana Alves', 'Produção', '2016-08-18', 'img_579b8b762de40.jpg', 1, '2016-07-29 13:59:34', '2016-07-29 14:13:54', NULL),
(184, 3, 'Jailton Almeida', 'Administração', '2016-08-20', 'img_579b8b9ca7413.jpg', 1, '2016-07-29 14:00:12', '2016-07-29 14:13:49', NULL),
(185, 3, 'Antonio Borsa', 'Vendas', '2016-08-21', 'img_579b8bc97d64b.jpg', 1, '2016-07-29 14:00:57', '2016-07-29 14:13:28', NULL),
(186, 3, 'Tatiana Ponce', 'Marketing', '2016-08-21', 'img_579b8c8da63e0.jpg', 1, '2016-07-29 14:04:13', '2016-07-29 14:14:20', NULL),
(187, 3, 'João Rodrigo Volochyn', 'Vendas', '2016-08-22', 'img_579b8dc563695.jpg', 1, '2016-07-29 14:09:25', '2016-07-29 14:13:50', NULL),
(188, 3, 'Cristiane Pinto', 'S&CM', '2016-08-27', 'img_579b8dffccb28.jpg', 1, '2016-07-29 14:10:23', '2016-07-29 14:13:35', NULL),
(189, 3, 'Simone Helena', 'Produção', '2016-08-27', 'img_579b8e2176d9f.jpg', 1, '2016-07-29 14:10:57', '2016-07-29 14:14:17', NULL),
(190, 3, 'Sabryna Alsfasser', 'RCM DEO', '2016-08-29', 'img_579b8e48a6c98.jpg', 1, '2016-07-29 14:11:36', '2016-07-29 14:14:16', NULL),
(191, 3, 'Ana Flavia Canuto', 'Customer', '2016-08-29', 'img_579b8e6825490.jpg', 1, '2016-07-29 14:12:08', '2016-07-29 14:13:23', NULL),
(192, 3, 'Fabiana Ibrahim', 'S&CM', '2016-08-29', 'img_579b8e8af2439.jpg', 1, '2016-07-29 14:12:43', '2016-07-29 14:13:39', NULL),
(193, 3, 'Julia Morelli', 'Marketing', '2016-08-30', 'img_579b8ea48d5c9.jpg', 1, '2016-07-29 14:13:08', '2016-07-29 14:13:53', NULL),
(194, 3, 'GUILHERME MIGUEL', 'VENDAS', '2016-09-01', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(195, 3, 'JOSELI OLIVEIRA', 'VENDAS', '2016-09-02', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(196, 3, 'JOAO PAULO PEREIRA', 'COMPOUNDING', '2016-09-02', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(197, 3, 'RODRIGO ARAKI', 'VENDAS', '2016-09-03', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(198, 3, 'MARIANA PRADO ', 'VENDAS', '2016-09-03', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(199, 3, 'JULIANA CABRAL', 'COMPRAS', '2016-09-03', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(200, 3, 'INOCENCIO SOUZA', 'COMPOUNDING', '2016-09-03', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(201, 3, 'SAMUEL BONALDO', 'VENDAS', '2016-09-03', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(202, 3, 'FRANCISLENE LANZELOTTI', 'TRADE MARKETING', '2016-09-04', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:24', '2016-09-06 11:12:24'),
(203, 3, 'FABIANO ZYSKO', 'VENDAS', '2016-09-05', NULL, 1, '2016-09-06 11:09:56', '2016-09-06 11:12:25', '2016-09-06 11:12:24'),
(204, 3, 'VANESSA OLIVEIRA', 'RECURSOS HUMANOS', '2016-09-05', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(205, 3, 'WDILENE BEZERRA', 'SUPLLY CHAIN', '2016-09-06', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(206, 3, 'DENISE GAMBOA', 'TRADE MARKETING', '2016-09-06', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(207, 3, 'TALITA PINHEIRO', 'TRADE MARKETING', '2016-09-06', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(208, 3, 'MARCIO FERREIRA', 'VENDAS', '2016-09-09', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(209, 3, 'AMANDA MARSSENATTI', 'LOGÍSTICA', '2016-09-11', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(210, 3, 'NATALIA MACHADO', 'MARKETING', '2016-09-11', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(211, 3, 'ANDREIA NEVES', 'FILLING & PACKING', '2016-09-11', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(212, 3, 'GRACIELE FIOCHI', 'PLANEJAMENTO ', '2016-09-12', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(213, 3, 'TOMAS SCHULZ', 'VENDAS', '2016-09-13', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(214, 3, 'DANIELA COUTINHO ', 'SUPPLY CHAIN', '2016-09-14', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(215, 3, 'CAROLINA BILESKI ', 'COMPRAS', '2016-09-15', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(216, 3, 'EMERSON LUIZ AVANCI', 'ENGENHARIA', '2016-09-15', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(217, 3, 'JOAO PAULO ALVES DOS SANTOS', 'VENDAS', '2016-09-17', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(218, 3, 'MOACIR MARQUES TAVARES JUNIOR', 'RECURSOS HUMANOS', '2016-09-17', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(219, 3, 'RAFAEL DAS NEVES LOPES', 'COMPRAS', '2016-09-18', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(220, 3, 'HERMES LOPES DA SILVA', 'LOGÍSTICA', '2016-09-20', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(221, 3, 'THIAGO ARAUJO DE SOUSA', 'VENDAS', '2016-09-21', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:26', '2016-09-06 11:12:25'),
(222, 3, 'FRANCIANE PIRES', 'FILLING & PACKING', '2016-09-21', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:25', '2016-09-06 11:12:25'),
(223, 3, 'MAIRA SALES', 'LOGÍSTICA', '2016-09-23', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(224, 3, 'VIVIANE RUBIM ', 'COMPRAS', '2016-09-24', NULL, 1, '2016-09-06 11:09:57', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(225, 3, 'THEODORO OLIVA ', 'VENDAS', '2016-09-26', NULL, 1, '2016-09-06 11:09:58', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(226, 3, 'REGINALDO ROSSI', 'TI ', '2016-09-26', NULL, 1, '2016-09-06 11:09:58', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(227, 3, 'FLAVIO JESUS', 'ENGENHARIA', '2016-09-27', NULL, 1, '2016-09-06 11:09:58', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(228, 3, 'MARCELA  FACONTI ', 'TRADE MARKETING', '2016-09-29', NULL, 1, '2016-09-06 11:09:58', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(229, 3, 'MURILO CHAVES', 'FILLING & PACKING', '2016-09-30', NULL, 1, '2016-09-06 11:09:58', '2016-09-06 11:12:26', '2016-09-06 11:12:26'),
(230, 3, 'Guilherme Miguel', 'Vendas', '2016-09-01', 'img_57ced127516a8.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:22:31', NULL),
(231, 3, 'Joseli Oliveira', 'Vendas', '2016-09-02', 'img_57ced1d939c23.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:25:29', NULL),
(232, 3, 'Joao Paulo Pereira', 'Compounding', '2016-09-02', 'img_57ced190e3731.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:24:16', NULL),
(233, 3, 'Rodrigo Araki', 'Vendas', '2016-09-03', 'img_57ced304513f9.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:30:28', NULL),
(234, 3, 'Mariana Prado', 'Vendas', '2016-09-03', 'img_57ced26f8afaa.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:27:59', NULL),
(235, 3, 'Juliana Cabral', 'Compras', '2016-09-03', 'img_57ced2157136d.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:26:29', NULL),
(236, 3, 'Inocencio Souza', 'Compounding', '2016-09-03', 'img_57ced15955c57.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:23:21', NULL),
(237, 3, 'Samuel Bonaldo', 'Vendas', '2016-09-03', 'img_57ced31cdc52f.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:30:52', NULL),
(238, 3, 'Francislene Lanzelotti', 'Trade Marketing', '2016-09-04', 'img_57ced0cb2e079.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:20:59', NULL),
(239, 3, 'Fabiano Zysko', 'Vendas', '2016-09-05', 'img_57ced07807114.jpg', 1, '2016-09-06 11:12:26', '2016-09-06 11:19:36', NULL),
(240, 3, 'Vanessa Oliveira', 'Recursos Humanos', '2016-09-05', 'img_57ced3e446a17.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:34:12', NULL),
(241, 3, 'Wdilene Bezerra', 'Suplly Chain', '2016-09-06', 'img_57ced411ae54e.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:34:57', NULL),
(242, 3, 'Denise Gamboa', 'Trade Marketing', '2016-09-06', 'img_57ced041ebc43.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:18:42', NULL),
(243, 3, 'Talita Pinheiro', 'Trade Marketing', '2016-09-06', 'img_57ced338070a2.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:31:20', NULL),
(244, 3, 'Marcio Ferreira', 'Vendas', '2016-09-09', 'img_57ced256a818e.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:27:34', NULL),
(245, 3, 'Amanda Marssenatti', 'Logística', '2016-09-11', 'img_57cecf7533693.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:15:17', NULL),
(246, 3, 'Natalia Machado', 'Marketing', '2016-09-11', 'img_57ced2c0e734a.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:29:21', NULL),
(247, 3, 'Andreia Neves', 'Filling & Packing', '2016-09-11', 'img_57cecfb35fa62.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:16:19', NULL),
(248, 3, 'Graciele Fiochi', 'Planejamento', '2016-09-12', 'img_57ced10291052.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:21:54', NULL),
(249, 3, 'Tomas Schulz', 'Vendas', '2016-09-13', 'img_57ced3cd30c93.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:33:49', NULL),
(250, 3, 'Daniela Coutinho', 'Supply Chain', '2016-09-14', 'img_57ced02841140.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:18:16', NULL),
(251, 3, 'Carolina Bileski', 'Compras', '2016-09-15', 'img_57ced018b5f57.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:18:00', NULL),
(252, 3, 'Emerson Luiz Avanci', 'Engenharia', '2016-09-15', 'img_57ced05b7d5cc.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:19:07', NULL),
(253, 3, 'Joao Paulo Alves Dos Santos', 'Vendas', '2016-09-17', 'img_57ced17d401fd.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:23:57', NULL),
(254, 3, 'Moacir Marques Tavares Junior', 'Recursos Humanos', '2016-09-17', 'img_57ced28eda475.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:28:30', NULL),
(255, 3, 'Rafael Das Neves Lopes', 'Compras', '2016-09-18', 'img_57ced2d4d1017.jpg', 1, '2016-09-06 11:12:27', '2016-09-06 11:29:40', NULL),
(256, 3, 'Hermes Lopes Da Silva', 'Logística', '2016-09-20', 'img_57ced13cd55c7.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:22:52', NULL),
(257, 3, 'Thiago Araujo De Sousa', 'Vendas', '2016-09-21', 'img_57ced3b68bc93.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:33:26', NULL),
(258, 3, 'Franciane Pires', 'Filling & Packing', '2016-09-21', 'img_57ced0e46da3f.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:21:24', NULL),
(259, 3, 'Maira Sales', 'Logística', '2016-09-23', 'img_57ced22b32216.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:26:51', NULL),
(260, 3, 'Viviane Rubim', 'Compras', '2016-09-24', 'img_57ced3fcd7ea2.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:34:36', NULL),
(261, 3, 'Theodoro Oliva', 'Vendas', '2016-09-26', 'img_57ced34ed673d.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:31:42', NULL),
(262, 3, 'Reginaldo Rossi', 'Ti', '2016-09-26', 'img_57ced2e8d1048.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:30:00', NULL),
(263, 3, 'Flavio Jesus', 'Engenharia', '2016-09-27', 'img_57ced0add6169.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:20:29', NULL),
(264, 3, 'Marcela  Faconti', 'Trade Marketing', '2016-09-29', 'img_57ced241f1e80.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:27:14', NULL),
(265, 3, 'Murilo Chaves', 'Filling & Packing', '2016-09-30', 'img_57ced2a251697.jpg', 1, '2016-09-06 11:12:28', '2016-09-06 11:28:50', NULL),
(266, 3, 'CHRISTIAN GOETZ', 'DIRETORIA', '2016-10-01', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:53', '2016-10-04 11:58:53'),
(267, 3, 'ALEX SOBRAL', 'PC DIRECTOR', '2016-10-02', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:53', '2016-10-04 11:58:53'),
(268, 3, 'ARY COMAR ', 'SUPPLY CHAIN', '2016-10-02', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:53', '2016-10-04 11:58:53'),
(269, 3, 'LEONARDO ADAMI', 'REGIONAL R&D', '2016-10-04', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:53', '2016-10-04 11:58:53'),
(270, 3, 'TATHIANE GARCIA', 'FINANCEIRO', '2016-10-05', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:53', '2016-10-04 11:58:53'),
(271, 3, 'DIDACO GORI', 'FILLING & PACKING', '2016-10-06', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:54', '2016-10-04 11:58:53'),
(272, 3, 'ERNESTO SARTORI', 'PROJECTS MANAGEMENT', '2016-10-06', NULL, 1, '2016-10-04 11:56:52', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(273, 3, 'PAMELA CARNEIRO', 'FILLING & PACKING', '2016-10-06', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(274, 3, 'MIRNA CARNIELLI', 'MARKETING', '2016-10-07', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(275, 3, 'LARISSA SAMPAIO', 'TRADE MARKETING', '2016-10-08', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(276, 3, 'EDUARDO BELOTO', 'VENDAS', '2016-10-08', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(277, 3, 'QUEZIA OLIVEIRA', 'VENDAS', '2016-10-09', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(278, 3, 'INGRID DUARTE', 'FINANCEIRO', '2016-10-09', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(279, 3, 'DEOGENES BORBA', 'VENDAS', '2016-10-12', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(280, 3, 'JOSÉ MOREIRA', 'VENDAS', '2016-10-12', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(281, 3, 'CASSIA CAMPANHA', 'SUPPLY CHAIN', '2016-10-14', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(282, 3, 'ANDRE SANTOS', 'FILLING & PACKING', '2016-10-15', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(283, 3, 'MARIANE MORAIS', 'SUPPLY CHAIN', '2016-10-17', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(284, 3, 'HERBERT LIMA', 'VENDAS', '2016-10-18', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(285, 3, 'ERIK TSUMURA', 'VENDAS', '2016-10-19', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(286, 3, 'DAIANE NEVES', 'FISCAL PC', '2016-10-19', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(287, 3, 'ANDRE VALE', 'VENDAS', '2016-10-19', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(288, 3, 'PAULO SOUZA', 'VENDAS', '2016-10-20', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(289, 3, 'GISELLE CABRAL', 'VENDAS', '2016-10-20', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(290, 3, 'LEANDRO LIMA', 'VENDAS', '2016-10-21', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:55', '2016-10-04 11:58:54'),
(291, 3, 'JULIANA PRINCEPE', 'SUPPLY CHAIN', '2016-10-21', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:54', '2016-10-04 11:58:54'),
(292, 3, 'SORAYA MIZUTANI', 'FINANCEIRO', '2016-10-21', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(293, 3, 'VALDOMIRO MOREIRA', 'VENDAS', '2016-10-21', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(294, 3, 'MIRELE SANFINS', 'FILLING & PACKING', '2016-10-22', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(295, 3, 'CAROLINA LEWIN', 'RECURSOS HUMANOS', '2016-10-24', NULL, 1, '2016-10-04 11:56:53', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(296, 3, 'EVANDRO CANDIDO', 'FILLING & PACKING', '2016-10-24', NULL, 1, '2016-10-04 11:56:54', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(297, 3, 'RICARDO AQUINO', 'TRADE MARKETING', '2016-10-27', NULL, 1, '2016-10-04 11:56:54', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(298, 3, 'MURILO NORCIA', 'TRADE MARKETING', '2016-10-30', NULL, 1, '2016-10-04 11:56:54', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(299, 3, 'LUIZ GUSTAVO AYRES', 'VENDAS', '2016-10-30', NULL, 1, '2016-10-04 11:56:54', '2016-10-04 11:58:55', '2016-10-04 11:58:55'),
(300, 3, 'Christian Goetz', 'Diretoria', '2016-10-01', 'img_57f3c47ba64eb.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 12:02:19', NULL),
(301, 3, 'Alex Sobral', 'PC Director', '2016-10-02', 'img_57f3c3d0924b1.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 11:59:29', NULL),
(302, 3, 'Ary Comar', 'Supply Chain', '2016-10-02', 'img_57f3c43016070.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 12:01:04', NULL),
(303, 3, 'Leonardo Adami', 'Regional R&D', '2016-10-04', 'img_57f3c63e4f36c.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 12:09:50', NULL),
(304, 3, 'Tathiane Garcia', 'Financeiro', '2016-10-05', 'img_57f3eb2214b9c.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 14:47:14', NULL),
(305, 3, 'Didaco Gori', 'Filling & Packing', '2016-10-06', 'img_57f3c4c89c383.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 12:03:36', NULL),
(306, 3, 'Ernesto Sartori', 'Projects Management', '2016-10-06', 'img_57f3c513c4be7.jpg', 1, '2016-10-04 11:58:55', '2016-10-04 12:04:51', NULL),
(307, 3, 'Pamela Carneiro', 'Filling & Packing', '2016-10-06', 'img_57f3c6d25c46c.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:12:18', NULL),
(308, 3, 'Mirna Carnielli', 'Marketing', '2016-10-07', 'img_57f3c6a98f1f9.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:11:37', NULL),
(309, 3, 'Larissa Sampaio', 'Trade Marketing', '2016-10-08', 'img_57f3c606b497d.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:08:54', NULL),
(310, 3, 'Eduardo Beloto', 'Vendas', '2016-10-08', 'img_57f3c4e35af47.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:04:03', NULL),
(311, 3, 'Quezia Oliveira', 'Vendas', '2016-10-09', 'img_57f3c706db9eb.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:13:10', NULL),
(312, 3, 'Ingrid Duarte', 'Financeiro', '2016-10-09', 'img_57f3c5a64a86d.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:07:18', NULL),
(313, 3, 'Deogenes Borba', 'Vendas', '2016-10-12', 'img_57f3c4ab67156.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:03:07', NULL),
(314, 3, 'José Moreira', 'Vendas', '2016-10-12', 'img_57f3c5c641378.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:07:50', NULL),
(315, 3, 'Cassia Campanha', 'Supply Chain', '2016-10-14', 'img_57f3c45422e32.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:01:40', NULL),
(316, 3, 'Andre Santos', 'Filling & Packing', '2016-10-15', 'img_57f3c3e9d5f2e.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 11:59:53', NULL),
(317, 3, 'Mariane Morais', 'Supply Chain', '2016-10-17', 'img_57f3c67f8e538.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:10:55', NULL),
(318, 3, 'Herbert Lima', 'Vendas', '2016-10-18', 'img_57f3c572c1227.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:06:26', NULL),
(319, 3, 'Erik Tsumura', 'Vendas', '2016-10-19', 'img_57f3c4f968cc6.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:04:25', NULL),
(320, 3, 'Daiane Neves', 'Fiscal PC', '2016-10-19', 'img_57f3c4983e0f1.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:02:48', NULL),
(321, 3, 'Andre Vale', 'Vendas', '2016-10-19', 'img_57f3c40572beb.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:00:21', NULL),
(322, 3, 'Paulo Souza', 'Vendas', '2016-10-20', 'img_57f3c6e7ea883.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:12:40', NULL),
(323, 3, 'Giselle Cabral', 'Vendas', '2016-10-20', 'img_57f3c54dd0999.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:05:49', NULL),
(324, 3, 'Leandro Lima', 'Vendas', '2016-10-21', 'img_57f3c6171eb38.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:09:11', NULL),
(325, 3, 'Juliana Princepe', 'Supply Chain', '2016-10-21', 'img_57f3c5db6bbe0.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:08:11', NULL),
(326, 3, 'Soraya Mizutani', 'Financeiro', '2016-10-21', 'img_57f3c72d773dd.jpg', 1, '2016-10-04 11:58:56', '2016-10-04 12:13:49', NULL),
(327, 3, 'Valdomiro Moreira', 'Vendas', '2016-10-21', 'img_57f3eb3bb7fd8.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 14:47:39', NULL),
(328, 3, 'Mirele Sanfins', 'Filling & Packing', '2016-10-22', 'img_57f3c696d9d59.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:11:18', NULL),
(329, 3, 'Carolina Lewin', 'Recursos Humanos', '2016-10-24', 'img_57f3c4419bbff.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:01:21', NULL),
(330, 3, 'Evandro Candido', 'Filling & Packing', '2016-10-24', 'img_57f3c52534468.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:05:09', NULL),
(331, 3, 'Ricardo Aquino', 'Trade Marketing', '2016-10-27', 'img_57f3c71887520.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:13:28', NULL),
(332, 3, 'Murilo Norcia', 'Trade Marketing', '2016-10-30', 'img_57f3c6badb705.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:11:54', NULL),
(333, 3, 'Luiz Gustavo Ayres', 'Vendas', '2016-10-30', 'img_57f3c6574fc15.jpg', 1, '2016-10-04 11:58:57', '2016-10-04 12:10:15', NULL),
(334, 3, 'ALESSANDRA LORENZ', 'VENDAS', '2016-11-03', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(335, 3, 'SILENE BRUNET', 'LEGAL DC', '2016-11-04', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(336, 3, 'JULIANO NEVES', 'VENDAS', '2016-11-05', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(337, 3, 'RENATA SILVA', 'PLANEJAMENTO', '2016-11-05', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(338, 3, 'HELDER SILVA', 'VENDAS', '2016-11-06', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(339, 3, 'JULIANO ROJA', 'VENDAS', '2016-11-07', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(340, 3, 'MARIA CARVALHO', 'FILLING', '2016-11-07', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(341, 3, 'KEILA MORAES', 'COMPRAS', '2016-11-08', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(342, 3, 'ROMUALDO LUCENA', 'TEC OPERAÇÕES', '2016-11-09', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(343, 3, 'ADRIANA SILVA', 'SUPPLY CHAIN', '2016-11-09', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(344, 3, 'ALEX KIM', 'RECURSOS HUMANOS', '2016-11-13', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(345, 3, 'AILTON CAVALCANTE', 'VENDAS', '2016-11-13', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:28', '2016-10-31 11:04:28'),
(346, 3, 'LAIS VIDAL', 'COORDENADORA DE SHE', '2016-11-14', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(347, 3, 'ALEXANDRE SILVA', 'TECNOLOGIA DA INFORMAÇÃO', '2016-11-14', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:29', '2016-10-31 11:04:28'),
(348, 3, 'ANA GARBI', 'VENDAS', '2016-11-16', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(349, 3, 'GILMARQUES ALMEIDA', 'FILLING', '2016-11-18', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(350, 3, 'CAMILA DECOUSSAU', 'TRADE MARKETING', '2016-11-19', NULL, 1, '2016-10-31 11:01:06', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(351, 3, 'PAULA NASCIMENTO', 'VENDAS', '2016-11-19', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(352, 3, 'MARCIO BARBOSA', 'VENDAS', '2016-11-22', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(353, 3, 'MARIANA ALMEIDA', 'TRADE MARKETING', '2016-11-26', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(354, 3, 'TOMAS BONANI', 'VENDAS', '2016-11-28', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(355, 3, 'ORIETTA BALBONTIN', 'MARKETING', '2016-11-29', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29');
INSERT INTO `employee` (`id`, `employee_unit_id`, `name`, `department`, `born_at`, `image`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(356, 3, 'ISABELA MAKI', 'MARKETING', '2016-11-30', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:35', '2016-10-31 11:04:29'),
(357, 3, 'BRUNO ROCHA', 'VENDAS', '2016-11-30', NULL, 1, '2016-10-31 11:01:07', '2016-10-31 11:04:29', '2016-10-31 11:04:29'),
(358, 3, 'Alessandra Lorenz', 'Vendas', '2016-11-03', 'img_58174196dc391.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:05:26', NULL),
(359, 3, 'Silene Brunet', 'Legal DC', '2016-11-04', 'img_5817440e9c2ca.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:15:58', NULL),
(360, 3, 'Juliano Neves', 'Vendas', '2016-11-05', 'img_581742dd3d8b4.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:10:53', NULL),
(361, 3, 'Renata Silva', 'Planejamento', '2016-11-05', 'img_581743dd88fe1.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:15:09', NULL),
(362, 3, 'Helder Silva', 'Vendas', '2016-11-06', 'img_581742ac0db6d.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:10:04', NULL),
(363, 3, 'Juliano Roja', 'Vendas', '2016-11-07', 'img_5817430094817.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:11:28', NULL),
(364, 3, 'Maria Carvalho', 'Filling', '2016-11-07', 'img_5817437a96e6a.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:13:31', NULL),
(365, 3, 'Keila Moraes', 'Compras', '2016-11-08', 'img_581743261c3ae.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:12:06', NULL),
(366, 3, 'Romualdo Lucena', 'Tec Operações', '2016-11-09', 'img_581743f3e807a.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:15:32', NULL),
(367, 3, 'Adriana Silva', 'Supply Chain', '2016-11-09', 'img_5817417e02114.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:05:02', NULL),
(368, 3, 'Alex Kim', 'Recursos Humanos', '2016-11-13', 'img_581741a35760b.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:05:39', NULL),
(369, 3, 'Ailton Cavalcante', 'Vendas', '2016-11-13', 'img_5817418abe848.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:05:14', NULL),
(370, 3, 'Lais Vidal', 'Coordenadora De She', '2016-11-14', 'img_58174340ac13c.jpg', 1, '2016-10-31 11:04:35', '2016-10-31 11:12:32', NULL),
(371, 3, 'Alexandre Silva', 'Tecnologia Da Informação', '2016-11-14', 'img_581741b132239.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:05:53', NULL),
(372, 3, 'Ana Garbi', 'Vendas', '2016-11-16', NULL, 1, '2016-10-31 11:04:36', '2016-10-31 11:04:36', NULL),
(373, 3, 'Gilmarques Almeida', 'Filling', '2016-11-18', 'img_58174266a1beb.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:08:54', NULL),
(374, 3, 'Camila Decoussau', 'Trade Marketing', '2016-11-19', 'img_581742450306d.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:08:21', NULL),
(375, 3, 'Paula Nascimento', 'Vendas', '2016-11-19', 'img_581743bfa771e.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:14:39', NULL),
(376, 3, 'Marcio Barbosa', 'Vendas', '2016-11-22', 'img_581743616745e.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:13:05', NULL),
(377, 3, 'Mariana Almeida', 'Trade Marketing', '2016-11-26', 'img_5817439460ab5.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:13:56', NULL),
(378, 3, 'Tomas Bonani', 'Vendas', '2016-11-28', 'img_5817442347ce9.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:16:19', NULL),
(379, 3, 'Orietta Balbontin', 'Marketing', '2016-11-29', 'img_581743ac410f8.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:14:20', NULL),
(380, 3, 'Isabela Maki', 'Marketing', '2016-11-30', 'img_581742c284851.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:10:26', NULL),
(381, 3, 'Bruno Rocha', 'Vendas', '2016-11-30', 'img_5817422d2c619.jpg', 1, '2016-10-31 11:04:36', '2016-10-31 11:07:57', NULL),
(382, 3, 'Rafhael Hisao Tavarayama', 'Supply Chain', '2017-01-01', 'img_587d09eea6e68.jpg', 1, '2017-01-16 15:12:39', '2017-01-16 15:59:10', NULL),
(383, 3, 'Carlos Eduardo Pereira Junior', 'Controladoria', '2017-01-02', 'img_587d057299307.jpg', 1, '2017-01-16 15:12:39', '2017-01-16 15:40:02', NULL),
(384, 3, 'Paula Ferro David', 'Marketing', '2017-01-04', 'img_587d09d72c5d8.jpg', 1, '2017-01-16 15:12:39', '2017-01-16 15:58:47', NULL),
(385, 3, 'Carolina Rodrigues', 'TPI', '2017-01-05', 'img_587d058970d53.jpg', 1, '2017-01-16 15:12:39', '2017-01-16 15:40:25', NULL),
(386, 3, 'Eliciane Da Silva Teles', 'Filling & Packing', '2017-01-06', 'img_587d072587674.jpg', 1, '2017-01-16 15:12:39', '2017-01-16 15:47:17', NULL),
(387, 3, 'Ligia Carolina Amadi Annunziato', 'Marketing', '2017-01-06', 'img_587d080db99f2.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:51:09', NULL),
(388, 3, 'Eder Flavio Ribeiro', 'Compounding', '2017-01-08', 'img_587d06f45b21a.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:46:28', NULL),
(389, 3, 'Rogger Vieira Silva Bueno', 'Vendas', '2017-01-09', 'img_587d0a27e0e3c.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 16:00:07', NULL),
(390, 3, 'Guilherme Da Silva Bissaco', 'Compounding', '2017-01-10', 'img_587d0788b4a07.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:48:56', NULL),
(391, 3, 'Camila Jaques Rosa', 'Fiscal', '2017-01-11', 'img_587d04e7edf0e.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:37:44', NULL),
(392, 3, 'Noel Lopes Da Silva Miranda Junior', 'Vendas', '2017-01-13', 'img_587d09bd8cd6a.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:58:21', NULL),
(393, 3, 'Gabriel Pereira', 'Vendas', '2017-01-15', 'img_587d0752db583.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:48:02', NULL),
(394, 3, 'Daniela Paris De Melo', 'Tesouraria', '2017-01-15', 'img_587d069a25429.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:44:58', NULL),
(395, 3, 'Gisele Regina Fola Batista', 'Logistica', '2017-01-20', 'img_587d076b196f0.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:48:27', NULL),
(396, 3, 'Marcia Dos Reis Brum', 'Vendas', '2017-01-20', 'img_587d08c441027.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:54:12', NULL),
(397, 3, 'Ricardo De Araujo Torres Barros', 'Vendas', '2017-01-21', 'img_587d0a0aab716.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:59:38', NULL),
(398, 3, 'Mariane Vieira Perassolo', 'Contabilidade', '2017-01-21', 'img_587d08f56124b.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:55:01', NULL),
(399, 3, 'Julia Araujo Roberto Kahn', 'Marketing', '2017-01-21', 'img_587d07d19bf13.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:50:09', NULL),
(400, 3, 'Luana Regina Pereira', 'Fiscal', '2017-01-23', 'img_587d082ef1aa0.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:51:43', NULL),
(401, 3, 'Lucas Grillo Moreira', 'Controladoria', '2017-01-23', 'img_587d084bdfc78.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:52:12', NULL),
(402, 3, 'Christian Luis Furigato', 'Manutenção', '2017-01-24', 'img_587d05a3eb1da.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:40:52', NULL),
(403, 3, 'Mayra Dietzold', 'Marketing', '2017-01-24', 'img_587d092967b63.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:55:53', NULL),
(404, 3, 'Daniela Spinola Mendes', 'Financeiro', '2017-01-27', 'img_587e0d28010e5.jpg', 1, '2017-01-16 15:12:40', '2017-01-17 10:25:12', NULL),
(405, 3, 'Carla De Fatima Araujo Macedo', 'Vendas', '2017-01-27', 'img_587d050785330.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:38:15', NULL),
(406, 3, 'Claudia Cintra Da Silva', 'Vendas', '2017-01-28', 'img_587d05cbc3365.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:41:31', NULL),
(407, 3, 'Michele Renata Texeira Ribeiro', 'Compras', '2017-01-29', 'img_587d095f3a322.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:56:47', NULL),
(408, 3, 'Monique Da Silva Sousa', 'Propagandista', '2017-01-29', 'img_587d098c16284.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:57:32', NULL),
(409, 3, 'Nathalia Vicentini Torres', 'Compras', '2017-01-31', 'img_587d09abe9aa0.jpg', 1, '2017-01-16 15:12:40', '2017-01-16 15:58:04', NULL),
(410, 3, 'Wilson Louvison Humberto', 'Logistica', '2017-01-31', 'img_587d0a40386c5.jpg', 1, '2017-01-16 15:12:41', '2017-01-16 16:00:32', NULL),
(411, 3, 'Felipe Aguiar Mendonca', 'Marketing', '2017-02-01', 'img_5890c6ca1db3d.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:18:02', NULL),
(412, 3, 'Marcelo Vieira Da Silva', 'Regional', '2017-02-01', 'img_5890c8cc440aa.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:26:36', NULL),
(413, 3, 'Ricardo Oliveira Siqueira Gomes', 'Customer Service', '2017-02-02', 'img_5890ca7d0c68d.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:33:49', NULL),
(414, 3, 'Fernando Kutchukian', 'Vendas', '2017-02-02', 'img_5890c6e3e6f6d.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:18:28', NULL),
(415, 3, 'Elaine Mures Gomes', 'Propagandista', '2017-02-03', 'img_5890c65ccbbd8.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:16:12', NULL),
(416, 3, 'Erika Pires Cardoso', 'Propagandista', '2017-02-04', 'img_5890c697045eb.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:17:11', NULL),
(417, 3, 'Luciana Aparecida Dester Vieira', 'Recursos Humanos', '2017-02-05', 'img_5890c82e8c603.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:23:58', NULL),
(418, 3, 'Eduardo Hipolito Da Silva', 'Fiscal', '2017-02-07', 'img_5890c64689995.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:15:50', NULL),
(419, 3, 'Karen Coletto Gandelman', 'Vendas', '2017-02-08', 'img_5890c7bce64f6.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:22:05', NULL),
(420, 3, 'Jardel Nisch', 'Contas', '2017-02-09', 'img_5890c783465f3.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:21:07', NULL),
(421, 3, 'Maria Vitoria Mansour Arida', 'Marketing', '2017-02-09', 'img_5890c928df6a7.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:28:08', NULL),
(422, 3, 'Gustavo Roberto Semen Neves', 'Vendedor', '2017-02-10', 'img_5890c72ea4518.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:19:42', NULL),
(423, 3, 'Nielsen Lopes De Camargo', 'Produção', '2017-02-11', 'img_5890ca24a686a.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:32:20', NULL),
(424, 3, 'Sheila Honorio Correa Parenti Cardoso', 'Planejamento', '2017-02-13', 'img_5890caf288dd0.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:35:46', NULL),
(425, 3, 'Rodrigo Mendes Feros', 'Vendedor', '2017-02-13', 'img_5890cac1ba7d0.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:34:57', NULL),
(426, 3, 'Valclides Antunes De Souza', 'Utilidades', '2017-02-14', 'img_5890cb07c63cf.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:36:07', NULL),
(427, 3, 'Maria Amelia Lauriano', 'Administrativo', '2017-02-14', 'img_5890c90641dba.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:27:34', NULL),
(428, 3, 'Fabio Da Costa Barbosa', 'Propagandista', '2017-02-14', 'img_5890c6aed8e40.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:17:34', NULL),
(429, 3, 'Carolina Duarte Martins Buffara De Freitas', 'Comunicacao', '2017-02-14', 'img_5890bf768e509.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 14:46:46', NULL),
(430, 3, 'Patricia Hasmann Dos Santos', 'Comunicacao', '2017-02-16', 'img_5890ca541015a.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:33:08', NULL),
(431, 3, 'Harumi Maria Serra Iamamoto', 'Key Account Mng Sr', '2017-02-16', 'img_5890c74a817ff.jpg', 1, '2017-01-31 14:44:35', '2017-01-31 15:20:10', NULL),
(432, 3, 'Liliam Maris Almeida', 'Customer Service', '2017-02-16', 'img_5890c8047f185.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:23:16', NULL),
(433, 3, 'Luiz Eduardo Pereira Faria', 'Nordeste', '2017-02-17', 'img_5890c894381a0.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:25:40', NULL),
(434, 3, 'Sara Cristina Barbosa Sarti', 'Produção', '2017-02-18', 'img_5890cadf0df91.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:35:27', NULL),
(435, 3, 'Luciana Spina Moris', 'Recursos Humanos', '2017-02-18', 'img_5890c84ae8f96.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:24:27', NULL),
(436, 3, 'Edinalva Nunes Martins De Souza', 'Cobrança', '2017-02-18', 'img_5890c614f23fa.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:15:01', NULL),
(437, 3, 'Ana Carolina Guazelli Cosin', 'Marketing', '2017-02-18', 'img_5890bf25c91b0.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 14:45:26', NULL),
(438, 3, 'Guilherme Brandao Silva', 'Estagiario', '2017-02-19', 'img_5890c71659af9.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:19:18', NULL),
(439, 3, 'Juliana Leardine De Souza', 'Produção', '2017-02-19', 'img_5890c79fe9161.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:21:36', NULL),
(440, 3, 'Eliene Ramalho Jesus', 'Produção', '2017-02-20', 'img_5890c6709651f.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:16:32', NULL),
(441, 3, 'Edson Brandao Da Silva', 'Recursos Humanos', '2017-02-22', 'img_5890c62feaf47.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:15:28', NULL),
(442, 3, 'Mariana Ramalho Da Cunha', 'Advogado', '2017-02-22', 'img_5890c9c92abd3.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:30:49', NULL),
(443, 3, 'Rodrigo Garcia Cunha', 'Vendas', '2017-02-22', 'img_5890ca9d975ed.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:34:21', NULL),
(444, 3, 'Daniela Maresca De Medeiros', 'Demanda', '2017-02-23', 'img_5890c01e2ce26.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 14:49:34', NULL),
(445, 3, 'Ana Laura Rodrigues Villela Camacho', 'Demanda', '2017-02-23', 'img_5890bf3ccb55e.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 14:45:48', NULL),
(446, 3, 'Anna Carolina Barbosa Scandurra Pereira', 'Administrativo', '2017-02-24', 'img_5890bf58a443b.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 14:46:16', NULL),
(447, 3, 'Isabela Formigoni Buratto', 'Marketing', '2017-02-25', 'img_5890c7682c170.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:20:40', NULL),
(448, 3, 'Mariana Silva Arruda Borges', 'Planejamento', '2017-02-26', 'img_5890c9fdb99f6.jpg', 1, '2017-01-31 14:44:36', '2017-01-31 15:31:41', NULL),
(449, 3, 'Sarah Andreza Souza Da Costa', 'Vendedor', '2017-03-01', 'img_58c0170cad3c1.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:37:00', NULL),
(450, 3, 'Junior Andre Do Carmo', 'Vendedor', '2017-03-02', 'img_58c0105572759.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:08:21', NULL),
(451, 3, 'Fabia Luisiana Da Silva Piva', 'Logistica', '2017-03-02', 'img_58c00d05034f6.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 10:54:13', NULL),
(452, 3, 'Magno Augusto Garcia Cocolo Gordiano', 'Vendedor', '2017-03-02', 'img_58c014bb5ffe7.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:27:07', NULL),
(453, 3, 'Flavia Gomes Dos Santos', 'Qualidade', '2017-03-04', 'img_58c00e2da02cb.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 10:59:09', NULL),
(454, 3, 'Adriana Raffaelli Do Valle', 'Marketing', '2017-03-04', 'img_58c0096cce751.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 10:38:52', NULL),
(455, 3, 'Pedro Henrique Davalos Ramos', 'Estagiario', '2017-03-05', 'img_58c016245fef6.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:33:08', NULL),
(456, 3, 'Luiz Fernando Pacifico Marcondes', 'Propagandista', '2017-03-07', 'img_58c014a037bb5.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:26:40', NULL),
(457, 3, 'Cibelle Cristina Araujo Francisco', 'Administrativo', '2017-03-07', 'img_58c00bb03e73b.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 10:48:32', NULL),
(458, 3, 'Paulo Eduardo Grippa', 'Projects Management', '2017-03-08', 'img_58c015f10d186.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 11:32:17', NULL),
(459, 3, 'Cristiano Liberato', 'Process Engeniring', '2017-03-09', 'img_58c00c1fc0f38.jpg', 1, '2017-03-08 10:36:30', '2017-03-08 10:50:23', NULL),
(460, 3, 'Marcelo Ferraz Almeida', 'Filling & Packing', '2017-03-09', 'img_58c014eee1704.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:27:58', NULL),
(461, 3, 'Julio Cesar Cordeiro Da Silva', 'Executivo Contas', '2017-03-09', 'img_58c0103925250.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:07:53', NULL),
(462, 3, 'Renata Fagundes Coelho', 'Demanda', '2017-03-09', 'img_58c016a04e5d9.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:35:12', NULL),
(463, 3, 'Kelly Juliana Da Silva', 'Logistica', '2017-03-10', 'img_58c010875ed77.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:09:11', NULL),
(464, 3, 'Rodrigo Gregorio Dinotte', 'Vendedor', '2017-03-11', 'img_58c016e1381cb.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:36:17', NULL),
(465, 3, 'Marcelo Bueno Pimenta', 'Supply Chain', '2017-03-11', 'img_58c014d99e7da.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:27:37', NULL),
(466, 3, 'Fulvio Tulio Capo Granata', 'Demanda', '2017-03-11', 'img_58c00e52450f3.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:59:46', NULL),
(467, 3, 'Tatiane Ferreira Dos Santos', 'Filling & Packing', '2017-03-12', 'img_58c0172000764.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:37:20', NULL),
(468, 3, 'Maria Solange Mendes Da Costa Souza', 'Filling & Packing', '2017-03-12', 'img_58c0155e904d1.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:29:50', NULL),
(469, 3, 'Gilson Moraes Chaves', 'Vendedor', '2017-03-12', 'img_58c00ecca30fc.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:01:48', NULL),
(470, 3, 'Ricardo De Carvalho Moreira', 'Filling & Packing', '2017-03-13', 'img_58c016bfc3e46.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:35:43', NULL),
(471, 3, 'Jose Carlos Bueno De Oliveira Junior', 'Compounding', '2017-03-15', 'img_58c00fbb41ab8.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:05:47', NULL),
(472, 3, 'Jucelaine De Fatima Trausula', 'Fiscal', '2017-03-15', 'img_58c00fdcc2fa9.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:06:20', NULL),
(473, 3, 'Ubirajara Fonseca De Vasconcelos Filho', 'Vendas', '2017-03-15', 'img_58c01799a95d4.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:39:21', NULL),
(474, 3, 'Joao Bosco Alves Costa', 'Compounding', '2017-03-16', 'img_58c00f984ef87.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:05:12', NULL),
(475, 3, 'Daniel Ribeiro Rangel De Souza', 'Vendas', '2017-03-16', 'img_58c00c435d14a.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:50:59', NULL),
(476, 3, 'Bruna Chirico Magalhaes', 'Marketing', '2017-03-19', 'img_58c009f0aebe3.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:41:04', NULL),
(477, 3, 'Livia Heringer Pasqualino', 'Logistica', '2017-03-19', 'img_58c01463be415.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:25:39', NULL),
(478, 3, 'Carlos Eduardo Azevedo Faia', 'Propagandista', '2017-03-19', 'img_58c00b5c00597.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:47:08', NULL),
(479, 3, 'Camila Carvalho Meireles', 'Marketing', '2017-03-20', 'img_58c00af74d381.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:45:27', NULL),
(480, 3, 'Cinthia Zavan', 'Qualidade', '2017-03-21', 'img_58c00c0676ace.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 10:49:58', NULL),
(481, 3, 'Juliana Muniz Vieira Da Silva', 'Administrativo', '2017-03-21', 'img_58c00ffb3e488.jpg', 1, '2017-03-08 10:36:31', '2017-03-08 11:06:51', NULL),
(482, 3, 'Gabriel Ruda Mendes Lafayette', 'Marketing', '2017-03-21', 'img_58c00e8b6a6f0.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:00:43', NULL),
(483, 3, 'Rui Bufarah Filho', 'Merchandising', '2017-03-21', 'img_58c016f95b4d1.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:36:41', NULL),
(484, 3, 'Nariman Sartori Alves', 'Vendedor', '2017-03-21', 'img_58c015cca7358.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:31:40', NULL),
(485, 3, 'Alisson Vitor Correa', 'Filling & Packing', '2017-03-22', 'img_58c009c048bf6.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 10:40:16', NULL),
(486, 3, 'Carlos Ferreira Da Silva', ' Vendas', '2017-03-22', NULL, 1, '2017-03-08 10:36:32', '2017-03-08 10:36:32', '2017-03-08 10:48:08'),
(487, 3, 'Alexandre Chiquie Ferrante Tripi', 'Vendas', '2017-03-22', 'img_58c0098f3a9d4.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 10:39:27', NULL),
(488, 3, 'Raul Samogini Rodrigues', 'Logistica', '2017-03-23', 'img_58c0168c5c2fd.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:34:52', NULL),
(489, 3, 'Isabela Baron', 'Recursos Humanos', '2017-03-26', 'img_58c00ef5c268f.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:02:29', NULL),
(490, 3, 'Wellington Tassi', 'Compounding', '2017-03-27', 'img_58c017b0e2f49.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:39:45', NULL),
(491, 3, 'Fernando Momesso Cardoso', 'Controladoria', '2017-03-27', 'img_58c00ddcc7490.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 10:57:48', NULL),
(492, 3, 'Leandro Martins Rodrigues Barbosa', 'Infraestrutura', '2017-03-28', 'img_58c010a6b2d98.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:09:42', NULL),
(493, 3, 'Luciano Nicola', 'Filling Management', '2017-03-29', 'img_58c0148575bcf.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:26:13', NULL),
(494, 3, 'Pedro Bento De Almeida Junior', 'Vendedor', '2017-03-29', 'img_58c01611a1dd3.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 11:32:49', NULL),
(495, 3, 'Alexandre Costa Carvalheira', 'Financeiro', '2017-03-29', 'img_58c0099f02739.jpg', 1, '2017-03-08 10:36:32', '2017-03-08 10:39:43', NULL),
(496, 3, 'Monica Valeria Dos Santos Longo', 'Recursos Humanos', '2017-03-30', 'img_58c015a0f3d28.jpg', 1, '2017-03-08 10:36:33', '2017-03-08 11:30:57', NULL),
(497, 3, 'Beatriz Giansante Lopes Pereira', 'Estagiaria', '2017-03-30', 'img_58c009d4c3d9b.jpg', 1, '2017-03-08 10:36:33', '2017-03-08 10:40:36', NULL),
(498, 3, 'Narcizo Barbosa De Oliveira De Barros', 'Filling & Packing', '2017-03-30', 'img_58c015b7e061f.jpg', 1, '2017-03-08 10:36:33', '2017-03-08 11:31:19', NULL),
(499, 3, 'Viviane Aparecida Contar', 'Administrativo', '2017-04-02', 'img_58e795dbb2458.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:36:27', NULL),
(500, 3, 'Rodolfo Rigoni Filho', 'Executivo Contas', '2017-04-04', 'img_58e794950ac5f.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:31:01', NULL),
(501, 3, 'Ana Paula Pelegrin Bedore', 'Vendedor', '2017-04-04', 'img_58e791733eb15.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:17:39', NULL),
(502, 3, 'Luiz Eduardo Moreira Caram', 'Controladoria', '2017-04-04', 'img_58e7938da02c8.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:26:37', NULL),
(503, 3, 'Ramon Gil', 'Qualidade', '2017-04-05', 'img_58e7948379140.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:30:43', NULL),
(504, 3, 'Vinicius Rodrigues Cardoso', 'Logistica', '2017-04-05', 'img_58e795bfb2d11.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:35:59', NULL),
(505, 3, 'Bruno Yukio Ogata', 'Continuos Improvement', '2017-04-07', 'img_58e791a2d05a7.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:18:26', NULL),
(506, 3, 'Bryanne Misael Da Silva Calandrello', 'Recursos Humanos', '2017-04-07', 'img_58e791b23dba6.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:18:42', NULL),
(507, 3, 'Vinicius De Souza Piccoli', 'Propagandista', '2017-04-07', 'img_58e7959cbbc27.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:35:24', NULL),
(508, 3, 'Juliana Aparecida Dos Santos', 'Supply Chain', '2017-04-08', 'img_58e79324e9f15.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:24:53', NULL),
(509, 3, 'Julia Ruy Bueno', 'Estagiario', '2017-04-08', 'img_58e79306c919b.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:24:22', NULL),
(510, 3, 'Michelle Guersoni De Lima Nespoli', 'Recursos Humanos', '2017-04-08', 'img_58e794458522f.jpg', 1, '2017-04-07 10:16:23', '2017-04-07 10:29:41', NULL),
(511, 3, 'Fernanda Mucciolo Kalil', 'Estagiario', '2017-04-09', 'img_58e792be04c05.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:23:10', NULL),
(512, 3, 'Vinicius Zampier Bitencourt De Sousa', 'Marketing', '2017-04-09', 'img_58e795cda77f2.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:36:13', NULL),
(513, 3, 'Willian Barbosa De Castro', 'Filling E Packing', '2017-04-10', 'img_58e7960f160f8.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:37:19', NULL),
(514, 3, 'Sabrina Pupo Martinhs Da Costa', 'Filling E Packing', '2017-04-11', 'img_58e794a82a2b9.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:31:20', NULL),
(515, 3, 'Jonny Aparecido Rodrigues', 'Filling E Packing', '2017-04-12', 'img_58e792e3626c0.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:23:47', NULL),
(516, 3, 'Carolina Melo Moreno', 'Qualidade', '2017-04-14', 'img_58e792136aba0.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:20:19', NULL),
(517, 3, 'Maisa Costa Machado Nascimento', 'Propagandista', '2017-04-14', 'img_58e793c9abf72.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:27:37', NULL),
(518, 3, 'Victor Da Costa Agra Almeida', 'Vendedor', '2017-04-14', 'img_58e7957fb36ee.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:34:55', NULL),
(519, 3, 'Mariana Paraiso Alves Ferreira', 'Vendas', '2017-04-15', 'img_58e7941664a2b.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:28:54', NULL),
(520, 3, 'Lauriane Tomoda Barros', 'Propagandista', '2017-04-17', 'img_58e79355ae0ac.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:25:41', NULL),
(521, 3, 'Elaine Cristina Ruela Ribeiro', 'Filling E Packing', '2017-04-18', 'img_58e79287780aa.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:22:15', NULL),
(522, 3, 'Siloel Alves De Souza', 'Vendedor', '2017-04-18', 'img_58e794deb3017.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:32:14', NULL),
(523, 3, 'Sergio Minguez Vano', 'Shopper & Customer', '2017-04-18', 'img_58e794c2a4311.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:31:46', NULL),
(524, 3, 'William Alexandre Mendes Barbosa', 'Vendas', '2017-04-19', 'img_58e795f1dfb68.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:36:49', NULL),
(525, 3, 'Paulo Da Silva Frazao', 'Vendedor', '2017-04-20', 'img_58e7946c84bd4.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:30:20', NULL),
(526, 3, 'Bruna Oliveira De Laurentiis Lima', 'Recursos Humanos', '2017-04-21', 'img_58e7918c76f7f.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:18:04', NULL),
(527, 3, 'Ana Maria Da Anunciacao Batista', 'Estagiario', '2017-04-21', 'img_58e7915e4a71d.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:17:18', NULL),
(528, 3, 'Marcela Trausola Momente', 'Fiscal', '2017-04-23', 'img_58e793e006f9b.jpg', 1, '2017-04-07 10:16:24', '2017-04-07 10:28:00', NULL),
(529, 3, 'Mariana Policastro', 'Marketing', '2017-04-24', 'img_58e79428eafd5.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:29:13', NULL),
(530, 3, 'Patricia Da Rocha Da Silva', 'Compounding', '2017-04-28', 'img_58e7945a18641.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:30:02', NULL),
(531, 3, 'Luiza De Oliveira Iasi', 'Shopper & Customer', '2017-04-29', 'img_58e793b2f12f6.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:27:15', NULL),
(532, 3, 'Alfio Mazzini', 'Projects Management', '2017-04-29', 'img_58e7914491720.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:16:53', NULL),
(533, 3, 'Maria Aparecida Dos Santos', 'Filling E Packing', '2017-04-29', 'img_58e7940283bc6.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:28:34', NULL),
(534, 3, 'Kassyane Marinheiro Campelo Cavalcanti', 'Vendas', '2017-04-29', 'img_58e79338e873a.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:25:13', NULL),
(535, 3, 'Camila De Almeida Ricardo', 'Controladoria', '2017-04-30', 'img_58e791f721a7d.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:19:51', NULL),
(536, 3, 'Tatiana Barros Pedroso', 'Regional', '2017-04-30', 'img_58e7952a580c2.jpg', 1, '2017-04-07 10:16:25', '2017-04-07 10:33:30', NULL),
(537, 3, 'Fernanda Menegon', 'Contas', '2017-05-01', 'img_591deedbc2541.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:58:35', NULL),
(538, 3, 'Joao Guilherme Tidei De Ungaro', 'Vendedor', '2017-05-05', 'img_591df0c05e52e.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:06:40', NULL),
(539, 3, 'Marina Borsato Benatti', 'Customer Service', '2017-05-06', 'img_591df13530c98.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:08:37', NULL),
(540, 3, 'Maximiliano Dornelles Bordignon', 'Vendas', '2017-05-06', 'img_591df1db07b7a.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:11:23', NULL),
(541, 3, 'Alessander Pancieri Marcal', 'Contas', '2017-05-09', 'img_591de2c25db1a.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:06:58', NULL),
(542, 3, 'Fernanda Cerqueira Fonseca', 'Contas', '2017-05-09', 'img_591dee7c0ceb7.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:57:00', NULL),
(543, 3, 'Keila Aparecida De Oliveira', 'Compras', '2017-05-11', 'img_591df0d909e0f.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:07:05', NULL),
(544, 3, 'Gustavo Henrique Fiacadori', 'Vendas', '2017-05-11', 'img_591def942678b.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:01:40', NULL),
(545, 3, 'Flavia De Souza Paz', 'Shopper & Customer', '2017-05-12', 'img_591def158bd58.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:59:33', NULL),
(546, 3, 'Darlene De Sousa Toledo', 'Fiscal', '2017-05-12', 'img_591de578dc2c7.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:18:32', NULL),
(547, 3, 'Camila Bailao Martins Branco', 'Marketing', '2017-05-12', 'img_591de3a38675a.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:10:43', NULL),
(548, 3, 'Carla Helena Da Costa Porto', 'Contas', '2017-05-13', 'img_591de3caf0a56.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:11:23', NULL),
(549, 3, 'Valeria Costa Ventura', 'Tesouraria', '2017-05-13', 'img_591df66d16261.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:30:53', NULL),
(550, 3, 'Patricia Vaz Picolo', 'Juridico', '2017-05-15', 'img_591df296e5557.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:14:31', NULL),
(551, 3, 'Clerio Dos Reis Neto', 'Shopper & Customer', '2017-05-16', 'img_591de54a0c9b9.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 15:17:46', NULL),
(552, 3, 'Lucio Alexandre De Favari', 'Sistema Informacao', '2017-05-17', 'img_591df10801b65.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:07:52', NULL),
(553, 3, 'Rafaela De Jesus Rosa', 'Demanda', '2017-05-19', 'img_591df2a9ef0de.jpg', 1, '2017-05-18 15:03:26', '2017-05-18 16:14:50', NULL),
(554, 3, 'Jessica Mina Funagoshi', 'Controladoria', '2017-05-19', 'img_591df09bb7773.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:06:03', NULL),
(555, 3, 'Jessica Martinez Oliveira', 'Marketing', '2017-05-20', 'img_591df0880ee16.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:05:44', NULL),
(556, 3, 'Jaime Pereira Da Silva Filho', 'Vendedor', '2017-05-20', 'img_591df03e29858.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:04:30', NULL),
(557, 3, 'Elvys Fabiano Alves Nunes', 'Marketing', '2017-05-20', 'img_591de59265c1d.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 15:18:58', NULL),
(558, 3, 'Amanda Correia Alves Da Silva', 'Vendedor', '2017-05-21', 'img_591de355e8aaf.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 15:09:26', NULL),
(559, 3, 'Hugo Leonardo Da Silva Martins', 'Contas', '2017-05-21', 'img_591defaf7560a.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:02:07', NULL),
(560, 3, 'Nathalia Galvao De Franca Namorado', 'Compras', '2017-05-23', 'img_591df22b3dfc4.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:12:43', NULL),
(561, 3, 'Adams Damaceno Ribeiro', 'Shopper & Customer', '2017-05-23', 'img_591de2b4f2d3a.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 15:06:46', NULL),
(562, 3, 'Nadja Arantes Pereira Peclat', 'Propagandista', '2017-05-25', 'img_591df20a3db85.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:12:10', NULL),
(563, 3, 'Lucas Thiede Martins Costa', 'Marketing', '2017-05-25', 'img_591df0ec4df08.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:07:24', NULL),
(564, 3, 'Silvana De Oliveira Silva', 'Logistica', '2017-05-25', 'img_591df40ebd866.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:20:47', NULL),
(565, 3, 'Monica Resio Bueno De Lima', 'Vendedor', '2017-05-26', 'img_591df1f2d3b5c.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:11:46', NULL),
(566, 3, 'Isabela Tamy Takara', 'Vendas', '2017-05-26', 'img_591defe02d9e3.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:02:56', NULL),
(567, 3, 'Suzana Da Fonseca', 'Recursos Humanos', '2017-05-27', 'img_591df6579c7fc.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:30:31', NULL),
(568, 3, 'Danubia Karine Teixeira Fonseca', 'Comunicacao', '2017-05-28', 'img_591de5615a9c8.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 15:18:09', NULL),
(569, 3, 'Ricardo Duraes', 'Contas', '2017-05-28', 'img_591df2beb6ddc.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:15:10', NULL),
(570, 3, 'Luiz Antonio Marasca Junior', 'Demanda', '2017-05-28', 'img_591df11d4e8f6.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:08:13', NULL),
(571, 3, 'Simone Lima Mendes Pinto', 'Qualidade', '2017-05-31', 'img_591df5ba267fc.jpg', 1, '2017-05-18 15:03:27', '2017-05-18 16:27:54', NULL),
(572, 3, 'teste', 'test', '2017-06-01', NULL, 1, '2017-06-12 16:19:14', '2017-06-12 16:19:14', NULL),
(573, 3, 'teste 02', 'test', '2017-06-02', NULL, 1, '2017-06-12 16:19:15', '2017-06-12 16:19:15', NULL),
(574, 3, 'teste 03', 'test', '2017-06-03', NULL, 1, '2017-06-12 16:19:15', '2017-06-12 16:19:15', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `employee_unit`
--

CREATE TABLE `employee_unit` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `employee_unit`
--

INSERT INTO `employee_unit` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'São Paulo', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(3, 'N/A', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `highlights`
--

CREATE TABLE `highlights` (
  `id` int(11) NOT NULL,
  `label` varchar(20) NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `scheduling_start` datetime NOT NULL,
  `scheduling_end` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `highlights`
--

INSERT INTO `highlights` (`id`, `label`, `title`, `text`, `image`, `active`, `scheduling_start`, `scheduling_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'O que é Lorem Ipsum?', 'O que é Lorem Ipsum?', 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'img_57f7e6316061e.jpg', 1, '2016-10-01 00:00:00', '2016-10-31 00:00:00', '2016-10-07 15:15:13', '2016-10-07 15:17:16', NULL),
(2, 'Teste', 'Teste caracteres', 'Reunião de SCM na fábrica de Itatiba\r\n\r\n2017-06-06\r\n\r\nAlém dos tópicos de SCM, os participantes tiveram a oportunidade de realizar uma visita à fábrica para entender sobre o processo produtivo dos produtos NIVEA com foco no controle de qualidade. A área de Quality Improvements realizou uma apresentação detalhada de todos os processos usados para garantir os padrões de qualidade da Beiersdorf.', 'img_59370b0062bab.jpg', 1, '2017-06-06 00:00:00', '2017-06-07 00:00:00', '2017-06-06 17:00:31', '2017-06-06 17:05:20', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itinerary`
--

CREATE TABLE `itinerary` (
  `id` int(11) NOT NULL,
  `itinerary_route_id` int(11) NOT NULL,
  `itinerary_city_id` int(11) NOT NULL,
  `schedule` varchar(5) NOT NULL,
  `stop` varchar(25) NOT NULL,
  `reference` varchar(25) NOT NULL,
  `neighborhood` varchar(15) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `itinerary_city`
--

CREATE TABLE `itinerary_city` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itinerary_city`
--

INSERT INTO `itinerary_city` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jundiaí', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(3, 'Campinas', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(4, 'Valinhos', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `itinerary_route`
--

CREATE TABLE `itinerary_route` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `trajectory` varchar(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `itinerary_route`
--

INSERT INTO `itinerary_route` (`id`, `name`, `trajectory`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Turno 1', 'Itatiba/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
(2, 'Turno 1', 'Jundiaí/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
(3, 'Turno 2', 'Itatiba/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
(4, 'Turno 2', 'Jundiaí/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
(5, 'ADM', 'Campinas/Valinhos', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
(6, 'ADM', 'Itatiba/Jundiaí', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `roleId` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `role`
--

INSERT INTO `role` (`id`, `parent_id`, `roleId`) VALUES
(1, NULL, 'guest'),
(2, 1, 'user');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `displayName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8 NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `displayName`, `password`, `state`) VALUES
(1, NULL, 'nivea@farolsign.com.br', 'Nivea', '$2y$14$ruuhGHHaSXpnYFKCN1R/.ea3tcq324AazvwbrizkJu9.ERb.KcQbS', 1),
(2, NULL, 'farol@farolsign.com.br', 'Farol Sign', '$2y$14$UjdJrSHnRs5UW.KL1cV6XeVUJUZWm1OHbKT/eH8Z9e6JyYAjOe.He', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `warning`
--

CREATE TABLE `warning` (
  `id` int(11) NOT NULL,
  `day_notice` date NOT NULL,
  `title` varchar(45) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `scheduling_start` datetime NOT NULL,
  `scheduling_end` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `warning`
--

INSERT INTO `warning` (`id`, `day_notice`, `title`, `text`, `image`, `active`, `scheduling_start`, `scheduling_end`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2016-09-01', 'O que é Lorem Ipsum?', 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'img_57f7dce1ef773.jpg', 1, '2016-10-01 00:00:00', '2016-10-31 00:00:00', '2016-09-26 11:58:19', '2016-10-07 14:35:30', NULL),
(2, '2016-11-01', 'Teste Norberto', 'Olá!\r\n\r\nNossa empresa conta com mais um novo Parceiro Corporativo, a FIA – FUNDAÇÃO INSTITUTO DE ADMINISTRAÇÃO.\r\n\r\nE o melhor, agora a FIA tem uma nova unidade na cidade de Campinas.\r\n\r\nBEIERSDORF e FIA, estimulando ainda mais o seu desenvolvimento!', 'img_5818a54c2e846.png', 0, '2016-11-01 00:00:00', '2016-11-01 00:00:00', '2016-11-01 12:23:09', '2016-11-01 12:23:09', NULL),
(3, '2017-07-26', 'AUDIOMETRIAS 2017', 'Colaboradores, as audiometrias serão dia 24/02/2017 (sexta-feira.)\r\nPrimeiro turno: das 06:30h às 08:30h\r\nSegundo turno: das 13:30h às 15:30h', 'img_5890cba0453a0.jpg', 1, '2017-08-01 00:00:00', '2017-08-31 00:00:00', '2017-01-20 17:11:01', '2017-08-29 14:49:56', NULL),
(4, '2017-08-29', 'Dream Big!', 'Você esta Preparado?', 'img_5899be78aa67d.jpg', 1, '2017-08-01 00:00:00', '2017-08-31 00:00:00', '2017-02-07 10:32:57', '2017-08-29 14:47:30', NULL),
(5, '2017-06-06', 'Teste caracteres', 'O Jornal Estadão realiza anualmente o estudo chamado Marcas Mais. Com o objetivo de identificar as marcas que apresentam o melhor nível de envolvimento com seus consumidores, são realizados milhares de entrevistas em todo o território nacional. O estudo teve cobertura nacional, sendo a análise gerada a partir de um banco de dados, fruto de 11.500 entrevistas realizadas por método online com brasileiros de todo o País. Essa amostra pertence às classes sociais A, B e C do Critério Brasil, com homens e mulheres de diversas faixas etárias. \r\n\r\nNesse ano, no seguimento de Cosméticos, NIVEA foi destaque nas regiões Sul,  Norte e Centro-Oeste. Confira:\r\n\r\nSÃO PAULO\r\n\r\n1.      O Boticário  \r\n\r\n2.      Natura  \r\n\r\n3.      Mary Kay \r\n\r\n \r\n\r\nSUDESTE - EXCETO SP\r\n\r\n1.      Natura/O Boticário  \r\n\r\n2.      Mary Kay  \r\n\r\n3.      L\'Oréal \r\n\r\n \r\n\r\nSUL\r\n\r\n1.      O Boticário  \r\n\r\n2.      Natura  \r\n\r\n3.      NIVEA \r\n\r\n \r\n\r\nNORDESTE\r\n\r\n1.      O Boticário  \r\n\r\n2.      Natura  \r\n\r\n3.      Avon \r\n\r\nNORTE E CENTRO-OESTE\r\n\r\n1.      O Boticário  \r\n\r\n2.      Natura  \r\n\r\n3.      NIVEA/L\'Oréal \r\n\r\nO resultado foi bastante significativo para a marca do Grupo Beiersdorf, em um cenário no qual não basta ter apenas bom discurso, mas também apresentar valores e atitudes coerentes com a comunicação das empresas.\r\n\r\nPara mais detalhes sobre o ranking de cosméticos, clique no link:\r\n\r\nhttp://publicacoes.estadao.com.br/marcasmais2017/categorias/cosmeticos/  \r\n\r\nFonte: Estadão - SP', 'img_593703382fb09.jpg', 0, '2017-06-06 00:00:00', '2017-06-06 00:00:00', '2017-06-06 16:32:09', '2017-06-06 16:32:39', NULL),
(6, '2017-08-29', 'Lorem Ipsum é simplesmente uma simulação de t', 'Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica e de impressos, e vem sendo utilizado desde o século XVI, quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos. Lorem Ipsum sobreviveu não só a cinco séculos, como também ao salto para a editoração eletrônica, permanecendo essencialmente inalterado. Se popularizou na década de 60, quando a Letraset lançou decalques contendo passagens de Lorem Ipsum, e mais recentemente quando passou a ser integrado a softwares de editoração eletrônica como Aldus PageMaker.', 'img_5978a9064bb81.jpg', 1, '2017-08-01 00:00:00', '2017-08-31 00:00:00', '2017-07-26 11:36:55', '2017-08-29 14:46:44', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_employee_employee_unit1_idx` (`employee_unit_id`);

--
-- Indexes for table `employee_unit`
--
ALTER TABLE `employee_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `highlights`
--
ALTER TABLE `highlights`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_itinerary_itinerary_route1_idx` (`itinerary_route_id`),
  ADD KEY `fk_itinerary_itinerary_city1_idx` (`itinerary_city_id`);

--
-- Indexes for table `itinerary_city`
--
ALTER TABLE `itinerary_city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itinerary_route`
--
ALTER TABLE `itinerary_route`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_57698A6AB8C2FD88` (`roleId`),
  ADD KEY `IDX_57698A6A727ACA70` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`);

--
-- Indexes for table `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `IDX_51498A8EA76ED395` (`user_id`),
  ADD KEY `IDX_51498A8ED60322AC` (`role_id`);

--
-- Indexes for table `warning`
--
ALTER TABLE `warning`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=575;
--
-- AUTO_INCREMENT for table `employee_unit`
--
ALTER TABLE `employee_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `highlights`
--
ALTER TABLE `highlights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `itinerary`
--
ALTER TABLE `itinerary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `itinerary_city`
--
ALTER TABLE `itinerary_city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `itinerary_route`
--
ALTER TABLE `itinerary_route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `warning`
--
ALTER TABLE `warning`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `fk_employee_employee_unit1` FOREIGN KEY (`employee_unit_id`) REFERENCES `employee_unit` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `itinerary`
--
ALTER TABLE `itinerary`
  ADD CONSTRAINT `fk_itinerary_itinerary_city1` FOREIGN KEY (`itinerary_city_id`) REFERENCES `itinerary_city` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_itinerary_itinerary_route1` FOREIGN KEY (`itinerary_route_id`) REFERENCES `itinerary_route` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `role`
--
ALTER TABLE `role`
  ADD CONSTRAINT `FK_57698A6A727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `role` (`id`);

--
-- Limitadores para a tabela `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK_51498A8EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_51498A8ED60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
