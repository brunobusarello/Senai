package appcalc;


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
                System.out.print(npr[i] + " ");
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
        /*
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
        */
        
        int contPar = 0;
        int contCol = 0;
        for (int i = 0; i < str.length(); i++) {
            switch (str.charAt(i)) {
                case '(':
                    contPar++;
                    break;
                case ')':
                    contPar--;
                    break;
                case '[':
                    contCol++;
                    break;
                case ']':
                    contCol--;
                    break;
            }
        }
        if (contCol == 0 && contPar == 0) {
            return true;
        }
        else {
            return false;
        }
        
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
            else if ((ch == '(') || (ch == ')') || (ch == '*')
                    || (ch == '/') || (ch == '+') || (ch == '-')) {
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
            else if (!fimOperando && !operando) { // se era um operador coloca na matriz
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
    
    // converter arrayInfixa para Notação Polonesa Reversa (pós-fixa)
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
        return arrayNpr;
    }

    // === Métodos para executar a operação === 
    // Criar a operação
    public double calcular(){
        Pilha p = new Pilha();
        double res = 0;
        for (int i = 0; npr[i] != null; i++) {
            input = npr[i];
            
            // 1º verificar se é um operando ou um operador
            // criar a operação ==> Resultado = esquerdo OPERA Direito (res = x + y)
            // Calcular a operação e retornar o valor
            if (isOperando(input)) {
                p.empilha(Double.parseDouble(input));
            }
            else if (isOperador(input)) {
                double atual = fazOperacao(input, p);
                p.empilha(atual);
                res = atual;
            }
        }
        return res;
    }

    // preparar os operandos
    public double fazOperacao(String operador, Pilha p){
        double temp;
        if (p.vazia()) {
            temp = 0; 
        }
        else {
            temp = Double.parseDouble(p.desempilha().toString());
        }
        if (!p.vazia()) {
            temp = calcValores(operador, Double.parseDouble(p.desempilha().toString()), temp);
        }
        return temp;
    }

    // calcular valores
    public double calcValores(String operador, double esquerdo, double direito){
        if (operador.equals("+")) {
            return esquerdo + direito;
        }
        else if (operador.equals("-")) {
            return esquerdo - direito;
        }
        else if (operador.equals("*")) {
            return esquerdo * direito;
        }
        else if (operador.equals("/")) {
            if (direito == 0) {
                System.out.println("Erro: não pode dividir por zero");
                return esquerdo;
            }
            return esquerdo / direito;
        }
        else {
            return esquerdo;
        }
    }

    // === Métodos auxiliares ===
    // verificar se é um operador
    public boolean isOperador(String input){
        if (input == null) {
            return false;
        }
        return input.equals("+") || input.equals("-") || input.equals("/") || input.equals("*");
    }
    
    // verificar se é um operando
    public boolean isOperando(String input){
        if (input == null) {
            return false;
        }
        
        try {
            Double.parseDouble(input);
            return true;
        }
        catch(NumberFormatException ex){
            return false;
        }
    }
    
    // verificar e retornar a prioridade do operador
    private int pri(char op){
        int nPri = 0;
        if (op == '/' || op == '*') {
            nPri = 3;
        }
        if (op == '+' || op == '-') {
            nPri = 2;
        }
        if (op == '(') {
            nPri = 1;
        }
        return nPri;
    }
}
