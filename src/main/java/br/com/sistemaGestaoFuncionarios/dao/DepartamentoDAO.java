package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Departamento;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartamentoDAO {

    public void createDepartamento(Departamento departamento) {
        String SQL = "INSERT INTO departamento (nome) VALUES (?)";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            System.out.println("conecto");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, departamento.getNome());
            preparedStatement.execute();

            System.out.println("inserido");
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }

    public List<Departamento> findAllDepartamentos() {
        String SQL = "SELECT * FROM departamento";
        List<Departamento> departamentos = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                Departamento departamento = new Departamento(id, nome);
                departamentos.add(departamento);
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return departamentos;
    }
}