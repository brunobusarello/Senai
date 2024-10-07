/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;
import model.Produto;

/**
 *
 * @author bruno_busarello
 */
public interface ProdutoDao {
    void addProduto(Produto produto);
    Produto getProduto(int id);
    List<Produto> getAllProdutos();
    void updateProduto(Produto produto);
    void deleteProduto(int id);
    int getNextId();
}
