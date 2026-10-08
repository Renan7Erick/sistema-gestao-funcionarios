
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

