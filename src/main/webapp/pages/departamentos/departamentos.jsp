<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                <li>
                    <a href="/encontrar-dashboard"><i class="ph ph-chart-bar"></i> Dashboard</a>
                </li>
                <li>
                    <a href="/encontrar-funcionarios"><i class="ph ph-users"></i> Funcionários</a>
                </li>
                <!-- A classe 'active' mantém o botão destacado -->
                <li class="active">
                    <a href="/encontrar-departamentos"><i class="ph ph-buildings"></i> Departamentos</a>
                </li>
                <li>
                    <a href="/encontrar-cargos"><i class="ph ph-briefcase"></i> Cargos</a>
                </li>
                <li>
                    <a href="#"><i class="ph ph-clock"></i> Ponto</a>
                </li>
                <li>
                    <a href="#"><i class="ph ph-airplane-tilt"></i> Férias</a>
                </li>
                <li>
                    <a href="#"><i class="ph ph-user"></i> Usuários</a>
                </li>
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
                <div class="stat-pill"><i class="ph ph-buildings"></i> Total: <strong>6</strong></div>
                <div class="stat-pill"><i class="ph ph-users"></i> Colaboradores: <strong>128</strong></div>
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

                    <div class="input-group">
                        <label>NOME DO DEPARTAMENTO <span class="required">*Obrigatório</span></label>
                        <input type="text" name="nome" placeholder="Ex: Comercial, Marketing, Suporte" required>
                    </div>

                    <div class="info-box">
                        <i class="ph ph-info"></i>
                        <p>Ao cadastrar um novo departamento, ele ficará disponível imediatamente para alocação de
                            cargos e novos colaboradores no sistema.</p>
                    </div>

                    <div class="form-actions">
                        <button type="button" class="btn-limpar"><i class="ph ph-eraser"></i> Limpar</button>
                        <button type="submit" class="btn-submit"><i class="ph ph-plus"></i> Cadastrar Departamento
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
                                    <td><i class="ph ph-users"></i> - </td>
                                    <td><span class="status-badge"><span class="dot"></span> Ativo</span></td>
                                    <td style="display:flex; gap: 8px;">

                                        <!-- Botão de Editar com Prompt nativo do navegador -->
                                        <button class="icon-btn" onclick="let novoNome = prompt('Editar nome do departamento:', '${departamento.nome}'); if(novoNome && novoNome.trim() !== '') { document.getElementById('form-edit-${departamento.id}').nome.value = novoNome; document.getElementById('form-edit-${departamento.id}').submit(); }"><i class="ph ph-pencil-simple"></i></button>

                                        <!-- Formulário invisível para enviar a requisição POST de Update -->
                                        <form id="form-edit-${departamento.id}" action="/update-departamento" method="POST" style="display:none;">
                                            <input type="hidden" name="id" value="${departamento.id}">
                                            <input type="hidden" name="nome" value="">
                                        </form>

                                        <!-- Formulário visível apenas como botão para o POST de Delete -->
                                        <form action="/delete-departamento" method="POST" style="margin: 0;">
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