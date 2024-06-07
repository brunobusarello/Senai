package bankproject;

public class Conta {
    // atributos da classe
    int tpConta;
    int nConta;
    String titular;
    float saldo;
    float limite;
    
    // métodos da classe
    public void status(){
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
        }
        else if(this.tpConta == 0){
            if(this.saldo + this.limite >= vlSaq){
                this.saldo -= vlSaq;
                this.limite += this.saldo;
                this.saldo = 0;
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
        if(this.limite < 1000){
            if(vlDep >= 1000 - this.limite){
                vlDep -= (1000 - this.limite);
                this.limite = 1000;
            }
            else{
                this.limite += vlDep;
                vlDep = 0;
            }
        }
        this.saldo += vlDep;
    }
}