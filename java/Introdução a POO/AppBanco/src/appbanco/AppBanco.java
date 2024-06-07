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
        Conta c101 = new Conta();
        c101.tpConta = '0';
        c101.nConta = 101;
        c101.titular = "Bruno";
        c101.saldo = 50.0f;
        c101.limite = 3000.0f;
        
        System.out.println("------------------------------");
        System.out.println("Deposito: 1800");
        c101.depositar(1800.0f);
        c101.statusConta("c101");
        
        System.out.println("------------------------------");
        System.out.println("Saque: 450");
        c101.sacar(450.0f);
        c101.statusConta("c101");
        
        System.out.println("------------------------------");
        System.out.println("Transferencia: 2000, c102");
        c101.transferir(2000, 102);
        c101.statusConta("c101");
    }
    
}
