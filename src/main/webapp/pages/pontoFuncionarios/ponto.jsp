<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Gestão de Ponto - Painel Admin</title>
	    <!-- Caminho corrigido para a raiz do Tomcat 7 -->
	    <link rel="stylesheet" href="/pages/pontoFuncionarios/ponto.css">
	</head>
	<body>
	    <!-- Menu Lateral Padronizado -->
	    <aside class="sidebar">
	        <div class="logo">
	            <span class="logo-icon">❖</span> SISTEMA
	        </div>
	        <nav class="menu">
	            <a href="/pages/dashboard/dashboard.html" class="menu-item">📊 Dashboard</a>
	            <a href="/encontrar-ponto" class="menu-item active">🕒 Ponto</a>
	            <a href="/encontrar-ferias" class="menu-item">✈️ Férias</a>
	        </nav>
	        <a href="/pages/login/index.html" class="logout">🚪 Sair</a>
	    </aside>

    <!-- Área Principal -->
    <main class="main-content">
        <!-- Cabeçalho -->
        <header class="topbar">
            <span class="breadcrumb">SISTEMA - PAINEL ADMIN</span>
            <div class="user-profile">
                <span class="status-badge"><span class="dot green"></span> Painel Online</span>
                <div class="avatar">AD</div>
            </div>
        </header>

        <!-- Título da Página -->
        <section class="page-header">
            <h1>Espelho de Ponto</h1>
            <p>Painel Admin - Visualização dos registros de entrada e saída dos colaboradores</p>
        </section>

        <!-- Tabela do Espelho de Ponto (Somente Leitura) -->
        <section class="card table-card">
            <div class="table-header">
                <h3>📅 Registros de Ponto</h3>
                <div class="month-selector">
                    <span>Histórico Consolidado</span>
                </div>
            </div>
            
            <table class="ponto-table data-table">
                <thead>
                    <tr>
                        <th>ID PONTO</th>
                        <th>FUNCIONÁRIO ID</th>
                        <th>DATA</th>
                        <th>ENTRADA</th>
                        <th>SAÍDA</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="ponto" items="${pontos}">
                        <tr>
                            <td><strong>#PT-${ponto.id}</strong></td>
                            <td class="muted-text">#FUNC-${ponto.funcionarioId}</td>
                            <td>${ponto.data}</td>
                            <td>${ponto.entrada}</td>
                            <td>${ponto.saida}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
    </main>

</body>
</html>