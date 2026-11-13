package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.dao.PontoDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;
import br.com.sistemaGestaoFuncionarios.model.Ponto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/funcionario/minhas-ferias")
public class ListFeriasByIdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");

        List<Ferias> ferias = new FeriasDAO().encontrarFeriasPorFuncionarioId(funcionarioLogado.getId());


        req.setAttribute("ferias", ferias);
        req.getRequestDispatcher("/pages/areaFuncionarios/minhasFerias/minhasFerias.jsp").forward(req, resp);

    }
}
