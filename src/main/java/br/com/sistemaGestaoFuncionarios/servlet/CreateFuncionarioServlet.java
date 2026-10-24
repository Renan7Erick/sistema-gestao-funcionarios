package br.com.sistemaGestaoFuncionarios.servlet;

import br.com.sistemaGestaoFuncionarios.dao.FuncionarioDAO;
import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/create-funcionario")
public class CreateFuncionarioServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        FuncionarioDAO funcionarioDAO = new FuncionarioDAO();

        String funcinarioNome = req.getParameter("nome");
        String funcionarioCpf = req.getParameter("cpf");
        String funcionarioEmail = req.getParameter("email");
        String funcionarioSenha = req.getParameter("senha");
        String funcionarioTelefone = req.getParameter("telefone");
        Date funcionarioDataNasc = Date.valueOf(req.getParameter("dataNascimento"));
        Date funcionarioDataCont = Date.valueOf(req.getParameter("dataContratacao"));
        String status = req.getParameter("status");
        String perfil = req.getParameter("perfil");
        int cargoId = Integer.parseInt(req.getParameter("cargoId"));
        int departamentoId = Integer.parseInt(req.getParameter("departamentoId"));


        Funcionario funcionario = new Funcionario(funcinarioNome, funcionarioCpf, funcionarioEmail, funcionarioSenha, funcionarioTelefone,  funcionarioDataNasc, funcionarioDataCont, status, perfil, cargoId, departamentoId);

        funcionarioDAO.createFuncionario(funcionario);

        resp.sendRedirect("/pages/cadastroFuncionarios/cadastroFunc.html");

    }
}
