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

@WebServlet("/encontrar-ponto-por-id")
public class ListPontoByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        int funcionarioTeste = 1; //ainda nao há sistema de login, portanto o id do funcionario ainda é teste

        List<Ponto> pontos = new PontoDAO().encontrarPontosByFuncionarioId(funcionarioTeste);


        req.setAttribute("pontos", pontos);
        req.getRequestDispatcher("/pages/areaFuncionarios/meuPonto/meuPonto.jsp").forward(req, resp);


    }
}
