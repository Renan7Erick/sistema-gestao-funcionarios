<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Férias - Portal do Colaborador</title>
    <link rel="stylesheet" href="/pages/feriasFuncionarios/ferias.css">
</head>
<body>

    <!-- Menu Lateral -->
    <aside class="sidebar">
        <div class="logo">
            <span class="logo-icon">❖</span> SISTEMA
        </div>
        <nav class="menu">
            <a href="#" class="menu-item">👤 Meu Perfil</a>
            <a href="#" class="menu-item">🕒 Meu Ponto</a>
            <a href="#" class="menu-item active">✈️ Minhas Férias</a>
        </nav>
        <a href="#" class="logout">🚪 Sair</a>
    </aside>

    <!-- Área Principal -->
    <main class="main-content">
        <header class="topbar">
            <span class="breadcrumb">SISTEMA - PORTAL DO COLABORADOR</span>
            <div class="user-profile">
                <span class="status-badge active-status"><span class="dot green"></span> Ativo</span>
                <div class="avatar">CF</div>
            </div>
        </header>

        <!-- Cabeçalho da Página -->
        <section class="page-header">
            <span class="breadcrumb">ENTIDADE: 4.5 FERIAS • ID COLABORADOR: #FUNC-084</span>
            <h1>Minhas Férias</h1>
            <p>Gestão e solicitação de períodos de férias (4.5 FERIAS)</p>
        </section>

        <!-- Formulário de Nova Solicitação -->
        <section class="card form-card">
            <div class="card-header">
                <h3 class="card-title">⨁ Nova Solicitação de Férias</h3>
                <span class="badge warning-light">Status Inicial: Pendente</span>
            </div>
            
			<form action="/create-ferias" method="POST" class="ferias-form">
			    <!-- Campos ocultos exigidos pelo Servlet -->
			    <input type="hidden" name="funcionarioId" value="84">
			    <input type="hidden" name="status" value="Pendente">

			    <div class="form-row">
			        <div class="input-group">
			            <label for="data-inicio">DATA DE INÍCIO (DATA_INICIO) *</label>
			            <!-- name ajustado para camelCase -->
			            <input type="date" id="data-inicio" name="dataInicio" required>
			            <span class="helper-text">Primeiro dia de gozo</span>
			        </div>
			        <div class="input-group">
			            <label for="data-fim">DATA DE TÉRMINO (DATA_FIM) *</label>
			            <!-- name ajustado para camelCase -->
			            <input type="date" id="data-fim" name="dataFim" required>
			            <span class="helper-text">Último dia de gozo</span>
			        </div>
			    </div>

			    <div class="form-footer">
			        <div class="warning-message">
			            <span class="warning-icon">ⓘ</span>
			            <p>A solicitação será cadastrada com status <strong>Pendente</strong> para análise e homologação da liderança.</p>
			        </div>
			        <div class="form-actions">
			            <button type="reset" class="btn-secondary">Limpar</button>
			            <button type="submit" class="btn-primary">✦ Solicitar Férias</button>
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
							        <a href="/editar-ferias?id=${feria.id}" style="text-decoration: none; margin-right: 8px;">✏️</a>

							        <!-- Formulário para Excluir -->
							        <form action="/delete-ferias" method="POST" style="display: inline;">
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