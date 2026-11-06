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
        // Consulta SQL atualizada: junta (JOIN) o departamento com o funcionário e conta quantos existem
        String SQL = "SELECT d.id, d.nome, COUNT(f.id) as total_colaboradores " +
                "FROM departamento d " +
                "LEFT JOIN funcionario f ON d.id = f.departamento_id " +
                "GROUP BY d.id, d.nome";

        List<Departamento> departamentos = new ArrayList<>();

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                int totalColaboradores = resultSet.getInt("total_colaboradores"); // Pega a contagem do banco

                // Usa o novo construtor
                Departamento departamento = new Departamento(id, nome, totalColaboradores);
                departamentos.add(departamento);
            }

            connection.close();
        } catch (Exception e) {
            System.out.println("Erro: " + e.getMessage());
        }

        return departamentos;
    }

    public void deleteDepartamentoById(String id) {
        String SQL = "DELETE FROM departamento WHERE id = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, Integer.parseInt(id));
            preparedStatement.execute();
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao deletar: " + e.getMessage());
        }
    }

    public void updateDepartamento(Departamento departamento) {
        String SQL = "UPDATE departamento SET nome = ? WHERE id = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setString(1, departamento.getNome());
            preparedStatement.setInt(2, departamento.getId());
            preparedStatement.execute();
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao atualizar: " + e.getMessage());
        }
    }
}