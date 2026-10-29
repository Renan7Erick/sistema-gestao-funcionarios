package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Funcionario;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

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

public List<Funcionario> encontrarFuncionarios(){
    String SQL = "SELECT f.*,\n" +
            "       c.nome AS cargo_nome,\n" +
            "       d.nome AS departamento_nome\n" +
            "FROM funcionario f\n" +
            "INNER JOIN cargo c ON f.cargo_id = c.id\n" +
            "INNER JOIN departamento d ON f.departamento_id = d.id";

    try {

        Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
        PreparedStatement preparedStatement = connection.prepareStatement(SQL);

        System.out.println("conecto");

        ResultSet resultSet = preparedStatement.executeQuery();

        List<Funcionario> funcionarios = new ArrayList<>();

        while (resultSet.next()){
            int funcionarioId = resultSet.getInt("id");
            String funcinarioNome = resultSet.getString("nome");
            String funcionarioCpf = resultSet.getString("cpf");
            String funcionarioEmail = resultSet.getString("email");
            String funcionarioSenha = resultSet.getString("senha");
            String funcionarioTelefone = resultSet.getString("telefone");
            Date funcionarioDataNasc = resultSet.getDate("data_nascimento");
            Date funcionarioDataCont = resultSet.getDate("data_contratacao");
            String status = resultSet.getString("status");
            String perfil = resultSet.getString("perfil");
            int cargoId = resultSet.getInt("cargo_id");
            String cargoNome = resultSet.getString("cargo_nome");
            int departamentoId = resultSet.getInt("departamento_id");
            String departamentoNome = resultSet.getString("departamento_nome");


            Funcionario funcionario = new Funcionario(funcionarioId, funcinarioNome, funcionarioCpf, funcionarioEmail, funcionarioSenha, funcionarioTelefone,  funcionarioDataNasc, funcionarioDataCont, status, perfil, cargoId, cargoNome, departamentoId, departamentoNome);

            funcionarios.add(funcionario);
        }
        System.out.println("cosnuilta realizadda");

        connection.close();

        return funcionarios;




    }catch (Exception e) {

        System.out.println("Erro ao consultar os dados no DB" + e.getMessage());

        return Collections.emptyList();
    }
}

    public void deleteFuncionarioById(String funcionarioId){
    String SQL = "DELETE FUNCIONARIO WHERE ID = ?";

    try {

        Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");

        System.out.println("success in database connection");

        PreparedStatement preparedStatement = connection.prepareStatement(SQL);
        preparedStatement.setString(1, funcionarioId);
        preparedStatement.execute();

        System.out.println("sucesso ao deletar usuario de id: " + funcionarioId);

        connection.close();




    } catch (Exception e) {

        System.out.println("fail in database connection"+ e.getMessage());

    }

    }

    public void updateFuncionario(Funcionario funcionario){

        String SQL = "UPDATE FUNCIONARIO SET NOME = ?, CPF = ?, EMAIL = ?, TELEFONE = ?, DATA_NASCIMENTO =?, DATA_CONTRATACAO = ?, STATUS = ? , PERFIL = ?, CARGO_ID = ?, DEPARTAMENTO_ID = ? WHERE ID = ?";

        try{
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa","sa");
            System.out.println("conecto");

            PreparedStatement preparedStatement = connection.prepareStatement(SQL);

            preparedStatement.setString(1, funcionario.getNome());
            preparedStatement.setString(2, funcionario.getCpf());
            preparedStatement.setString(3, funcionario.getEmail());
            preparedStatement.setString(4, funcionario.getTelefone());
            preparedStatement.setDate(5, funcionario.getDataNascimento());
            preparedStatement.setDate(6, funcionario.getDataContratacao());
            preparedStatement.setString(7, funcionario.getStatus());
            preparedStatement.setString(8, funcionario.getPerfil());
            preparedStatement.setInt(9, funcionario.getCargoId());
            preparedStatement.setInt(10, funcionario.getDepartamentoId());
            preparedStatement.setInt(11, funcionario.getId());
            preparedStatement.execute();

            System.out.println("atualizado");


            connection.close();

        } catch (Exception e) {

            System.out.println("fail in database connection"+ e.getMessage());

        }



    }

}
