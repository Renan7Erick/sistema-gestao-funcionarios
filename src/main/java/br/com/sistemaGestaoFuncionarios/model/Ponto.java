package br.com.sistemaGestaoFuncionarios.model;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

public class Ponto {
    private int id;
    private int funcionarioId;
    private Date data;
    private Time entrada;
    private Time saida;

    public Ponto(int id, int funcionarioId, Date data, Time entrada, Time saida) {
        this.id = id;
        this.funcionarioId = funcionarioId;
        this.data = data;
        this.entrada = entrada;
        this.saida = saida;
    }

    public Ponto() {

    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getFuncionarioId() {
        return funcionarioId;
    }

    public void setFuncionarioId(int funcionarioId) {
        this.funcionarioId = funcionarioId;
    }

    public Date getData() {
        return data;
    }

    public void setData(Date data) {
        this.data = data;
    }

    public Time getEntrada() {
        return entrada;
    }

    public void setEntrada(Time entrada) {
        this.entrada = entrada;
    }

    public Time getSaida() {
        return saida;
    }

    public void setSaida(Time saida) {
        this.saida = saida;
    }
}


