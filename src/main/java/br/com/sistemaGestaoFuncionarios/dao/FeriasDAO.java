package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Ferias;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FeriasDAO {

	public void deleteFeriasByFuncionarioId(String funcionarioId) {
		String SQL = "DELETE FROM ferias WHERE FUNCIONARIO_ID = ?";

		try {
			Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
			System.out.println("success in database connection");

			PreparedStatement preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, funcionarioId);
			preparedStatement.execute();

			System.out.println("sucesso ao deletar férias de id: " + funcionarioId);

			connection.close();

		} catch (Exception e) {
			System.out.println("fail in database connection" + e.getMessage());
		}
	}
	public void createFerias(Ferias ferias) {
        String SQL = "INSERT INTO FERIAS (FUNCIONARIO_ID, DATA_INICIO, DATA_FIM, STATUS) VALUES (?, ?, ?, ?)";
        
        try {
            java.sql.Connection connection = java.sql.DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            java.sql.PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            
            preparedStatement.setInt(1, ferias.getFuncionarioId());
            preparedStatement.setDate(2, java.sql.Date.valueOf(ferias.getDataInicio()));
            preparedStatement.setDate(3, java.sql.Date.valueOf(ferias.getDataFim()));
            preparedStatement.setString(4, ferias.getStatus());
            
            preparedStatement.execute();
            System.out.println("Férias registradas com sucesso no banco H2.");
            
            connection.close();
        } catch (Exception e) {
            System.out.println("Falha na conexão com banco ao salvar férias: " + e.getMessage());
        }
    }
	public java.util.List<Ferias> findAllFerias() {
        String SQL = "SELECT * FROM FERIAS";
        java.util.List<Ferias> ferias = new java.util.ArrayList<>();
        try {
            java.sql.Connection connection = java.sql.DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            java.sql.PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            java.sql.ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {
                Ferias f = new Ferias(
                    resultSet.getInt("ID"),
                    resultSet.getInt("FUNCIONARIO_ID"),
                    resultSet.getDate("DATA_INICIO").toLocalDate(),
                    resultSet.getDate("DATA_FIM").toLocalDate(),
                    resultSet.getString("STATUS")
                );
                ferias.add(f);
            }
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao listar férias: " + e.getMessage());
        }
        return ferias;
    }
	public void updateStatusFerias(int id, String status) {
        String SQL = "UPDATE FERIAS SET STATUS = ? WHERE ID = ?";
        try {
            java.sql.Connection connection = java.sql.DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            java.sql.PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setString(1, status);
            ps.setInt(2, id);
            ps.execute();
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao atualizar status: " + e.getMessage());
        }
    }
	public boolean hasFeriasAtivas(int funcionarioId) {
        boolean temAtiva = false;
        String SQL = "SELECT COUNT(*) FROM FERIAS WHERE FUNCIONARIO_ID = ? AND UPPER(STATUS) IN ('PENDENTE', 'APROVADA')";
        
        try {
            java.sql.Connection connection = java.sql.DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            java.sql.PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setInt(1, funcionarioId);
            
            java.sql.ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                temAtiva = rs.getInt(1) > 0;
            }
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao verificar férias ativas: " + e.getMessage());
        }
        return temAtiva;
    }
}