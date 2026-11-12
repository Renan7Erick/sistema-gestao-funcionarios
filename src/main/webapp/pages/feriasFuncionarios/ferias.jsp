<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Férias - Painel Admin</title>
    <link rel="stylesheet" href="/pages/feriasFuncionarios/feriasFuncionarios.css">
</head>
<body>

<aside class="sidebar">
    <div>
        <div class="logo">
            <div class="logo-icone">❖</div>
            <div class="logo-texto">
                <strong>SISTEMA</strong>
                <span>FUNCIONARIOS</span>
            </div>
        </div>

      <ul class="menu">
    <li><a href="/encontrar-dashboard">Dashboard</a></li>
    <li><a href="/encontrar-funcionarios">Funcionarios</a></li>
    <li><a href="/encontrar-departamentos">Departamentos</a></li>
    <li><a href="/encontrar-cargos">Cargos</a></li>
    <li><a href="/encontrar-pontos">Ponto</a></li>
    <li><a href="/encontrar-ferias" class="ativo">Férias</a></li>
</ul>
    </div>

    <a href="#" class="sair">Sair</a>
</aside>

<div class="conteudo">
    <header class="topbar">
        <span>GESTÃO ORGANIZACIONAL</span>
        <span class="selo">Administrador</span>
    </header>

    <main>
        <section class="cabecalho">
            <span class="trilha">Painel corporativo de Férias</span>
            <h1>Solicitações e Gestão de Férias</h1>
            <p>Aprove ou rejeite as solicitações feitas pelos colaboradores.</p>
        </section>

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
                            <th>Funcionario</th>
                            <th>Inicio</th>
                            <th>Término</th>
                            <th>Status</th>
                            <th>Ações</th>
                        </tr>
                    </thead>

                    <tbody>

                        <c:forEach var="feria" items="${ferias}">
                            <tr>
                                <td><strong>#FER-${feria.id}</strong></td>
                                <td class="mudo">${feria.funcionarioId}</td>
                                <td>${feria.dataInicio}</td>
                                <td>${feria.dataFim}</td>

                                <td>
                                    <span class="badge ${feria.status}">
                                        ${feria.status}
                                    </span>
                                </td>

                                <td class="table-actions-cell">

                                    <!-- CORREÇÃO AQUI: "Pendente" com apenas a primeira letra maiúscula -->
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