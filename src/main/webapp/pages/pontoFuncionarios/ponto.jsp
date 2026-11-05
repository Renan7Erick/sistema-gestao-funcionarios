<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">
	<head>
		<script src="https://unpkg.com/@phosphor-icons/web"></script>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>Gestão de Ponto - Painel Admin</title>
	    <!-- Caminho corrigido para a raiz do Tomcat 7 -->
	    <link rel="stylesheet" href="/pages/pontoFuncionarios/ponto.css">
	</head>
	<body>
	    <!-- Menu Lateral Padronizado -->
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
		            <li><a href="http://localhost:8080/pages/dashboard/dashboard.html"><i class="ph ph-chart-bar"></i> Dashboard</a></li>
		            <li><a href="http://localhost:8080/encontrar-funcionarios"><i class="ph ph-users"></i> Funcionários</a></li>
		            <li><a href="http://localhost:8080/encontrar-departamentos"><i class="ph ph-buildings"></i> Departamentos</a></li>
		            <li><a href="http://localhost:8080/encontrar-cargos"><i class="ph ph-briefcase"></i> Cargos</a></li>
		            <li class="active"><a href="http://localhost:8080/encontrar-ponto"><i class="ph ph-clock"></i> Ponto</a></li>
		            <li><a href="http://localhost:8080/encontrar-ferias"><i class="ph ph-airplane-tilt"></i> Férias</a></li>
		        </ul>
		    </nav>

		    <div class="sidebar-footer">
		        <a href="http://localhost:8080/pages/login/index.html" class="logout-btn">
		            <i class="ph ph-sign-out"></i> Sair
		        </a>
		    </div>
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