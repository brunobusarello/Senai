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
import model.InfPedido;

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
            
            List<InfPedido> produtos = pedido.getIdProdutos();
            query = "INSERT INTO produto_pedido (idPedido, idProduto, qtd) VALUES (?, ?, ?)";
            for (int i = 0; i < produtos.size(); i++) {
                statement = dbConnection.prepareStatement(query);
                statement.setInt(1, pedido.getCod());
                statement.setInt(2, produtos.get(i).getIdProduto());
                statement.setFloat(3, produtos.get(i).getQtd());
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
                query = "SELECT * FROM produto_pedido WHERE idPedido = ?";
                statement = dbConnection.prepareStatement(query);
                statement.setInt(1, id);
                ResultSet resultSet1 = statement.executeQuery();
                List<InfPedido> produtos = new ArrayList<>();
                
                while (resultSet1.next()) {
                    InfPedido inf = new InfPedido(resultSet1.getInt("qtd"), resultSet1.getInt("idProduto"));
                    produtos.add(inf);
                }
                pedidos.add(new Pedido(resultSet.getInt("id"), resultSet.getDate("dataEmissao"), produtos, resultSet.getInt("idCliente")));
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
    
    @Override
    public List<InfPedido> getProduto(int id){
        List<InfPedido> infPedidos = new ArrayList<>();
        try {
            String query = "select c.description, p.qtd from produto_pedido p join produto c on p.idProduto = c.id where idPedido=?;";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                infPedidos.add(new InfPedido(resultSet.getInt("qtd"), resultSet.getString("description")));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return infPedidos;
    }
    
    @Override
    public List<Integer> getAllCliId(){
        List<Integer> infPedidos = new ArrayList<>();
        try {
            String query = "select idCliente from pedido";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                infPedidos.add(resultSet.getInt("idCliente"));
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return infPedidos;
    }
    
    @Override
    public String getCliName(int id){
        String infPedidos = null;
        try {
            String query = "select c.nome from pedido p join cliente c on p.idCliente = c.id where idCliente=?;";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                infPedidos = resultSet.getString("nome");
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return infPedidos;
    }
    
    @Override
    public java.sql.Date getPedDate(int id){
        java.sql.Date infPedidos = null;
        try {
            String query = "select dataEmissao from pedido where id=?;";
            PreparedStatement statement = dbConnection.prepareStatement(query);
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                infPedidos = resultSet.getDate("dataEmissao");
            }
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return infPedidos;
    }
    
}
