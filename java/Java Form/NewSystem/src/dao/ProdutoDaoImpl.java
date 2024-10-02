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
import model.Produto;

/**
 *
 * @author bruno_busarello
 */
public class ProdutoDaoImpl implements ProdutoDao {
    private Connection connection;

    public ProdutoDaoImpl() {
        try {
            String url = "jdbc:mysql://localhost:3306/db_sccpf";
            String produto = "root";
            String password = "";
            connection = DriverManager.getConnection(url, produto, password);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void addProduto(Produto produto){
        try {
            String query = "INSERT INTO produto (desc, unit, qtd, preco) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, produto.getDesc());
            statement.setString(2, produto.getUnit());
            statement.setFloat(3, produto.getQtd());
            statement.setFloat(4, produto.getPreco());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Produto getProduto(int id){
        Produto produto = null;
        try {
            String query = "SELECT * FROM produto WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                produto = new Produto(resultSet.getInt("id"), resultSet.getString("desc"),
                        resultSet.getString("unit"), resultSet.getFloat("qtd"), resultSet.getFloat("preco"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produto;
    }
    
    @Override
    public List<Produto> getAllProdutos() {
        List<Produto> produtos = new ArrayList<>();
        try {
            String query = "SELECT * FROM produto";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                produtos.add(new Produto(resultSet.getInt("id"), resultSet.getString("desc"),
                        resultSet.getString("unit"), resultSet.getFloat("qtd"), resultSet.getFloat("preco")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return produtos;
    }
    
    @Override
    public void updateProduto(Produto produto) {
        try {
            String query = "UPDATE produto SET nome = ?, fone = ?, email = ?, endereco = ? WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, produto.getDesc());
            statement.setString(2, produto.getUnit());
            statement.setFloat(3, produto.getQtd());
            statement.setFloat(4, produto.getPreco());
            statement.setInt(5, produto.getCod());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduto(int id) {
        try {
            String query = "DELETE FROM produto WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
