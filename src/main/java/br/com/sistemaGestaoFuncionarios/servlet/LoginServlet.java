package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String email = req.getParameter("email");
        String senha = req.getParameter("senha");

        FuncionarioDAO dao = new FuncionarioDAO();

        Funcionario funcionario = dao.findByEmailAndSenha(email, senha);

        if (funcionario != null){
            req.getSession().setAttribute("funcionarioLogado", funcionario);

            if ("ADMIN".equals(funcionario.getPerfil())){
                resp.sendRedirect("/encontrar-dashboard");
            }else {
                resp.sendRedirect("/pages/areaFuncionarios/meuPerfil/meuPerfil.html");
            }
        }else {
            req.setAttribute("message", "E-mail ou senha inválidos!");
            req.getRequestDispatcher("/pages/login/login.jsp").forward(req, resp);
        }

    }
}
