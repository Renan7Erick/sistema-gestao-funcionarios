package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.CargoDAO;
import br.com.sistemaGestaoFuncionarios.model.Cargo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-cargo")
public class CreateCargoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CargoDAO dao = new CargoDAO();
        String cargoNome = req.getParameter("nome");
        String cargoNivel = req.getParameter("nivel");
        int departamentoId = Integer.parseInt(req.getParameter("departamento_id"));

        Cargo cargo = new Cargo(cargoNome, cargoNivel, departamentoId);
        dao.createCargo(cargo);
        resp.sendRedirect("/encontrar-cargos");
    }
}
