<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Minhas Férias</title>
    <!-- Rota do CSS corrigida com caminho absoluto -->
    <link rel="stylesheet" href="/pages/areaFuncionarios/minhasFerias/minhasFerias.css">
</head>
<body>

<aside class="sidebar">
    <div>
        <div class="logo">
            <div class="logo-icone">❖</div>
            <div class="logo-texto">
                <strong>SISTEMA</strong>
                <span>FUNCIONÁRIOS</span>
            </div>
        </div>

        <ul class="menu">
            <li><a href="/funcionario/meu-perfil">Meu Perfil</a></li>
            <li><a href="/funcionario/meu-ponto">Meu Ponto</a></li>
            <li><a href="/funcionario/minhas-ferias" class="ativo">Minhas Férias</a></li>
        </ul>
    </div>

    <a href="/logout" class="sair">Sair</a>
</aside>

<div class="conteudo">
    <header class="topbar">
        <span>PORTAL DO COLABORADOR</span>
        <span class="selo">Ativo</span>
    </header>

    <main>
        <section class="cabecalho">
            <h1>Minhas Férias</h1>
            <p>Solicite períodos de férias e acompanhe o resultado.</p>
        </section>

        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Nova solicitação de férias</h2>
                    <p>A solicitação é criada como PENDENTE e fica aguardando a análise do RH.</p>
                </div>
                <span class="badge Pendente">Status inicial: PENDENTE</span>
            </div>

            <!-- Alerta de Erro -->
            <c:if test="${not empty param.erro}">
                <div style="background-color: #f8d7da; color: #721c24; padding: 12px; border-radius: 4px; margin-bottom: 15px; border: 1px solid #f5c6cb; font-weight: bold;">
                    ⚠️
                    <c:choose>
                        <c:when test="${param.erro == 'ATIVAS'}">Ação negada: Você já possui uma solicitação de férias em andamento ou aprovada.</c:when>
                        <c:when test="${param.erro == 'DATA_INVALIDA'}">A data de início deve ser anterior à data de fim.</c:when>
                        <c:when test="${param.erro == 'PASSADO'}">A data de início não pode ser anterior a hoje.</c:when>
                        <c:when test="${param.erro == 'LIMITE_DIAS'}">O período de férias não pode ultrapassar 30 dias.</c:when>
                        <c:when test="${param.erro == 'SOBREPOSTO'}">Você já tem uma solicitação pendente ou aprovada nesse período.</c:when>
                        <c:otherwise>Não foi possível salvar a solicitação. Tente novamente.</c:otherwise>
                    </c:choose>
                </div>
            </c:if>

            <!-- Alerta de Sucesso -->
            <c:if test="${param.sucesso == '1'}">
                <div style="background-color: #d4edda; color: #155724; padding: 12px; border-radius: 4px; margin-bottom: 15px; border: 1px solid #c3e6cb; font-weight: bold;">
                    ✅ Solicitação submetida com sucesso! Acompanhe o protocolo no histórico abaixo e aguarde o retorno do administrador.
                </div>
            </c:if>
            <form action="/funcionario/solicitar-ferias" method="POST">
                <div class="form-linha">

                    <div class="campo">
                        <label for="dataInicio">Data de início *</label>
                        <input type="date" id="dataInicio" name="dataInicio" required>
                    </div>

                    <div class="campo">
                        <label for="dataFim">Data de término *</label>
                        <input type="date" id="dataFim" name="dataFim" required>
                    </div>
                </div>

                <div class="form-rodape">
                    <span class="dica">Informe o primeiro e o último dia de gozo.</span>
                    <div class="acoes">
                        <button type="reset" class="btn btn-contorno">Limpar</button>
                        <button type="submit" class="btn btn-primario">+ Solicitar Férias</button>
                    </div>
                </div>
            </form>
        </section>

        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Histórico de solicitações</h2>
                    <p>Suas solicitações de férias e o status de cada uma.</p>
                </div>
            </div>

            <div class="tabela-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Início</th>
                        <th>Término</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody>
                        
                    <!-- Tabela dinâmica do banco de dados -->
                    <c:forEach var="feria" items="${ferias}">
                        <tr>
                            <td><strong>${feria.id}</strong></td>
                            <td>${feria.dataInicio}</td>
                            <td>${feria.dataFim}</td>
                            <td><span class="badge ${feria.status}">${feria.status}</span></td>
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