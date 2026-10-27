package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.CargoDAO;
import br.com.sistemaGestaoFuncionarios.model.Cargo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-cargos")
public class ListCargoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CargoDAO dao = new CargoDAO();
        List<Cargo> cargosList = dao.encontrarCargos();

        req.setAttribute("cargos", cargosList);
        req.getRequestDispatcher("/pages/cargos/cargos.jsp").forward(req, resp);
    }
}
