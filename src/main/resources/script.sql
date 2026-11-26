-- ============================================================
-- LIMPEZA: apaga as tabelas (filhas primeiro) para o script poder
-- ser executado várias vezes sem violar CPF/e-mail únicos.
-- ============================================================
DROP TABLE IF EXISTS ferias;
DROP TABLE IF EXISTS ponto;
DROP TABLE IF EXISTS funcionario;
DROP TABLE IF EXISTS cargo;
DROP TABLE IF EXISTS departamento;

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
-- DADOS DE TESTE
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

-- FUNCIONARIOS (ids 1 a 20)
-- Logins de teste: admin@empresa.com / admin123 (ADMIN)
--                  os demais usam a senha func123 (FUNCIONARIO)
-- Cada cargo pertence a um departamento (cargo 1 -> depto 1, cargo 2 -> depto 2, ...),
-- então os funcionários usam sempre o par cargo_id = departamento_id.
INSERT INTO funcionario
(nome, cpf, email, senha, perfil, telefone, data_nascimento, data_contratacao, status, cargo_id, departamento_id)
VALUES
    ('Administrador',    '111.111.111-11', 'admin@empresa.com',     'admin123', 'ADMIN',       '(11) 99999-0001', '1990-01-15', '2020-02-03', 'ATIVO',   1, 1),
    ('Carla Mendes',     '222.222.222-22', 'carla@empresa.com',     'func123',  'FUNCIONARIO', '(11) 99999-0002', '1992-05-20', '2021-06-14', 'ATIVO',   2, 2),
    ('Bruno Lima',       '333.333.333-33', 'bruno@empresa.com',     'func123',  'FUNCIONARIO', '(11) 99999-0003', '1996-09-08', '2023-01-09', 'ATIVO',   3, 3),
    ('Fernanda Costa',   '444.444.444-44', 'fernanda@empresa.com',  'func123',  'FUNCIONARIO', '(11) 99999-0004', '1998-12-30', '2024-03-18', 'ATIVO',   4, 4),
    ('Rafael Alves',     '555.555.555-55', 'rafael@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0005', '1988-03-11', '2019-08-26', 'INATIVO', 5, 5),
    ('Juliana Rocha',    '123.456.789-06', 'juliana@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0006', '1991-04-12', '2020-09-01', 'ATIVO',   1, 1),
    ('Marcos Pereira',   '234.567.890-17', 'marcos@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0007', '1989-07-25', '2019-11-04', 'ATIVO',   2, 2),
    ('Patricia Santos',  '345.678.901-28', 'patricia@empresa.com',  'func123',  'FUNCIONARIO', '(11) 99999-0008', '1994-02-18', '2022-03-07', 'ATIVO',   3, 3),
    ('Diego Martins',    '456.789.012-39', 'diego@empresa.com',     'func123',  'FUNCIONARIO', '(11) 99999-0009', '1997-10-03', '2023-05-15', 'ATIVO',   4, 4),
    ('Camila Ribeiro',   '567.890.123-40', 'camila@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0010', '1993-06-29', '2021-01-11', 'ATIVO',   5, 5),
    ('Thiago Barbosa',   '678.901.234-51', 'thiago@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0011', '1990-11-14', '2018-04-23', 'ATIVO',   1, 1),
    ('Larissa Nogueira', '789.012.345-62', 'larissa@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0012', '1995-01-07', '2022-08-29', 'ATIVO',   2, 2),
    ('Gustavo Teixeira', '890.123.456-73', 'gustavo@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0013', '1987-08-21', '2017-02-13', 'INATIVO', 3, 3),
    ('Aline Duarte',     '901.234.567-84', 'aline@empresa.com',     'func123',  'FUNCIONARIO', '(11) 99999-0014', '1999-03-16', '2024-07-01', 'ATIVO',   4, 4),
    ('Felipe Araujo',    '012.345.678-95', 'felipe@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0015', '1992-12-05', '2020-10-19', 'ATIVO',   5, 5),
    ('Renata Moura',     '147.258.369-01', 'renata@empresa.com',    'func123',  'FUNCIONARIO', '(11) 99999-0016', '1986-09-30', '2016-06-06', 'ATIVO',   1, 1),
    ('Vinicius Cardoso', '258.369.147-12', 'vinicius@empresa.com',  'func123',  'FUNCIONARIO', '(11) 99999-0017', '1996-05-09', '2023-09-12', 'ATIVO',   2, 2),
    ('Beatriz Gomes',    '369.147.258-23', 'beatriz@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0018', '1998-02-27', '2024-01-22', 'ATIVO',   3, 3),
    ('Eduardo Castro',   '159.357.486-34', 'eduardo@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0019', '1991-10-18', '2019-05-20', 'INATIVO', 4, 4),
    ('Isabela Freitas',  '753.951.852-45', 'isabela@empresa.com',   'func123',  'FUNCIONARIO', '(11) 99999-0020', '1994-07-04', '2021-11-08', 'ATIVO',   5, 5);

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