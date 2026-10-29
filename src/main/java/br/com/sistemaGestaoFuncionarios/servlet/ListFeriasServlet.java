package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/encontrar-ferias")
public class ListFeriasServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FeriasDAO dao = new FeriasDAO();
		List<Ferias> feriasList = dao.encontrarFerias();

		req.setAttribute("ferias", feriasList);

		// jsp
		req.getRequestDispatcher("/pages/feriasFuncionarios/ferias.jsp").forward(req, resp);
	}
}