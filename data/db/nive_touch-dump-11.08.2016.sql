-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.9 - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.3.0.5109
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando dados para a tabela nivea_touch.activity: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.article: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
/*!40000 ALTER TABLE `article` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.employee: ~182 rows (aproximadamente)
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` (`id`, `employee_unit_id`, `name`, `department`, `born_at`, `image`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 3, 'Andrea Nitrini', 'Vendas', '2016-06-01', 'img_5750774fadb6a.jpg', 1, '2016-06-02 15:12:40', '2016-06-02 15:13:52', NULL),
	(2, 3, 'Guilherme Pinheiro', 'Filling & Packing', '2016-06-01', 'img_575077ba126dc.jpg', 1, '2016-06-02 15:15:22', '2016-06-02 15:15:26', NULL),
	(3, 3, 'Sidneia Ribeiro', 'Filling Management', '2016-06-01', 'img_5750781c5f38a.jpg', 1, '2016-06-02 15:17:00', '2016-06-02 15:17:03', NULL),
	(4, 3, 'Hildalete Sousa', 'Filling & Packing', '2016-06-03', 'img_5750787b43dba.jpg', 1, '2016-06-02 15:18:35', '2016-06-02 15:18:39', NULL),
	(5, 3, 'Rodrigo Moreira', 'Vendas', '2016-06-02', 'img_575078ecc090e.jpg', 1, '2016-06-02 15:20:28', '2016-06-02 15:20:33', NULL),
	(6, 3, 'Aline Motta', 'Anl. Logistica PL', '2016-06-04', 'img_575079b46bd3e.jpg', 1, '2016-06-02 15:23:48', '2016-06-02 15:23:51', NULL),
	(7, 3, 'Marcelo Zuchetto', 'Filling & Packing', '2016-06-04', 'img_57507a12eb466.jpg', 1, '2016-06-02 15:25:23', '2016-06-02 15:25:26', NULL),
	(8, 3, 'Rosemeri Matias', 'Vendas', '2016-06-04', 'img_57507a5810417.jpg', 1, '2016-06-02 15:26:32', '2016-06-02 15:26:35', NULL),
	(9, 3, 'Fernando Ferroni', 'Controladoria', '2016-06-04', 'img_57507c44d200a.jpg', 1, '2016-06-02 15:34:44', '2016-06-02 15:34:49', NULL),
	(10, 3, 'Heliana Guilherme', 'Diretoria Financeira', '2016-06-04', 'img_57507ca35f054.jpg', 1, '2016-06-02 15:36:19', '2016-06-02 15:36:23', NULL),
	(11, 3, 'Soraya Barros', 'Qualidade', '2016-06-07', 'img_57507d00a0010.jpg', 1, '2016-06-02 15:37:52', '2016-06-02 15:56:09', NULL),
	(12, 3, 'Ricardo Carvalho', 'Vendas', '2016-06-07', 'img_57507d86b547c.jpg', 1, '2016-06-02 15:40:06', '2016-06-02 15:40:10', NULL),
	(13, 3, 'João Franceschetto', 'Vendas', '2016-06-07', 'img_57507dd13d818.jpg', 1, '2016-06-02 15:41:21', '2016-06-02 15:41:25', NULL),
	(14, 3, 'Francisco Pereira', 'Vendas', '2016-06-07', 'img_57507e229ca91.jpg', 1, '2016-06-02 15:42:42', '2016-06-02 15:42:46', NULL),
	(15, 3, 'Ana Paula Alves', 'Trade Marketing', '2016-06-08', 'img_57507e67cfb63.jpg', 1, '2016-06-02 15:43:51', '2016-06-02 15:43:58', NULL),
	(16, 3, 'Viviane Contar', 'Mkt Direction', '2016-04-02', 'img_57508baec3b9b.jpg', 1, '2016-06-02 16:40:30', '2016-06-02 16:40:37', NULL),
	(17, 3, 'Luiz Caram', 'Controladoria', '2016-04-04', 'img_57508c1be06db.jpg', 1, '2016-06-02 16:42:20', '2016-06-02 16:42:24', NULL),
	(18, 3, 'Ana Paula Pelegrini', 'Indireto Atacado Farma', '2016-04-04', 'img_57508c8c19b80.jpg', 1, '2016-06-02 16:44:12', '2016-06-02 16:44:15', NULL),
	(19, 3, 'Nathalia Weber', 'Marketing', '2016-06-09', 'img_57585aa4335c0.jpg', 1, '2016-06-08 14:49:24', '2016-06-08 14:54:46', NULL),
	(20, 3, 'Lucas Ortega', 'Comunicação', '2016-06-09', 'img_57585b1e5b25e.jpg', 1, '2016-06-08 14:51:26', '2016-06-08 14:54:45', NULL),
	(21, 3, 'Jeffer Anthony', 'Controladoria', '2016-06-11', 'img_57585bd58f559.jpg', 1, '2016-06-08 14:54:29', '2016-06-08 14:54:43', NULL),
	(22, 3, 'Gabriel Nucci', 'Vendas', '2016-06-12', 'img_57585ca287b35.jpg', 1, '2016-06-08 14:57:54', '2016-06-08 14:57:58', NULL),
	(23, 3, 'Giseli Oliveira', 'Planejamento De Materiais', '2016-06-13', 'img_57585d316a0a4.jpg', 1, '2016-06-08 15:00:17', '2016-06-08 15:00:21', NULL),
	(24, 3, 'Paula Mazzini', 'Planejamento De Materiais', '2016-06-13', 'img_57585e10c3627.jpg', 1, '2016-06-08 15:04:00', '2016-06-08 15:04:07', NULL),
	(25, 3, 'Vivian Louise', 'Marketing', '2016-06-14', 'img_57585ecfbcbae.jpg', 1, '2016-06-08 15:07:11', '2016-06-08 15:07:18', NULL),
	(26, 3, 'Mariana Brancatte', 'Controles Internos', '2016-06-14', 'img_57585f94dc75b.jpg', 1, '2016-06-08 15:10:28', '2016-06-08 15:16:39', NULL),
	(27, 3, 'Flavio Cunha', 'Vendas', '2016-06-14', 'img_575860127b98a.jpg', 1, '2016-06-08 15:12:34', '2016-06-08 15:12:38', NULL),
	(28, 3, 'Lilian Hossoi', 'Tecnologia Da Informação', '2016-06-15', 'img_575860e108809.jpg', 1, '2016-06-08 15:16:01', '2016-06-08 15:16:37', NULL),
	(29, 3, 'Julio Abrunhosa', 'Vendas', '2016-06-16', 'img_575862915b8f8.jpg', 1, '2016-06-08 15:23:13', '2016-06-08 15:23:19', NULL),
	(30, 3, 'Celso Oliveira', 'Compounding', '2016-06-16', 'img_57596106eae96.jpg', 1, '2016-06-09 09:28:55', '2016-06-09 09:29:01', NULL),
	(31, 3, 'Priscilla Cardoso', 'Marketing', '2016-06-17', 'img_575acb3d5d0b0.jpg', 1, '2016-06-10 11:14:21', '2016-06-10 11:42:57', NULL),
	(32, 3, 'Lilian Silva', 'Vendas', '2016-06-19', 'img_575acba7ae7a8.jpg', 1, '2016-06-10 11:16:07', '2016-06-10 11:42:51', NULL),
	(33, 3, 'Marjorie Oliveira', 'Trade Marketing', '2016-06-19', 'img_575acc2170677.jpg', 1, '2016-06-10 11:18:09', '2016-06-10 11:42:55', NULL),
	(34, 3, 'Julio Boiarenco', 'Vendas', '2016-06-21', 'img_575acc8238339.jpg', 1, '2016-06-10 11:19:46', '2016-06-10 11:42:49', NULL),
	(35, 3, 'Marilia Campolino', 'Vendas', '2016-06-23', 'img_575acccf4e4c4.jpg', 1, '2016-06-10 11:21:03', '2016-06-10 11:42:54', NULL),
	(36, 3, 'Helena Camargo', 'Marketing', '2016-06-23', 'img_575acd286b60a.jpg', 1, '2016-06-10 11:22:32', '2016-06-10 11:42:44', NULL),
	(37, 3, 'Paula Campos', 'Fiscal', '2016-06-23', 'img_575acd70866e8.jpg', 1, '2016-06-10 11:23:44', '2016-06-10 11:42:56', NULL),
	(38, 3, 'Nathalie Metzler', 'Marketing', '2016-06-24', 'img_575acdae42761.jpg', 1, '2016-06-10 11:24:46', '2016-06-10 11:42:55', NULL),
	(39, 3, 'Rodrigo Burgos', 'Vendas', '2016-06-24', 'img_575acdf62cbd5.jpg', 1, '2016-06-10 11:25:58', '2016-06-10 11:43:00', NULL),
	(40, 3, 'Augusto Cesar Da Silva', 'Vendas', '2016-06-24', 'img_575ace35b71c0.jpg', 1, '2016-06-10 11:27:01', '2016-06-10 11:42:41', NULL),
	(41, 3, 'Liege Slomp', 'Vendas', '2016-06-24', 'img_575ace9eeade2.jpg', 1, '2016-06-10 11:28:47', '2016-06-10 11:42:50', NULL),
	(42, 3, 'Juliana Sbrussi', 'Qualidade', '2016-06-25', 'img_575acf119428f.jpg', 1, '2016-06-10 11:30:41', '2016-06-10 11:42:49', NULL),
	(43, 3, 'Andreia Melo', 'Tesouraria', '2016-06-27', 'img_575acf5017ad5.jpg', 1, '2016-06-10 11:31:44', '2016-06-10 11:42:41', NULL),
	(44, 3, 'Thiago Bilges', 'Vendas', '2016-06-27', 'img_575acf9716be1.jpg', 1, '2016-06-10 11:32:55', '2016-06-10 11:43:01', NULL),
	(45, 3, 'Joelma Bufalo', 'Filling & Packing', '2016-06-28', 'img_575ad04b62b27.jpg', 1, '2016-06-10 11:35:55', '2016-06-10 11:42:45', NULL),
	(46, 3, 'Manoel Crisostomo', 'Filling & Packing', '2016-06-28', 'img_575ad0906df76.jpg', 1, '2016-06-10 11:37:04', '2016-06-10 11:42:51', NULL),
	(47, 3, 'Vagner Cunha', 'Compras', '2016-06-28', 'img_575ad0e2904a5.jpg', 1, '2016-06-10 11:38:26', '2016-06-10 11:43:01', NULL),
	(48, 3, 'Pedro Silva', 'Customer Service', '2016-06-29', 'img_575ad11f77c36.jpg', 1, '2016-06-10 11:39:27', '2016-06-10 11:42:57', NULL),
	(49, 3, 'Juliana Omizu', 'Marketing', '2016-06-30', 'img_575ad165a7d8a.jpg', 1, '2016-06-10 11:40:37', '2016-06-10 11:42:49', NULL),
	(50, 3, 'Denise Oliveira', 'Recursos Humanos', '2016-06-30', 'img_575ad1d5a422e.jpg', 1, '2016-06-10 11:42:29', '2016-06-10 11:42:42', NULL),
	(51, 3, 'Viviane Contar', 'MKT Direction', '2016-04-02', 'img_575af7131093a.jpg', 1, '2016-06-10 14:21:23', '2016-06-10 15:14:57', NULL),
	(52, 3, 'Luiz Caram', 'Controladoria', '2016-04-04', 'img_575af7722640b.jpg', 1, '2016-06-10 14:22:58', '2016-06-10 15:14:37', NULL),
	(53, 3, 'Ana Paula Pelegrin', 'Indireto Atacado Farma', '2016-04-04', 'img_575af7d4dd2cf.jpg', 1, '2016-06-10 14:24:36', '2016-06-10 15:14:20', NULL),
	(54, 3, 'Rodolfo Rigoni', 'Indireto Leste', '2016-04-04', 'img_575af81bad164.jpg', 1, '2016-06-10 14:25:47', '2016-06-10 15:14:48', NULL),
	(55, 3, 'Ramon Gil', 'Qualidade', '2016-04-05', 'img_575af858508ce.jpg', 1, '2016-06-10 14:26:48', '2016-06-10 15:14:47', NULL),
	(56, 3, 'Vinicius Cardoso', 'Customer Service Nivea', '2016-04-05', 'img_575af8a033d68.jpg', 1, '2016-06-10 14:28:00', '2016-06-10 15:14:54', NULL),
	(57, 3, 'Bryanne Calandrello', 'Recursos Humanos', '2016-04-07', 'img_575af8eb1a879.jpg', 1, '2016-06-10 14:29:15', '2016-06-10 15:14:24', NULL),
	(58, 3, 'Bruno Ogata', 'Continuos Improvement', '2016-04-07', 'img_575af92bb205b.jpg', 1, '2016-06-10 14:30:19', '2016-06-10 15:14:23', NULL),
	(59, 3, 'Vinicius Piccoli', 'EUC_Demand', '2016-04-07', 'img_575af9950610e.jpg', 1, '2016-06-10 14:32:05', '2016-06-10 15:14:57', NULL),
	(60, 3, 'Julia Bueno', 'MKT Deo', '2016-04-08', 'img_575af9e5578a6.jpg', 1, '2016-06-10 14:33:25', '2016-06-10 15:14:34', NULL),
	(61, 3, 'Juliana Santos', 'Supply DC Regional', '2016-04-08', 'img_575afa2eba9d5.jpg', 1, '2016-06-10 14:34:38', '2016-06-10 15:14:33', NULL),
	(62, 3, 'Michelle Guersoni', 'Recursos Humanos', '2016-04-08', 'img_575afa79259b5.jpg', 1, '2016-06-10 14:35:53', '2016-06-10 15:14:43', NULL),
	(63, 3, 'Andrea Almeida', 'MKT Skin Care', '2016-04-09', 'img_575afac0e6804.jpg', 1, '2016-06-10 14:37:04', '2016-06-10 15:14:21', NULL),
	(64, 3, 'Fernanda Kalil', 'Shopper & Customer', '2016-04-09', 'img_575afb30323b4.jpg', 1, '2016-06-10 14:38:56', '2016-06-10 15:14:25', NULL),
	(65, 3, 'Willian Castro', 'Filling & Packing', '2016-04-10', 'img_575afb7219128.jpg', 1, '2016-06-10 14:40:02', '2016-06-10 15:14:59', NULL),
	(66, 3, 'Jonny Rodrigues', 'Filling & Packing', '2016-04-12', 'img_575afbd491a5e.jpg', 1, '2016-06-10 14:41:40', '2016-06-10 15:14:29', NULL),
	(67, 3, 'Victor Almeida', 'Nordeste II', '2016-04-14', 'img_575afc4c25d5a.jpg', 1, '2016-06-10 14:43:40', '2016-06-10 15:14:53', NULL),
	(68, 3, 'Maisa Nascimento', 'EUC_Demand', '2016-04-14', 'img_575afc83d83ca.jpg', 1, '2016-06-10 14:44:35', '2016-06-10 15:14:38', NULL),
	(69, 3, 'Vanessa Garci', 'Quality DC', '2016-04-14', 'img_575afcc71278f.jpg', 1, '2016-06-10 14:45:43', '2016-06-10 15:14:52', NULL),
	(70, 3, 'Mariana Ferreira', 'Clientes Regionais', '2016-04-15', 'img_575afd09171d5.jpg', 1, '2016-06-10 14:46:49', '2016-06-10 15:14:42', NULL),
	(71, 3, 'Juliana Rossi', 'Shopper & Customer - PDV', '2016-04-16', 'img_575afd55b7b6c.jpg', 1, '2016-06-10 14:48:05', '2016-06-10 15:14:33', NULL),
	(72, 3, 'Leticia Guiti', 'Shopper & Customer - Canal Indireto', '2016-04-17', 'img_575afda67627a.jpg', 1, '2016-06-10 14:49:26', '2016-06-10 15:14:32', NULL),
	(73, 3, 'Lauriane Barros', 'EUC_Demand', '2016-04-17', 'img_575afe135bb58.jpg', 1, '2016-06-10 14:51:15', '2016-06-10 15:14:32', NULL),
	(74, 3, 'Elaine Ribeiro', 'Filling & Packing', '2016-04-18', 'img_575afe8bbb295.jpg', 1, '2016-06-10 14:53:15', '2016-06-10 15:14:26', NULL),
	(75, 3, 'Sergio Vano', 'Shopper & Customer - Canal Indireto', '2016-04-18', 'img_575afed439c45.jpg', 1, '2016-06-10 14:54:28', '2016-06-10 15:14:50', NULL),
	(76, 3, 'Siloel Souza', 'Clientes Regionais SP', '2016-04-18', 'img_575aff4e27e5d.jpg', 1, '2016-06-10 14:56:30', '2016-06-10 15:14:51', NULL),
	(77, 3, 'William Barbosa', 'Indireto Leste', '2016-04-19', 'img_575b00544c09e.jpg', 1, '2016-06-10 15:00:52', '2016-06-10 15:14:58', NULL),
	(78, 3, 'Paulo Frazão', 'Clientes Regionais Sul', '2016-04-20', 'img_575b00c5c17f9.jpg', 1, '2016-06-10 15:02:45', '2016-06-10 15:14:46', NULL),
	(79, 3, 'Ana Batista', 'Recursos Humanos', '2016-04-21', 'img_575b0117074ff.jpg', 1, '2016-06-10 15:04:07', '2016-06-10 15:14:19', NULL),
	(80, 3, 'Marcela Trausola', 'Fiscal PC', '2016-06-23', 'img_575b01795ff8a.jpg', 1, '2016-06-10 15:05:45', '2016-06-10 15:14:38', NULL),
	(81, 3, 'Patricia Rocha', 'Compouding', '2016-04-28', 'img_575b01cd16e7f.jpg', 1, '2016-06-10 15:07:09', '2016-06-10 15:14:43', NULL),
	(82, 3, 'Luiza Iasi', 'Shopper & Customer - Intelligence', '2016-06-29', 'img_575b0224779be.jpg', 1, '2016-06-10 15:08:36', '2016-06-10 15:14:37', NULL),
	(83, 3, 'Alfio Mazzini', 'Technical Management', '2016-04-29', 'img_575b027c2cb92.jpg', 1, '2016-06-10 15:10:04', '2016-06-10 15:14:18', NULL),
	(84, 3, 'Maria Santos', 'Filling & Packing', '2016-04-29', 'img_575b02ccccfcf.jpg', 1, '2016-06-10 15:11:24', '2016-06-10 15:14:41', NULL),
	(85, 3, 'Camila Almeida', 'Controladoria', '2016-04-30', 'img_575b031741611.jpg', 1, '2016-06-10 15:12:39', '2016-06-10 15:14:24', NULL),
	(86, 3, 'Tatiana Pedroso', 'Planejamento de Materiais - PCP', '2016-04-30', 'img_575b037596129.jpg', 1, '2016-06-10 15:14:13', '2016-06-10 15:14:52', NULL),
	(87, 3, 'Rafhael Tavarayama', 'Supply Chain', '2016-01-01', 'img_575eae3c5703c.jpg', 1, '2016-06-13 09:59:40', '2016-06-13 11:30:11', NULL),
	(88, 3, 'Carlos Pereira', 'Administração Financeira', '2016-01-02', 'img_575eae5dd697e.jpg', 1, '2016-06-13 10:00:13', '2016-06-13 11:29:34', NULL),
	(89, 3, 'Carolina Rodrigues', 'Supply Chain', '2016-01-05', 'img_575eaea9ae73e.jpg', 1, '2016-06-13 10:01:29', '2016-06-13 11:29:33', NULL),
	(90, 3, 'Ligia Annunziato', 'Marketing', '2016-01-06', 'img_575eaeff4d315.jpg', 1, '2016-06-13 10:02:55', '2016-06-13 11:29:52', NULL),
	(91, 3, 'Eliciane Teles', 'Filling & Packing', '2016-01-06', 'img_575eaf51ebfe6.jpg', 1, '2016-06-13 10:04:18', '2016-06-13 11:29:40', NULL),
	(92, 3, 'Eder Ribeiro', 'Supply Chain', '2016-01-08', 'img_575eaf9964f7d.jpg', 1, '2016-06-13 10:05:29', '2016-06-13 11:29:39', NULL),
	(93, 3, 'Guilherme Bissaco', 'Compounding', '2016-01-10', 'img_575eb1f0e2ee4.jpg', 1, '2016-06-13 10:15:28', '2016-06-13 11:29:46', NULL),
	(94, 3, 'Camila Saturnino', 'Fiscal', '2016-01-11', 'img_575eb239a90a6.jpg', 1, '2016-06-13 10:16:41', '2016-06-13 11:29:32', NULL),
	(95, 3, 'Diogo Fabres', 'Vendas', '2016-01-13', 'img_575eb2cca0cf5.jpg', 1, '2016-06-13 10:19:08', '2016-06-13 11:29:39', NULL),
	(96, 3, 'Isabela Cerqueira', 'Planejamento de Materiais - PCP', '2016-01-14', 'img_575eb926eb7f3.jpg', 1, '2016-06-13 10:46:15', '2016-06-13 11:29:49', NULL),
	(97, 3, 'Alexandre John', 'Shopper & Customer', '2016-01-15', 'img_575eb96bb428f.jpg', 1, '2016-06-13 10:47:23', '2016-06-13 11:29:02', NULL),
	(98, 3, 'Gabriel Pereira', 'Vendas', '2016-01-15', 'img_575eb9b669353.jpg', 1, '2016-06-13 10:48:38', '2016-06-13 11:29:44', NULL),
	(99, 3, 'Daniela Melo', 'Tesouraria', '2016-01-15', 'img_575eb9fe82122.jpg', 1, '2016-06-13 10:49:50', '2016-06-13 11:29:38', NULL),
	(100, 3, 'Maria Amelia Lauriano', 'Farma Sudeste', '2016-01-17', 'img_575eba6b951df.jpg', 1, '2016-06-13 10:51:39', '2016-06-13 11:30:03', NULL),
	(101, 3, 'Gisele Fola', 'Logistics DC Jundiai', '2016-01-20', 'img_575ebac8a445c.jpg', 1, '2016-06-13 10:53:12', '2016-06-13 11:29:45', NULL),
	(102, 3, 'Marcia Brum', 'Vendas', '2016-01-20', 'img_575ebdc27a33e.jpg', 1, '2016-06-13 11:05:54', '2016-06-13 11:30:00', NULL),
	(103, 3, 'Mariane Perassolo', 'Contabilidade', '2016-01-21', 'img_575ebe5248b67.jpg', 1, '2016-06-13 11:08:18', '2016-06-13 11:30:04', NULL),
	(104, 3, 'Luana Pereira', 'Fiscal', '2015-01-23', 'img_575ebeb3b99f1.jpg', 1, '2016-06-13 11:09:55', '2016-06-13 11:29:52', NULL),
	(105, 3, 'Lucas Moreira', 'Controladoria', '2016-01-23', 'img_575ebf162ccb7.jpg', 1, '2016-06-13 11:11:34', '2016-06-13 11:29:59', NULL),
	(106, 3, 'Mayra Dietzold', 'Marketing', '2016-01-24', 'img_575ebf7dd0309.jpg', 1, '2016-06-13 11:13:17', '2016-06-13 11:30:05', NULL),
	(107, 3, 'Christian Furigato', 'Engenharia', '2016-01-24', 'img_575ebfdf24274.jpg', 1, '2016-06-13 11:14:55', '2016-06-13 11:29:34', NULL),
	(108, 3, 'Daniela Mendes', 'Administração Financeira', '2016-01-27', 'img_575ec0459f54d.jpg', 1, '2016-06-13 11:16:37', '2016-06-13 11:29:38', NULL),
	(109, 3, 'Carla Macedo', 'Vendas', '2016-01-27', 'img_575ec090b19ba.jpg', 1, '2016-06-13 11:17:52', '2016-06-13 11:29:32', NULL),
	(110, 3, 'Claudia Silva', 'Administração de Vendas', '2016-01-28', 'img_575ec0dab9ec2.jpg', 1, '2016-06-13 11:19:06', '2016-06-13 11:29:37', NULL),
	(111, 3, 'Natalia Paixão', 'Vendas', '2016-01-29', 'img_575ec11d9f57c.jpg', 1, '2016-06-13 11:20:13', '2016-06-13 11:30:08', NULL),
	(112, 3, 'Michelle Texeira', 'Compras', '2016-01-29', 'img_575ec181a458e.jpg', 1, '2016-06-13 11:21:53', '2016-06-13 11:30:05', NULL),
	(113, 3, 'Nathalia Torres', 'Compras', '2016-01-31', 'img_575ec1daa4790.jpg', 1, '2016-06-13 11:23:22', '2016-06-13 11:30:09', NULL),
	(114, 3, 'Wilson Humberto', 'Logistics DC Jundiai', '2016-01-31', 'img_575ec3286f6db.jpg', 1, '2016-06-13 11:28:56', '2016-06-13 11:30:22', NULL),
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
	(193, 3, 'Julia Morelli', 'Marketing', '2016-08-30', 'img_579b8ea48d5c9.jpg', 1, '2016-07-29 14:13:08', '2016-07-29 14:13:53', NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.employee_unit: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `employee_unit` DISABLE KEYS */;
