/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.List;

/**
 *
 * @author bruno_busarello
 */
public class Pedido {
    private int cod;
    private Date dataEmissao;
    private List<Integer> idProdutos;
    private int idCliente;

    public Pedido(int cod, Date dataEmissao, List<Integer> idProdutos, int idCliente) {
        this.cod = cod;
        this.dataEmissao = dataEmissao;
        this.idProdutos = idProdutos;
        this.idCliente = idCliente;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public Date getDataEmissao() {
        return dataEmissao;
    }

    public void setDataEmissao(Date dataEmissao) {
        this.dataEmissao = dataEmissao;
    }

    public List<Integer> getIdProdutos() {
        return idProdutos;
    }

    public void setIdProdutos(List<Integer> idProdutos) {
        this.idProdutos = idProdutos;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }
    
    
}
