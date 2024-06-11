
import Classes.Carro;
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
        Carro carro = new Carro();
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
                case 1:
                    
                    break;
                case 2:

                    break;
                case 3:

                    break;
                case 4:

                    break;
                default:
                    System.out.println("Opção incorreta");
            }
        }

        carro.setStatus(true);
        if (!carro.isStatus()) {
            carro.setStatus(true);
            System.out.println("O carro foi ligado");
        } else {
            System.out.println("Carro já está ligado");
        }

        carro.setVelocidade(50); // colocar velocidade no meu objeto
        if (carro.isStatus()) {
            carro.acelerar(100);
        } else {
            System.out.println("Não foi possível acelerar o carro");
        }
        int armazenarV = carro.getVelocidade(); // pegar velocidade do meu objeto

        System.out.println("Velocidade: " + armazenarV + " Km/h");
        System.out.println("Status: " + carro.isStatus());

    }

}
