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
import model.DbConnection;

/**
 *
 * @author bruno_busarello
 */
public class ClienteDaoImpl implements ClienteDao {
    DbConnection dbConnection = new DbConnection();
    
    public ClienteDaoImpl() {
        dbConnection.dbConnect();
    }
    
    @Override
    public void addCliente(Cliente cliente){
        try {
            String query = "INSERT INTO cliente (nome, fone, email, endereco) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = dbConnection.prepareStatement(query);
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
            PreparedStatement statement = dbConnection.prepareStatement(query);
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
            PreparedStatement statement = dbConnection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
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
            PreparedStatement statement = dbConnection.prepareStatement(query);
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
            PreparedStatement statement = dbConnection.prepareStatement(query);
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
            PreparedStatement statement = dbConnection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
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
