package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.DepartamentoDAO;
import br.com.sistemaGestaoFuncionarios.dao.DashboardDAO; // Importe o DashboardDAO
import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Departamento;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-departamentos")
public class ListDepartamentoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");

        FuncionarioDAO funcDao = new FuncionarioDAO();
        Funcionario funcionario = funcDao.findById(funcionarioLogado.getId());

        DepartamentoDAO dao = new DepartamentoDAO();
        List<Departamento> departamentoList = dao.findAllDepartamentos();

        // NOVO: Buscar o total real de colaboradores usando o DashboardDAO
        DashboardDAO dashboardDAO = new DashboardDAO();
        int totalColaboradoresGeral = dashboardDAO.contarFuncionarios();

        req.setAttribute("departamentos", departamentoList);

        req.setAttribute("funcionario", funcionario);
        // NOVO: Enviar o total real para o JSP
        req.setAttribute("totalColaboradoresGeral", totalColaboradoresGeral);

        req.getRequestDispatcher("/pages/departamentos/departamentos.jsp").forward(req, resp);
    }
}