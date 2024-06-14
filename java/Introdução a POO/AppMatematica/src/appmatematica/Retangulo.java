package appmatematica;

/**
 *
 * @author bruno_busarello
 */
public class Retangulo {
    // atributos
    private float lado1;
    private float lado2;
    private float area;
    private float perimetro;
    
    // setters
    public void setLado1(float lado1) {
        this.lado1 = lado1;
    }
    
    public void setLado2(float lado2) {
        this.lado2 = lado2;
    }
    
    // construtores
    public Retangulo(){
        
    }

    public Retangulo(float l1, float l2) {
        this.lado1 = l1;
        this.lado2 = l2;
    }
    
    // métodos
    public void calcArea(){
        this.area = this.lado1 * this.lado2;
        System.out.println("A área do retângulo " + this.lado1 + "X" + this.lado2 + " é: " + this.area);
    }
    
    public void calcPerimetro(){
        this.perimetro = (this.lado1 * 2) + (this.lado2 * 2);
        System.out.println("O perímetro do retângulo " + this.lado1 + "X" + this.lado2 + " é: " + this.perimetro);
    }
}
