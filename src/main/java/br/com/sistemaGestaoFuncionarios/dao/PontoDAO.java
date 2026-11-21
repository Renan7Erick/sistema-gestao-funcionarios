package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Funcionario;
import br.com.sistemaGestaoFuncionarios.model.Ponto;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PontoDAO {


    public String createPonto(Ponto ponto){

        String SQL = "SELECT COUNT(*) FROM FERIAS WHERE FUNCIONARIO_ID = ? AND STATUS = 'APROVADA' " +
                "AND CURRENT_DATE BETWEEN DATA_INICIO AND DATA_FIM"; //busca se o usuário está de férias na data atual para bloquear o ponto

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");


            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, ponto.getFuncionarioId());
            ResultSet resultSet = preparedStatement.executeQuery();
            resultSet.next();

            if (resultSet.getInt(1) > 0){
                connection.close();
                return "FERIAS"; // esse if significa se ele encontrar um registro de férias ele bloqueia o ponto e encerra a função
            }

            //senão estiver de ferias ele segue pro registro e outras verificações

            SQL = "SELECT * FROM PONTO WHERE FUNCIONARIO_ID = ? AND DATA = CURRENT_DATE ORDER BY ID DESC";
            preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, ponto.getFuncionarioId());
            resultSet = preparedStatement.executeQuery(); //busca os pontos de hoje, se tiver

            if (resultSet.next()){
                if (resultSet.getTime("saida") == null){
                    // saída em aberto: registra a saída
                    SQL = "UPDATE PONTO SET SAIDA = CURRENT_TIME WHERE ID = ?";
                    preparedStatement = connection.prepareStatement(SQL);
                    preparedStatement.setInt(1, resultSet.getInt("id"));
                    preparedStatement.executeUpdate();
                }else {
                    // já tem entrada e saída hoje
                    connection.close();
                    return "LIMITE";
                }

            }else{
                // nenhum registro hoje: registra a entrada
                SQL = "INSERT INTO PONTO (FUNCIONARIO_ID, DATA, ENTRADA) VALUES (?, CURRENT_DATE, CURRENT_TIME)";
                preparedStatement = connection.prepareStatement(SQL);
                preparedStatement.setInt(1, ponto.getFuncionarioId());
                preparedStatement.executeUpdate();
            }


            connection.close();
            return null;

        } catch (Exception e) {

            System.out.println("fail in database connection" + e.getMessage());
            return "ERRO";

        }
    }

    public List<Ponto> encontrarPontos(){
        String SQL = "SELECT * FROM PONTO";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            System.out.println("conecto");

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ponto> pontos = new ArrayList<>();

            while (resultSet.next()){
                int pontoId = resultSet.getInt("id");
                Date data = resultSet.getDate("data");
                Time entrada = resultSet.getTime("entrada");
                Time saida = resultSet.getTime("saida");
                int funcionario_Id = resultSet.getInt("funcionario_id");

                Ponto ponto = new Ponto(pontoId,funcionario_Id, data, entrada,saida);

                pontos.add(ponto);
            }

            System.out.println("cosnuilta realizadda");

            connection.close();

            return pontos;



        }catch (Exception e) {

            System.out.println("fail in database connection" + e.getMessage());
            e.printStackTrace();
            return Collections.emptyList();

        }
    }

    public List<Ponto> encontrarPontosByFuncionarioId(int funcionarioId){
        String SQL = "SELECT * FROM PONTO where funcionario_id = ?";

        try {

            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            System.out.println("conecto");

            preparedStatement.setInt(1, funcionarioId);
            ResultSet resultSet = preparedStatement.executeQuery();

            List<Ponto> pontos = new ArrayList<>();

            while (resultSet.next()){
                int pontoId = resultSet.getInt("id");
                Date data = resultSet.getDate("data");
                Time entrada = resultSet.getTime("entrada");
                Time saida = resultSet.getTime("saida");
                int funcionario_Id = resultSet.getInt("funcionario_id");

                Ponto ponto = new Ponto(pontoId,funcionario_Id, data, entrada,saida);

                pontos.add(ponto);
            }

            System.out.println("cosnuilta realizadda");

            connection.close();

            return pontos;



        }catch (Exception e) {

            System.out.println("fail in database connection");

            return Collections.emptyList();

        }

    }





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