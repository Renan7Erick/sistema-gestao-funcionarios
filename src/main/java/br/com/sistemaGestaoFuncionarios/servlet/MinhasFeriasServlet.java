package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/minhas-ferias")
public class MinhasFeriasServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeriasDAO dao = new FeriasDAO();
        // Carrega as férias do banco H2 para desenhar a tabela do histórico
        List<Ferias> lista = dao.findAllFerias(); 
        
        request.setAttribute("ferias", lista);
        request.getRequestDispatcher("/pages/areaFuncionarios/minhasFerias/minhasFerias.jsp").forward(request, response);
    }
}