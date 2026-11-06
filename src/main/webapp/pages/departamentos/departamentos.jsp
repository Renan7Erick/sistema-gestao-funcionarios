<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Departamentos - Sistema de Funcionários</title>
    <!-- Liga o ficheiro CSS com caminho absoluto para funcionar com o Servlet -->
    <link rel="stylesheet" href="/pages/departamentos/departamentos.css">
    <!-- Importa ícones da biblioteca Phosphor Icons -->
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
</head>
<body>
<div class="app-container">

    <!-- ================= BARRA LATERAL (SIDEBAR) ================= -->
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
                <li><a href="http://localhost:8080/encontrar-dashboard">Dashboard</a></li>
                <li><a href="http://localhost:8080/encontrar-funcionarios">Funcionários</a></li>
                <li><a class="active" href="http://localhost:8080/encontrar-departamentos">Departamentos</a></li>
                <li><a href="http://localhost:8080/encontrar-cargos">Cargos</a></li>
                <li><a href="http://localhost:8080/encontrar-pontos">Ponto</a></li>
                <li><a href="http://localhost:8080/encontrar-ferias">Férias</a></li>

            </ul>
        </nav>

        <div class="sidebar-footer">
            <a href="../login/index.html" class="logout-btn">
                <i class="ph ph-sign-out"></i> Sair
            </a>
        </div>
    </aside>

    <!-- ================= ÁREA DE CONTEÚDO ================= -->
    <main class="main-content">

        <!-- Cabeçalho Superior -->
        <header class="top-header">
            <div class="breadcrumb">
                <span>PAINEL CORPORATIVO</span> / <strong>DEPARTAMENTOS</strong>
            </div>

            <div class="user-area">
                <div class="profile-text">
                    <strong>Administrador</strong>
                    <span>admin@sistema.corp</span>
                </div>
                <div class="avatar">
                    AD
                    <span class="status-dot"></span>
                </div>
            </div>
        </header>

        <!-- Título da Página e Indicadores -->
        <section class="page-heading">
            <div class="heading-title">
                <h1>Departamentos <span class="badge">Cadastro e Gestão de Departamentos</span></h1>
                <p>Estruturação de unidades corporativas, dimensionamento de equipes e controle departamental.</p>
            </div>
            <div class="heading-stats">

                <div class="stat-pill"><i class="ph ph-buildings"></i> Total: <strong>${fn:length(departamentos)}</strong></div>
                <div class="stat-pill"><i class="ph ph-users"></i> Colaboradores: <strong>${totalColaboradoresGeral}</strong></div>
            </div>
        </section>

        <!-- Área de Formulário e Tabela -->
        <section class="content-grid">

            <!-- COLUNA ESQUERDA: Formulário de Cadastro -->
            <div class="form-card">
                <div class="card-header-form">
                    <div class="form-icon">
                        <i class="ph-fill ph-plus-circle"></i>
                    </div>
                    <div>
                        <h3>Novo Departamento</h3>
                        <span>Cadastre uma nova unidade corporativa</span>
                    </div>
                    <button class="btn-cadastrar-top">CADASTRAR</button>
                </div>

                <form action="/create-departamento" method="POST">

                    <input type="hidden" name="id" value="<c:out value='${param.id}'/>">

                    <div class="input-group">
                        <label>NOME DO DEPARTAMENTO <span class="required">*Obrigatório</span></label>
                        <input type="text" name="nome" placeholder="Ex: Comercial, Marketing, Suporte" value="<c:out value='${param.nome}'/>" required>
                    </div>

                    <div class="info-box">
                        <i class="ph ph-info"></i>
                        <p>Ao cadastrar um novo departamento, ele ficará disponível imediatamente para alocação de
                            cargos e novos colaboradores no sistema.</p>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-limpar"><i class="ph ph-eraser"></i> Limpar</button>
                        <button type="submit" class="btn-submit"><i class="ph ph-plus"></i> ${empty param.id ? 'Cadastrar Departamento' : 'Salvar Alterações'}
                        </button>
                    </div>
                </form>
            </div>

            <!-- COLUNA DIREITA: Tabela de Departamentos -->
            <div class="table-card">
                <div class="table-header-card">
                    <div class="table-title-area">
                        <i class="ph ph-list-bullets"></i>
                        <div>
                            <h3>Departamentos Cadastrados</h3>
                            <p>Visão consolidada de todas as divisões ativas</p>
                        </div>
                    </div>
                    <div class="table-actions">
                        <div class="search-box">
                            <i class="ph ph-magnifying-glass"></i>
                            <input type="text" placeholder="Buscar departamento...">
                        </div>
                        <button class="btn-action"><i class="ph ph-arrows-clockwise"></i> Atualizar</button>
                        <button class="btn-action"><i class="ph ph-export"></i> Exportar</button>
                    </div>
                </div>

                <div class="table-responsive">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NOME DO DEPARTAMENTO</th>
                                <th>TOTAL DE COLABORADORES</th>
                                <th>STATUS</th>
                                <th>AÇÕES</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="departamento" items="${departamentos}">
                                <tr>
                                    <td><span class="id-tag">#${departamento.id}</span></td>
                                    <td>
                                        <div class="dep-info">
                                            <i class="ph ph-buildings"></i>
                                            <div>
                                                <strong>${departamento.nome}</strong>
                                            </div>
                                        </div>
                                    </td>
                                    <td><i class="ph ph-users"></i> ${departamento.totalColaboradores} Colaboradores</td>
                                    <td><span class="status-badge"><span class="dot"></span> Ativo</span></td>
                                    <td style="display:flex; gap: 8px;">

                                        <c:url var="urlEditar" value="/encontrar-departamentos">
                                            <c:param name="id" value="${departamento.id}"/>
                                            <c:param name="nome" value="${departamento.nome}"/>
                                        </c:url>
                                        <button type="button" class="icon-btn" title="Editar" onclick="window.location.href='${urlEditar}'"><i class="ph ph-pencil-simple"></i></button>

                                        <!-- Formulário de Delete com confirmação em JavaScript -->
                                        <form action="/delete-departamento" method="POST" style="margin: 0;" onsubmit="return confirm('Tem certeza que deseja excluir o departamento ${departamento.nome}? Esta ação não pode ser desfeita.');">
                                            <input type="hidden" name="id" value="${departamento.id}">
                                            <button type="submit" class="icon-btn" title="Deletar"><i class="ph ph-trash"></i></button>
                                        </form>

                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- Mensagem amigável caso a tabela esteja vazia -->
                            <c:if test="${empty departamentos}">
                                <tr>
                                    <td colspan="5" style="text-align: center; padding: 20px;">Nenhum departamento cadastrado.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="table-footer">
                    <span>Mostrando <strong>6</strong> de <strong>6</strong> departamentos</span>
                    <div class="pagination">
                        <button class="page-btn" disabled>Anterior</button>
                        <button class="page-btn active">1</button>
                        <button class="page-btn" disabled>Próximo</button>
                    </div>
                </div>
            </div>

        </section>
    </main>
</div>
</body>
</html>