/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author bruno_busarello
 */
public class InfPedido {
    private float qtd;
    private int idProduto;
    private String desc;

    public InfPedido() {
    }

    public InfPedido(float qtd, int idProduto) {
        this.qtd = qtd;
        this.idProduto = idProduto;
    }

    public InfPedido(float qtd, String desc) {
        this.qtd = qtd;
        this.desc = desc;
    }

    public float getQtd() {
        return qtd;
    }

    public void setQtd(float qtd) {
        this.qtd = qtd;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    
    
    
}
