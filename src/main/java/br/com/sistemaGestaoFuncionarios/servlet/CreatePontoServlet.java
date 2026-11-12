package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.PontoDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;
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

        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");


        Ponto ponto = new Ponto();

        ponto.setFuncionarioId(funcionarioLogado.getId());

        new PontoDAO().createPonto(ponto);

        resp.sendRedirect("/funcionario/meu-ponto");


    }
}
