<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/pages/dashboard/dashboard.css">
    <link rel="stylesheet" href="/pages/cadastroFuncionarios/cadastroFunc.css">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <title>Funcionários - Sistema</title>
</head>
<body>
    <div class="app-container">
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
                    <li class="active"><a href="http://localhost:8080/encontrar-funcionarios"><i class="ph ph-users"></i> Funcionários</a></li>
                    <li><a href="http://localhost:8080/encontrar-departamentos"><i class="ph ph-buildings"></i> Departamentos</a></li>
                    <li><a href="http://localhost:8080/encontrar-cargos"><i class="ph ph-briefcase"></i> Cargos</a></li>
                    <li><a href="http://localhost:8080/encontrar-pontos"><i class="ph ph-clock"></i> Ponto</a></li>
                    <li><a href="http://localhost:8080/encontrar-ferias"><i class="ph ph-airplane-tilt"></i> Férias</a></li>
                </ul>
            </nav>
            <div class="sidebar-footer">
                <a href="/logout" class="logout-btn">
                    <i class="ph ph-sign-out"></i> Sair
                </a>
            </div>
        </aside>

        <main class="main-content">
            <header class="top-header">
                <div class="title-area">
                    <h1>Funcionários</h1>
                    <p>Gestão e cadastro de colaboradores da empresa</p>
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

            <section class="rightside">
                <form class="form-cadastro" action="/create-funcionario" method="post">
                    <input type="hidden" name="id" value="${param.id}">

                    <div class="cabecalho-form">
                        <div class="titulo-form">
                            <i class="ph ph-user-plus"></i>
                            <div>
                                <h3>${empty param.id ? 'Cadastrar Novo Funcionário' : 'Editar Funcionário'}</h3>
                                <p>Preencha os dados contratuais e funcionais do novo colaborador</p>
                            </div>
                        </div>
                        <span class="rotulo-form">Formulário de ingresso</span>
                    </div>

                    <div class="input-row">
                        <div class="input-card">
                            <label>ID (Automático)</label>
                            <input type="text" value="${empty param.id ? 'Automático' : param.id}" readonly>
                        </div>
                        <div class="input-card input-card-largo">
                            <label>Nome Completo</label>
                            <input type="text" id="nome" name="nome" placeholder="Ex: pedro gameplays" value="${param.nome}" required>
                        </div>
                        <div class="input-card">
                            <label>CPF</label>
                            <input id="cpf" name="cpf" placeholder="Ex: 000.000.000-00" value="${param.cpf}" required>
                        </div>
                    </div>

                    <div class="input-row">
                        <div class="input-card">
                            <label>Email</label>
                            <input type= "email" name="email" placeholder="Ex: colaborador@empresa.com" id="email" value="${param.email}" required>
                        </div>
                        <div class="input-card">
                            <label> ${empty param.id ? 'Senha' : ''} </label>
                            <input name="senha" type="${empty param.id ? 'password' : 'hidden'}" id="senha" ${empty param.id ? 'required' : ''}>
                        </div>
                        <div class="input-card">
                            <label>Telefone</label>
                            <input name="telefone" id="telefone" placeholder="Ex: (11) 98765-4321" value="${param.telefone}" required>
                        </div>
                    </div>

                    <div class="input-row">
                        <div class="input-card">
                            <label>Data de Nascimento</label>
                            <input name="dataNascimento" id="dataNascimento" type="date" value="${param.dataNascimento}" required>
                        </div>
                        <div class="input-card">
                            <label>Data de Contratação</label>
                            <input name="dataContratacao" id="dataContratacao" type="date" value="${param.dataContratacao}" required>
                        </div>
                        <div class="input-card">
                            <label>Cargo</label>
                            <select name="cargoId" id="cargoId">
                                <c:forEach var="cargo" items="${cargos}">
                                    <option value="${cargo.id}" ${param.cargoId == cargo.id ? 'selected' : ''}>${cargo.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="input-card">
                            <label>Departamento</label>
                            <select name="departamentoId" id="departamentoId">
                                <c:forEach var="departamento" items="${departamentos}">
                                    <option value="${departamento.id}" ${param.departamentoId == departamento.id ? 'selected' : ''}>${departamento.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="input-row">
                        <div class="input-card">
                            <label>Status</label>
                            <select name="status" id="status">
                                <option value="ATIVO" ${param.status == 'ATIVO' ? 'selected' : ''}>Ativo</option>
                                <option value="INATIVO" ${param.status == 'INATIVO' ? 'selected' : ''}>Inativo</option>
                            </select>
                        </div>
                        <div class="input-card">
                            <label>Perfil</label>
                            <select name="perfil" id="perfil">
                            <option value="FUNCIONARIO" ${param.perfil == "FUNCIONARIO" ? 'selected' : ''}>FUNCIONARIO</option>
                                <option value="ADMIN" ${param.perfil == "ADMIN" ? 'selected' : ''}>ADMIN</option>

                            </select>
                        </div>
                    </div>

                    <div class="form-buttons">
                        <button onclick="window.location.href='/encontrar-funcionarios'" type="reset"><i class="ph ph-arrow-counter-clockwise"></i> Cancelar</button>
                        <button type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 12 12" fill="none">
                                <path d="M5.01667 8.51667L9.12917 4.40417L8.3125 3.5875L5.01667 6.88333L3.35417 5.22083L2.5375 6.0375L5.01667 8.51667V8.51667M5.83333 11.6667C5.02639 11.6667 4.26806 11.5135 3.55833 11.2073C2.84861 10.901 2.23125 10.4854 1.70625 9.96042C1.18125 9.43542 0.765625 8.81806 0.459375 8.10833C0.153125 7.39861 0 6.64028 0 5.83333C0 5.02639 0.153125 4.26806 0.459375 3.55833C0.765625 2.84861 1.18125 2.23125 1.70625 1.70625C2.23125 1.18125 2.84861 0.765625 3.55833 0.459375C4.26806 0.153125 5.02639 0 5.83333 0C6.64028 0 7.39861 0.153125 8.10833 0.459375C8.81806 0.765625 9.43542 1.18125 9.96042 1.70625C10.4854 2.23125 10.901 2.84861 11.2073 3.55833C11.5135 4.26806 11.6667 5.02639 11.6667 5.83333C11.6667 6.64028 11.5135 7.39861 11.2073 8.10833C10.901 8.81806 10.4854 9.43542 9.96042 9.96042C9.43542 10.4854 8.81806 10.901 8.10833 11.2073C7.39861 11.5135 6.64028 11.6667 5.83333 11.6667V11.6667M5.83333 10.5C7.13611 10.5 8.23958 10.0479 9.14375 9.14375C10.0479 8.23958 10.5 7.13611 10.5 5.83333C10.5 4.53056 10.0479 3.42708 9.14375 2.52292C8.23958 1.61875 7.13611 1.16667 5.83333 1.16667C4.53056 1.16667 3.42708 1.61875 2.52292 2.52292C1.61875 3.42708 1.16667 4.53056 1.16667 5.83333C1.16667 7.13611 1.61875 8.23958 2.52292 9.14375C3.42708 10.0479 4.53056 10.5 5.83333 10.5V10.5M5.83333 5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333" fill="#FFEFF1" />
                            </svg>
                            ${empty param.id ? 'Cadastrar' : 'Salvar alterações'}
                        </button>
                    </div>
                </form>

                <section class="areaLista">
                    <div class="input-row cabecalho-lista">
                        <div class="titulo-lista">
                            <h3>Lista de Funcionários</h3>
                            <span>${fn:length(funcionarios)} cadastrados</span>
                        </div>

                        <form action="/encontrar-funcionarios-nome" method="get">
                            <div class="input-pesquisar" ><input name="nomeBusca" value="${param.nomeBusca}"  placeholder="Buscar por nome"> <button type="submit" class="botao-pesquisar"> <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 14 14" fill="none">
                                                                                                                               <path d="M12.45 13.5L7.725 8.775C7.35 9.075 6.91875 9.3125 6.43125 9.4875C5.94375 9.6625 5.425 9.75 4.875 9.75C3.5125 9.75 2.35938 9.27813 1.41562 8.33438C0.471875 7.39063 0 6.2375 0 4.875C0 3.5125 0.471875 2.35938 1.41562 1.41562C2.35938 0.471875 3.5125 0 4.875 0C6.2375 0 7.39063 0.471875 8.33438 1.41562C9.27813 2.35938 9.75 3.5125 9.75 4.875C9.75 5.425 9.6625 5.94375 9.4875 6.43125C9.3125 6.91875 9.075 7.35 8.775 7.725L13.5 12.45L12.45 13.5V13.5M4.875 8.25C5.8125 8.25 6.60938 7.92188 7.26562 7.26562C7.92188 6.60938 8.25 5.8125 8.25 4.875C8.25 3.9375 7.92188 3.14062 7.26562 2.48438C6.60938 1.82812 5.8125 1.5 4.875 1.5C3.9375 1.5 3.14062 1.82812 2.48438 2.48438C1.82812 3.14062 1.5 3.9375 1.5 4.875C1.5 5.8125 1.82812 6.60938 2.48438 7.26562C3.14062 7.92188 3.9375 8.25 4.875 8.25V8.25" fill="#1A2332"/>
                                                                                                                                </svg> </button> </div>
                        </form>
                    </div>

                    <!-- NOVA DIV PARA CONTER A LISTA E EVITAR O ESTOURO DA PÁGINA -->
                    <div class="lista-container">
                        <div class="legendaLista">
                            <p>AÇÕES</p>
                            <p>ID</p>
                            <p>NOME</p>
                            <p>CPF</p>
                            <p>E-MAIL</p>
                            <p>TELEFONE</p>
                            <p>NASCIMENTO</p>
                            <p>CONTRATAÇÃO</p>
                            <p>CARGO</p>
                            <p>DEPARTAMENTO</p>
                            <p>STATUS</p>
                        </div>

                        <c:forEach var="funcionario" items="${funcionarios}">
                            <div class="cardLista">
                                <div class="action">
                                    <a href="encontrar-funcionarios?id=${funcionario.id}&nome=${funcionario.nome}&cpf=${funcionario.cpf}&email=${funcionario.email}&telefone=${funcionario.telefone}&dataNascimento=${funcionario.dataNascimento}&dataContratacao=${funcionario.dataContratacao}&cargoId=${funcionario.cargoId}&departamentoId=${funcionario.departamentoId}&status=${funcionario.status}&perfil=${funcionario.perfil}">
                                        <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M1.5 12H2.56875L9.9 4.66875L8.83125 3.6L1.5 10.9312V12V12M0 13.5V10.3125L9.9 0.43125C10.05 0.29375 10.2156 0.1875 10.3969 0.1125C10.5781 0.0375 10.7688 0 10.9688 0C11.1687 0 11.3625 0.0375 11.55 0.1125C11.7375 0.1875 11.9 0.3 12.0375 0.45L13.0688 1.5C13.2188 1.6375 13.3281 1.8 13.3969 1.9875C13.4656 2.175 13.5 2.3625 13.5 2.55C13.5 2.75 13.4656 2.94062 13.3969 3.12188C13.3281 3.30313 13.2188 3.46875 13.0688 3.61875L3.1875 13.5H0V13.5M12 2.55V2.55L10.95 1.5V1.5L12 2.55V2.55M9.35625 4.14375L8.83125 3.6V3.6L9.9 4.66875V4.66875L9.35625 4.14375V4.14375" fill="#94A3B8"/>
                                        </svg>
                                    </a>
                                    <form action="/delete-funcionario" method="post" onsubmit="return confirm('Tem certeza que deseja excluir este funcionário?');">
                                        <input type="hidden" name="id" value="${funcionario.id}">
                                        <button type="submit">
                                            <svg width="12" height="14" viewBox="0 0 12 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M2.25 13.5C1.8375 13.5 1.48438 13.3531 1.19062 13.0594C0.896875 12.7656 0.75 12.4125 0.75 12V2.25H0V0.75H3.75V0H8.25V0.75H12V2.25H11.25V12C11.25 12.4125 11.1031 12.7656 10.8094 13.0594C10.5156 13.3531 10.1625 13.5 9.75 13.5H2.25V13.5M9.75 2.25H2.25V12V12V12H9.75V12V12V2.25V2.25M3.75 10.5H5.25V3.75H3.75V10.5V10.5M6.75 10.5H8.25V3.75H6.75V10.5V10.5M2.25 2.25V2.25V12V12V12V12V12V12V2.25V2.25" fill="#94A3B8"/>
                                            </svg>
                                        </button>
                                    </form>
                                </div>
                                <p>${funcionario.id} </p>
                                <p>${funcionario.nome}</p>
                                <p>${funcionario.cpf}</p>
                                <p>${funcionario.email}</p>
                                <p>${funcionario.telefone}</p>
                                <p>${funcionario.dataNascimento}</p>
                                <p>${funcionario.dataContratacao}</p>
                                <p>${funcionario.cargoNome}</p>
                                <p>${funcionario.departamentoNome}</p>
                                <p>${funcionario.status}</p>
                            </div>
                        </c:forEach>
                    </div>
                </section>
            </section>
        </main>
    </div>
</body>
</html>
