<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Ponto</title>
    <link rel="stylesheet" href="/pages/areaFuncionarios/meuPonto/meuPonto.css">
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
            <li><a href="/funcionario/meu-ponto" class="ativo">Meu Ponto</a></li>
            <li><a href="/funcionario/minhas-ferias">Minhas Férias</a></li>
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
            <h1>Meu Ponto</h1>
            <p>Registro diário da sua jornada de trabalho.</p>
        </section>

        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Registrar ponto</h2>
                    <p>O primeiro registro do dia marca a entrada. O seguinte marca a saída.</p>
                </div>


                    <c:if test="${param.erro == 'LIMITE'}">
                        <div class="mensagem-erro">Você já registrou entrada e saída hoje.</div>
                    </c:if>
                    <c:if test="${param.erro == 'FERIAS'}">
                        <div class="mensagem-erro">Você está em período de férias aprovado.</div>
                    </c:if>
                    <c:if test="${param.erro == 'ERRO'}">
                        <div class="mensagem-erro">Não foi possível registrar o ponto. Tente novamente.</div>
                    </c:if>

                <form action="/funcionario/create-ponto" method="post" onsubmit="return confirm('Deseja realmente registrar o ponto agora?');">
                    <button type="submit" class="btn btn-primario">+ Registrar Ponto (Entrada/Saída)</button>
                </form>
            </div>
        </section>

        <section class="card">
            <div class="card-topo">
                <div>
                    <h2>Meus registros</h2>
                    <p>Histórico de entradas e saídas.</p>
                </div>
            </div>

            <div class="tabela-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Data</th>
                        <th>Entrada</th>
                        <th>Saída</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="ponto" items="${pontos}">
                        <tr>
                            <td>${ponto.id}</td>
                            <td>${ponto.data}</td>
                            <td>${ponto.entrada}</td>
                            <td>${ponto.saida}</td>
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