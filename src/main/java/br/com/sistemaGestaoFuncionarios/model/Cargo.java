package br.com.sistemaGestaoFuncionarios.model;

public class Cargo {
    private int id;
    private String nome;
    private String nivel;
    private int departamentoId;

    public Cargo(int id, String nome, String nivel, int departamentoId) {
        this.id = id;
        this.nome = nome;
        this.nivel = nivel;
        this.departamentoId = departamentoId;
    }

    public int getDepartamentoId() {
        return departamentoId;
    }

    public void setDepartamentoId(int departamentoId) {
        this.departamentoId = departamentoId;
    }

    public String getNivel() {
        return nivel;
    }

    public void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public int getId() {
        return id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }
}
