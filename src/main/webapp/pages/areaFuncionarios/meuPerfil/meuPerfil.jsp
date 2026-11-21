<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meu Perfil</title>
    <link rel="stylesheet" href="/pages/areaFuncionarios/minhasFerias/minhasFerias.css">
    <link rel="stylesheet" href="/pages/areaFuncionarios/meuPerfil/meuPerfil.css">
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
            <li><a href="/funcionario/meu-perfil" class="ativo">Meu Perfil</a></li>
            <li><a href="/funcionario/meu-ponto">Meu Ponto</a></li>
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
            <h1>Meu Perfil</h1>
            <p>Visualize seus dados cadastrais, cargo e situação de férias.</p>
        </section>

        <section class="areablocos">

            <section class="blocos">
                <h1>
                    <svg width="19" height="20" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M8.3125 3.5C8.29427 2.67969 7.92969 2.05078 7.21875 1.61328C6.48958 1.21224 5.76042 1.21224 5.03125 1.61328C4.32031 2.05078 3.95573 2.67969 3.9375 3.5C3.95573 4.32031 4.32031 4.94922 5.03125 5.38672C5.76042 5.78776 6.48958 5.78776 7.21875 5.38672C7.92969 4.94922 8.29427 4.32031 8.3125 3.5ZM2.625 3.5C2.625 2.86198 2.77995 2.27865 3.08984 1.75C3.39974 1.22135 3.82812 0.792969 4.375 0.464844C4.92188 0.154948 5.50521 0 6.125 0C6.74479 0 7.32812 0.154948 7.875 0.464844C8.42188 0.792969 8.85026 1.22135 9.16016 1.75C9.47005 2.27865 9.625 2.86198 9.625 3.5C9.625 4.13802 9.47005 4.72135 9.16016 5.25C8.85026 5.77865 8.42188 6.20703 7.875 6.53516C7.32812 6.84505 6.74479 7 6.125 7C5.50521 7 4.92188 6.84505 4.375 6.53516C3.82812 6.20703 3.39974 5.77865 3.08984 5.25C2.77995 4.72135 2.625 4.13802 2.625 3.5ZM1.33984 12.6875H10.9102C10.7643 11.7943 10.3724 11.0651 9.73438 10.5C9.07812 9.9349 8.29427 9.64323 7.38281 9.625H4.86719C3.95573 9.64323 3.18099 9.9349 2.54297 10.5C1.88672 11.0651 1.48568 11.7943 1.33984 12.6875ZM0 13.1797C0.0364583 11.8125 0.510417 10.6641 1.42188 9.73438C2.35156 8.82292 3.5 8.34896 4.86719 8.3125H7.38281C8.75 8.34896 9.89844 8.82292 10.8281 9.73438C11.7396 10.6641 12.2135 11.8125 12.25 13.1797C12.25 13.4167 12.168 13.6081 12.0039 13.7539C11.8581 13.918 11.6667 14 11.4297 14H0.820312C0.583333 14 0.391927 13.918 0.246094 13.7539C0.0820312 13.6081 0 13.4167 0 13.1797Z"
                            fill="#2563EB" />
                    </svg>
                    Dados Cadastrais
                </h1>

                <div class="blocosinfo">
                    <div class="blocosCard">
                        <p>Nome Completo</p>
                        <div class="info"><c:out value="${funcionario.nome}"/></div>
                    </div>

                    <div class="blocosCard">
                        <p>E-mail Corporativo</p>
                        <div class="info"><c:out value="${funcionario.email}"/></div>
                    </div>

                    <div class="blocosCard">
                        <p>Telefone</p>
                        <div class="info"><c:out value="${funcionario.telefone}"/></div>
                    </div>
                </div>
            </section>

            <section class="blocos">
                <h1>
                    <svg width="19" height="20" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M5.03125 1.3125H8.96875C9.09635 1.33073 9.16927 1.40365 9.1875 1.53125V2.625H4.8125V1.53125C4.83073 1.40365 4.90365 1.33073 5.03125 1.3125ZM3.5 1.53125V2.625H1.75C1.25781 2.64323 0.847656 2.81641 0.519531 3.14453C0.191406 3.47266 0.0182292 3.88281 0 4.375V7H5.25H8.75H14V4.375C13.9818 3.88281 13.8086 3.47266 13.4805 3.14453C13.1523 2.81641 12.7422 2.64323 12.25 2.625H10.5V1.53125C10.4818 1.09375 10.3359 0.729167 10.0625 0.4375C9.77083 0.164062 9.40625 0.0182292 8.96875 0H5.03125C4.59375 0.0182292 4.22917 0.164062 3.9375 0.4375C3.66406 0.729167 3.51823 1.09375 3.5 1.53125ZM14 7.875H8.75V8.75C8.75 9.00521 8.66797 9.21484 8.50391 9.37891C8.33984 9.54297 8.13021 9.625 7.875 9.625H6.125C5.86979 9.625 5.66016 9.54297 5.49609 9.37891C5.33203 9.21484 5.25 9.00521 5.25 8.75V7.875H0V11.375C0.0182292 11.8672 0.191406 12.2773 0.519531 12.6055C0.847656 12.9336 1.25781 13.1068 1.75 13.125H12.25C12.7422 13.1068 13.1523 12.9336 13.4805 12.6055C13.8086 12.2773 13.9818 11.8672 14 11.375V7.875Z"
                            fill="#4F46E5" />
                    </svg>
                    Função | Setor
                </h1>

                <div class="blocosinfo">
                    <div class="blocosCard">
                        <p>Departamento</p>
                        <div class="info"><c:out value="${funcionario.departamentoNome}"/></div>
                    </div>

                    <div class="blocosCard">
                        <p>Cargo</p>
                        <div class="info"><c:out value="${funcionario.cargoNome}"/></div>
                    </div>

                    <div class="blocosCard">
                        <p>Data de Admissão</p>
                        <div class="info"><c:out value="${funcionario.dataContratacao}"/></div>
                    </div>
                </div>
            </section>

            <section class="blocos">
                <h1>
                    <svg width="19" height="20" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M3.5 0C3.90104 0.0364583 4.11979 0.255208 4.15625 0.65625V1.75H8.09375V0.65625C8.13021 0.255208 8.34896 0.0364583 8.75 0C9.15104 0.0364583 9.36979 0.255208 9.40625 0.65625V1.75H10.5C10.9922 1.76823 11.4023 1.94141 11.7305 2.26953C12.0586 2.59766 12.2318 3.00781 12.25 3.5V3.9375V5.25V12.25C12.2318 12.7422 12.0586 13.1523 11.7305 13.4805C11.4023 13.8086 10.9922 13.9818 10.5 14H1.75C1.25781 13.9818 0.847656 13.8086 0.519531 13.4805C0.191406 13.1523 0.0182292 12.7422 0 12.25V5.25V3.9375V3.5C0.0182292 3.00781 0.191406 2.59766 0.519531 2.26953C0.847656 1.94141 1.25781 1.76823 1.75 1.75H2.84375V0.65625C2.88021 0.255208 3.09896 0.0364583 3.5 0ZM10.9375 5.25H1.3125V12.25C1.33073 12.5234 1.47656 12.6693 1.75 12.6875H10.5C10.7734 12.6693 10.9193 12.5234 10.9375 12.25V5.25ZM8.99609 8.12109L5.93359 11.1836C5.6237 11.4388 5.3138 11.4388 5.00391 11.1836L3.25391 9.43359C2.9987 9.1237 2.9987 8.8138 3.25391 8.50391C3.5638 8.2487 3.8737 8.2487 4.18359 8.50391L5.46875 9.78906L8.06641 7.19141C8.3763 6.9362 8.6862 6.9362 8.99609 7.19141C9.2513 7.5013 9.2513 7.8112 8.99609 8.12109Z"
                            fill="#059669" />
                    </svg>
                    Situação de Férias
                </h1>

                <div class="blocosinfo">
                    <div class="blocosCard">
                        <p>Saldo de Férias</p>
                        <div class="info">30 dias disponíveis</div>
                    </div>

                    <div class="blocosCard">
                        <p>Próximo Período Aquisitivo</p>
                        <div class="info">14/03/2026</div>
                    </div>
                </div>
            </section>

        </section>
    </main>
</div>

</body>

</html>