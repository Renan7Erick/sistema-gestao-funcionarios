package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/create-ferias")
public class CreateFeriasServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
            int funcionarioId = Integer.parseInt(request.getParameter("funcionarioId"));
            LocalDate dataInicio = LocalDate.parse(request.getParameter("dataInicio"));
            LocalDate dataFim = LocalDate.parse(request.getParameter("dataFim"));
            String status = request.getParameter("status"); 

            
            Ferias ferias = new Ferias(0, funcionarioId, dataInicio, dataFim, status);

            
            FeriasDAO feriasDAO = new FeriasDAO();
            feriasDAO.createFerias(ferias);

            
            response.sendRedirect("/encontrar-ferias");

        } catch (Exception e) {
            System.out.println("Erro ao processar o registo de férias: " + e.getMessage());
            response.sendRedirect("/erro.html"); 
        }
    }
}