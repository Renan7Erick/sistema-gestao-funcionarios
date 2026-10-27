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




                        <label for="nome-cargo">NOME DO CARGO <span class="obrigatorio">*</span></label>
                        <input type="text" id="nome-cargo" name="nome" placeholder="Ex: Desenvolvedor, Analista Financeiro" required>

                        <label for="nivel-cargo">NÍVEL <span class="obrigatorio">*</span></label>
                        <select id="nivel-cargo" name="nivel" required>
                            <option value="">Selecione a senioridade</option>
                            <option value="JUNIOR">Júnior</option>
                            <option value="PLENO">Pleno</option>
                            <option value="SENIOR">Sênior</option>
                        </select>

                        <label for="departamento-cargo">DEPARTAMENTO (DEPARTAMENTO_ID) <span class="obrigatorio">*</span></label>
                        <select id="departamento-cargo" name="departamento_id" required>
                            <option value="">Selecione um departamento</option>
                            <option value="1">Administrativo</option>
                            <option value="2">Financeiro</option>
                            <option value="3">TI</option>
                            <option value="4">RH</option>
                            <option value="5">Comercial</option>
                        </select>


                        <div id="botoes-formulario">
                            <button type="reset" id="botao-limpar">Limpar</button>
                            <button type="submit" id="botao-cadastrar">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <path d="M12 5v14M5 12h14"/>
                                </svg>
                                Cadastrar Cargo
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
                            </tr>
                        </thead>
                        <tbody>
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
                                       </tr>
                                   </c:forEach>

                                   <c:if test="${empty cargos}">
                                       <tr><td colspan="4">Nenhum cargo cadastrado.</td></tr>
                                   </c:if>
                        </tbody>
                    </table>

                    

                </div>

            </div>
        </div>
    </div>

</body>
</html>
