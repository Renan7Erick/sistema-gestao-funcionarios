<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cargos - Sistema Funcionários</title>
    <link rel="stylesheet" href="/pages/cargos/style.css">
</head>
<body>

    <!-- ========== MENU LATERAL ========== -->
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
                <li><a href="../dashboard/dashboard.html">Dashboard</a></li>
                <li><a href="../funcionarios/funcionarios.html">Funcionários</a></li>
                <li><a href="../departamentos/departamentos.html">Departamentos</a></li>
                <li><a href="cargos.html" class="ativo">Cargos</a></li>
                <li><a href="../ponto/ponto.html">Ponto</a></li>
                <li><a href="../ferias/ferias.html">Férias</a></li>
            </ul>
        </div>

        <div id="area-sair">
            <a href="../../index.html" id="link-sair">Sair</a>
        </div>

    </div>

    <!-- ========== CONTEÚDO ========== -->
    <div id="conteudo">

        <!-- Barra do topo -->
        <div id="barra-topo">
            <span id="titulo-topo">GESTÃO ORGANIZACIONAL</span>

            <div id="usuario-topo">
                <div id="dados-usuario">
                    <span id="nome-usuario">Administrador</span>
                    <span id="email-usuario">admin@empresa.com</span>
                </div>
                <div id="avatar">AD</div>
            </div>
        </div>

        <div id="area-pagina">

            <!-- Cabeçalho da página -->
            <div id="cabecalho-pagina">
                <div id="titulo-pagina">
                    <h1>Cargos <span class="selo">CADASTRO E GESTÃO DE CARGOS</span></h1>
                    <p id="descricao-pagina">Definição de funções, níveis hierárquicos e alocação por departamento.</p>
                </div>

                <div id="resumos">
                    <div class="caixa-resumo">
                        <div class="icone-resumo">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="2" y="5" width="20" height="14" rx="2"/>
                                <circle cx="9" cy="11" r="2"/>
                                <path d="M6 16c.5-1.5 1.5-2 3-2s2.5.5 3 2M15 10h4M15 14h4"/>
                            </svg>
                        </div>
                        <div>
                            <span class="resumo-rotulo">Total</span>
                            <span class="resumo-valor">12 Cargos</span>
                        </div>
                    </div>

                    <div class="caixa-resumo">
                        <div class="icone-resumo">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="m12 2 10 5-10 5L2 7z"/>
                                <path d="m2 17 10 5 10-5"/>
                                <path d="m2 12 10 5 10-5"/>
                            </svg>
                        </div>
                        <div>
                            <span class="resumo-rotulo">Níveis</span>
                            <span class="resumo-valor">3 (Jr, Pl, Sr)</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Duas colunas: formulário e tabela -->
            <div id="colunas">

                <!-- ===== FORMULÁRIO ===== -->
                <div id="cartao-formulario" class="cartao">

                    <div class="topo-cartao">
                        <div class="icone-escuro">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="2" y="7" width="20" height="14" rx="2"/>
                                <path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/>
                            </svg>
                        </div>
                        <div class="texto-topo-cartao">
                            <h2>Novo Cargo</h2>
                            <p>Cadastre uma nova função na empresa</p>
                        </div>
                        <span class="selo">CADASTRAR</span>
                    </div>

                    <form id="form-cargo" action="/create-cargo" method="post">

                        <input type="hidden" id="id" name="id" value="${param.id}">




                        <label for="nome-cargo">NOME DO CARGO <span class="obrigatorio">*</span></label>
                        <input type="text" id="nome-cargo" name="nome" placeholder="Ex: Desenvolvedor, Analista Financeiro" value="${param.nome}" required>

                        <label for="nivel-cargo">NÍVEL <span class="obrigatorio">*</span></label>
                        <select id="nivel-cargo" name="nivel" required>
                            <option value="">Selecione a senioridade</option>
                            <option value="JUNIOR" ${param.nivel == 'JUNIOR' ? 'selected' : ''}>Júnior</option>
                            <option value="PLENO" ${param.nivel == 'PLENO' ? 'selected' : ''}>Pleno</option>
                            <option value="SENIOR" ${param.nivel == 'SENIOR' ? 'selected' : ''}>Sênior</option>
                        </select>

                        <label for="departamento-cargo">DEPARTAMENTO (DEPARTAMENTO_ID) <span class="obrigatorio">*</span></label>
                        <select id="departamento-cargo" name="departamento_id" required>
                            <option value="">Selecione um departamento</option>
                            <option value="1" ${param.departamento_id == '1' ? 'selected' : ''}>Administrativo</option>
                            <option value="2" ${param.departamento_id == '2' ? 'selected' : ''}>Financeiro</option>
                            <option value="3" ${param.departamento_id == '3' ? 'selected' : ''}>TI</option>
                            <option value="4" ${param.departamento_id == '4' ? 'selected' : ''}>RH</option>
                            <option value="5" ${param.departamento_id == '5' ? 'selected' : ''}>Comercial</option>
                        </select>


                        <div id="botoes-formulario">
                            <button type="reset" id="botao-limpar">Limpar</button>
                            <button type="submit" id="botao-cadastrar">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M12 5v14M5 12h14"/>
                                </svg>
                                ${empty param.id ? 'Cadastrar Cargo' : 'Salvar Alterações'}
                            </button>
                        </div>

                    </form>
                </div>

                <!-- ===== TABELA ===== -->
                <div id="cartao-tabela" class="cartao">

                    <div class="topo-cartao">
                        <div class="icone-claro">
                            <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="3" width="18" height="18" rx="2"/>
                                <path d="M3 9h18M3 15h18M9 3v18"/>
                            </svg>
                        </div>
                        <div class="texto-topo-cartao">
                            <h2>Cargos Cadastrados</h2>
                            <p>Visão geral de funções e departamentos associados</p>
                        </div>
                        
                    </div>



                    <table id="tabela-cargos">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>CARGO / FUNÇÃO</th>
                                <th>NÍVEL</th>
                                <th>DEPARTAMENTO</th>
                                <th>Ações</th>
                            </tr>
                        </thead>
                        <<tbody>
                             <c:forEach var="cargo" items="${cargos}">
                                 <tr>
                                     <td class="coluna-id">#${cargo.id}</td>
                                     <td>
                                         <div class="nome-cargo">
                                             <div class="icone-cargo">
                                                 <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                     <rect x="2" y="7" width="20" height="14" rx="2"/>
                                                     <path d="M16 7V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v2"/>
                                                 </svg>
                                             </div>
                                             <span><c:out value="${cargo.nome}"/></span>
                                         </div>
                                     </td>
                                     <td><span class="nivel">${cargo.nivel}</span></td>
                                     <td>
                                         <span class="departamento">
                                             <span class="bolinha cor-azul"></span><c:out value="${cargo.departamentoNome}"/>
                                         </span>
                                     </td>
                                     <td>
                                         <div class="acoes">
                                             <!-- Editar -->
                                             <a href = "/encontrar-cargos?id=${cargo.id}&nome=${cargo.nome}&nivel=${cargo.nivel}&departamento_id=${cargo.departamentoId}"
                                                class="btn-acao btn-editar" title="Editar cargo">
                                                 <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                                     <path d="M12 20h9"/>
                                                     <path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"/>
                                                 </svg>
                                             </a>

                                             <!-- Deletar -->
                                             <form action="/delete-cargo" method="post"
                                                   onsubmit="return confirm('Tem certeza que deseja excluir este cargo?');">
                                                 <input type="hidden" name="id" value="${cargo.id}">
                                                 <button type="submit" class="btn-acao btn-deletar" title="Excluir cargo">
                                                     <svg width="12" height="14" viewBox="0 0 12 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                         <path d="M2.25 13.5C1.8375 13.5 1.48438 13.3531 1.19062 13.0594C0.896875 12.7656 0.75 12.4125 0.75 12V2.25H0V0.75H3.75V0H8.25V0.75H12V2.25H11.25V12C11.25 12.4125 11.1031 12.7656 10.8094 13.0594C10.5156 13.3531 10.1625 13.5 9.75 13.5H2.25V13.5M9.75 2.25H2.25V12V12V12H9.75V12V12V2.25V2.25M3.75 10.5H5.25V3.75H3.75V10.5V10.5M6.75 10.5H8.25V3.75H6.75V10.5V10.5M2.25 2.25V2.25V12V12V12V12V12V12V2.25V2.25" fill="#94A3B8"/>
                                                     </svg>
                                                 </button>
                                             </form>
                                         </div>
                                     </td>
                                 </tr>
                             </c:forEach>

                             <c:if test="${empty cargos}">
                                 <tr><td colspan="5">Nenhum cargo cadastrado.</td></tr>
                             </c:if>
                         </tbody>
                    </table>

                    

                </div>

            </div>
        </div>
    </div>

</body>
</html>
