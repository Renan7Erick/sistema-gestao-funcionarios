package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.DepartamentoDAO;
import br.com.sistemaGestaoFuncionarios.model.Cargo;
import br.com.sistemaGestaoFuncionarios.model.Departamento;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-departamento")
public class CreateDepartamentoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        DepartamentoDAO dao = new DepartamentoDAO();
        String departamentoId = request.getParameter("id");
        String nome = request.getParameter("nome");


        if (departamentoId.isBlank()){
            Departamento departamento = new Departamento(0, nome);
            DepartamentoDAO departamentoDAO = new DepartamentoDAO();
            departamentoDAO.createDepartamento(departamento);
        }else {
            Departamento departamento = new Departamento(Integer.parseInt(departamentoId), nome);
            dao.updateDepartamento(departamento);
        }


        response.sendRedirect("/encontrar-departamentos");
    }
}