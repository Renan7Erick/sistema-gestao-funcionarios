<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/pages/cadastroFuncionarios/cadastroFunc.css">
    <title>Document</title>
</head>

<body>
    <main>

        <div id="menu-lateral">

            <div id="menu-topo">
                <div id="logo">
                    <div id="logo-icone">
                        <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="4" y="2" width="16" height="20" rx="2"/>
                            <path d="M9 22v-4h6v4"/>
                            <path d="M8 6h.01M12 6h.01M16 6h.01M8 10h.01M12 10h.01M16 10h.01M8 14h.01M12 14h.01M16 14h.01"/>
                        </svg>
                    </div>
                    <div id="logo-texto">
                        <span id="logo-titulo">SISTEMA</span>
                        <span id="logo-subtitulo">FUNCIONÁRIOS</span>
                    </div>
                </div>

                <ul id="menu">
                    <li><a href="http://localhost:8080/pages/dashboard/dashboard.html">Dashboard</a></li>
                    <li><a href="http://localhost:8080/encontrar-funcionarios" class="ativo">Funcionários</a></li>
                    <li><a href="http://localhost:8080/pages/departamentos/departamentos.html">Departamentos</a></li>
                    <li><a href="http://localhost:8080/encontrar-cargos">Cargos</a></li>
                    <li><a href="../ponto/ponto.html">Ponto</a></li>
                    <li><a href="../ferias/ferias.html">Férias</a></li>
                </ul>
            </div>

            <div id="area-sair">
                <a href="../../index.html" id="link-sair">Sair</a>
            </div>

        </div>



        <section class="rightside">

            <form class="form-cadastro" action="/create-funcionario" method="post">

                <input type="hidden" name="id" value="${param.id}">

                <div class="input-row">





                    <div class="input-card">
                        <label>Nome Completo</label>
                        <input type="text" id="nome" name="nome" placeholder="Ex: pedro gameplays" value="${param.nome}" required>
                    </div>


                    <div class="input-card">
                        <label>CPF</label>
                        <input id="cpf" name="cpf" placeholder="Ex: 000.000.000-00"  value="${param.cpf}" required>
                    </div>


                </div>

                <div class="input-row">


                    <div class="input-card">
                        <label>Email</label>
                        <input name="email" placeholder="Ex: colaborador@empresa.com" id="email" value="${param.email}" required>
                    </div>

                    <div class="input-card">
                        <label>Senha</label>
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
                        <input name="dataContratacao" id="dataContratacao"  type="date"  value="${param.dataContratacao}" required>
                    </div>




                    <div class="input-card">
                        <label>Cargo</label>
                        <div class="input-div">
                            <select name="cargoId" id="cargoId">
                                <c:forEach var="cargo" items="${cargos}">
                                    <option value="${cargo.id}" ${param.cargoId == cargo.id ? 'selected' : ''}>${cargo.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>



                    <div class="input-card">
                        <label>Departamento</label>
                        <div class="input-div">
                            <select name="departamentoId" id="departamentoId">
                                <c:forEach var="departamento" items="${departamentos}">
                                    <option value="${departamento.id}" ${param.departamentoId == departamento.id ? 'selected' : ''}>${departamento.nome}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                </div>


                <div class="input-row">


                <div class="input-card">
                    <label>Status</label>
                    <div class="input-div">
                        <select name="status" id="status">
                            <option value="ATIVO" ${param.status == 'ATIVO' ? 'selected' : ''}>Ativo</option>
                            <option value="INATIVO" ${param.status == 'INATIVO' ? 'selected' : ''}>Inativo</option>
                        </select>
                    </div>
                </div>

                    <div class="input-card">
                        <label>Perfil</label>
                        <div class="input-div">
                            <select name="perfil" id="perfil">
                                <option value="ADMIN">ADMIN</option>
                                <option VALUE="FUNCIONARIO">FUNCIONARIO</option>
                            </select>
                        </div>
                    </div>

                </div>



                <div class="form-buttons">
                    <button type="reset">Cancelar</button>
                    <button type="submit"> ${empty param.id ? 'Cadastrar' : 'Salvar alterações'} <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                            viewBox="0 0 12 12" fill="none">
                            <path
                                d="M5.01667 8.51667L9.12917 4.40417L8.3125 3.5875L5.01667 6.88333L3.35417 5.22083L2.5375 6.0375L5.01667 8.51667V8.51667M5.83333 11.6667C5.02639 11.6667 4.26806 11.5135 3.55833 11.2073C2.84861 10.901 2.23125 10.4854 1.70625 9.96042C1.18125 9.43542 0.765625 8.81806 0.459375 8.10833C0.153125 7.39861 0 6.64028 0 5.83333C0 5.02639 0.153125 4.26806 0.459375 3.55833C0.765625 2.84861 1.18125 2.23125 1.70625 1.70625C2.23125 1.18125 2.84861 0.765625 3.55833 0.459375C4.26806 0.153125 5.02639 0 5.83333 0C6.64028 0 7.39861 0.153125 8.10833 0.459375C8.81806 0.765625 9.43542 1.18125 9.96042 1.70625C10.4854 2.23125 10.901 2.84861 11.2073 3.55833C11.5135 4.26806 11.6667 5.02639 11.6667 5.83333C11.6667 6.64028 11.5135 7.39861 11.2073 8.10833C10.901 8.81806 10.4854 9.43542 9.96042 9.96042C9.43542 10.4854 8.81806 10.901 8.10833 11.2073C7.39861 11.5135 6.64028 11.6667 5.83333 11.6667V11.6667M5.83333 10.5C7.13611 10.5 8.23958 10.0479 9.14375 9.14375C10.0479 8.23958 10.5 7.13611 10.5 5.83333C10.5 4.53056 10.0479 3.42708 9.14375 2.52292C8.23958 1.61875 7.13611 1.16667 5.83333 1.16667C4.53056 1.16667 3.42708 1.61875 2.52292 2.52292C1.61875 3.42708 1.16667 4.53056 1.16667 5.83333C1.16667 7.13611 1.61875 8.23958 2.52292 9.14375C3.42708 10.0479 4.53056 10.5 5.83333 10.5V10.5M5.83333 5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333"
                                fill="#FFEFF1" />
                        </svg> </button>

                </div>


            </form>

             <section class="areaLista">




            
            <div class="input-row">
                
                <div class="input-card"><input placeholder="Buscar por nome, cargo ou matrícula"></div>
                
                <div class="input-card">
                    
                        <select id="departamento">
                                <option value="1">Administrativo</option>
                                <option value="2">Financeiro</option>
                                <option value="3">TI</option>
                                <option value="4">RH</option>
                                <option value="5">Comercial</option>
                            </select>

                    </div>

                    

                </div>


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

                        <div class="action" > <a href="encontrar-funcionarios?id=${funcionario.id}&nome=${funcionario.nome}&cpf=${funcionario.cpf}&email=${funcionario.email}&telefone=${funcionario.telefone}&dataNascimento=${funcionario.dataNascimento}&dataContratacao=${funcionario.dataContratacao}&cargoId=${funcionario.cargoId}&departamentoId=${funcionario.departamentoId}&status=${funcionario.status}&perfil=${funcionario.perfil}" ><svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M1.5 12H2.56875L9.9 4.66875L8.83125 3.6L1.5 10.9312V12V12M0 13.5V10.3125L9.9 0.43125C10.05 0.29375 10.2156 0.1875 10.3969 0.1125C10.5781 0.0375 10.7688 0 10.9688 0C11.1687 0 11.3625 0.0375 11.55 0.1125C11.7375 0.1875 11.9 0.3 12.0375 0.45L13.0688 1.5C13.2188 1.6375 13.3281 1.8 13.3969 1.9875C13.4656 2.175 13.5 2.3625 13.5 2.55C13.5 2.75 13.4656 2.94062 13.3969 3.12188C13.3281 3.30313 13.2188 3.46875 13.0688 3.61875L3.1875 13.5H0V13.5M12 2.55V2.55L10.95 1.5V1.5L12 2.55V2.55M9.35625 4.14375L8.83125 3.6V3.6L9.9 4.66875V4.66875L9.35625 4.14375V4.14375" fill="#94A3B8"/>
                        </svg></a>

                            <form action="/delete-funcionario" method="post">

                                <input type="hidden" name="id" value="${funcionario.id}" >
                         <button type="submit"><svg width="12" height="14" viewBox="0 0 12 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                             <path d="M2.25 13.5C1.8375 13.5 1.48438 13.3531 1.19062 13.0594C0.896875 12.7656 0.75 12.4125 0.75 12V2.25H0V0.75H3.75V0H8.25V0.75H12V2.25H11.25V12C11.25 12.4125 11.1031 12.7656 10.8094 13.0594C10.5156 13.3531 10.1625 13.5 9.75 13.5H2.25V13.5M9.75 2.25H2.25V12V12V12H9.75V12V12V2.25V2.25M3.75 10.5H5.25V3.75H3.75V10.5V10.5M6.75 10.5H8.25V3.75H6.75V10.5V10.5M2.25 2.25V2.25V12V12V12V12V12V12V2.25V2.25" fill="#94A3B8"/>
                         </svg></button>

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

                </section>


        </section>

    </main>



</body>

</html>