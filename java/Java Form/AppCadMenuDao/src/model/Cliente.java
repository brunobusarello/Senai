package model;

/**
 *
 * @author bruno_busarello
 */
public class Cliente {
    private int codigo;
    private String nome;
    private String fone;
    private String email;
    private String endereco;

    public Cliente(int codigo, String nome, String fone, String email, String endereco) {
        this.codigo = codigo;
        this.nome = nome;
        this.fone = fone;
        this.email = email;
        this.endereco = endereco;
    }

    public Cliente() {
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getFone() {
        return fone;
    }

    public void setFone(String fone) {
        this.fone = fone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    
}
