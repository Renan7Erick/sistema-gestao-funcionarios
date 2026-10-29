package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Cargo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CargoDAO {

    public void createCargo(Cargo cargo){
        String SQL = "INSERT INTO cargo (nome, nivel, departamento_id) VALUES (?,?,?)";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("Conectou");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, cargo.getNome());
            preparedStatement.setString(2, cargo.getNivel());
            preparedStatement.setInt(3, cargo.getDepartamentoId());
            preparedStatement.execute();

            System.out.println("Cargo Inserido");

            connection.close();



        } catch (Exception e) {
            System.out.println("fail in database connection"+ e.getMessage());
        }
    }

    public List<Cargo> encontrarCargos(){
        String SQL =  "SELECT c.*,\n" +
                "       d.nome AS departamento_nome\n" +
                "FROM cargo c\n" +
                "INNER JOIN departamento d ON c.departamento_id = d.id";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            System.out.println("Conectou");

            ResultSet resultSet = preparedStatement.executeQuery();

            List<Cargo> cargos = new ArrayList<>();

            while (resultSet.next()){
                int cargoId = resultSet.getInt("id");
                String cargoNome = resultSet.getString("nome");
                String cargoNivel = resultSet.getString("nivel");
                int departamentoId = resultSet.getInt("departamento_id");
                String departamentoNome = resultSet.getString("departamento_nome");

                Cargo cargo = new Cargo(cargoId, cargoNome, cargoNivel, departamentoId, departamentoNome);
                cargos.add(cargo);
            }

            System.out.println("Consulta realizada");
            connection.close();
            return cargos;

        } catch (Exception e) {
            System.out.println("Erro ao consultar os dados no DB" + e.getMessage());
            return Collections.emptyList();
        }
    }

    public void deleteCargoById(int cargoId){
        String SQL = "DELETE CARGO WHERE ID = ?";

        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            preparedStatement.setInt(1, cargoId);
            preparedStatement.execute();

            System.out.println("sucesso ao deletar usuario de id: " + cargoId);

            connection.close();

        } catch (Exception e) {
            System.out.println("fail in database connection"+ e.getMessage());
        }
    }

    public void updateCargo(Cargo cargo){
        String SQL = "UPDATE CARGO SET NOME = ?, NIVEL = ?, DEPARTAMENTO_ID = ? WHERE ID = ?";
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

            System.out.println("success in database connection");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, cargo.getNome());
            preparedStatement.setString(2, cargo.getNivel());
            preparedStatement.setInt(3, cargo.getDepartamentoId());
            preparedStatement.setInt(4, cargo.getId());
            preparedStatement.execute();

            System.out.println("success in update cargo");

            connection.close();

        } catch (Exception e) {
            System.out.println("fail in database connection");
            System.out.println("Error: " + e.getMessage());
        }
    }


}
