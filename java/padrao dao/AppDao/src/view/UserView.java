package view;

import model.User;
import dao.UserDao;
import dao.UserDaoImpl;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

public class UserView extends JFrame {
    private UserDao userDao;
    private JTextField txtName;
    private JTextField txtEmail;
    private JTextArea txtUsers;

    public UserView() {
        userDao = new UserDaoImpl();

        setTitle("User Management");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Panel para adicionar usuário
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 2));
        panel.add(new JLabel("Name:"));
        txtName = new JTextField();
        panel.add(txtName);
        panel.add(new JLabel("Email:"));
        txtEmail = new JTextField();
        panel.add(txtEmail);
        JButton btnAdd = new JButton("Add User");
        panel.add(btnAdd);

        // Área de texto para mostrar usuários
        txtUsers = new JTextArea();
        txtUsers.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(txtUsers);

        add(panel, BorderLayout.NORTH);
        add(scrollPane, BorderLayout.CENTER);

        btnAdd.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String name = txtName.getText();
                String email = txtEmail.getText();
                userDao.addUser(new User(0, name, email));
                loadUsers();
                txtName.setText("");
                txtEmail.setText("");
            }
        });

        loadUsers();
    }

    private void loadUsers() {
        List<User> users = userDao.getAllUsers();
        StringBuilder sb = new StringBuilder();
        for (User user : users) {
            sb.append("ID: ").append(user.getId()).append(", Name: ").append(user.getName()).append(", Email: ")
                    .append(user.getEmail()).append("\n");
        }
        txtUsers.setText(sb.toString());
    }
}
