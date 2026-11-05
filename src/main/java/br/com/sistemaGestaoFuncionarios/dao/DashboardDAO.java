package br.com.sistemaGestaoFuncionarios.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public int contarFuncionarios(){
        String SQL = "SELECT COUNT(*) FROM FUNCIONARIO";
        int total = 0;

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                total = resultSet.getInt(1);
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return total;
    }

    public int contarDepartamentos(){
        String SQL = "SELECT COUNT(*) FROM DEPARTAMENTO";
        int total = 0;

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                total = resultSet.getInt(1);
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return total;
    }

    public int contarPontosHoje(){
        String SQL = "SELECT COUNT(*) FROM ponto WHERE data = CURRENT_DATE";
        int total = 0;

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
               total = resultSet.getInt(1);
            }
            connection.close();

        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return total;
    }

    public int contarFeriasPendentes(){
        String SQL = "SELECT COUNT(*) FROM ferias WHERE status = 'PENDENTE'";
        int total = 0;

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()){
                total = resultSet.getInt(1);
            }
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return total;
    }
}
