
-- 4.1 DEPARTAMENTO
CREATE TABLE IF NOT EXISTS departamento (
        id   INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(100) NOT NULL UNIQUE
    );

-- 4.2 CARGO um cargo pode ter vários funcionários
CREATE TABLE IF NOT EXISTS cargo (
        id              INT AUTO_INCREMENT PRIMARY KEY,
        nome            VARCHAR(100) NOT NULL,
        nivel           ENUM('JUNIOR', 'PLENO', 'SENIOR') NOT NULL,
        departamento_id INT NOT NULL,
        FOREIGN KEY (departamento_id) REFERENCES departamento(id)
    );


CREATE TABLE IF NOT EXISTS funcionario (
        id               INT AUTO_INCREMENT PRIMARY KEY,
        nome             VARCHAR(150) NOT NULL,
        cpf              VARCHAR(14)  NOT NULL UNIQUE,
        email            VARCHAR(150) NOT NULL UNIQUE,
        senha            VARCHAR(50)  NOT NULL,
        perfil           ENUM('ADMIN', 'FUNCIONARIO') NOT NULL DEFAULT 'FUNCIONARIO',
        telefone         VARCHAR(20),
        data_nascimento  DATE,
        data_contratacao DATE NOT NULL,
        status           ENUM('ATIVO', 'INATIVO') NOT NULL DEFAULT 'ATIVO',
        cargo_id         INT NOT NULL,
        departamento_id  INT NOT NULL,
        FOREIGN KEY (cargo_id) REFERENCES cargo(id),
        FOREIGN KEY (departamento_id) REFERENCES departamento(id)
    );

-- 4.4 PONTO
CREATE TABLE IF NOT EXISTS ponto (
         id             INT AUTO_INCREMENT PRIMARY KEY,
         funcionario_id INT  NOT NULL,
         data           DATE NOT NULL,
         entrada        TIME NOT NULL,
         saida          TIME,                              -- pode começar nulo porque precisa registrar uma saída depois
         FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
    );

-- 4.5 FERIAS
CREATE TABLE IF NOT EXISTS ferias (
        id             INT AUTO_INCREMENT PRIMARY KEY,
        funcionario_id INT  NOT NULL,
        data_inicio    DATE NOT NULL,
        data_fim       DATE NOT NULL,
        status         ENUM('PENDENTE', 'APROVADA', 'REJEITADA') NOT NULL DEFAULT 'PENDENTE',
        FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
    );

-- ============================================================
-- DADOS DE TESTE (5 registros por tabela)
-- A ordem importa: primeiro as tabelas que não dependem de outras.
-- ============================================================

-- DEPARTAMENTOS (ids 1 a 5)
INSERT INTO departamento (nome) VALUES
    ('Administrativo'),
    ('Financeiro'),
    ('TI'),
    ('RH'),
    ('Comercial');

-- CARGOS (ids 1 a 5)
INSERT INTO cargo (nome, nivel, departamento_id) VALUES
     ('Analista Administrativo', 'SENIOR', 1),
     ('Analista Financeiro',     'PLENO',  2),
     ('Desenvolvedor Backend',   'PLENO',  3),
     ('Analista de RH',          'JUNIOR', 4),
     ('Executivo de Vendas',     'SENIOR', 5);

-- FUNCIONARIOS (ids 1 a 5)
-- Logins de teste: admin@empresa.com / admin123 (ADMIN)
--                  os demais usam a senha func123 (FUNCIONARIO)
INSERT INTO funcionario
(nome, cpf, email, senha, perfil, telefone, data_nascimento, data_contratacao, status, cargo_id, departamento_id)
VALUES
    ('Administrador',  '111.111.111-11', 'admin@empresa.com',    'admin123', 'ADMIN',       '(11) 99999-0001', '1990-01-15', '2020-02-03', 'ATIVO',   1, 1),
    ('Carla Mendes',   '222.222.222-22', 'carla@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0002', '1992-05-20', '2021-06-14', 'ATIVO',   2, 2),
    ('Bruno Lima',     '333.333.333-33', 'bruno@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0003', '1996-09-08', '2023-01-09', 'ATIVO',   3, 3),
    ('Fernanda Costa', '444.444.444-44', 'fernanda@empresa.com', 'func123',  'FUNCIONARIO', '(11) 99999-0004', '1998-12-30', '2024-03-18', 'ATIVO',   4, 4),
    ('Rafael Alves',   '555.555.555-55', 'rafael@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0005', '1988-03-11', '2019-08-26', 'INATIVO', 5, 5);

-- PONTOS (ids 1 a 5) - o último ainda está sem saída
INSERT INTO ponto (funcionario_id, data, entrada, saida) VALUES
     (2, '2026-10-19', '08:00:00', '17:00:00'),
     (3, '2026-10-19', '08:10:00', '17:05:00'),
     (4, '2026-10-20', '07:55:00', '16:50:00'),
     (2, '2026-10-20', '08:02:00', '17:01:00'),
     (3, '2026-10-21', '08:05:00', NULL);

-- FERIAS (ids 1 a 5)
INSERT INTO ferias (funcionario_id, data_inicio, data_fim, status) VALUES
   (2, '2026-12-15', '2026-12-30', 'PENDENTE'),
   (3, '2026-11-02', '2026-11-16', 'APROVADA'),
   (4, '2026-11-23', '2026-12-07', 'REJEITADA'),
   (1, '2027-01-04', '2027-01-18', 'APROVADA'),
   (5, '2026-09-01', '2026-09-15', 'APROVADA');
