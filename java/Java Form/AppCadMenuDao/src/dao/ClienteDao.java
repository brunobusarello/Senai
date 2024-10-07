/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;
import model.Cliente;

/**
 *
 * @author bruno_busarello
 */
public interface ClienteDao {
    void addCliente(Cliente cliente);
    Cliente getCliente(int id);
    List<Cliente> getAllClientes();
    void updateCliente(Cliente cliente);
    void deleteCliente(int id);
    int getNextId();
}
