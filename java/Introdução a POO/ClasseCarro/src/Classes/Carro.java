package Classes;

/**
 *
 * @author bruno_busarello
 */
public class Carro {
    private int velocidade;
    private boolean status;

    // método construtor
    public Carro(int velocidade) {
        this.velocidade = velocidade;
    }
    
    // métodos da classe
    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getVelocidade() {
        return velocidade;
    }

    public void setVelocidade(int velocidade) {
        this.velocidade = velocidade;
    }
    
    public void acelerar(int aceleracao){
        this.velocidade += aceleracao;
    }
    
    public void frear(int vel){
        this.velocidade -= vel;
        if(this.velocidade < 0) this.velocidade = 0;
    }
    
    public void ligar(){
        if(this.status){
            System.out.println("O carro já está ligado");
        }
        else{
            this.status = true;
            System.out.println("Ligando o carro");
        }
    }
    
    public void desligar(){
        if(this.status && this.velocidade == 0){
            this.status = false;
            System.out.println("DesLigando o carro");
        }
        else{
            System.out.println("O carro já está desligado ou está em movimento");
        }
    }
    
    public void status(){
        System.out.println("Velocidade..........: " + this.velocidade);
        System.out.println("Status..............: " + this.status);
    }
}
