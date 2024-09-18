
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author bruno_busarello
 */
public class Arquivo {
    public static String read(String caminho){
        String conteudo = "";
        try {
            FileReader arquivo = new FileReader(caminho);
            BufferedReader leitura = new BufferedReader(arquivo);
            String linha = "";
            try {
                linha = leitura.readLine();
                while (linha != null) {                    
                    conteudo += linha + "\n";
                    linha = leitura.readLine();
                }
                arquivo.close();
                return conteudo;
            } catch (IOException ex) {
                System.err.println("Erro: Erro de leitura do arquivo.");
                return "";
            }
        } catch (FileNotFoundException ex) {
            System.err.println("Erro: Arquivo não encontrado");
            return "";
        }
    }
    
    public static boolean write(String caminho, String txt){
        try {
            FileWriter arquivo = new FileWriter(caminho);
            PrintWriter gravacao = new PrintWriter(arquivo);
            gravacao.append(txt);
            gravacao.close();
            
            return true;
        } catch (IOException ex) {
            System.err.println("Erro:" + ex.getMessage());
            return false;
        }
    }
}
