package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FeriasDAO;
import br.com.sistemaGestaoFuncionarios.model.Ferias;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/funcionario/solicitar-ferias")
public class CreateFeriasServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Funcionario funcionarioLogado = (Funcionario) request.getSession().getAttribute("funcionarioLogado");

        FeriasDAO dao = new FeriasDAO();

        String erro;

        try {
            LocalDate inicioFormatado = LocalDate.parse(request.getParameter("dataInicio"));
            LocalDate fimFormatado = LocalDate.parse(request.getParameter("dataFim"));

            Ferias ferias = new Ferias();
            ferias.setFuncionarioId(funcionarioLogado.getId());
            ferias.setDataInicio(inicioFormatado);
            ferias.setDataFim(fimFormatado);
            ferias.setStatus("PENDENTE");

            erro = dao.createFerias(ferias);

        } catch (Exception e) {          // data vazia ou em formato inválido
            erro = "DATA_INVALIDA";
        }

        // 3. Resultado pela URL
        if (erro == null) {
            response.sendRedirect("/funcionario/minhas-ferias?sucesso=1");
        } else {
            response.sendRedirect("/funcionario/minhas-ferias?erro=" + erro);
        }
    }
}