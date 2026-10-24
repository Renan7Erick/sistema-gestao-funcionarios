package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FuncionarioDAO {

public void createFuncionario(Funcionario funcionario){
    String SQL = "INSERT INTO funcionario (nome, cpf, email, senha, telefone, data_nascimento, data_contratacao, status, perfil, cargo_id,  departamento_id) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

    try{
        Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
        System.out.println("conecto");

        PreparedStatement preparedStatement = connection.prepareStatement(SQL);

        preparedStatement.setString(1, funcionario.getNome());
        preparedStatement.setString(2, funcionario.getCpf());
        preparedStatement.setString(3, funcionario.getEmail());
        preparedStatement.setString(4, funcionario.getSenha());
        preparedStatement.setString(5, funcionario.getTelefone());
        preparedStatement.setDate(6, funcionario.getDataNascimento());
        preparedStatement.setDate(7, funcionario.getDataContratacao());
        preparedStatement.setString(8, funcionario.getStatus());
        preparedStatement.setString(9, funcionario.getPerfil());
        preparedStatement.setInt(10, funcionario.getCargoId());
        preparedStatement.setInt(11, funcionario.getDepartamentoId());
        preparedStatement.execute();

        System.out.println("inserido");


        connection.close();

    } catch (Exception e) {

        System.out.println("fail in database connection"+ e.getMessage());

    }

}



}
