package br.com.sistemaGestaoFuncionarios.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-employee")
public class CreateEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String employeeName = req.getParameter("employee-name");

        System.out.println(employeeName);

        req.getRequestDispatcher("index.html").forward(req, resp);
    }
}
