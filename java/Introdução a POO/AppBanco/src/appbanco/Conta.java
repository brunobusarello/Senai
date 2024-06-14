package appbanco;

public class Conta {
    // == tpConta ==
    // 0 - C. Corrente
    // 1 - Poupança
    // 2 - Salário
    // =============
    
    // atributos de classe
    private char tpConta;
    private int nConta;
    private String titular;
    private float saldo = 0.0f;
    private float limite = 0.0f;
    
     //construtor da classe
    public Conta(char tp, int nC, String tit){
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
    
    // métodos da Classe
    public void sacar(float vlSaq){
        if(this.saldo >= vlSaq){
            this.saldo -= vlSaq;
        }
        else if(this.tpConta == '0'){
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
    
    public void transferir(float vlTransf, int conta){
        if(this.saldo >= vlTransf){
            System.out.println("Transferindo R$" + vlTransf + " para a conta: " + conta);
            this.saldo -= vlTransf;
        }
        else if(this.tpConta == '0'){
            if(this.saldo + this.limite >= vlTransf){
                System.out.println("Transferindo R$" + vlTransf + " para a conta: " + conta);
                this.saldo -= vlTransf;
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
    
    public float verSaldo(){
        return this.saldo;
    }
    
    public void statusConta(String obj){
        System.out.println("-------- Informacoes da Conta " + obj + " --------");
        System.out.println("Tipo.............: " + this.tpConta);
        System.out.println("Numero...........: " + this.nConta);
        System.out.println("Titular..........: " + this.titular);
        System.out.println("Saldo............: " + this.saldo);
        System.out.println("Limite...........: " + this.limite);
        System.out.println("--------------------------------------");
    }
}