INSERT INTO `employee_unit` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'São Paulo', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
	(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
	(3, 'N/A', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);
/*!40000 ALTER TABLE `employee_unit` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.highlights: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `highlights` DISABLE KEYS */;
/*!40000 ALTER TABLE `highlights` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.itinerary: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerary` DISABLE KEYS */;
/*!40000 ALTER TABLE `itinerary` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.itinerary_city: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerary_city` DISABLE KEYS */;
INSERT INTO `itinerary_city` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Jundiaí', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
	(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
	(3, 'Campinas', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
	(4, 'Valinhos', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);
/*!40000 ALTER TABLE `itinerary_city` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.itinerary_route: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `itinerary_route` DISABLE KEYS */;
INSERT INTO `itinerary_route` (`id`, `name`, `trajectory`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'Turno 1', 'Itatiba/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
	(2, 'Turno 1', 'Jundiaí/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
	(3, 'Turno 2', 'Itatiba/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
	(4, 'Turno 2', 'Jundiaí/Itatiba', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
	(5, 'ADM', 'Campinas/Valinhos', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL),
	(6, 'ADM', 'Itatiba/Jundiaí', '2016-06-01 16:50:00', '2016-06-01 16:50:00', NULL);
/*!40000 ALTER TABLE `itinerary_route` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.role: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`id`, `parent_id`, `roleId`) VALUES
	(1, NULL, 'guest'),
	(2, 1, 'user');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.users: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `displayName`, `password`, `state`) VALUES
	(1, NULL, 'nivea@farolsign.com.br', 'Nivea', '$2y$14$ruuhGHHaSXpnYFKCN1R/.ea3tcq324AazvwbrizkJu9.ERb.KcQbS', 1),
	(2, NULL, 'farol@farolsign.com.br', 'Farol Sign', '$2y$14$UjdJrSHnRs5UW.KL1cV6XeVUJUZWm1OHbKT/eH8Z9e6JyYAjOe.He', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.users_roles: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
	(1, 2),
	(2, 2);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;

-- Copiando dados para a tabela nivea_touch.warning: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `warning` DISABLE KEYS */;
/*!40000 ALTER TABLE `warning` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
