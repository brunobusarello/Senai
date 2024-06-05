package appbanco;

public class Conta {
    // == tpConta ==
    // 0 - C. Corrente
    // 1 - Poupança
    // 2 - Salário
    // =============
    
    // atributos de classe
    char tpConta;
    int nConta;
    String titular;
    float saldo = 0.0f;
    float limite = 1000.0f;
    
    // métodos da Classe
    public void sacar(float vlSaq){
        if(this.saldo >= vlSaq || (this.tpConta == '0' && this.saldo + this.limite >= vlSaq)){
            this.saldo -= vlSaq;
            if(this.saldo < 0){
                this.limite -= -this.saldo;
                this.saldo = 0;
            }
        }
        else{
            System.out.println("Você não tem saldo suficiente para esta operação.");
        }
    }
    
    public void depositar(float vlDep){
        this.saldo += vlDep;
    }
    
    public void transferir(float vlTransf, int conta){
        if(this.saldo >= vlTransf){
            System.out.println("O valor de R$" + vlTransf + " foi depositado na conta: " + conta);
            this.saldo -= vlTransf;
        }
        else{
            System.out.println("Você não tem saldo suficiente para esta operação.");
        }
    }
    
    public float verSaldo(){
        return this.saldo;
    }
    
    public void statusConta(String obj){
        System.out.println("-------- Informações da Conta " + obj + " --------");
        System.out.println("Tipo.............: " + this.tpConta);
        System.out.println("Número...........: " + this.nConta);
        System.out.println("Titular..........: " + this.titular);
        System.out.println("Saldo............: " + this.saldo);
        System.out.println("Limite...........: " + this.limite);
        System.out.println("--------------------------------------");
    }
}
