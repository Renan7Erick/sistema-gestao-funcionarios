<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Ponto - Portal do Colaborador</title>
    <link rel="stylesheet" href="/pages/pontoFuncionarios/ponto.css">
</head>
<body>

    <!-- Menu Lateral (Sidebar) -->
    <aside class="sidebar">
        <div class="logo">
            <!-- Símbolo genérico para o logo -->
            <span class="logo-icon">❖</span> SISTEMA
        </div>
        <nav class="menu">
            <a href="#" class="menu-item">👤 Meu Perfil</a>
            <a href="#" class="menu-item active">🕒 Meu Ponto</a>
            <a href="#" class="menu-item">✈️ Minhas Férias</a>
        </nav>
        <a href="#" class="logout">🚪 Sair</a>
    </aside>

    <!-- Área Principal -->
    <main class="main-content">
        <!-- Cabeçalho -->
        <header class="topbar">
            <span class="breadcrumb">PORTAL DO COLABORADOR</span>
            <div class="user-profile">
                <span class="status-badge"><span class="dot green"></span> Ativo</span>
                <div class="avatar">CF</div>
            </div>
        </header>

        <!-- Título da Página -->
        <section class="page-header">
            <h1>Meu Ponto</h1>
            <p>Registro diário de jornada de trabalho e espelho de ponto mensal</p>
        </section>

        <!-- Card de Registro de Ponto -->
        <section class="card register-card">
            <div class="register-info">
                <span class="status-badge"><span class="dot green"></span> JORNADA EM ANDAMENTO</span>
                <span class="escala">Escala CLT Padrão (08h diárias)</span>
            </div>
            <button class="btn-primary">⏱ + Registrar Ponto (Entrada/Saída)</button>
        </section>

        <!-- Cards de Resumo do Dia -->
        <section class="summary-cards">
            <div class="info-card">
                <p class="card-title">ENTRADA HOJE</p>
                <h2>08:00 <span class="badge-text green">No horário</span></h2>
                <p class="card-desc">Terminal 01 - Biometria</p>
            </div>
            <div class="info-card">
                <p class="card-title">INTERVALO ALMOÇO</p>
                <h2>12:00 - 13:00</h2>
                <p class="card-desc">60 minutos previstos</p>
            </div>
            <div class="info-card">
                <p class="card-title">PREVISÃO DE SAÍDA</p>
                <h2>17:00</h2>
                <p class="card-desc">Carga diária: 08h 00m</p>
            </div>
        </section>

        <!-- Tabela do Espelho de Ponto -->
        <section class="card table-card">
            <div class="table-header">
                <h3>📅 Espelho Mensal</h3>
                <div class="month-selector">
                    <button>&lt;</button>
                    <span>Maio / 2026</span>
                    <button>&gt;</button>
                </div>
            </div>
            
            <table class="ponto-table">
                <thead>
                    <tr>
                        <th>DATA</th>
                        <th>ENTRADA</th>
                        <th>INTERVALO INÍCIO</th>
                        <th>INTERVALO FIM</th>
                        <th>SAÍDA</th>
                        <th>TOTAL HORAS</th>
                        <th>STATUS</th>
                        <th>AÇÕES</th>
                    </tr>
                </thead>
				<tbody>
				                    <c:forEach var="ponto" items="${pontos}">
				                        <tr>
				                            <td><strong>${ponto.data}</strong></td>
				                            <td>${ponto.entrada}</td>
				                            <td>--:--</td> <!-- Sem atributo no model -->
				                            <td>--:--</td> <!-- Sem atributo no model -->
				                            <td>${ponto.saida}</td>
				                            <td>--:--</td> <!-- Cálculo não implementado -->
				                            <td><span class="badge regular">REGISTRADO</span></td>
				                            <td><button class="btn-icon">✔️ OK</button></td>
				                        </tr>
				                    </c:forEach>
				                </tbody>
            </table>
        </section>
    </main>

</body>
</html>