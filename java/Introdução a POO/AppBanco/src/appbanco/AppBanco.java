package appbanco;

/**
 *
 * @author bruno_busarello
 */

public class AppBanco {
    public static void main(String[] args) {
        // aqui vamos gerenciar os conceitos de POO
        
        System.out.println("=======================================");
        System.out.println("==   App de gerenciamento do Banco   ==");
        System.out.println("=======================================");
        
        // instanciar um novo objeta Conta
        Conta conta1 = new Conta();
        
        conta1.tpConta = '0';
        conta1.titular = "João Sem Braço";
        conta1.saldo = 500.00f;
        
        conta1.sacar(1300.00f);
        conta1.statusConta("conta1");
        System.out.println("");
        
        Conta c2 = new Conta();
        c2.nConta = 100;
        c2.tpConta = '2';
        c2.titular = "Abirobaldo Silva";
        c2.saldo = 230.00f;
        
        c2.statusConta("c2");
    }
    
}
