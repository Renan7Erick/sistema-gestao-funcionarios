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

@WebServlet("/create-ferias")
public class CreateFeriasServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Funcionario funcionarioLogado = (Funcionario) request.getSession().getAttribute("funcionarioLogado");
            String dataInicio = request.getParameter("dataInicio");
            String dataFim = request.getParameter("dataFim");

            FeriasDAO dao = new FeriasDAO();

            // 1. REGRA DE BLOQUEIO: Testa se já tem férias
            if (dao.hasFeriasAtivas(funcionarioLogado.getId())) {
                request.setAttribute("erroBloqueio", "Ação negada: Você já possui uma solicitação de férias em andamento ou aprovada.");
                request.setAttribute("ferias", dao.findAllFerias());
                response.sendRedirect("/funcionario/minhas-ferias");                return; // Para a execução aqui
            }

            // 2. CRIAÇÃO: Se estiver livre, salva no banco
            LocalDate inicioFormatado = LocalDate.parse(dataInicio);
            LocalDate fimFormatado = LocalDate.parse(dataFim);

            Ferias ferias = new Ferias();
            ferias.setFuncionarioId(funcionarioLogado.getId());
            ferias.setDataInicio(inicioFormatado);
            ferias.setDataFim(fimFormatado);
            ferias.setStatus("Pendente");
            
            dao.createFerias(ferias);
            
            // 3. MENSAGEM DE SUCESSO: Carrega a mensagem verde e a tabela atualizada
            request.setAttribute("mensagemSucesso", "Solicitação submetida com sucesso! Acompanhe o protocolo no histórico abaixo e aguarde o retorno do administrador.");
            request.setAttribute("ferias", dao.findAllFerias());
            response.sendRedirect("/funcionario/minhas-ferias");
            
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
}