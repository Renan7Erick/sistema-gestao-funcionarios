package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Funcionario;
import br.com.sistemaGestaoFuncionarios.model.Ponto;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PontoDAO {


    public void createPonto(Ponto ponto){

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");

            String SQL = "SELECT * FROM PONTO WHERE FUNCIONARIO_ID = ? AND DATA = CURRENT_DATE ORDER BY ID DESC"; // lista a data e o id do funcioanrio, para os horarios,  precisa ser atualizado 1 vez, um de entrada e um de saída
// é organizado por id para o resultSet.next() encontrar o ultimo registro dee saida

            System.out.println("conecto");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setInt(1, ponto.getFuncionarioId()); // vai ser pego pelo usuario logado

            ResultSet resultSet = preparedStatement.executeQuery();

            if(resultSet.next() && resultSet.getTime("saida") == null){ //verifica se ja tem um registro, se sim, cadastra uma saída
                SQL = "UPDATE PONTO SET SAIDA = CURRENT_TIME WHERE ID = ?"; // é um update, pois ele atualiza o cadastro para cadastrar a saída

                preparedStatement = connection.prepareStatement(SQL);
                preparedStatement.setInt(1, resultSet.getInt("id"));
                preparedStatement.executeUpdate();

                System.out.println("registro de saída");
            } else { // se nao, cadastra uma entrada

                SQL = "INSERT INTO PONTO (FUNCIONARIO_ID, DATA, ENTRADA) VALUES (?, CURRENT_DATE, CURRENT_TIME)";

                preparedStatement = connection.prepareStatement(SQL);
                preparedStatement.setInt(1, ponto.getFuncionarioId());
                preparedStatement.executeUpdate();

                System.out.println("Entrada Registrada");

            }

            System.out.println("inserido");

            connection.close();


        } catch (Exception e) {

            System.out.println("fail in database connection" + e.getMessage());

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