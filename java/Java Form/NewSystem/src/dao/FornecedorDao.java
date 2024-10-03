/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;
import model.Fornecedor;

/**
 *
 * @author bruno_busarello
 */
public interface FornecedorDao {
    void addFornecedor(Fornecedor fornecedor);
    Fornecedor getFornecedor(int id);
    List<Fornecedor> getAllFornecedors();
    void updateFornecedor(Fornecedor fornecedor);
    void deleteFornecedor(int id);
}
