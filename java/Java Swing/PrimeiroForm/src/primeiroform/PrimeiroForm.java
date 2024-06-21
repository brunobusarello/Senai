package primeiroform;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

/**
 *
 * @author bruno_busarello
 */
public class PrimeiroForm {
    public static void main(String[] args) {
        JFrame form = new JFrame();
        
        // definição do tamanho da janela
        form.setSize(600, 400);
        
        // título da janela
        form.setTitle("Exemplo de form em Java");
        
        //faz a janela aparecer no centro
        form.setLocationRelativeTo(null);
        
        // encerra a aplicação quando clicado no X
        form.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        // determina que apenas o usuário fazerá o layout
        form.setLayout(null);
        
        JLabel label = new JLabel();
        
        // texto a ser mostrado no label
        label.setText("Teste de label no form");
        
        // define a posição e as dimensões
        label.setBounds(50, 50, 200, 30);
        
        // cria uma nova cor
        Color cor1 = new Color(0, 0, 200);
        
        // muda o tipo da fonte, a família e o tamanho
        label.setFont(new Font("Arial", Font.BOLD, 18));
        
        // muda a cor da fonte
        label.setForeground(cor1);
        
        JTextField jTfNome = new JTextField();
        
        // seta o tamanho do campo do nome
        jTfNome.setBounds(50, 90, 200, 30);
        
        JButton botao = new JButton("5");
        
        // define as dimensões do botão
        botao.setBounds(70, 130, 160, 30);
        
        botao.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                jTfNome.setText(jTfNome.getText()+"5");
            }
            
        });
        
        // adiciona o objeto botão ao formulário
        form.add(botao);
        
        // adiciona o objeto jTfNome ao formulário
        form.add(jTfNome);
        
        // adiciona o objeto label ao formulário
        form.add(label);
        
        // torna a janela visível
        form.setVisible(true);
    }
}
