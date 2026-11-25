<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Acesso ao sistema - RH</title>
    <link rel="stylesheet" href="/pages/login/style.css">
</head>
<body>
    <div class="login-container">
        <form action="/login" method="post" class="login-card">
            <c:if test="${not empty requestScope.message}">
                <div class="mensagem-erro" role="alert">
                    <c:out value="${requestScope.message}"/>
                </div>
            </c:if>
            <h2>Acesso ao sistema</h2>
            
            <div class="input-group">
                <label for="email">E-mail</label>
                <input name="email" type="email" id="email" placeholder="seu.email@empresa.com" required>
            </div>
            
            <div class="input-group">
                <label for="senha">Senha</label>
                <input name="senha" type="password" id="senha" placeholder="••••••••" required>
            </div>

            <a  class="btn-inicio btn-contorno"  href = "/index.html"> Retornar ao início </a>
            
            <button type="submit">Entrar</button>
        </form>
    </div>
</body>
</html>