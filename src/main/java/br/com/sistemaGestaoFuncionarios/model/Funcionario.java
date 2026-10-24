package br.com.sistemaGestaoFuncionarios.model;


import java.sql.Date;


public class Funcionario {
    private int id;
    private String nome;
    private String cpf;
    private String email;
    private String telefone;
    private String senha;
    private Date dataNascimento;
    private Date dataContratacao;
    private String status;
    private String perfil;
    private int cargoId;
    private int departamentoId;

    public Funcionario(int id, String nome, String cpf, String email, String telefone, String senha, Date dataNascimento, Date dataContratacao, String status, String perfil, int cargoId, int departamentoId) {
        this.id = id;
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.senha = senha;
        this.telefone = telefone;
        this.dataNascimento = dataNascimento;
        this.dataContratacao = dataContratacao;
        this.status = status;
        this.perfil = perfil;
        this.cargoId = cargoId;
        this.departamentoId = departamentoId;
    }

    public Funcionario(String nome, String cpf, String email, String senha, String telefone,  Date dataNascimento, Date dataContratacao, String status, String perfil, int cargoId, int departamentoId) {
        this.nome = nome;
        this.cpf = cpf;
        this.email = email;
        this.senha = senha;
        this.telefone = telefone;
        this.dataNascimento = dataNascimento;
        this.dataContratacao = dataContratacao;
        this.status = status;
        this.perfil = perfil;
        this.cargoId = cargoId;
        this.departamentoId = departamentoId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPerfil() {
        return perfil;
    }

    public void setPerfil(String perfil) {
        this.perfil = perfil;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public Date getDataContratacao() {
        return dataContratacao;
    }

    public void setDataContratacao(Date dataContratacao) {
        this.dataContratacao = dataContratacao;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCargoId() {
        return cargoId;
    }

    public void setCargoId(int cargoId) {
        this.cargoId = cargoId;
    }

    public int getDepartamentoId() {
        return departamentoId;
    }

    public void setDepartamentoId(int departamentoId) {
        this.departamentoId = departamentoId;
    }
}
