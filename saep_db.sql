-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Tempo de geração: 02/10/2026 às 19:46
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `saep_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `pet_id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `motivo` varchar(255) NOT NULL,
  `observacoes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `agendamentos`
--

INSERT INTO `agendamentos` (`id`, `pet_id`, `data_hora`, `motivo`, `observacoes`) VALUES
(1, 1, '2026-10-10 08:00:00', 'Consulta', 'Primeiro atendimento'),
(2, 2, '2026-10-10 09:00:00', 'Vacinação', 'Verificar carteira'),
(3, 3, '2026-10-11 10:00:00', 'Retorno', 'Reavaliação'),
(6, 1, '2026-12-12 18:00:00', 'câncer', 'tratamento de próstata');

-- --------------------------------------------------------

--
-- Estrutura para tabela `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `especie` varchar(50) NOT NULL,
  `raca` varchar(80) NOT NULL,
  `data_nascimento` date NOT NULL,
  `tutor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `pets`
--

INSERT INTO `pets` (`id`, `nome`, `especie`, `raca`, `data_nascimento`, `tutor_id`) VALUES
(1, 'Thor', 'Cachorro', 'SRD', '2022-01-10', 1),
(2, 'Luna', 'Gato', 'SRD', '2023-03-15', 2),
(3, 'Mel', 'Cachorro', 'Poodle', '2021-06-20', 3);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tutores`
--

CREATE TABLE `tutores` (
  `id` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `cpf_criptografado` text NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `tutores`
--

INSERT INTO `tutores` (`id`, `nome`, `cpf_criptografado`, `telefone`, `email`) VALUES
(1, 'Tutor Exemplo A', 'AmWNjmPjOb+GX/S6VH4ba2JYa4RhklQe9CtMLECO43puxoBYTf2E', '17999990001', 'tutor1@exemplo.com'),
(2, 'Tutor Exemplo B', 'FpBdcWvQ3Uv18YmhV5/8ZzD/JLddWXjkvtRED8/hvmPAbJdSIY7j', '17999990002', 'tutor2@exemplo.com'),
(3, 'Tutor Exemplo C', 'Z54/l7XrzL71VrjGwP0V3Xgq6Du1lRaxhyBdo6E4ioukq7SwToNx', '17999990003', 'tutor3@exemplo.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(60) NOT NULL,
  `senha_hash` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `login`, `senha_hash`) VALUES
(1, 'Administrador', 'admin', '$2b$12$G3u2JYle3DwdtBB3JUfD4eMvYHkL2p2ry8D0zxTl0m2zj1KBWT0si'),
(2, 'Recepção', 'recepcao', '$2b$12$IniF9Wusd.PODBe4pXHwxeoKz.i/ILI.uql7zmxgiBhVm9ZSaE3zy'),
(3, 'Veterinário', 'vet', '$2b$12$XdUNZqjiTCxpedU45wvzZu6S7CyG2ebeNvpsEVp9la03SgkJUJbCW');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_agendamento_pet` (`pet_id`);

--
-- Índices de tabela `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pet_tutor` (`tutor_id`);

--
-- Índices de tabela `tutores`
--
ALTER TABLE `tutores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login` (`login`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tutores`
--
ALTER TABLE `tutores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `fk_agendamento_pet` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`) ON UPDATE CASCADE;

--
-- Restrições para tabelas `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_pet_tutor` FOREIGN KEY (`tutor_id`) REFERENCES `tutores` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
