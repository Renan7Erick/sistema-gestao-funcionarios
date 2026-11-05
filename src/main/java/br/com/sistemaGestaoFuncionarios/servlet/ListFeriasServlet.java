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

@WebServlet("/encontrar-ferias")
public class ListFeriasServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        FeriasDAO dao = new FeriasDAO();
        List<Ferias> lista = dao.findAllFerias();
        
        request.setAttribute("ferias", lista);
        request.getRequestDispatcher("/pages/feriasFuncionarios/ferias.jsp").forward(request, response);
    }
}