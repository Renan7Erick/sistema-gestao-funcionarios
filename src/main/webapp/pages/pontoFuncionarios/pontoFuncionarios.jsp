<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ponto - Painel Admin</title>
    <link rel="stylesheet" href="/pages/pontoFuncionarios/pontoFuncionarios.css">
</head>
<body>

<aside class="sidebar">
    <div>
        <div class="logo">
            <div class="logo-icone">❖</div>
            <div class="logo-texto">
                <strong>SISTEMA</strong>
                <span>FUNCIONÁRIOS</span>
            </div>
        </div>

       <ul class="menu">
    <li><a href="/encontrar-dashboard">Dashboard</a></li>
    <li><a href="/encontrar-funcionarios">Funcionários</a></li>
    <li><a href="/encontrar-departamentos">Departamentos</a></li>
    <li><a href="/encontrar-cargos">Cargos</a></li>
    <li><a href="/encontrar-pontos" class="ativo">Ponto</a></li>
    <li><a href="/encontrar-ferias">Férias</a></li>
</ul>
    </div>

    <a href="#" class="sair">Sair</a>
</aside>

<div class="conteudo">
    <header class="topbar">
        <span>GESTÃO ORGANIZACIONAL</span>
        <span class="selo">Administrador</span>
    </header>

    <main>
        <section class="cabecalho">
            <span class="trilha">Painel corporativo › Ponto</span>
            <h1>Controle e Registros de Ponto</h1>
            <p>Auditoria e monitoramento das marcações de jornada dos colaboradores.</p>
        </section>

        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Registros de ponto</h2>
                    <p>Somente consulta. Os funcionários registram o próprio ponto na área deles.</p>
                </div>
            </div>

            <div class="tabela-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Funcionário</th>
                        <th>Data</th>
                        <th>Entrada</th>
                        <th>Saída</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="ponto" items="${pontos}">
                        <tr>
                            <td>${ponto.id}</td>
                            <td>${ponto.funcionarioId}</td>
                            <td>${ponto.data}</td>
                            <td>${ponto.entrada}</td>
                            <td>${ponto.saida}</td>
                        </tr>
                    </c:forEach>



                    </tbody>
                </table>
            </div>
        </section>
    </main>
</div>

</body>
</html>
