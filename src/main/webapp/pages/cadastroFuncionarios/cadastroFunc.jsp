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

        <section class="leftside">
            <section class="logo">
                <div class="fundoLogo">

                    <svg width="12" height="16" viewBox="0 0 12 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M1.5 0C1.08333 0.0208333 0.729167 0.166667 0.4375 0.4375C0.166667 0.729167 0.0208333 1.08333 0 1.5V14.5C0.0208333 14.9167 0.166667 15.2708 0.4375 15.5625C0.729167 15.8333 1.08333 15.9792 1.5 16H4.5V13.5C4.52083 13.0833 4.66667 12.7292 4.9375 12.4375C5.22917 12.1667 5.58333 12.0208 6 12C6.41667 12.0208 6.77083 12.1667 7.0625 12.4375C7.33333 12.7292 7.47917 13.0833 7.5 13.5V16H10.5C10.9167 15.9792 11.2708 15.8333 11.5625 15.5625C11.8333 15.2708 11.9792 14.9167 12 14.5V1.5C11.9792 1.08333 11.8333 0.729167 11.5625 0.4375C11.2708 0.166667 10.9167 0.0208333 10.5 0H1.5ZM2 7.5C2.02083 7.1875 2.1875 7.02083 2.5 7H3.5C3.8125 7.02083 3.97917 7.1875 4 7.5V8.5C3.97917 8.8125 3.8125 8.97917 3.5 9H2.5C2.1875 8.97917 2.02083 8.8125 2 8.5V7.5ZM5.5 7H6.5C6.8125 7.02083 6.97917 7.1875 7 7.5V8.5C6.97917 8.8125 6.8125 8.97917 6.5 9H5.5C5.1875 8.97917 5.02083 8.8125 5 8.5V7.5C5.02083 7.1875 5.1875 7.02083 5.5 7ZM8 7.5C8.02083 7.1875 8.1875 7.02083 8.5 7H9.5C9.8125 7.02083 9.97917 7.1875 10 7.5V8.5C9.97917 8.8125 9.8125 8.97917 9.5 9H8.5C8.1875 8.97917 8.02083 8.8125 8 8.5V7.5ZM2.5 3H3.5C3.8125 3.02083 3.97917 3.1875 4 3.5V4.5C3.97917 4.8125 3.8125 4.97917 3.5 5H2.5C2.1875 4.97917 2.02083 4.8125 2 4.5V3.5C2.02083 3.1875 2.1875 3.02083 2.5 3ZM5 3.5C5.02083 3.1875 5.1875 3.02083 5.5 3H6.5C6.8125 3.02083 6.97917 3.1875 7 3.5V4.5C6.97917 4.8125 6.8125 4.97917 6.5 5H5.5C5.1875 4.97917 5.02083 4.8125 5 4.5V3.5ZM8.5 3H9.5C9.8125 3.02083 9.97917 3.1875 10 3.5V4.5C9.97917 4.8125 9.8125 4.97917 9.5 5H8.5C8.1875 4.97917 8.02083 4.8125 8 4.5V3.5C8.02083 3.1875 8.1875 3.02083 8.5 3Z"
                            fill="white" />
                    </svg>

                </div>
                <h1>Sistema</h1>
                <p>Funcionários</p>
            </section>

            <hr>

            <section class="botoes">
                <button>📊 Meu perfil</button>
                <button>🕐 Meu Ponto</button>
                <button>🦥 Minhas Férias</button>
            </section>
        </section>

        <section class="rightside">

            <form action="/create-funcionario" method="post">

                <div class="input-row">





                    <div class="input-card">
                        <label>Nome Completo</label>
                        <input id="nome" name="nome" placeholder="Ex: pedro gameplays">
                    </div>


                    <div class="input-card">
                        <label>CPF</label>
                        <input id="cpf" name="cpf" placeholder="Ex: 000.000.000-00">
                    </div>


                </div>

                <div class="input-row">


                    <div class="input-card">
                        <label>Email</label>
                        <input name="email" placeholder="Ex: colaborador@empresa.com" id="email">
                    </div>

                    <div class="input-card">
                        <label>Senha</label>
                        <input name="senha" type="password" id="senha">
                    </div>

                    <div class="input-card">
                        <label>Telefone</label>
                        <input name="telefone" id="telefone" placeholder="Ex: (11) 98765-4321">
                    </div>

                </div>


                <div class="input-row">

                    <div class="input-card">
                        <label>Data de Nascimento</label>
                        <input name="dataNascimento" id="dataNascimento" type="date">
                    </div>

                    <div class="input-card">
                        <label>Data de Contratação</label>
                        <input name="dataContratacao" id="dataContratacao" type="date">
                    </div>




                    <div class="input-card">
                        <label>Cargo</label>
                        <div class="input-div">
                            <select name="cargoId" id="cargoId">
                                <option value="1">Analista Administrativo</option>
                                <option value="2">Analista Financeiro</option>
                                <option value="3">Desenvolvedor Backend</option>
                                <option value="4">Analista de RH</option>
                                <option value="5">Executivo de Vendas</option>
                            </select>
                        </div>
                    </div>



                    <div class="input-card">
                        <label>Departamento</label>
                        <div class="input-div">
                            <select name="departamentoId" id="departamentoId">
                                <option value="1">Administrativo</option>
                                <option value="2">Financeiro</option>
                                <option value="3">TI</option>
                                <option value="4">RH</option>
                                <option value="5">Comercial</option>
                            </select>
                        </div>
                    </div>

                </div>


                <div class="input-row">


                <div class="input-card">
                    <label>Status</label>
                    <div class="input-div">
                        <select name="status" id="status">
                            <option value="ATIVO">Ativo</option>
                            <option value="INATIVO">Inativo</option>

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
                    <button>Cancelar</button>
                    <button type="submit">Salvar Alterações <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12"
                            viewBox="0 0 12 12" fill="none">
                            <path
                                d="M5.01667 8.51667L9.12917 4.40417L8.3125 3.5875L5.01667 6.88333L3.35417 5.22083L2.5375 6.0375L5.01667 8.51667V8.51667M5.83333 11.6667C5.02639 11.6667 4.26806 11.5135 3.55833 11.2073C2.84861 10.901 2.23125 10.4854 1.70625 9.96042C1.18125 9.43542 0.765625 8.81806 0.459375 8.10833C0.153125 7.39861 0 6.64028 0 5.83333C0 5.02639 0.153125 4.26806 0.459375 3.55833C0.765625 2.84861 1.18125 2.23125 1.70625 1.70625C2.23125 1.18125 2.84861 0.765625 3.55833 0.459375C4.26806 0.153125 5.02639 0 5.83333 0C6.64028 0 7.39861 0.153125 8.10833 0.459375C8.81806 0.765625 9.43542 1.18125 9.96042 1.70625C10.4854 2.23125 10.901 2.84861 11.2073 3.55833C11.5135 4.26806 11.6667 5.02639 11.6667 5.83333C11.6667 6.64028 11.5135 7.39861 11.2073 8.10833C10.901 8.81806 10.4854 9.43542 9.96042 9.96042C9.43542 10.4854 8.81806 10.901 8.10833 11.2073C7.39861 11.5135 6.64028 11.6667 5.83333 11.6667V11.6667M5.83333 10.5C7.13611 10.5 8.23958 10.0479 9.14375 9.14375C10.0479 8.23958 10.5 7.13611 10.5 5.83333C10.5 4.53056 10.0479 3.42708 9.14375 2.52292C8.23958 1.61875 7.13611 1.16667 5.83333 1.16667C4.53056 1.16667 3.42708 1.61875 2.52292 2.52292C1.61875 3.42708 1.16667 4.53056 1.16667 5.83333C1.16667 7.13611 1.61875 8.23958 2.52292 9.14375C3.42708 10.0479 4.53056 10.5 5.83333 10.5V10.5M5.83333 5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333V5.83333"
                                fill="#FFEFF1" />
                        </svg></button>

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
                        <p>${funcionario.id}</p>
                        <p>${funcionario.nome}</p>
                        <p>${funcionario.cpf}</p>
                        <p>${funcionario.email}</p>
                        <p>${funcionario.telefone}</p>
                        <p>${funcionario.dataNascimento}</p>
                        <p>${funcionario.dataContratacao}</p>
                        <p>${funcionario.cargoId}</p>
                        <p>${funcionario.departamentoId}</p>
                        <p>${funcionario.status}</p>

                    </div>
                 </c:forEach>

                </section>


        </section>

    </main>



</body>

</html>