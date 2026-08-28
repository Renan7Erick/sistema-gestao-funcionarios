# Sistema de Gerenciamento de Funcionários

![Java](https://img.shields.io/badge/Backend-Java-orange)
![JDBC](https://img.shields.io/badge/Data%20Access-JDBC-blue)
![H2 Database](https://img.shields.io/badge/Database-H2-darkblue)
![Frontend](https://img.shields.io/badge/Frontend-HTML%20%7C%20CSS%20%7C%20JS-brightgreen)

O **Sistema de Gerenciamento de Funcionários** é uma aplicação web corporativa voltada para o controle e a organização interna de colaboradores de uma empresa. Desenvolvido no âmbito acadêmico para o 3º Semestre de Projeto Integrador (PI), o projeto integra múltiplos módulos administrativos interligados, regras de negócio, controle de presença, gestão de férias, verificação documental, relatórios e controle de acesso autenticado.

---

## 📋 Sumário

- [1. Contexto do Projeto](#1-contexto-do-projeto)
- [2. Tecnologias Utilizadas](#2-tecnologias-utilizadas)
- [3. Arquitetura do Sistema](#3-arquitetura-do-sistema)
- [4. Estrutura do Banco de Dados](#4-estrutura-do-banco-de-dados)
- [5. Estrutura de Pastas](#5-estrutura-de-pastas)
- [6. Funcionalidades do Sistema](#6-funcionalidades-do-sistema)
- [7. Módulos do Sistema](#7-módulos-do-sistema)
- [8. Relatórios Administrativos](#8-relatórios-administrativos)
- [9. Requisitos Acadêmicos e Restrições](#9-requisitos-acadêmicos-e-restrições)
- [10. Exemplos de Uso (Fluxos)](#10-exemplos-de-uso-fluxos)
- [11. Como Executar o Projeto](#11-como-executar-o-projeto)
- [12. Objetivo Acadêmico](#12-objetivo-acadêmico)

---

## 1. Contexto do Projeto

O objetivo principal da aplicação é centralizar, padronizar e otimizar os fluxos de dados internos relacionados a recursos humanos e operações institucionais. 

O sistema divide-se em duas camadas principais de acesso:
- **Área Pública:** Livremente acessível, destinada à apresentação institucional da empresa, catálogo de departamentos publicáveis e formulários de contato/acesso.
- **Área Administrativa:** Protegida por credenciais de autenticação, permitindo o gerenciamento completo de colaboradores, cargos, departamentos, ponto, férias, documentos e métricas gerenciais.

---

## 2. Tecnologias Utilizadas

| Camada | Tecnologia | Descrição |
| :--- | :--- | :--- |
| **Frontend** | HTML5 / CSS3 / JavaScript | Interface visual estruturada, estilizada e com scripts para dinamismo e manipulação de DOM. |
| **Interface** | Bootstrap | Framework CSS utilizado para auxílio no suporte a componentes responsivos e layout. |
| **Backend** | Java (Nativo) | Processamento de regras de negócio e controle de requisições web sem o uso de Spring Boot. |
| **Persistência** | JDBC | Comunicação direta, rápida e manual com a camada de persistência através de SQL puro. |
| **Banco de Dados**| H2 Database | Sistema de gerenciamento de banco de dados relacional leve e integrado. |

---

## 3. Arquitetura do Sistema

```text
+-------------------------------------------------------------+
|                          FRONTEND                           |
|         HTML5  |  CSS3  |  JavaScript  |  Bootstrap         |
+-------------------------------------------------------------+
                              |
                              | Requisições HTTP (GET/POST)
                              v
+-------------------------------------------------------------+
|                          BACKEND                            |
|                     Java (Sem Spring)                       |
|                             |                               |
|                           JDBC                              |
+-------------------------------------------------------------+
                              |
                              | Consultas / Manipulação SQL
                              v
+-------------------------------------------------------------+
|                       BANCO DE DADOS                        |
|                         H2 Database                         |
+-------------------------------------------------------------+
