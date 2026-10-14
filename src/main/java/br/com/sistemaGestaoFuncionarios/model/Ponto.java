package br.com.sistemaGestaoFuncionarios.model;

import java.time.LocalDate;
import java.time.LocalTime;

public class Ponto {
    private int id;
    private int funcionarioId;
    private LocalDate data;
    private LocalTime entrada;
    private LocalTime saida;

    public Ponto(int id, int funcionarioId, LocalDate data, LocalTime entrada, LocalTime saida) {
        this.id = id;
        this.funcionarioId = funcionarioId;
        this.data = data;
        this.entrada = entrada;
        this.saida = saida;
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

    public LocalDate getData() {
        return data;
    }

    public void setData(LocalDate data) {
        this.data = data;
    }

    public LocalTime getEntrada() {
        return entrada;
    }

    public void setEntrada(LocalTime entrada) {
        this.entrada = entrada;
    }

    public LocalTime getSaida() {
        return saida;
    }

    public void setSaida(LocalTime saida) {
        this.saida = saida;
    }
}


