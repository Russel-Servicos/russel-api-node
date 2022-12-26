-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 08-Dez-2022 às 15:42
-- Versão do servidor: 8.0.30
-- versão do PHP: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `russel_ecommerce`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `attachments`
--

CREATE TABLE `attachments` (
  `id` bigint UNSIGNED NOT NULL,
  `file_id` int NOT NULL,
  `table_name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `table_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

CREATE TABLE `categorias` (
  `id` bigint UNSIGNED NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ec_adverts`
--

CREATE TABLE `ec_adverts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` float(15,2) UNSIGNED NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `clicks` int UNSIGNED NOT NULL,
  `stars` int UNSIGNED NOT NULL,
  `status` int UNSIGNED NOT NULL,
  `image` int UNSIGNED DEFAULT NULL,
  `hour_long` int UNSIGNED NOT NULL,
  `category_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ec_categories`
--

CREATE TABLE `ec_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int UNSIGNED NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ec_discounts`
--

CREATE TABLE `ec_discounts` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int UNSIGNED NOT NULL DEFAULT '1',
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `type` int UNSIGNED NOT NULL DEFAULT '1',
  `value` float UNSIGNED NOT NULL,
  `start_value` float UNSIGNED NOT NULL,
  `total` int UNSIGNED NOT NULL,
  `used_total` int UNSIGNED NOT NULL,
  `payload` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `partners`
--

CREATE TABLE `partners` (
  `id` int NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `users_id` int DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `partners_products`
--

CREATE TABLE `partners_products` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `barcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_order` int DEFAULT '0',
  `product_show` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `product_new` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `promotional_price` float(10,2) DEFAULT NULL,
  `keywords` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `image` int DEFAULT NULL,
  `on_date` date DEFAULT NULL,
  `off_date` date DEFAULT NULL,
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_category` int DEFAULT NULL,
  `link_show` int NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` bigint UNSIGNED NOT NULL,
  `nome` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categoria_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_categories`
--

CREATE TABLE `so_categories` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_order` int DEFAULT '0',
  `category_id` int DEFAULT NULL,
  `status` int DEFAULT '0',
  `type` int DEFAULT '1',
  `color` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `category_show` int DEFAULT '0',
  `image` int DEFAULT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description2` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `keywords` varchar(150) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `category_new` int DEFAULT '0',
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `slug` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_categories_itens`
--

CREATE TABLE `so_categories_itens` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_faqs`
--

CREATE TABLE `so_faqs` (
  `id` int NOT NULL,
  `faq_code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `faq_order` int DEFAULT NULL,
  `faq_question` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `faq_reply` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `category_id` int NOT NULL,
  `faq_status` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_gallery`
--

CREATE TABLE `so_gallery` (
  `id` int NOT NULL,
  `code` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `status` int DEFAULT '1',
  `link_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `order_gallery` int DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_gallery_items`
--

CREATE TABLE `so_gallery_items` (
  `id` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `gallery_id` int NOT NULL,
  `register_id` int NOT NULL,
  `item_order` int DEFAULT '1',
  `item_link` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT '1',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_itens`
--

CREATE TABLE `so_itens` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  `id_request` int NOT NULL,
  `price` float NOT NULL,
  `id_product` int DEFAULT NULL,
  `code` int NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `modality` int DEFAULT NULL,
  `period` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_links`
--

CREATE TABLE `so_links` (
  `id` int NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(80) NOT NULL,
  `url` varchar(200) NOT NULL,
  `target` int DEFAULT '0',
  `type` int DEFAULT '0',
  `status` int DEFAULT '0',
  `menu_status` int DEFAULT '0',
  `menu_order` int DEFAULT '1',
  `new_link` int DEFAULT '0',
  `link_id` int DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_prices`
--

CREATE TABLE `so_prices` (
  `id` bigint NOT NULL,
  `jornada_trabalho` int DEFAULT NULL,
  `escala` int DEFAULT NULL,
  `tipo_contratacao` int DEFAULT NULL,
  `piso` float(10,2) DEFAULT NULL,
  `adc_noturno` float(10,2) DEFAULT NULL,
  `despesas` float(10,2) DEFAULT NULL,
  `valor_uniformes` float(10,2) DEFAULT NULL,
  `adc_insalubridade` float(10,2) DEFAULT NULL,
  `adc_periculosidade` float(10,2) DEFAULT NULL,
  `valor_alimentacao` float(10,2) DEFAULT NULL,
  `valor_seguro_vida` float(10,2) DEFAULT NULL,
  `valor_transporte` float(10,2) DEFAULT NULL,
  `percentual_lucro` float(10,2) DEFAULT NULL,
  `percentual_r_s` float(10,2) DEFAULT NULL,
  `adc_name_1` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_name_2` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_name_3` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_name_4` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_name_5` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adc_value_1` float(10,2) DEFAULT NULL,
  `adc_value_2` float(10,2) DEFAULT NULL,
  `adc_value_3` float(10,2) DEFAULT NULL,
  `adc_value_4` float(10,2) DEFAULT NULL,
  `adc_value_5` float(10,2) DEFAULT NULL,
  `unit_price` float(10,2) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `created_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_products`
--

CREATE TABLE `so_products` (
  `id` int NOT NULL,
  `type` int NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `barcode` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `product_order` int DEFAULT '0',
  `product_show` int DEFAULT '0',
  `status` int NOT NULL DEFAULT '0',
  `product_new` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `price` float(10,2) NOT NULL DEFAULT '0.00',
  `promotional_price` float(10,2) DEFAULT NULL,
  `keywords` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `quantity` int DEFAULT '0',
  `stock` int DEFAULT '0',
  `image` int DEFAULT NULL,
  `on_date` date DEFAULT NULL,
  `off_date` date DEFAULT NULL,
  `created_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_category` int DEFAULT NULL,
  `link_show` int NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `date` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_requests`
--

CREATE TABLE `so_requests` (
  `id` int NOT NULL,
  `delivery_date` date DEFAULT NULL,
  `status` varchar(30) DEFAULT 'created',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `address_id` int NOT NULL,
  `payment_form` int NOT NULL,
  `code` varchar(20) NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `items` json DEFAULT NULL,
  `discount` float(16,2) DEFAULT '0.00',
  `taxa` float(16,2) DEFAULT '0.00',
  `total` float(16,2) NOT NULL DEFAULT '0.00',
  `type` varchar(10) DEFAULT NULL,
  `sign_url` varchar(250) DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `due_day` int NOT NULL,
  `payment_date` datetime DEFAULT NULL,
  `gateway_boleto_qrcode` varchar(250) DEFAULT NULL,
  `gateway_barcode` varchar(250) DEFAULT NULL,
  `recurring_transaction` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `so_taxes`
--

CREATE TABLE `so_taxes` (
  `id` int NOT NULL,
  `tax_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `tax_value` float(10,2) NOT NULL,
  `tax_status` int DEFAULT '0',
  `tax_type` int DEFAULT '1',
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tokens`
--

CREATE TABLE `tokens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `status` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `created_in` datetime DEFAULT NULL,
  `token` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uploads`
--

CREATE TABLE `uploads` (
  `id` bigint UNSIGNED NOT NULL,
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ceated_in` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `folder_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `uploads_folders`
--

CREATE TABLE `uploads_folders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `pin` int DEFAULT NULL,
  `type` int DEFAULT '1',
  `code` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `email` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `lang` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `privacy` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'public',
  `credit` int DEFAULT '0',
  `password` varchar(62) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `accept_terms` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'off',
  `email_marketing` varchar(3) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT 'off',
  `theme` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'black',
  `timezone` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT 'America/Sao_Paulo',
  `autobiography` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_in` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_addresses`
--

CREATE TABLE `users_addresses` (
  `id` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `cep` varchar(50) NOT NULL,
  `street` varchar(100) NOT NULL,
  `district` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `county` varchar(3) DEFAULT 'BR',
  `number` int NOT NULL,
  `complement` varchar(100) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `state` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_cards`
--

CREATE TABLE `users_cards` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` int NOT NULL,
  `expiration` char(7) NOT NULL,
  `cvv` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_entreprises`
--

CREATE TABLE `users_entreprises` (
  `id` int NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `nominee` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `ramal` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `corporate_name` varchar(50) NOT NULL,
  `fantasy_name` varchar(50) NOT NULL,
  `email_verification` int DEFAULT '0',
  `email_token` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_info`
--

CREATE TABLE `users_info` (
  `id` int NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `cpf` int NOT NULL,
  `birth` date NOT NULL,
  `phone` int NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ec_adverts`
--
ALTER TABLE `ec_adverts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_id` (`category_id`);

--
-- Índices para tabela `ec_categories`
--
ALTER TABLE `ec_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `ec_discounts`
--
ALTER TABLE `ec_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `INDEX` (`users_id`);

--
-- Índices para tabela `partners_products`
--
ALTER TABLE `partners_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categoria_id` (`categoria_id`);

--
-- Índices para tabela `so_categories`
--
ALTER TABLE `so_categories`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_categories_itens`
--
ALTER TABLE `so_categories_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Índices para tabela `so_faqs`
--
ALTER TABLE `so_faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Índices para tabela `so_gallery`
--
ALTER TABLE `so_gallery`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_gallery_items`
--
ALTER TABLE `so_gallery_items`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_itens`
--
ALTER TABLE `so_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `request_id` (`id_request`);

--
-- Índices para tabela `so_links`
--
ALTER TABLE `so_links`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_prices`
--
ALTER TABLE `so_prices`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_products`
--
ALTER TABLE `so_products`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_requests`
--
ALTER TABLE `so_requests`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `so_taxes`
--
ALTER TABLE `so_taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`);

--
-- Índices para tabela `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `uploads`
--
ALTER TABLE `uploads`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `uploads_folders`
--
ALTER TABLE `uploads_folders`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `users_addresses`
--
ALTER TABLE `users_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `users_cards`
--
ALTER TABLE `users_cards`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `users_entreprises`
--
ALTER TABLE `users_entreprises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Índices para tabela `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ec_adverts`
--
ALTER TABLE `ec_adverts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ec_categories`
--
ALTER TABLE `ec_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `ec_discounts`
--
ALTER TABLE `ec_discounts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `partners_products`
--
ALTER TABLE `partners_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_categories`
--
ALTER TABLE `so_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_categories_itens`
--
ALTER TABLE `so_categories_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_faqs`
--
ALTER TABLE `so_faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_gallery`
--
ALTER TABLE `so_gallery`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_gallery_items`
--
ALTER TABLE `so_gallery_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_itens`
--
ALTER TABLE `so_itens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_links`
--
ALTER TABLE `so_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_prices`
--
ALTER TABLE `so_prices`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_products`
--
ALTER TABLE `so_products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_requests`
--
ALTER TABLE `so_requests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `so_taxes`
--
ALTER TABLE `so_taxes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `uploads`
--
ALTER TABLE `uploads`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `uploads_folders`
--
ALTER TABLE `uploads_folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users_addresses`
--
ALTER TABLE `users_addresses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users_cards`
--
ALTER TABLE `users_cards`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users_entreprises`
--
ALTER TABLE `users_entreprises`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `ec_adverts`
--
ALTER TABLE `ec_adverts`
  ADD CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `ec_categories` (`id`);

--
-- Limitadores para a tabela `produtos`
--
ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `so_categories_itens`
--
ALTER TABLE `so_categories_itens`
  ADD CONSTRAINT `so_categories_itens_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `so_products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `so_faqs`
--
ALTER TABLE `so_faqs`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `so_categories` (`id`);

--
-- Limitadores para a tabela `so_itens`
--
ALTER TABLE `so_itens`
  ADD CONSTRAINT `so_itens_ibfk_1` FOREIGN KEY (`id_request`) REFERENCES `so_requests` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_addresses`
--
ALTER TABLE `users_addresses`
  ADD CONSTRAINT `users_addresses_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_cards`
--
ALTER TABLE `users_cards`
  ADD CONSTRAINT `users_cards_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_entreprises`
--
ALTER TABLE `users_entreprises`
  ADD CONSTRAINT `users_entreprises_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `users_info_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
