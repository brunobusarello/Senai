package caduser;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

/**
 *
 * @author bruno_busarello
 */
public class CadUser {
    public static void main(String[] args) {
        JFrame form = new JFrame();
        
        form.setSize(500, 400);
        form.setLocationRelativeTo(null);
        form.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        form.setLayout(null);
        
        JLabel titulo = new JLabel();
        
        titulo.setText("Cadastro do cliente");
        titulo.setBounds(20, 20, 375, 35);
        titulo.setFont(new Font("Arial", Font.BOLD, 24));
        
        // input do nome
        JLabel lblNome = new JLabel();
        
        lblNome.setText("Nome:");
        lblNome.setBounds(20, 80, 90, 30);
        lblNome.setFont(new Font("Arial", Font.PLAIN, 18));
        
        JTextField tFNome = new JTextField();
        
        tFNome.setBounds(130, 80, 230, 30);
        
        // input do CPF
        JLabel lblCPF = new JLabel();
        
        lblCPF.setText("CPF:");
        lblCPF.setBounds(20, 120, 90, 30);
        lblCPF.setFont(new Font("Arial", Font.PLAIN, 18));
        
        JTextField tFCPF = new JTextField();
        
        tFCPF.setBounds(130, 120, 230, 30);
        
        // input do email
        JLabel lblEmail = new JLabel();
        
        lblEmail.setText("Email:");
        lblEmail.setBounds(20, 160, 90, 30);
        lblEmail.setFont(new Font("Arial", Font.PLAIN, 18));
        
        JTextField tFEmail = new JTextField();
        
        tFEmail.setBounds(130, 160, 230, 30);
        
        // input telefone
        JLabel lblTel = new JLabel();
        
        lblTel.setText("Telefone:");
        lblTel.setBounds(20, 200, 90, 30);
        lblTel.setFont(new Font("Arial", Font.PLAIN, 18));
        
        JTextField tFTel = new JTextField();
        
        tFTel.setBounds(130, 200, 230, 30);
        
        // botões
        JButton btnCad = new JButton("Cadastrar");
        btnCad.setBounds(20, 250, 100, 30);
        btnCad.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Você clicou no botão Cadastrar");
            }
            
        });
        
        JButton btnClear = new JButton("Limpar");
        btnClear.setBounds(130, 250, 100, 30);
        btnClear.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Você clicou no botão Limpar");
            }
            
        });
        
        JButton btnClose = new JButton("Fechar");
        btnClose.setBounds(240, 250, 100, 30);
        btnClose.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Você clicou no botão Fechar");
            }
            
        });
        
        JButton btnSearch = new JButton("Busca");
        btnSearch.setBounds(350, 250, 100, 30);
        btnSearch.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Você clicou no botão Busca");
            }
            
        });
        
        JButton btnAlt = new JButton("Alterar");
        btnAlt.setBounds(20, 290, 100, 30);
        btnAlt.addActionListener(new ActionListener(){
            @Override
            public void actionPerformed(ActionEvent e) {
                JOptionPane.showMessageDialog(null, "Você clicou no botão Alterar");
            }
            
        });
        
        // parte que adiciona os elementos ao formulário
        form.add(btnCad);
        form.add(btnAlt);
        form.add(btnClear);
        form.add(btnClose);
        form.add(btnSearch);
        form.add(tFTel);
        form.add(lblTel);
        form.add(tFEmail);
        form.add(lblEmail);
        form.add(tFCPF);
        form.add(lblCPF);
        form.add(tFNome);
        form.add(lblNome);
        form.add(titulo);
        
        form.setVisible(true);
    }
    
}
