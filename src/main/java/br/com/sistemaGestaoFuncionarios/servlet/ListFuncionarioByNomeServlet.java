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

@WebServlet("/encontrar-funcionarios-nome")
public class ListFuncionarioByNomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FuncionarioDAO funcDao = new FuncionarioDAO();
        String nome = req.getParameter("nomeBusca");
        CargoDAO cargoDAO = new CargoDAO();
        DepartamentoDAO departamentoDAO = new DepartamentoDAO();

        List<Funcionario>  funcionarioList = funcDao.encontrarFuncionariosPeloNome(nome);

        List<Cargo> listaCargos = cargoDAO.encontrarCargos();
        List<Departamento> listaDepartamentos = departamentoDAO.findAllDepartamentos();


        req.setAttribute("funcionarios", funcionarioList);
        req.setAttribute("cargos", listaCargos);
        req.setAttribute("departamentos", listaDepartamentos);

        req.getRequestDispatcher("/pages/cadastroFuncionarios/cadastroFunc.jsp").forward(req, resp);


    }
}
