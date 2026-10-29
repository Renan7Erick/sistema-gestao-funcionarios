package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.DepartamentoDAO;
import br.com.sistemaGestaoFuncionarios.model.Departamento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update-departamento")
public class UpdateDepartamentoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String departamentoId = req.getParameter("id");
        String nome = req.getParameter("nome");

        Departamento departamento = new Departamento(Integer.parseInt(departamentoId), nome);
        new DepartamentoDAO().updateDepartamento(departamento);

        resp.sendRedirect("/encontrar-departamentos");
    }
}