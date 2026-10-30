package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.PontoDAO;
import br.com.sistemaGestaoFuncionarios.model.Ponto;

// ATENÇÃO AQUI: Troquei todos os 'javax' por 'jakarta'
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-ponto")
public class ListPontoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PontoDAO dao = new PontoDAO();
        
        List<Ponto> pontoList = dao.encontrarPontos(); 

        req.setAttribute("pontos", pontoList);
        
        req.getRequestDispatcher("/pages/pontoFuncionarios/ponto.jsp").forward(req, resp);
    }
}