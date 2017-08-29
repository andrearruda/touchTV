-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 09-Jun-2016 às 16:06
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
-- Extraindo dados da tabela `employee_unit`
--

INSERT INTO `employee_unit` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'São Paulo', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(3, 'N/A', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);

--
-- Extraindo dados da tabela `itinerary_city`
--

INSERT INTO `itinerary_city` (`id`, `name`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jundiaí', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(2, 'Itatiba', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(3, 'Campinas', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL),
(4, 'Valinhos', 1, '2016-06-08 08:30:00', '2016-06-08 08:30:00', NULL);

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

--
-- Extraindo dados da tabela `role`
--

INSERT INTO `role` (`id`, `parent_id`, `roleId`) VALUES
(1, NULL, 'guest'),
(2, 1, 'user');

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `displayName`, `password`, `state`) VALUES
(1, NULL, 'nivea@farolsign.com.br', 'Nivea', '$2y$14$ruuhGHHaSXpnYFKCN1R/.ea3tcq324AazvwbrizkJu9.ERb.KcQbS', 1),
(2, NULL, 'farol@farolsign.com.br', 'Farol Sign', '$2y$14$UjdJrSHnRs5UW.KL1cV6XeVUJUZWm1OHbKT/eH8Z9e6JyYAjOe.He', 1);

--
-- Extraindo dados da tabela `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `role_id`) VALUES
(1, 2),
(2, 2);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
