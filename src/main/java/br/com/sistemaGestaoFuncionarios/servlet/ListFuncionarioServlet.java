package br.com.sistemaGestaoFuncionarios.servlet;


import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-funcionarios")
public class ListFuncionarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        FuncionarioDAO dao = new FuncionarioDAO();

        List<Funcionario> funcionarioList = dao.encontrarFuncionarios();

        req.setAttribute("funcionarios", funcionarioList);


        req.getRequestDispatcher("/pages/cadastroFuncionarios/cadastroFunc.jsp").forward(req, resp);

    }
}
