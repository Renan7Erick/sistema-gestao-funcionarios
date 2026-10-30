<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Controle de Férias - Painel Admin</title>
    <link rel="stylesheet" href="/pages/feriasFuncionarios/ferias.css">
</head>
<body>

    <!-- Menu Lateral -->
	<aside class="sidebar">
	        <div class="logo">
	            <span class="logo-icon">❖</span> SISTEMA
	        </div>
	        <nav class="menu">
	            <a href="/pages/dashboard/dashboard.html" class="menu-item">📊 Dashboard</a>
	            <a href="/encontrar-ponto" class="menu-item">🕒 Ponto</a>
	            <a href="/encontrar-ferias" class="menu-item active">✈️ Férias</a>
	        </nav>
	        <a href="/pages/login/index.html" class="logout">🚪 Sair</a>
	    </aside>

    <!-- Área Principal -->
    <main class="main-content">
        <header class="topbar">
            <span class="breadcrumb">SISTEMA - PAINEL ADMIN</span>
            <div class="user-profile">
                <span class="status-badge active-status"><span class="dot green"></span> Ativo</span>
                <div class="avatar">CF</div>
            </div>
        </header>

		<section class="page-header">
		            <span class="breadcrumb">PAINEL ADMIN • GESTÃO DE FÉRIAS</span>
		            <h1>Controle de Férias</h1>
		            <p>Lançamento e aprovação de férias dos colaboradores</p>
		        </section>

		        <!-- Formulário de Lançamento (Visão RH) -->
		        <section class="card form-card">
		            <div class="card-header">
		                <h3 class="card-title">⨁ Lançar Novas Férias</h3>
		            </div>
		            
		            <form action="/sistema-gestao-funcionarios/create-ferias" method="POST" class="ferias-form">
		                <input type="hidden" name="status" value="Aprovada">

		                <div class="form-row">
		                    <!-- O RH agora digita qual funcionário vai tirar férias -->
		                    <div class="input-group">
		                        <label for="funcionario-id">ID DO FUNCIONÁRIO *</label>
		                        <input type="number" id="funcionario-id" name="funcionarioId" placeholder="Ex: 5" required>
		                    </div>

		                    <div class="input-group">
		                        <label for="data-inicio">DATA DE INÍCIO *</label>
		                        <input type="date" id="data-inicio" name="dataInicio" required>
		                    </div>
		                    
		                    <div class="input-group">
		                        <label for="data-fim">DATA DE TÉRMINO *</label>
		                        <input type="date" id="data-fim" name="dataFim" required>
		                    </div>
		                </div>

		                <div class="form-footer">
		                    <div class="form-actions">
		                        <button type="submit" class="btn-primary">✦ Lançar Férias</button>
		                    </div>
		                </div>
		            </form>
		        </section>
        <!-- Tabela de Histórico -->
        <section class="card table-card">
            <div class="table-header-controls">
                <div>
                    <h3>Histórico de Solicitações</h3>
                    <p class="subtitle">Registros da entidade FERIAS vinculados ao colaborador</p>
                </div>
                <div class="table-actions">
                    <div class="search-box">
                        <span class="search-icon">🔍</span>
                        <input type="text" placeholder="Buscar por ID ou data...">
                    </div>
                    <button class="btn-outline">↻ Atualizar</button>
                </div>
            </div>
            
            <table class="data-table">
				<thead>
				                <tr>
				                    <th>ID (PK)</th>
				                    <th>FUNCIONÁRIO ID (FK)</th>
				                    <th>DATA DE INÍCIO</th>
				                    <th>DATA DE TÉRMINO</th>
				                    <th>STATUS</th>
				                    <th>AÇÕES</th> 
				                </tr>
				            </thead>
				<tbody>
				    <c:forEach var="feria" items="${ferias}">
				        <tr>
				            <td><strong>#FER-${feria.id}</strong></td>
				            <td class="muted-text">#FUNC-${feria.funcionarioId}</td>
				            <td>${feria.dataInicio}</td>
				            <td>${feria.dataFim}</td>
							<td>
							        <span class="badge ${feria.status == 'Aprovada' ? 'success' : (feria.status == 'Pendente' ? 'warning' : 'danger')}">
							            ${feria.status}
							        </span>
							    </td>
							    
							    <!-- Nova Coluna de Ações -->
							    <td class="table-actions-cell">
							        <!-- Ícone para Editar (pode direcionar para um modal ou tela de edição) -->
									<a href="/sistema-gestao-funcionarios/editar-ferias?id=${feria.id}" style="text-decoration: none; margin-right: 8px;">✏️</a>

									<form action="/sistema-gestao-funcionarios/delete-ferias" method="POST" style="display: inline;">
									    <input type="hidden" name="id" value="${feria.id}">
									    <button type="submit" style="background: none; border: none; cursor: pointer;" title="Excluir">🗑️</button>
									</form>
							    </td>
							</tr>
				    </c:forEach>
				</tbody>
            </table>

            <div class="table-footer">
                <span class="muted-text">Mostrando 4 registros da entidade FERIAS</span>
                <div class="pagination">
                    <span class="muted-text">Página 1 de 1</span>
                    <button class="btn-icon" disabled>&lt;</button>
                    <button class="btn-icon" disabled>&gt;</button>
                </div>
            </div>
        </section>
    </main>

</body>
</html>