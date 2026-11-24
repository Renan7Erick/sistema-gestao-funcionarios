package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/funcionario/alterar-senha")
public class AlterarSenhaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");

        String atual = req.getParameter("senhaAtual");
        String nova = req.getParameter("novaSenha");
        String confirmacao = req.getParameter("confirmacao");

        String erro;
        if (nova == null || nova.length() < 6) {
            erro = "CURTA";
        } else if (!nova.equals(confirmacao)) {
            erro = "CONFIRMACAO";
        } else if (nova.equals(atual)) {
            erro = "IGUAL";
        } else {
            erro = new FuncionarioDAO().alterarSenha(funcionarioLogado.getId(), atual, nova);
        }

        if (erro == null) {
            resp.sendRedirect("/funcionario/meu-perfil?senhaOk=1");
        } else {
            resp.sendRedirect("/funcionario/meu-perfil?senhaErro=" + erro);
        }
    }
}
