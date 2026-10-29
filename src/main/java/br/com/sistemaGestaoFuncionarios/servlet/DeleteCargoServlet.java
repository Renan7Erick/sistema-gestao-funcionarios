package br.com.sistemaGestaoFuncionarios.servlet;


import br.com.sistemaGestaoFuncionarios.dao.CargoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-cargo")
public class DeleteCargoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int cargoId = Integer.parseInt(req.getParameter("id"));

        new CargoDAO().deleteCargoById(cargoId);

        resp.sendRedirect("/encontrar-cargos");
    }
}
