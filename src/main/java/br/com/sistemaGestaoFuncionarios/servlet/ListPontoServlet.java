package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.PontoDAO;
import br.com.sistemaGestaoFuncionarios.model.Ponto;

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
        
        // Substitua 'encontrarPontos()' pelo nome real do método de busca no seu PontoDAO
        List<Ponto> pontoList = dao.encontrarPontos(); 

        req.setAttribute("pontos", pontoList);
        
        // Direciona para o arquivo da view
        req.getRequestDispatcher("/pages/pontoFuncionarios/ponto.jsp").forward(req, resp);
    }
}