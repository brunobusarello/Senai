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
import model.Pedido;
import model.DbConnection;

/**
 *
 * @author bruno_busarello
 */
public class PedidoDaoImpl implements PedidoDao {
    DbConnection dbConnection = new DbConnection();
    
    public PedidoDaoImpl() {
        dbConnection.dbConnect();
    }
    
    @Override
    public void addPedido(Pedido pedido){
        try {
            String query = "INSERT INTO pedido (dataEmissao, idCliente) VALUES (?, ?)";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            statement.setDate(1, pedido.getDataEmissao());
            statement.setInt(2, pedido.getIdCliente());
            statement.executeUpdate();
            
            List<Pedido.InfPedido> produtos = pedido.getIdProdutos();
            query = "INSERT INTO produto_pedido (idPedido, idProduto, qtd) VALUES (?, ?, ?)";
            for (int i = 0; i < produtos.size(); i++) {
                statement = dbConnection.prepareStatement(query);
                statement.setInt(1, pedido.getCod());
                statement.setInt(2, produtos.get(i).getIdPedido());
                statement.setInt(3, produtos.get(i).getQtd());
                statement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public Pedido getPedido(int id){
        Pedido pedido = null;
        try {
            String query = "SELECT * FROM pedido WHERE id = ?";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                //pedido = new Pedido(resultSet.getInt("id"), resultSet.getString("nome"),
                //        resultSet.getString("fone"), resultSet.getString("email"), resultSet.getString("endereco"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pedido;
    }
    
    @Override
    public List<Pedido> getAllPedidos() {
        List<Pedido> pedidos = new ArrayList<>();
        try {
            String query = "SELECT * FROM pedido";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                query = "SELECT * FROM pedido_produto WHERE idPedido = ?";
                statement = dbConnection.prepareStatement(query);
                statement.setInt(1, id);
                resultSet = statement.executeQuery();
                List<Pedido.InfPedido> produtos = null;
                int cod = resultSet.getInt("id");
                int idCliente = resultSet.getInt("idCliente");
                var dateEmission = resultSet.getDate("dataEmissao");
                
                while (resultSet.next()) {
                    produtos.add()
                }
                pedidos.add(new Pedido(cod, dateEmission, produtos, idCliente));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pedidos;
    }
    
    @Override
    public void updatePedido(Pedido pedido) {
        try {
            String query = "UPDATE pedido SET nome = ?, fone = ?, email = ?, endereco = ? WHERE id = ?";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            /*
            statement.setString(1, pedido.getNome());
            statement.setString(2, pedido.getFone());
            statement.setString(3, pedido.getEmail());
            statement.setString(4, pedido.getEndereco());
            statement.setInt(5, pedido.getCodigo());
            statement.executeUpdate();
            */
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deletePedido(int id) {
        try {
            String query = "DELETE FROM pedido WHERE id = ?";
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
            String query = "SELECT AUTO_INCREMENT FROM information_schema.TABLES WHERE TABLE_NAME = 'pedido';";
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
