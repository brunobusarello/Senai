
import Classes.Carro;
import java.awt.font.TextAttribute;
import java.util.Scanner;

/**
 *
 * @author bruno_busarello
 */
public class Main {

    public static void main(String[] args) {
        // Carro = class
        // carro = objeto
        // Carro() = constructor
        int opc = 1;
        Carro carro = new Carro(20);
        Scanner ler = new Scanner(System.in);

        // menu
        while (opc > 0) {
            System.out.println("----------------------------------");
            System.out.println("| 1 - Acelerar");
            System.out.println("| 2 - Frear");
            System.out.println("| 3 - Ligar");
            System.out.println("| 4 - Desligar");
            System.out.println("| 0 - Sair");
            System.out.println("----------------------------------");
            System.out.print("Sua escolha: ");
            opc = ler.nextInt();

            switch (opc) {
                case 0:
                    System.out.println("== Saindo do sistema! ==");
                    break;
                case 1:
                    if(!carro.isStatus()){
                        System.out.println("Ligue o carro primeiro");
                    }
                    else{
                        System.out.print("Qual velocidade deseja acelerar? ");
                        int vel = ler.nextInt();
                        carro.acelerar(vel);
                    }
                    break;
                case 2:
                    if(!carro.isStatus() || carro.getVelocidade() <= 0){
                        System.out.println("Ligue ou acelere o carro primeiro");
                    }
                    else{
                        System.out.print("Informe a velocidade final: ");
                        int velocidade = ler.nextInt();
                        carro.frear(velocidade);
                    }
                    break;
                case 3:
                    carro.ligar();
                    break;
                case 4:
                    carro.desligar();
                    break;
                default:
                    System.out.println("Opção incorreta");
            }
            carro.status();
        }
    }
}
