package appmatematica;

/**
 *
 * @author bruno_busarello
 */
public class AppMatematica {
    public static void main(String[] args) {
        System.out.println("\nRetângulo 1");
        Retangulo rec1 = new Retangulo(10, 5);

        rec1.calcArea();
        rec1.calcPerimetro();
        
        rec1.setLado2(7);
        
        rec1.calcArea();
        rec1.calcPerimetro();
        
        System.out.println("\nRetângulo 2");
        Retangulo rec2 = new Retangulo(20, 20);
        
        rec2.calcArea();
        rec2.calcPerimetro();
        
        rec2.setLado2(25);
        
        rec2.calcArea();
        rec2.calcPerimetro();
        
        System.out.println("\nRetângulo 3");
        Retangulo rec3 = new Retangulo(10, 10);
        
        rec3.calcArea();
        rec3.calcPerimetro();
        
        rec3.setLado2(5);
        
        rec3.calcArea();
        rec3.calcPerimetro();
        
        System.out.println("\nRetângulo 4");
        Retangulo rec4 = new Retangulo(10, 5);
        
        rec4.calcArea();
        rec4.calcPerimetro();
        
        rec4.setLado2(40);
        
        rec4.calcArea();
        rec4.calcPerimetro();
    }
    
}
