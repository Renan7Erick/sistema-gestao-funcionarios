package br.com.sistemaGestaoFuncionarios.dao;

import br.com.sistemaGestaoFuncionarios.model.Ponto;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PontoDAO {

    public List<Ponto> encontrarPontos() {
        String SQL = "SELECT * FROM ponto";
        
        try {
            Connection connection = DriverManager.getConnection("jdbc:h2:~/test", "sa", "sa");
            PreparedStatement preparedStatement = connection.prepareStatement(SQL);
            
            System.out.println("conecto ao banco para listar pontos");
            
            ResultSet resultSet = preparedStatement.executeQuery();
            List<Ponto> listaPontos = new ArrayList<>();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int funcionarioId = resultSet.getInt("funcionario_id");
                
              
                Date dataSql = resultSet.getDate("data");
                Time entradaSql = resultSet.getTime("entrada");
                Time saidaSql = resultSet.getTime("saida");
                
  
                Ponto ponto = new Ponto(
                        id, 
                        funcionarioId, 
                        dataSql != null ? dataSql.toLocalDate() : null, 
                        entradaSql != null ? entradaSql.toLocalTime() : null, 
                        saidaSql != null ? saidaSql.toLocalTime() : null
                );
                
                listaPontos.add(ponto);
            }
            System.out.println("consulta de pontos realizada");

            connection.close();
            return listaPontos;

        } catch (Exception e) {
            System.out.println("Erro ao consultar os dados de Ponto no DB: " + e.getMessage());
            return Collections.emptyList();
        }
    }
}