package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;


@WebServlet("/funcionario/meu-perfil")
public class ListMeuPerfilServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Funcionario funcionarioLogado = (Funcionario) req.getSession().getAttribute("funcionarioLogado");

        FuncionarioDAO dao = new FuncionarioDAO();
        Funcionario funcionario = dao.findById(funcionarioLogado.getId());

        if (funcionario == null){
            resp.sendRedirect("/logout");
            return;
        }

        req.setAttribute("funcionario", funcionario);

        LocalDate hoje = LocalDate.now();
        boolean emFerias = false;
        long diasRestantes = 0;
        FeriasDAO feriasDAO = new FeriasDAO();

        for (Ferias f : feriasDAO.encontrarFeriasPorFuncionarioId(funcionarioLogado.getId())){
            boolean aprovada = "APROVADA".equals(f.getStatus());
            boolean noPeriodo = !hoje.isBefore(f.getDataInicio()) && !hoje.isAfter(f.getDataFim());

            if (aprovada && noPeriodo){
                emFerias = true;
                diasRestantes = ChronoUnit.DAYS.between(hoje, f.getDataFim()) + 1;

            }
        }

        req.setAttribute("emFerias", emFerias);
        req.setAttribute("diasRestantes", diasRestantes);
        req.getRequestDispatcher("/pages/areaFuncionarios/meuPerfil/meuPerfil.jsp").forward(req, resp);
    }
}
