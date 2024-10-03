/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Fornecedor;

/**
 *
 * @author bruno_busarello
 */
public class FornecedorDaoImpl implements FornecedorDao {
    private Connection connection;

    public FornecedorDaoImpl() {
        try {
            String url = "jdbc:mysql://localhost:3306/db_sccpf";
            String fornecedor = "root";
            String password = "";
            connection = DriverManager.getConnection(url, fornecedor, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void addFornecedor(Fornecedor fornecedor){
        try {
            String query = "INSERT INTO fornecedor (empresa, contato, fone, email) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, fornecedor.getEmpresa());
            statement.setString(2, fornecedor.getContato());
            statement.setString(3, fornecedor.getFone());
            statement.setString(4, fornecedor.getEmail());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Fornecedor getFornecedor(int id){
        Fornecedor fornecedor = null;
        try {
            String query = "SELECT * FROM fornecedor WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                fornecedor = new Fornecedor(resultSet.getInt("id"), resultSet.getString("empresa"),
                        resultSet.getString("contato"), resultSet.getString("fone"), resultSet.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fornecedor;
    }
    
    @Override
    public List<Fornecedor> getAllFornecedors() {
        List<Fornecedor> fornecedors = new ArrayList<>();
        try {
            String query = "SELECT * FROM fornecedor";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                fornecedors.add(new Fornecedor(resultSet.getInt("id"), resultSet.getString("empresa"),
                        resultSet.getString("contato"), resultSet.getString("fone"), resultSet.getString("email")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return fornecedors;
    }
    
    @Override
    public void updateFornecedor(Fornecedor fornecedor) {
        try {
            String query = "UPDATE fornecedor SET empresa = ?, contato = ?, fone = ?, email = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, fornecedor.getEmpresa());
            statement.setString(2, fornecedor.getContato());
            statement.setString(3, fornecedor.getFone());
            statement.setString(4, fornecedor.getEmail());
            statement.setInt(5, fornecedor.getCod());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteFornecedor(int id) {
        try {
            String query = "DELETE FROM fornecedor WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
