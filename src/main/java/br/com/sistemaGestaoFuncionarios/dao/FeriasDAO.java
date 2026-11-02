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

}