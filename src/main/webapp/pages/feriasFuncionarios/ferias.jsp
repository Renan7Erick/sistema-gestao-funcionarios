<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Férias - Sistema Funcionários</title>
    <!-- CSS global da Dashboard PRIMEIRO -->
    <link rel="stylesheet" href="/pages/dashboard/dashboard.css">
    <!-- CSS específico desta página -->
    <link rel="stylesheet" href="/pages/feriasFuncionarios/feriasFuncionarios.css">
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
                <li><a href="http://localhost:8080/encontrar-pontos"><i class="ph ph-clock"></i> Ponto</a></li>
                <li class="active"><a href="http://localhost:8080/encontrar-ferias"><i class="ph ph-airplane-tilt"></i> Férias</a></li>
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
                <h1>Solicitações e Gestão de Férias</h1>
                <p>Aprove ou rejeite as solicitações feitas pelos colaboradores.</p>
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

        <!-- ========== CONTEÚDO ESPECÍFICO DE FÉRIAS ========== -->
        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Solicitações de férias</h2>
                    <p>As solicitações novas chegam com o status PENDENTE.</p>
                </div>
            </div>

            <div class="tabela-wrap">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Funcionário(ID)</th>
                            <th>Funcionário(NOME)</th>
                            <th>Início</th>
                            <th>Término</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>

                    <tbody>
                        <c:forEach var="feria" items="${ferias}">
                            <tr>
                                <td><strong>${feria.id}</strong></td>
                                <td class="mudo">${feria.funcionarioId}</td>
                                <td>${feria.funcionarioNome}</td>
                                <td>${feria.dataInicio}</td>
                                <td>${feria.dataFim}</td>

                                <td>
                                    <span class="badge ${feria.status}">
                                        ${feria.status}
                                    </span>
                                </td>

                                <td class="table-actions-cell">
                                    <c:if test="${feria.status == 'PENDENTE'}">
                                        <form action="/atualizar-status-ferias"
                                              method="POST"
                                              style="display: inline;">

                                            <input type="hidden"
                                                   name="id"
                                                   value="${feria.id}">

                                            <input type="hidden"
                                                   name="status"
                                                   value="APROVADA">

                                            <button type="submit"
                                                    style="background-color: #28a745; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer;">
                                                Aprovar
                                            </button>
                                        </form>

                                        <form action="/atualizar-status-ferias"
                                              method="POST"
                                              style="display: inline;">

                                            <input type="hidden"
                                                   name="id"
                                                   value="${feria.id}">

                                            <input type="hidden"
                                                   name="status"
                                                   value="REJEITADA">

                                            <button type="submit"
                                                    style="background-color: #dc3545; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer; margin-left: 5px;">
                                                Rejeitar
                                            </button>
                                        </form>
                                    </c:if>
                                </td>
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