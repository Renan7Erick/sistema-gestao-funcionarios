package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-ferias")
public class DeleteFeriasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String feriasId = request.getParameter("id");
            
            FeriasDAO feriasDAO = new FeriasDAO();
            feriasDAO.deleteFeriasById(feriasId);

            response.sendRedirect("/encontrar-ferias");
        } catch (Exception e) {
            System.out.println("Erro ao deletar férias: " + e.getMessage());
            response.sendRedirect("/erro.html");
        }
    }
}