package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/atualizar-status-ferias")
public class UpdateStatusFeriasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // Adicione esta linha para sumir o aviso
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            
            FeriasDAO dao = new FeriasDAO();
            dao.updateStatusFerias(id, status);
            
            response.sendRedirect("/encontrar-ferias");
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}