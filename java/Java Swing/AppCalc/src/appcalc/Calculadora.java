package appcalc;

import java.security.spec.NamedParameterSpec;

/**
 *
 * @author bruno_busarello
 */
public class Calculadora {
    private char par;           // verifica se os pares de "(", "[" ou "{" estão corretos
    private boolean ok = true;  // retorno do método expOk()
    private String infixa;      // Recebe a expressão INFIXA para decompor
    
    private String[] expInfixa = new String[50];    // Guarda a expressão infixa decomposta em um valor
    
    private double resultado;   // guarda o resultado da expressão calculada
    
    private String[] npr = new String[100];
    private String input = "";
    
    // constructor
    public Calculadora() {
    }
    
    // ========= Métodos para converter e avaliar a expressão =========
    // avaliar a expressão
    public String evalExp(String strInFixa){
        if(expOk(strInFixa)){
            this.expInfixa = decompor(strInFixa);
            this.npr = posFixa();
            System.out.println("Expressão Balanceada!");
            
            for (int i = 0; npr[i] != null; i++) {
                System.out.println(npr[i] + " ");
            }
            this.resultado = calcular();
        }
        else{
            System.out.println("Expressão não balanceada!");
        }
        return String.valueOf(resultado);
    }
    
    // verifica se a expressão está balanceada (OK)
    public boolean expOk(String str){
        Pilha p = new Pilha();
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == '[' || str.charAt(i) == '(') {
                p.empilha(str.charAt(i));
            }
            else if (str.charAt(i) == ']' || str.charAt(i) == ')') {
                if (!p.vazia()) {
                    par = p.desempilha().toString().charAt(0);
                }
                else {
                    ok = false;
                }
                if (par != '[' && par != '(') {
                    ok = false;
                }
            }
        }
        if(!p.vazia()){
            ok = false;
        }
        return ok;
    }
    
    public String[] decompor(String str){
        this.infixa = str;
        String[] arrayInfixa = new String[50];
        
        int indexIni = 0;
        boolean operando = false;
        boolean fimOperando = true;
        int indexArray = 0;
        
        for (int i = 0; i < infixa.length(); i++) {
            char ch = infixa.charAt(i);
            if ((ch >= '0') && (ch <= '9')) {
                operando = true;
                fimOperando = false;
            }
            else if ((ch == '(') || (ch == ')') || (ch == '*') || (ch == '/') || (ch == '+') || (ch == '-')) {
                if (operando) {
                    fimOperando = true;
                }
                else {
                    operando = false;
                    fimOperando = false;
                }
            }
            if (operando && fimOperando) { // se era um operando e terminou
                // coloca os operandos na matriz
                arrayInfixa[indexArray] = infixa.substring(indexIni, i);
                indexArray++;
                operando = false;
                indexIni = i;
                
                // coloca o operador na matriz
                arrayInfixa[indexArray] = infixa.substring(indexIni, i+1);
                indexArray++;
                indexIni = i + 1;
            }
            else if (fimOperando && operando) { // se era um operador coloca na matriz
                arrayInfixa[indexArray] = infixa.substring(indexIni, i+1);
                indexArray++;
                indexIni = i + 1;
            }
        }
        if (indexIni < infixa.length()) { // atualiza o restante da expressão
            arrayInfixa[indexArray] = infixa.substring(indexIni, infixa.length());
        }
        this.expInfixa = arrayInfixa;
        
        return arrayInfixa;
    }
    
    public String[] posFixa(){
        String[] arrayNpr = new String[100];
        Pilha p = new Pilha();
        int indexArray = 0;
        
        for (int i = 0; expInfixa[i] != null; i++) {
            String valor = expInfixa[i];
            
            if(valor.charAt(0) == '+' || valor.charAt(0) == '-' || valor.charAt(0) == '*' || valor.charAt(0) == '/'){
                while (!p.vazia() && pri(p.topo().toString().charAt(0)) >= pri(valor.charAt(0))) {
                    arrayNpr[indexArray] = p.desempilha().toString();
                    indexArray++;
                }
                p.empilha(valor);
            }
            else if (valor.charAt(0) == '(') {
                p.empilha(valor);
            }
            else if (valor.charAt(0) == ')') {
                while (p.topo().toString().charAt(0) != '(') {
                    arrayNpr[indexArray] = p.desempilha().toString();
                    indexArray++;
                }
                p.desempilha();
            }
            else {
                arrayNpr[indexArray] = valor;
                indexArray++;
            }
        }
        while (!p.vazia()) {            
            arrayNpr[indexArray] = p.desempilha().toString();
            indexArray++;
        }
    }
}
