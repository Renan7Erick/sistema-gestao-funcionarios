<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ponto - Sistema Funcionários</title>
    <!-- CSS global da Dashboard PRIMEIRO -->
    <link rel="stylesheet" href="/pages/dashboard/dashboard.css">
    <!-- CSS específico desta página -->
    <link rel="stylesheet" href="/pages/pontoFuncionarios/pontoFuncionarios.css">
    <!-- Biblioteca de ícones -->
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>
<body>
<div class="app-container">

    <!-- ========== BARRA LATERAL (PADRÃO DASHBOARD) ========== -->
    <aside class="sidebar">
        <div class="logo-area">
            <i class="ph-fill ph-buildings"></i>
            <div>
                <h2>SISTEMA</h2>
                <p>FUNCIONÁRIOS</p>
            </div>
        </div>

        <nav class="menu">
            <ul>
                <li><a href="http://localhost:8080/encontrar-dashboard"><i class="ph ph-chart-bar"></i> Dashboard</a></li>
                <li><a href="http://localhost:8080/encontrar-funcionarios"><i class="ph ph-users"></i> Funcionários</a></li>
                <li><a href="http://localhost:8080/encontrar-departamentos"><i class="ph ph-buildings"></i> Departamentos</a></li>
                <li><a href="http://localhost:8080/encontrar-cargos"><i class="ph ph-briefcase"></i> Cargos</a></li>
                <li class="active"><a href="http://localhost:8080/encontrar-pontos"><i class="ph ph-clock"></i> Ponto</a></li>
                <li><a href="http://localhost:8080/encontrar-ferias"><i class="ph ph-airplane-tilt"></i> Férias</a></li>
            </ul>
        </nav>

        <div class="sidebar-footer">
            <a href="/logout" class="logout-btn">
                <i class="ph ph-sign-out"></i> Sair
            </a>
        </div>
    </aside>

    <!-- ========== CONTEÚDO ========== -->
    <main class="main-content">

        <!-- ========== CABEÇALHO SUPERIOR (PADRÃO DASHBOARD) ========== -->
        <header class="top-header">
            <div class="title-area">
                <h1>Controle e Registros de Ponto</h1>
                <p>Auditoria e monitoramento das marcações de jornada dos colaboradores.</p>
            </div>

            <div class="user-area">

                <div class="profile-info">
                    <div class="profile-text">
                        <strong>${funcionario.nome}</strong>
                         <span>${funcionario.email}</span>
                    </div>
                    <div class="avatar">AD</div>
                </div>
            </div>
        </header>

        <!-- ========== CONTEÚDO ESPECÍFICO DE PONTO ========== -->
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
                        <th>Funcionário(ID)</th>
                        <th>Funcionário(Nome)</th>
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
                            <td>${ponto.funcionarioNome}</td>
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