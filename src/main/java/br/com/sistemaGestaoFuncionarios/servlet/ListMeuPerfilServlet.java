package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/funcionario/meu-perfil")
public class ListMeuPerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");

        FuncionarioDAO dao = new FuncionarioDAO();
        Funcionario funcionario = dao.findById(funcionarioLogado.getId());

        if (funcionario == null){
            resp.sendRedirect("/logout");
            return;
        }

        req.setAttribute("funcionario", funcionario);
        req.getRequestDispatcher("/pages/areaFuncionarios/meuPerfil/meuPerfil.jsp").forward(req, resp);
    }
}
