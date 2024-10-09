/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.sql.Date;
import java.util.List;
import model.InfPedido;
import model.Pedido;

/**
 *
 * @author bruno_busarello
 */
public interface PedidoDao {
    void addPedido(Pedido pedido);
    Pedido getPedido(int id);
    List<Pedido> getAllPedidos();
    void updatePedido(Pedido pedido);
    void deletePedido(int id);
    int getNextId();
    List<InfPedido> getProduto(int id);
    List<Integer> getAllCliId();
    String getCliName(int id);
    Date getPedDate(int id);
}
