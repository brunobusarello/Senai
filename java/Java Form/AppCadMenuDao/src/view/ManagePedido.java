/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JInternalFrame.java to edit this template
 */
package view;

import dao.ClienteDaoImpl;
import dao.PedidoDaoImpl;
import dao.ProdutoDaoImpl;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import model.Cliente;
import model.InfPedido;
import model.Pedido;

/**
 *
 * @author gusta
 */
public class ManagePedido extends javax.swing.JInternalFrame {
    PedidoDaoImpl pedidoDaoImpl = new PedidoDaoImpl();
    List<Integer> idClientes = pedidoDaoImpl.getAllId();
    /**
     * Creates new form ManagePedido
     */
    public ManagePedido() {
        initComponents();
        loadCli();
    }
    
    public void loadCli(){
        for (Integer idCliente : idClientes) {
            jCbCli.addItem(idCliente + pedidoDaoImpl.getCliName(pedidoDaoImpl.getClientId(idCliente)));
        }
    }
    
    public void loadPro(){
        DefaultTableModel defaultPro = new DefaultTableModel(new Object[]{
            "Descrição",
            "Quantidade"
        }, 0);
        
        
        List<InfPedido> pedidos = pedidoDaoImpl.getProduto(jCbCli.getSelectedIndex()+1);
        for (InfPedido produto : pedidos) {
            Object linha[] = new Object[] {
                produto.getDesc(),
                produto.getQtd()
            };
            defaultPro.addRow(linha);
        }
        jTbPro.setModel(defaultPro);
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jCbCli = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTbPro = new javax.swing.JTable();
        jTfDate = new javax.swing.JTextField();
        btnDel = new javax.swing.JButton();

        setClosable(true);

        jCbCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jCbCliActionPerformed(evt);
            }
        });

        jTbPro.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null},
                {null, null, null, null}
            },
            new String [] {
                "Title 1", "Title 2", "Title 3", "Title 4"
            }
        ));
        jScrollPane1.setViewportView(jTbPro);

        jTfDate.setEditable(false);

        btnDel.setText("Deletar");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 495, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jCbCli, javax.swing.GroupLayout.PREFERRED_SIZE, 159, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jTfDate, javax.swing.GroupLayout.PREFERRED_SIZE, 129, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(btnDel)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap(19, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jCbCli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jTfDate, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(btnDel))
                .addGap(18, 18, 18)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 293, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(21, 21, 21))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jCbCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jCbCliActionPerformed
        // TODO add your handling code here:
        jTfDate.setText(String.valueOf(pedidoDaoImpl.getPedDate(jCbCli.getSelectedIndex()+1)));
        loadPro();
    }//GEN-LAST:event_jCbCliActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnDel;
    private javax.swing.JComboBox<String> jCbCli;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTbPro;
    private javax.swing.JTextField jTfDate;
    // End of variables declaration//GEN-END:variables
}