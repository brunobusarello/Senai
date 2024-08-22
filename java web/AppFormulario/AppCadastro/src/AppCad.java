import javax.swing.JFrame;

public class AppCad extends JFrame {

    public AppCad(){
        setTitle("Teste de Aplicação Desktop");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLocationRelativeTo(null);

        setVisible(true);
    }
    public static void main(String[] args) throws Exception {
        AppCad form = new AppCad();

    }
}
