package br.com.sistemaGestaoFuncionarios.servlet;


import br.com.sistemaGestaoFuncionarios.dao.CargoDAO;
import br.com.sistemaGestaoFuncionarios.dao.DepartamentoDAO;
import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Cargo;
import br.com.sistemaGestaoFuncionarios.model.Departamento;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-funcionarios")
public class ListFuncionarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        FuncionarioDAO funcDao = new FuncionarioDAO();

        CargoDAO cargoDAO = new CargoDAO(); // criados para integrar os cadastros de cada dado do banco de dados, ao cadastro de funcionario
                                            // para poder usar o select, com opcoes do banco de dados.

        DepartamentoDAO departamentoDAO = new DepartamentoDAO();



        List<Funcionario> funcionarioList = funcDao.encontrarFuncionarios();

        List<Cargo> listaCargos = cargoDAO.encontrarCargos();

        List<Departamento> listaDeparamentos = departamentoDAO.findAllDepartamentos();

        req.setAttribute("funcionarios", funcionarioList);
        req.setAttribute("cargos", listaCargos);
        req.setAttribute("departamentos", listaDeparamentos);


        req.getRequestDispatcher("/pages/cadastroFuncionarios/cadastroFunc.jsp").forward(req, resp);

    }
}
