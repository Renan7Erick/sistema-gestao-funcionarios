package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Ferias;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class FeriasDAO {

	public void createFerias(Ferias ferias) {
		String SQL = "INSERT INTO ferias (funcionario_id, data_inicio, data_fim, status) VALUES (?, ?, ?, ?)";

		try {
			Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
			System.out.println("conecto");

			PreparedStatement preparedStatement = connection.prepareStatement(SQL);

			preparedStatement.setInt(1, ferias.getFuncionarioId());
			preparedStatement.setDate(2, Date.valueOf(ferias.getDataInicio()));
			preparedStatement.setDate(3, Date.valueOf(ferias.getDataFim()));
			preparedStatement.setString(4, ferias.getStatus());
			preparedStatement.execute();

			System.out.println("férias inseridas");

			connection.close();

		} catch (Exception e) {
			System.out.println("fail in database connection" + e.getMessage());
		}
	}

	public List<Ferias> encontrarFerias() {
		String SQL = "SELECT * FROM ferias";

		try {
			Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
			PreparedStatement preparedStatement = connection.prepareStatement(SQL);

			System.out.println("conecto");

			ResultSet resultSet = preparedStatement.executeQuery();
			List<Ferias> listaFerias = new ArrayList<>();

			while (resultSet.next()) {
				int id = resultSet.getInt("id");
				int funcionarioId = resultSet.getInt("funcionario_id");
				Date dataInicio = resultSet.getDate("data_inicio");
				Date dataFim = resultSet.getDate("data_fim");
				String status = resultSet.getString("status");

				Ferias ferias = new Ferias(id, funcionarioId, dataInicio.toLocalDate(), dataFim.toLocalDate(), status);

				listaFerias.add(ferias);
			}
			System.out.println("consulta realizada");

			connection.close();
			return listaFerias;

		} catch (Exception e) {
			System.out.println("Erro ao consultar os dados no DB" + e.getMessage());
			return Collections.emptyList();
		}
	}

	public void updateFerias(Ferias ferias) {
		String SQL = "UPDATE ferias SET data_inicio = ?, data_fim = ?, status = ? WHERE id = ?";

		try {
			Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
			PreparedStatement preparedStatement = connection.prepareStatement(SQL);

			preparedStatement.setDate(1, Date.valueOf(ferias.getDataInicio()));
			preparedStatement.setDate(2, Date.valueOf(ferias.getDataFim()));
			preparedStatement.setString(3, ferias.getStatus());
			preparedStatement.setInt(4, ferias.getId());
			preparedStatement.execute();

			System.out.println("férias atualizadas com sucesso");

			connection.close();

		} catch (Exception e) {
			System.out.println("fail in database connection" + e.getMessage());
		}
	}

	public void deleteFeriasById(String feriasId) {
		String SQL = "DELETE FROM ferias WHERE id = ?";

		try {
			Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
			System.out.println("success in database connection");

			PreparedStatement preparedStatement = connection.prepareStatement(SQL);
			preparedStatement.setString(1, feriasId);
			preparedStatement.execute();

			System.out.println("sucesso ao deletar férias de id: " + feriasId);

			connection.close();

		} catch (Exception e) {
			System.out.println("fail in database connection" + e.getMessage());
		}
	}
}