package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Ponto;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PontoDAO {

    public void deletePontoByFuncionarioId(String funcionarioId) {
        String SQL = "DELETE FROM PONTO WHERE FUNCIONARIO_ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, funcionarioId);
            preparedStatement.execute();

            System.out.println("sucesso ao deletar ponto de id: " + funcionarioId);

            connection.close();

        } catch (Exception e) {
            System.out.println("fail in database connection" + e.getMessage());
        }
    }
   
}