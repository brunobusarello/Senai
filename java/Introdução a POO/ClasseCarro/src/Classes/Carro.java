package Classes;

/**
 *
 * @author bruno_busarello
 */
public class Carro {
    private int velocidade;
    private boolean status = true;

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
}
