-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 27/05/2025 às 03:08
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `engenharia_app`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_calculos`
--

CREATE TABLE `historico_calculos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `tipo_calculo_id` int(11) NOT NULL,
  `dados_entrada` text NOT NULL,
  `resultado` text NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `historico_calculos`
--

INSERT INTO `historico_calculos` (`id`, `usuario_id`, `tipo_calculo_id`, `dados_entrada`, `resultado`, `criado_em`) VALUES
(1, 1, 3, '{\"largura\":2,\"altura\":3,\"profundidade\":1.5}', '9.00 m³', '2025-05-27 00:47:48'),
(2, 1, 5, '{\"comprimento\":8,\"largura\":4.5}', 'Cálculo não implementado.', '2025-05-27 00:51:53'),
(3, 1, 4, '{\"comprimento\":12,\"largura\":3.5}', 'Peso: NaN kg', '2025-05-27 01:03:50'),
(4, 1, 4, '{\"volume\":0.02,\"densidade\":2400}', 'Peso: 48.00 kg', '2025-05-27 01:05:08');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipos_calculo`
--

CREATE TABLE `tipos_calculo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipos_calculo`
--

INSERT INTO `tipos_calculo` (`id`, `nome`, `descricao`) VALUES
(1, 'Dimensionamento de tubulações hidráulicas', 'Calcula o diâmetro ideal com base na vazão e velocidade.'),
(2, 'Carga admissível do solo', 'Calcula a tensão admissível do terreno com base nos dados do SPT.'),
(3, 'Volume de corte e aterro', 'Estima volumes a partir das cotas de projeto e do terreno.'),
(4, 'Dimensionamento de tubulações hidráulicas', 'Calcula diâmetro ideal com base em vazão, coeficiente e declividade.'),
(5, 'Carga admissível do solo', 'Calcula a tensão admissível do solo com base no SPT.'),
(6, 'Peso de bloco de concreto', 'Calcula o peso de um bloco com base em volume e densidade.'),
(7, 'Área de laje', 'Calcula a área total da laje em m².');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `criado_em`) VALUES
(1, 'Elder Macedo', 'macedoelder23@gmail.com', '$2b$10$r0gkUq9MzFMK6OvDvVLOsOCEgFsQYgxExN8XbMOzsJvG7Mv6Wndd2', '2025-05-27 00:33:15');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `historico_calculos`
--
ALTER TABLE `historico_calculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `tipo_calculo_id` (`tipo_calculo_id`);

--
-- Índices de tabela `tipos_calculo`
--
ALTER TABLE `tipos_calculo`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `historico_calculos`
--
ALTER TABLE `historico_calculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tipos_calculo`
--
ALTER TABLE `tipos_calculo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `historico_calculos`
--
ALTER TABLE `historico_calculos`
  ADD CONSTRAINT `historico_calculos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `historico_calculos_ibfk_2` FOREIGN KEY (`tipo_calculo_id`) REFERENCES `tipos_calculo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
