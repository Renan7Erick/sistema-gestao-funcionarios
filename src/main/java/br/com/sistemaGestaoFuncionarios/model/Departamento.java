package br.com.sistemaGestaoFuncionarios.model;

public class Departamento {
    private int id;
    private String nome;
    private int totalColaboradores; // Novo campo para receber a contagem

    // Construtor original (mantido para não quebrar o CreateDepartamentoServlet)
    public Departamento(int id, String nome) {
        this.id = id;
        this.nome = nome;
    }

    // Novo construtor que inclui o total de colaboradores
    public Departamento(int id, String nome, int totalColaboradores) {
        this.id = id;
        this.nome = nome;
        this.totalColaboradores = totalColaboradores;
    }

    public int getId() { return id; }

    public String getNome() { return nome; }
    public void setNome(String nome) { this.nome = nome; }

    public int getTotalColaboradores() { return totalColaboradores; }
    public void setTotalColaboradores(int totalColaboradores) { this.totalColaboradores = totalColaboradores; }
}