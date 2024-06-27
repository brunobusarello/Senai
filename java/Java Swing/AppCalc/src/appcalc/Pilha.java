package appcalc;

/**
 *
 * @author bruno_busarello
 */
public class Pilha {
    public static final int maxItems = 100;
    private int itens;
    private Object stk[];
    private int topo = -1;

    public Pilha() {
        this.itens = maxItems;
        stk = new Object[itens];
    }

    public Pilha(int n){
        this.itens = n;
        stk = new Object[itens];
    }
    
    public void print(){
        if(!vazia()){
            String resp = "";
            for (int i = 0; i <= topo; i++) {
                resp += " [" + stk[i].toString() + "] ";
            }
            System.out.println(resp);
        }
        else{
            System.out.println("Pilha vazia");
        }
    }
    
    public int tamanho(){
        return (topo + 1);
    }
    
    public boolean vazia(){
        return (topo < 0);
    }
    
    public Object topo(){
        if(!vazia()){
            return stk[topo];
        }
        else{
            return null;
        }
    }
    
    public void empilha(Object obj){
        if(topo < itens - 1){
            topo++;
            stk[topo] = obj;
        }
        else{
            System.out.println("Pilha cheia");
        }
    }
    
    public Object desempilha(){
        if(!vazia()){
            return stk[topo--];
        }
        else{
            return null;
        }
    }
}
