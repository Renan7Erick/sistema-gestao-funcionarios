package br.com.sistemaGestaoFuncionarios.servlet;


import br.com.sistemaGestaoFuncionarios.dao.DashboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/encontrar-dashboard")
public class ListDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        DashboardDAO dashboardDAO = new DashboardDAO();

        int totalFuncionarios = dashboardDAO.contarFuncionarios();
        int totalDepartamentos = dashboardDAO.contarDepartamentos();
        int totalPontosHoje = dashboardDAO.contarPontosHoje();
        int totalFeriasPendente = dashboardDAO.contarFeriasPendentes();

        req.setAttribute("totalFuncionarios", totalFuncionarios);
        req.setAttribute("totalDepartamentos", totalDepartamentos);
        req.setAttribute("totalPontosHoje", totalPontosHoje);
        req.setAttribute("totalFeriasPendente", totalFeriasPendente);

        req.getRequestDispatcher("/pages/dashboard/dashboard.jsp").forward(req, resp);
    }
}
