package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.PontoDAO;
import br.com.sistemaGestaoFuncionarios.model.Ponto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;

@WebServlet("/create-ponto")
public class CreatePontoServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int funcionarioId = 1; // teste temporario pois ainda nao ha sistema d elogin para receber esse id


        Ponto ponto = new Ponto();

        ponto.setFuncionarioId(funcionarioId);

        new PontoDAO().createPonto(ponto);

        resp.sendRedirect("/encontrar-pontos");


    }
}
