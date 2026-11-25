package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Ferias;
import br.com.sistemaGestaoFuncionarios.model.Ponto;

import java.sql.*;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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
	public String createFerias(Ferias ferias) {

        LocalDate inicio = ferias.getDataInicio();
        LocalDate fim = ferias.getDataFim();


        // Verifica se as datas estão preenchidas e se o inicio e antes do fim, senao for e data inválida
        if (inicio == null || fim == null || !inicio.isBefore(fim)){
            return "DATA_INVALIDA";
        }

        // As férias não podem começar no passado
        if (inicio.isBefore(LocalDate.now())){
            return "PASSADO";
        }


        // função que conta quantos dias existem entre a data de inicio e fim
        long dias = ChronoUnit.DAYS.between(inicio, fim) + 1;


        // se for mais q 30 bloqueia por limite de dias
        if (dias > 30){
            return "LIMITE_DIAS";
        }


        if (hasFeriasAtivas(ferias.getFuncionarioId(), inicio, fim)) {
            return "SOBREPOSTO";
        }


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

            return null;
        } catch (Exception e) {
            System.out.println("Falha na conexão com banco ao salvar férias: " + e.getMessage());
            return "ERRO";
        }
    }
	public java.util.List<Ferias> findAllFerias() {
        String SQL = "SELECT f.*, fu.nome AS funcionario_nome " +
                "FROM FERIAS f " +
                "INNER JOIN FUNCIONARIO fu ON f.funcionario_id = fu.id";
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

                f.setFuncionarioNome(resultSet.getString("funcionario_nome"));
                ferias.add(f);
            }
            connection.close();
        } catch (Exception e) {
            System.out.println("Erro ao listar férias: " + e.getMessage());
        }
        return ferias;
    }
    public List<Ferias> encontrarFeriasPorFuncionarioId(int funcionarioId){
        String SQL = "SELECT * FROM Ferias where funcionario_id = ?";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            System.out.println("conecto");

            preparedStatement.setInt(1, funcionarioId);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ferias> ferias = new ArrayList<>();

            while (resultSet.next()){
                int feriasId = resultSet.getInt("ID");
                LocalDate dataInicio = resultSet.getDate("DATA_INICIO").toLocalDate();
                LocalDate dataFim = resultSet.getDate("DATA_FIM").toLocalDate();
                String status = resultSet.getString("STATUS");
                int funcionario_Id = resultSet.getInt("funcionario_id");

                Ferias feria = new Ferias(feriasId, funcionario_Id, dataInicio, dataFim, status);

                ferias.add(feria);
            }

            System.out.println("cosnuilta realizadda");

            connection.close();

            return ferias;



        }catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }
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

    public boolean hasFeriasAtivas(int funcionarioId, LocalDate inicio, LocalDate fim) {
        boolean temAtiva = false;
        String SQL = "SELECT COUNT(*) FROM FERIAS WHERE FUNCIONARIO_ID = ? " +
                "AND STATUS IN ('PENDENTE', 'APROVADA') " +
                "AND DATA_INICIO <= ? AND DATA_FIM >= ?";

        try {
            java.sql.Connection connection = java.sql.DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            java.sql.PreparedStatement ps = connection.prepareStatement(SQL);
            ps.setInt(1, funcionarioId);
            ps.setDate(2, java.sql.Date.valueOf(fim));      // existente começa antes (ou no dia) do fim novo
            ps.setDate(3, java.sql.Date.valueOf(inicio));   // existente termina depois (ou no dia) do início novo

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