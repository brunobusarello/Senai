package bankproject;

import java.lang.invoke.MethodHandles;
import java.util.Scanner;

/**
 *
 * @author bruno_busarello
 */
public class BankProject {
    public static Scanner ler = new Scanner(System.in);
    
    
    public static void main(String[] args) {
        int i = 0;
        Conta id101 = new Conta();
        while (i < 5) {
            Scanner lerStr = new Scanner(System.in);
            i = menuInicial();
            switch (i) {
                case 1:
                    id101.nConta = 101;
                    System.out.println("O numero da sua conta e " + id101.nConta);
                    System.out.print("Nome do titular da conta: ");
                    id101.titular = lerStr.nextLine();
                    System.out.println("\n| 0 - C. Corrente");
                    System.out.println("| 1 - Poupanca");
                    System.out.println("| 2 - Salário");
                    System.out.print("Qual sera o tipo de conta? ");
                    id101.tpConta = ler.nextInt();
                    System.out.print("Qual o saldo inicial? R$ ");
                    id101.saldo = ler.nextFloat();
                    System.out.print("Qual o limite da conta? R$ ");
                    id101.limite = ler.nextFloat();
                    System.out.println("");
                    System.out.println("=================================");
                    System.out.println("|   Conta criada com sucesso!   |");
                    System.out.println("=================================");
                    System.out.println("");
                    break;
                case 2:
                    id101.status();
                    break;
                case 3:
                    System.out.print("--\nQual o valor deseja sacar? R$ ");
                    float vl3 = ler.nextFloat();
                    id101.sacar(vl3);
                    break;
                case 4:
                    System.out.print("Qual o valor deseja depositar? R$ ");
                    float vl4 = ler.nextFloat();
                    id101.depositar(vl4);
                    break;
            }
        }
    }
    
    public static int menuInicial(){
        System.out.println("========================================");
        System.out.println("|   Aplicativo Gerenciador de Contas   |");
        System.out.println("|--------------------------------------|");
        System.out.println("|                 MENU                 |");
        System.out.println("|--------------------------------------|");
        System.out.println("| 1 - Criar Conta   2 - Listar conta   |");
        System.out.println("| 3 - Sacar         4 - Depositar      |");
        System.out.println("| 5 - Sair                             |");
        System.out.println("========================================");
        System.out.print(" - Escolha uma opcao: ");
        int opc = ler.nextInt();
        return opc;
    }
}
