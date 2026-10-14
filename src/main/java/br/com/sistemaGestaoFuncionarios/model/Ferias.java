package br.com.sistemaGestaoFuncionarios.model;


import java.time.LocalDate;

public class Ferias {
    private int id;
    private int funcionarioId;
    private LocalDate dataInicio;
    private LocalDate dataFim;
    private String status;

    public Ferias(int id, int funcionarioId, LocalDate dataInicio, LocalDate dataFim, String status) {
        this.id = id;
        this.funcionarioId = funcionarioId;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.status = status;
    }

    public int getFuncionarioId() {
        return funcionarioId;
    }

    public void setFuncionarioId(int funcionarioId) {
        this.funcionarioId = funcionarioId;
    }

    public LocalDate getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(LocalDate dataInicio) {
        this.dataInicio = dataInicio;
    }

    public LocalDate getDataFim() {
        return dataFim;
    }

    public void setDataFim(LocalDate dataFim) {
        this.dataFim = dataFim;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}


