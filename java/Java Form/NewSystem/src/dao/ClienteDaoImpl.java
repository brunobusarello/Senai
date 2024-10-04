/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import model.Cliente;

/**
 *
 * @author bruno_busarello
 */
public class ClienteDaoImpl implements ClienteDao {
    private Connection connection;
    

    public ClienteDaoImpl() {
        connection();
    }
    
    public boolean connection(){
        try {
            String url = "jdbc:mysql://localhost:3306/db_sccpf";
            String cliente = "root";
            String password = "";
            connection = DriverManager.getConnection(url, cliente, password);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    @Override
    public void addCliente(Cliente cliente){
        try {
            String query = "INSERT INTO cliente (nome, fone, email, endereco) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, cliente.getNome());
            statement.setString(2, cliente.getFone());
            statement.setString(3, cliente.getEmail());
            statement.setString(4, cliente.getEndereco());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Cliente getCliente(int id){
        Cliente cliente = null;
        try {
            String query = "SELECT * FROM cliente WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                cliente = new Cliente(resultSet.getInt("id"), resultSet.getString("nome"),
                        resultSet.getString("fone"), resultSet.getString("email"), resultSet.getString("endereco"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cliente;
    }
    
    @Override
    public List<Cliente> getAllClientes() {
        List<Cliente> clientes = new ArrayList<>();
        try {
            String query = "SELECT * FROM cliente";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                clientes.add(new Cliente(resultSet.getInt("id"), resultSet.getString("nome"),
                        resultSet.getString("fone"), resultSet.getString("email"), resultSet.getString("endereco")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return clientes;
    }
    
    @Override
    public void updateCliente(Cliente cliente) {
        try {
            String query = "UPDATE cliente SET nome = ?, fone = ?, email = ?, endereco = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, cliente.getNome());
            statement.setString(2, cliente.getFone());
            statement.setString(3, cliente.getEmail());
            statement.setString(4, cliente.getEndereco());
            statement.setInt(5, cliente.getCodigo());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCliente(int id) {
        try {
            String query = "DELETE FROM cliente WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public int getNextId(){
        int maior = 0;
        try {
            String query = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_NAME = 'cliente';";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                maior = resultSet.getInt("AUTO_INCREMENT");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            maior = 0;
        }
        return maior;
    }
    
}
