package bankproject;

public class Conta {
    // atributos da classe
    private int tpConta;
    private int nConta;
    private String titular;
    private float saldo;
    private float limite;
    private float limiteMax;
    
    //construtor da classe
    public Conta(int tp, int nC, String tit){
        this.tpConta = tp;
        this.nConta = nC;
        this.titular = tit;
        this.saldo = 0.0f;
        this.limite = 500.0f;
    }
    
    // definindo getters 
    public int getTpConta() {
        return tpConta;
    }

    public int getnConta() {
        return nConta;
    }

    public float getSaldo() {
        return saldo;
    }
    
    // métodos da classe
    public void status(){
        System.out.println("");
        System.out.println("-------- Informacoes da Conta --------");
        System.out.println("Tipo.............: " + this.tpConta);
        System.out.println("Numero...........: " + this.nConta);
        System.out.println("Titular..........: " + this.titular);
        System.out.println("Saldo............: " + this.saldo);
        System.out.println("Limite...........: " + this.limite);
        System.out.println("--------------------------------------");
    }
    
    public void sacar(float vlSaq){
        if(this.saldo >= vlSaq){
            this.saldo -= vlSaq;
            System.out.println("");
            System.out.println("=================================");
            System.out.println("| Saque de" + vlSaq + " feito com sucesso");
            System.out.println("=================================");
        }
        else if(this.tpConta == 0){
            if(this.saldo + this.limite >= vlSaq){
                float limOriginal = this.limite;
                this.saldo -= vlSaq;
                this.limite += this.saldo;
                this.saldo = 0;
                System.out.println("");
                System.out.println("=================================");
                System.out.println("| Saque de " + vlSaq + "feito com sucesso");
                System.out.println("| Foi utilizado " + (limOriginal - this.limite) + " do limite");
                System.out.println("=================================");
            }
            else{
                System.out.println("Limite insuficiente para a operação");
            }
        }
        else{
            System.out.println("Você não tem saldo suficiente para esta operação.");
        }
    }
    
    public void depositar(float vlDep){
        if(this.limite < limiteMax){
            if(vlDep >= limiteMax - this.limite){
                vlDep -= (limiteMax - this.limite);
                this.limite = limiteMax;
            }
            else{
                this.limite += vlDep;
                vlDep = 0;
            }
        }
        this.saldo += vlDep;
    }
}