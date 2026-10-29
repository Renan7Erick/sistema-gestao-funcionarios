package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.DepartamentoDAO;
import br.com.sistemaGestaoFuncionarios.model.Departamento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-departamentos")
public class ListDepartamentoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DepartamentoDAO dao = new DepartamentoDAO();
        List<Departamento> departamentoList = dao.findAllDepartamentos();

        req.setAttribute("departamentos", departamentoList);
        req.getRequestDispatcher("/pages/departamentos/departamentos.jsp").forward(req, resp);
    }
}