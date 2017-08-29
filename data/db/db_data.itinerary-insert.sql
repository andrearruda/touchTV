-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09-Jun-2016 às 16:39
-- Versão do servidor: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `nivea_touch`
--

--
-- Extraindo dados da tabela `itinerary`
--

INSERT INTO `itinerary` (`id`, `itinerary_route_id`, `itinerary_city_id`, `schedule`, `stop`, `reference`, `neighborhood`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, 1, '07:10', 'Av. Jundiaí', 'Restaurante Burgues', 'Anhangabau', 1, '2016-06-09 11:36:22', '2016-06-09 11:48:21', NULL),
(2, 6, 1, '07:15', 'Av. Petrolina Antunes', 'Estacionamento Santiago', 'N/A', 1, '2016-06-09 11:43:14', '2016-06-09 11:48:20', NULL),
(3, 6, 1, '07:20', 'Av. Itatiba', 'Paróquia Santa Teresinha', 'N/A', 1, '2016-06-09 11:44:09', '2016-06-09 11:48:19', NULL),
(4, 6, 1, '07:22', 'Rod. Const. Cintra', 'Pto Onibus Passarela Jund', 'N/A', 1, '2016-06-09 11:48:10', '2016-06-09 11:48:18', NULL),
(5, 6, 1, '07:30', 'Rod. Const. Cintra', 'Ponto de Onibus Venda Nov', 'N/A', 1, '2016-06-09 11:52:11', '2016-06-09 11:52:20', NULL),
(6, 6, 2, '07:45', 'Av. Mal. Castelo Branco', 'Extra', 'N/A', 1, '2016-06-09 11:52:54', '2016-06-09 11:53:09', NULL),
(7, 6, 2, '07:45', 'Marginal Mercadão', 'Pto. Onibus', 'N/A', 1, '2016-06-09 11:54:03', '2016-06-09 11:54:06', NULL),
(8, 6, 2, '07:50', 'R. Comendador Franco', 'Terminal de Ônibus', 'Centro', 1, '2016-06-09 12:56:04', '2016-06-09 12:57:44', NULL),
(9, 6, 2, '07:52', 'R. Barão de Itapema', 'Pto ônibus em frente ao S', 'Centro', 1, '2016-06-09 12:57:21', '2016-06-09 12:57:45', NULL),
(10, 6, 2, '07:54', 'Av: Pedro Mascani   - Pos', 'Pto. Ônibus', 'N/A', 1, '2016-06-09 12:58:21', '2016-06-09 12:58:26', NULL),
(11, 6, 2, '07:54', 'Av. Pedro Mascani', 'Ponto Drogaria do Marcelo', 'N/A', 1, '2016-06-09 12:58:49', '2016-06-09 12:58:52', NULL),
(12, 6, 2, '07:55', 'Av: Pedro Mascani   - Pur', 'Pto. Ônibus', 'N/A', 1, '2016-06-09 12:59:25', '2016-06-09 12:59:33', NULL),
(13, 6, 2, '07:55', 'Av. Pedro Mascani', 'Terminal Jofege / portela', 'N/A', 1, '2016-06-09 12:59:51', '2016-06-09 12:59:59', NULL),
(14, 6, 2, '08:00', 'Rodovia Luciano Consoline', '(após radar)', 'N/A', 1, '2016-06-09 13:00:20', '2016-06-09 13:00:24', NULL),
(15, 6, 2, '08:05', 'Rodovia Dom Pedro I', 'Pto Onibus frente Cachoei', 'N/A', 1, '2016-06-09 13:00:43', '2016-06-09 13:01:01', NULL),
(16, 6, 2, '08:10', 'BDF - em seguida retorna ', 'N/A', 'N/A', 1, '2016-06-09 13:01:19', '2016-06-09 13:01:22', NULL),
(17, 6, 2, '08:35', 'R. Luis Scavone', 'Garagem ITT', 'Centro', 1, '2016-06-09 13:01:44', '2016-06-09 13:01:48', NULL),
(18, 6, 2, '16:45', 'R. Luis Scavone', 'Garagem ITT', 'Centro', 1, '2016-06-09 13:03:05', '2016-06-09 13:03:09', NULL),
(19, 6, 2, '17:20', 'Chegada BDF', 'N/A', 'N/A', 1, '2016-06-09 13:03:30', '2016-06-09 13:03:34', NULL),
(20, 6, 2, '17:35', 'Saída BDF', 'N/A', 'N/A', 1, '2016-06-09 13:03:56', '2016-06-09 13:04:05', NULL),
(21, 6, 2, '17:40', 'Rod. Do Contorno', 'N/A', 'N/A', 1, '2016-06-09 13:04:25', '2016-06-09 13:04:33', NULL),
(22, 6, 2, '17:41', 'Rodovia Luciano Consoline', '(após radar)', 'N/A', 1, '2016-06-09 13:04:55', '2016-06-09 13:05:06', NULL),
(23, 6, 2, '17:43', 'Av. P. Mascagni / Av. da ', 'Ptos. De ônibus', 'N/A', 1, '2016-06-09 13:06:33', '2016-06-09 13:06:37', NULL),
(24, 6, 2, '17:45', 'Jd. Luca / Av.  29 de Abr', 'Ptos. De ônibus', 'N/A', 1, '2016-06-09 13:06:55', '2016-06-09 13:06:59', NULL),
(25, 6, 2, '17:46', 'Av. Vinte e nove de Abril', 'Em frente Gordinho Lanche', 'N/A', 1, '2016-06-09 13:07:40', '2016-06-09 13:07:44', NULL),
(26, 6, 2, '17:47', 'Av. Mal. Castelo Branco', 'Extra', 'N/A', 1, '2016-06-09 13:08:09', '2016-06-09 13:08:13', NULL),
(27, 6, 2, '17:48', 'R Barão de Itapema', 'Pto de Ônibus em frente a', 'N/A', 1, '2016-06-09 13:08:31', '2016-06-09 13:12:09', NULL),
(28, 6, 2, '17:50', 'Rod Const. Cintra (Frente', 'Ponto de ônibus', 'N/A', 1, '2016-06-09 13:17:43', '2016-06-09 13:23:12', NULL),
(29, 6, 1, '17:52', 'Rod. Const. Cintra', 'Venda Nova', 'N/A', 1, '2016-06-09 13:43:45', '2016-06-09 13:43:49', NULL),
(30, 6, 1, '17:53', 'Rod. Engenheiro Constanci', 'Km 70', 'N/A', 1, '2016-06-09 13:46:07', '2016-06-09 13:46:12', NULL),
(31, 6, 1, '17:55', 'Rod. Const. Cintra', 'Ent. Res.Pq. das Colinas', 'N/A', 1, '2016-06-09 13:46:37', '2016-06-09 13:46:56', NULL),
(32, 6, 1, '17:59', 'Rua Itatiba', 'Pte. Saída p/ Itatiba', 'N/A', 1, '2016-06-09 13:47:14', '2016-06-09 13:47:17', NULL),
(33, 6, 1, '18:10', 'Av Henrique Andrés', 'N/A', 'N/A', 1, '2016-06-09 13:47:42', '2016-06-09 13:47:47', NULL),
(34, 6, 1, '18:20', 'Av Anchieta', '18:20', 'N/A', 1, '2016-06-09 13:48:09', '2016-06-09 13:48:14', NULL),
(35, 6, 1, '18:30', 'Rodoviária Antiga', 'Shopping M', 'N/A', 1, '2016-06-09 13:48:48', '2016-06-09 13:48:51', NULL),
(36, 6, 1, '18:50', 'Av. Jundiaí', 'Restaurante Burgues', 'N/A', 1, '2016-06-09 13:49:27', '2016-06-09 13:49:32', NULL),
(37, 6, 1, '18:50', 'Av. Marginal da Rod. Anha', 'Escola Politécnica', 'N/A', 1, '2016-06-09 13:49:46', '2016-06-09 13:49:49', NULL),
(38, 5, 3, '07:00', 'Av Andrade Neves', 'N/A', 'N/A', 1, '2016-06-09 14:19:29', '2016-06-09 14:19:42', NULL),
(39, 5, 3, '07:00', 'Rua Ricardo (Pto onibus)', 'Frente Estac. Rodoviária', 'Centro', 1, '2016-06-09 14:20:08', '2016-06-09 14:20:12', NULL),
(40, 5, 3, '07:07', 'Rua Dr Mascarenhas', 'N/A', 'Centro', 1, '2016-06-09 14:20:29', '2016-06-09 14:20:32', NULL),
(41, 5, 3, '07:05', 'Rua Sales de Oliveira', 'Pto Onibus Endec   (1º Po', 'N/A', 1, '2016-06-09 14:21:00', '2016-06-09 14:21:04', NULL),
(42, 5, 3, '07:06', 'Av Prudente de Moraes', 'N/A', 'Centro', 1, '2016-06-09 14:21:21', '2016-06-09 14:21:25', NULL),
(43, 5, 3, '07:07', 'Av. Faria Lima', 'Tunel', 'Centro', 1, '2016-06-09 14:21:44', '2016-06-09 14:21:49', NULL),
(44, 5, 3, '07:08', 'Rua Campos Salles', 'N/A', 'Centro', 1, '2016-06-09 14:22:17', '2016-06-09 14:22:21', NULL),
(45, 5, 3, '07:08', 'Rua Euclides Figueiredo', 'N/A', 'Centro', 1, '2016-06-09 14:22:49', '2016-06-09 14:22:53', NULL),
(46, 5, 3, '07:09', 'Rua Onze de Agosto', 'N/A', 'Centro', 1, '2016-06-09 14:23:16', '2016-06-09 14:23:20', NULL),
(47, 5, 3, '07:10', 'R. Lidgerwood', 'Estação Ferroviária', 'Centro', 1, '2016-06-09 14:23:44', '2016-06-09 14:23:48', NULL),
(48, 5, 3, '07:11', 'Av. Expedicionarios', 'N/A', 'Centro', 1, '2016-06-09 14:24:23', '2016-06-09 14:24:27', NULL),
(49, 5, 3, '07:11', 'Av. Pref. Nicolau José Ma', 'N/A', 'Centro', 1, '2016-06-09 14:25:22', '2016-06-09 14:25:27', NULL),
(50, 5, 3, '07:13', 'R. Herique Barcellos', 'N/A', 'Centro', 1, '2016-06-09 14:25:49', '2016-06-09 14:25:54', NULL),
(51, 5, 3, '07:13', 'R. José Paulino', 'N/A', 'Centro', 1, '2016-06-09 14:28:07', '2016-06-09 14:28:11', NULL),
(52, 5, 3, '07:15', 'Av. Aquidabã', 'Pto. Onibus (Hotel Ibis)', 'Centro', 1, '2016-06-09 14:28:30', '2016-06-09 14:28:42', NULL),
(53, 5, 3, '07:20', 'Av. Dr. Moraes Salles', 'Ventura Mall', 'Centro', 1, '2016-06-09 14:29:04', '2016-06-09 14:29:08', NULL),
(54, 5, 4, '07:30', 'Rod D Pedro I', 'N/A', 'Centro', 1, '2016-06-09 14:29:24', '2016-06-09 14:29:41', NULL),
(55, 5, 4, '07:35', 'Rodovia Agricultores', 'N/A', 'Centro', 1, '2016-06-09 14:30:04', '2016-06-09 14:30:35', NULL),
(56, 5, 4, '07:38', 'Rodovia Flavio de Carvalh', 'N/A', 'N/A', 1, '2016-06-09 14:30:32', '2016-06-09 14:30:36', NULL),
(57, 5, 4, '07:40', 'Av. dos Estados', 'Churrascaria Gravetos', 'Centro', 1, '2016-06-09 14:30:54', '2016-06-09 14:31:03', NULL),
(58, 5, 4, '07:45', 'Rod Flávio de Carvalho', 'N/A', 'N/A', 1, '2016-06-09 14:31:21', '2016-06-09 14:31:26', NULL),
(59, 5, 4, '07:50', 'Rod dos Agricultores', 'Rotatoria Saida D. Pedro', 'Centro', 1, '2016-06-09 14:31:48', '2016-06-09 14:31:51', NULL),
(60, 5, 4, '07:55', 'Rod D Pedro I', 'N/A', 'N/A', 1, '2016-06-09 14:32:11', '2016-06-09 14:32:14', NULL),
(61, 5, 2, '08:15', 'Empresa BDF', 'N/A', 'N/A', 1, '2016-06-09 14:32:48', '2016-06-09 14:32:51', NULL),
(62, 5, 2, '16:45', 'R. Luis Scavone', 'Garagem ITT', 'Centro', 1, '2016-06-09 14:37:14', '2016-06-09 14:37:19', NULL),
(63, 5, 2, '17:15', 'Estar na BDF', 'N/A', 'N/A', 1, '2016-06-09 14:37:41', '2016-06-09 14:37:51', NULL),
(64, 5, 2, '17:35', 'Horário de saída', 'Empresa BDF', 'N/A', 1, '2016-06-09 14:38:30', '2016-06-09 14:38:33', NULL),
(65, 5, 4, '17:54', 'Trevo Joaquim Edígio x Va', 'N/A', 'N/A', 1, '2016-06-09 14:39:06', '2016-06-09 14:39:13', NULL),
(66, 5, 3, '18:00', 'Rodoanel Campinas', 'Trevo Valinhos', 'N/A', 1, '2016-06-09 14:39:31', '2016-06-09 14:39:35', NULL),
(67, 5, 3, '18:10', 'Rod. Heitor Penteado', 'N/A', 'N/A', 1, '2016-06-09 14:39:54', '2016-06-09 14:39:58', NULL),
(68, 5, 3, '18:15', 'Av. Dr. Moraes Salles', 'N/A', 'N/A', 1, '2016-06-09 14:40:14', '2016-06-09 14:40:17', NULL),
(69, 5, 3, '18:20', 'Av. Aquidabã', 'Hotel Ibis', 'N/A', 1, '2016-06-09 14:40:44', '2016-06-09 14:40:48', NULL),
(70, 5, 3, '18:30', 'Av. Cel Quirino', 'Laurão', 'Centro', 1, '2016-06-09 14:41:30', '2016-06-09 14:41:34', NULL),
(71, 5, 3, '18:35', 'Via Expressa Waldemar Pas', 'N/A', 'N/A', 1, '2016-06-09 14:41:49', '2016-06-09 14:41:52', NULL),
(72, 5, 3, '18:45', 'R. Antonio Carlos de Tole', 'N/A', 'N/A', 1, '2016-06-09 14:42:14', '2016-06-09 14:42:20', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
