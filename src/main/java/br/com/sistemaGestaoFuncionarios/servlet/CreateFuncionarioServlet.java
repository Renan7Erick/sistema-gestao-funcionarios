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
        String funcionarioTelefone = req.getParameter("telefone");
        Date funcionarioDataNasc = Date.valueOf(req.getParameter("dataNascimento"));
        Date funcionarioDataCont = Date.valueOf(req.getParameter("dataContratacao"));
        String status = req.getParameter("status");
        int cargoId = Integer.parseInt(req.getParameter("cargo"));
        int departamentoId = Integer.parseInt(req.getParameter("departamento"));


        Funcionario funcionario = new Funcionario(funcinarioNome, funcionarioCpf, funcionarioEmail, funcionarioTelefone, funcionarioDataNasc, funcionarioDataCont, status, cargoId, departamentoId);





    }
}
