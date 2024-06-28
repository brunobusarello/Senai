package appcalc;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Action;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

/**
 *
 * @author bruno_busarello
 */
public class AppCalc {
    public static void main(String[] args) {
        int hBtn = 60;
        int wBtn = 60;
        int espaco = 20;
        
        // cria a tela
        JFrame form = new JFrame();
        
        form.setSize(360, 570);
        form.setTitle("Calculadora");
        form.setLocationRelativeTo(null);
        form.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        form.setLayout(null);
        
        // visor da calculadora
        JTextField visor = new JTextField();
        visor.setHorizontalAlignment(SwingConstants.RIGHT);
        visor.setFont(new Font("Arial", Font.PLAIN, 28));
        visor.setBounds(20, 20, 300, 80);
        
        // botões
        JButton btnClear = new JButton("C");
        btnClear.setFont(new Font("Arial", Font.PLAIN, 22));
        btnClear.setBounds(espaco, 120, wBtn, hBtn);
        btnClear.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText("");
            }
            
        });
        
        JButton btnBack = new JButton("<");
        btnBack.setFont(new Font("Arial", Font.PLAIN, 22));
        btnBack.setBounds(espaco * 2 + wBtn, 120, wBtn, hBtn);
        btnBack.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                if(visor.getText().length() > 0) visor.setText(visor.getText().substring(0, visor.getText().length() - 1));
            }
        });
        
        JButton btnOpnPar = new JButton("(");
        btnOpnPar.setFont(new Font("Arial", Font.PLAIN, 22));
        btnOpnPar.setBounds(espaco * 3 + wBtn * 2, 120, wBtn, hBtn);
        btnOpnPar.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "(");
            }
            
        });
        
        JButton btnClsPar = new JButton(")");
        btnClsPar.setFont(new Font("Arial", Font.PLAIN, 22));
        btnClsPar.setBounds(espaco * 4 + wBtn * 3, 120, wBtn, hBtn);
        btnClsPar.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + ")");
            }
        });
        
        JButton btn7 = new JButton("7");
        btn7.setFont(new Font("Arial", Font.PLAIN, 22));
        btn7.setBounds(espaco, 120 + 60 + 20, wBtn, hBtn);
        btn7.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "7");
            }
            
        });
        
        JButton btn8 = new JButton("8");
        btn8.setFont(new Font("Arial", Font.PLAIN, 22));
        btn8.setBounds(espaco * 2 + wBtn, 120 + 60 + 20, wBtn, hBtn);
        btn8.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "8");
            }
            
        });
        
        JButton btn9 = new JButton("9");
        btn9.setFont(new Font("Arial", Font.PLAIN, 22));
        btn9.setBounds(espaco * 3 + wBtn * 2, 120 + 60 + 20, wBtn, hBtn);
        btn9.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "9");
            }
            
        });
        
        JButton btnBarr = new JButton("/");
        btnBarr.setFont(new Font("Arial", Font.PLAIN, 22));
        btnBarr.setBounds(espaco * 4 + wBtn * 3, 120 + 60 + 20, wBtn, hBtn);
        btnBarr.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "/");
            }
            
        });
        
        JButton btn4 = new JButton("4");
        btn4.setFont(new Font("Arial", Font.PLAIN, 22));
        btn4.setBounds(espaco, 120 + 80 * 2, wBtn, hBtn);
        btn4.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "4");
            }
            
        });
        
        JButton btn5 = new JButton("5");
        btn5.setFont(new Font("Arial", Font.PLAIN, 22));
        btn5.setBounds(espaco * 2 + wBtn, 120 + 80 * 2, wBtn, hBtn);
        btn5.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "5");
            }
            
        });
        
        JButton btn6 = new JButton("6");
        btn6.setFont(new Font("Arial", Font.PLAIN, 22));
        btn6.setBounds(espaco * 3 + wBtn * 2, 120 + 80 * 2, wBtn, hBtn);
        btn6.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "6");
            }
            
        });
        
        JButton btnMult = new JButton("*");
        btnMult.setFont(new Font("Arial", Font.PLAIN, 22));
        btnMult.setBounds(espaco * 4 + wBtn * 3, 120 + 80 * 2, wBtn, hBtn);
        btnMult.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "*");
            }
            
        });
        
        JButton btn1 = new JButton("1");
        btn1.setFont(new Font("Arial", Font.PLAIN, 22));
        btn1.setBounds(espaco, 120 + 80 * 3, wBtn, hBtn);
        btn1.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "1");
            }
            
        });
        
        JButton btn2 = new JButton("2");
        btn2.setFont(new Font("Arial", Font.PLAIN, 22));
        btn2.setBounds(espaco * 2 + wBtn, 120 + 80 * 3, wBtn, hBtn);
        btn2.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "2");
            }
            
        });
        
        JButton btn3 = new JButton("3");
        btn3.setFont(new Font("Arial", Font.PLAIN, 22));
        btn3.setBounds(espaco * 3 + wBtn * 2, 120 + 80 * 3, wBtn, hBtn);
        btn3.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "3");
            }
            
        });
        
        JButton btnLess = new JButton("-");
        btnLess.setFont(new Font("Arial", Font.PLAIN, 22));
        btnLess.setBounds(espaco * 4 + wBtn * 3, 120 + 80 * 3, wBtn, hBtn);
        btnLess.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "-");
            }
            
        });
        
        JButton btn0 = new JButton("0");
        btn0.setFont(new Font("Arial", Font.PLAIN, 22));
        btn0.setBounds(espaco, 120 + 80 * 4, wBtn, hBtn);
        btn0.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "0");
            }
            
        });
        
        JButton btnDot = new JButton(".");
        btnDot.setFont(new Font("Arial", Font.PLAIN, 22));
        btnDot.setBounds(espaco * 2 + wBtn, 120 + 80 * 4, wBtn, hBtn);
        btnDot.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + ".");
            }
            
        });
        
        JButton btnEquals = new JButton("=");
        btnEquals.setFont(new Font("Arial", Font.PLAIN, 22));
        btnEquals.setBounds(espaco * 3 + wBtn * 2, 120 + 80 * 4, wBtn, hBtn);
        btnEquals.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                String exp = visor.getText();
                
                System.out.println(">>>"+exp);
                Calculadora calculo = new Calculadora();
                String resultado = calculo.evalExp(exp);
                visor.setText(resultado);
            }
            
        });
        
        JButton btnPlus = new JButton("+");
        btnPlus.setFont(new Font("Arial", Font.PLAIN, 22));
        btnPlus.setBounds(espaco * 4 + wBtn * 3, 120 + 80 * 4, wBtn, hBtn);
        btnPlus.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                visor.setText(visor.getText() + "+");
            }
            
        });
        
        form.add(btnPlus);
        form.add(btnEquals);
        form.add(btnDot);
        form.add(btn0);
        form.add(btnLess);
        form.add(btn3);
        form.add(btn2);
        form.add(btn1);
        form.add(btnMult);
        form.add(btn6);
        form.add(btn5);
        form.add(btn4);
        form.add(btnBarr);
        form.add(btn9);
        form.add(btn8);
        form.add(btn7);
        form.add(btnClsPar);
        form.add(btnOpnPar);
        form.add(btnBack);
        form.add(btnClear);
        form.add(visor);
        
        form.setVisible(true);
    }
    
}
