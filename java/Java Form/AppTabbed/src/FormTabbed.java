
import java.util.ArrayList;
import javax.swing.JOptionPane;
import javax.swing.table.DefaultTableModel;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */

/**
 *
 * @author bruno_busarello
 */
public class FormTabbed extends javax.swing.JFrame {
    /*
    * * Creates new form FormTabbed
     */
    // <editor-fold defaultstate="collapsed" desc="VARIÁVEIS">
    // Guarda a informação se será salvo uma edição ou um novo registro
    public static boolean editCli = false;
    public static boolean editPro = false;
    public static boolean editFor = false;
    // Guarda a linha selecionada da tabela
    public static int selectedCli;
    public static int selectedPro;
    public static int selectedFor;
    // Listas para guardar as informações de cada seção
    public static ArrayList<Cliente> listaCliente;
    public static ArrayList<Produto> listaProduto;
    public static ArrayList<Fornecedor> listaFornecedor;
    //</editor-fold>
    
    /* ====== FUNÇÕES PARA ATUALIZAR AS TABELAS ====== */
    public void tblCliente(){
        DefaultTableModel modeloCli = new DefaultTableModel(new Object[]{
            "Código",
            "Nome",
            "Telefone",
            "Email",
            "Endereço"
        }, 0);
        
        for (int i = 0; i < listaCliente.size(); i++) {
            Object linhaCli[] = new Object[]{
                listaCliente.get(i).getCodigo(),
                listaCliente.get(i).getNome(),
                listaCliente.get(i).getFone(),
                listaCliente.get(i).getEmail(),
                listaCliente.get(i).getEndereco(),
            };
            modeloCli.addRow(linhaCli);
        }
        
        jTbCli.setModel(modeloCli);
        jTbCli.getColumnModel().getColumn(0).setPreferredWidth(50);
        jTbCli.getColumnModel().getColumn(1).setPreferredWidth(250);
        jTbCli.getColumnModel().getColumn(2).setPreferredWidth(80);
        jTbCli.getColumnModel().getColumn(3).setPreferredWidth(80);
        jTbCli.getColumnModel().getColumn(4).setPreferredWidth(80);
    }
    
    public void tblProduto(){
        DefaultTableModel modeloPro = new DefaultTableModel(new Object[]{
            "Código",
            "Preço",
            "Quantidade",
            "Unidade",
            "Decrição"
        }, 0);
        
        for (int i = 0; i < listaProduto.size(); i++) {
            Object linhaPro[] = new Object[]{
                listaProduto.get(i).getCod(),
                listaProduto.get(i).getPreco(),
                listaProduto.get(i).getQtd(),
                listaProduto.get(i).getUnit(),
                listaProduto.get(i).getDesc(),
            };
            modeloPro.addRow(linhaPro);
        }
        
        jTbPro.setModel(modeloPro);
        jTbPro.getColumnModel().getColumn(0).setPreferredWidth(50);
        jTbPro.getColumnModel().getColumn(1).setPreferredWidth(250);
        jTbPro.getColumnModel().getColumn(2).setPreferredWidth(80);
        jTbPro.getColumnModel().getColumn(3).setPreferredWidth(80);
        jTbPro.getColumnModel().getColumn(4).setPreferredWidth(80);
    }
    
    public void tblFornecedor(){
        DefaultTableModel modeloFor = new DefaultTableModel(new Object[]{
            "Código",
            "Empresa",
            "Contato",
            "Telefone",
            "Email"
        }, 0);
        
        for (int i = 0; i < listaFornecedor.size(); i++) {
            Object linhaCli[] = new Object[]{
                listaFornecedor.get(i).getCod(),
                listaFornecedor.get(i).getEmpresa(),
                listaFornecedor.get(i).getContato(),
                listaFornecedor.get(i).getFone(),
                listaFornecedor.get(i).getEmail(),
            };
            modeloFor.addRow(linhaCli);
        }
        
        jTbFor.setModel(modeloFor);
        jTbFor.getColumnModel().getColumn(0).setPreferredWidth(50);
        jTbFor.getColumnModel().getColumn(1).setPreferredWidth(250);
        jTbFor.getColumnModel().getColumn(2).setPreferredWidth(80);
        jTbFor.getColumnModel().getColumn(3).setPreferredWidth(80);
        jTbFor.getColumnModel().getColumn(4).setPreferredWidth(80);
    }
    
    /* ====== FUNÇÕES PARA SALVAR REGISTROS NO NOTEPAD ====== */
    public static void saveCli(){
        String fileCli = "cliente.db";
        String linhaCli = "";
        
        for (int i = 0; i < listaCliente.size(); i++) {
            linhaCli +=
                    listaCliente.get(i).getCodigo() + ";"
                    + listaCliente.get(i).getNome()+ ";"
                    + listaCliente.get(i).getFone()+ ";"
                    + listaCliente.get(i).getEmail()+ ";"
                    + listaCliente.get(i).getEndereco()+ "\n";
        }
        
        if (Arquivo.write(fileCli, linhaCli)) {
            JOptionPane.showMessageDialog(null, "Arquivo Gravado com sucesso!");
        }
        else{
            JOptionPane.showMessageDialog(null, "Erro na gravação do arquivo");
        }
    }
    
    public static void savePro(){
        String fileCli = "produto.db";
        String linhaCli = "";
        
        for (int i = 0; i < listaProduto.size(); i++) {
            linhaCli +=
                    listaProduto.get(i).getCod()+ ";"
                    + listaProduto.get(i).getPreco()+ ";"
                    + listaProduto.get(i).getQtd()+ ";"
                    + listaProduto.get(i).getUnit()+ ";"
                    + listaProduto.get(i).getDesc()+ "\n";
        }
        
        if (Arquivo.write(fileCli, linhaCli)) {
            JOptionPane.showMessageDialog(null, "Arquivo Gravado com sucesso!");
        }
        else{
            JOptionPane.showMessageDialog(null, "Erro na gravação do arquivo");
        }
    }
    
    public static void saveFor(){
        String fileCli = "fornecedor.db";
        String linhaCli = "";
        
        for (int i = 0; i < listaFornecedor.size(); i++) {
            linhaCli +=
                    listaFornecedor.get(i).getCod()+ ";"
                    + listaFornecedor.get(i).getEmpresa()+ ";"
                    + listaFornecedor.get(i).getContato()+ ";"
                    + listaFornecedor.get(i).getFone()+ ";"
                    + listaFornecedor.get(i).getEmail()+ "\n";
        }
        
        if (Arquivo.write(fileCli, linhaCli)) {
            JOptionPane.showMessageDialog(null, "Arquivo Gravado com sucesso!");
        }
        else{
            JOptionPane.showMessageDialog(null, "Erro na gravação do arquivo");
        }
    }
    
    /* ====== FUNÇÕES PARA CARREGAR OS DADOS DO NOTEPAD ====== */
    public static void loadCli(){
        String fileCli = "cliente.db";
        String content = Arquivo.read(fileCli);
        
        if (content.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Erro de leitura de arquivo");
        }
        else {
            String[] linhaCli = content.split("\n");
            String[] dadosCli;
            
            for (int i = 0; i < linhaCli.length; i++) {
                dadosCli = linhaCli[i].split(";");
                Cliente cli = new Cliente();
                cli.setCodigo(Integer.parseInt(dadosCli[0]));
                cli.setNome(dadosCli[1]);
                cli.setFone(dadosCli[2]);
                cli.setEmail(dadosCli[3]);
                cli.setEndereco(dadosCli[4]);
                listaCliente.add(cli);
            }
        }
    }
    
    public static void loadPro(){
        String filePro = "produto.db";
        String content = Arquivo.read(filePro);
        
        if (content.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Erro de leitura de arquivo");
        }
        else {
            String[] linhaPro = content.split("\n");
            String[] dadosPro;
            
            for (int i = 0; i < linhaPro.length; i++) {
                dadosPro = linhaPro[i].split(";");
                Produto pro = new Produto();
                pro.setCod(Integer.parseInt(dadosPro[0]));
                pro.setPreco(Float.parseFloat(dadosPro[1]));
                pro.setQtd(Float.parseFloat(dadosPro[2]));
                pro.setUnit(dadosPro[3]);
                pro.setDesc(dadosPro[4]);
                listaProduto.add(pro);
            }
        }
    }
    
    public static void loadFor(){
        String fileFor = "fornecedor.db";
        String content = Arquivo.read(fileFor);
        
        if (content.isEmpty()) {
            JOptionPane.showMessageDialog(null, "Erro de leitura de arquivo");
        }
        else {
            String[] linhaFor = content.split("\n");
            String[] dadosFor;
            
            for (int i = 0; i < linhaFor.length; i++) {
                dadosFor = linhaFor[i].split(";");
                Fornecedor forn = new Fornecedor();
                forn.setCod(Integer.parseInt(dadosFor[0]));
                forn.setEmpresa(dadosFor[1]);
                forn.setContato(dadosFor[2]);
                forn.setFone(dadosFor[3]);
                forn.setEmail(dadosFor[4]);
                listaFornecedor.add(forn);
            }
        }
    }
    
    // Método construtor
    public FormTabbed() {
        listaCliente = new ArrayList<>();
        listaProduto = new ArrayList<>();
        listaFornecedor = new ArrayList<>();
        loadCli();
        loadPro();
        loadFor();
        initComponents();
        tblCliente();
        tblFornecedor();
        tblProduto();
    }
    
    // <editor-fold defaultstate="collapsed" desc="CLIENTE: FUNÇÕES ADICIONAIS">
    // Habilita ou desabilita os inputs
    public void enableCli(boolean ena){
        jTfCodCli.setEnabled(ena);
        jTfMailCli.setEnabled(ena);
        jTfNameCli.setEnabled(ena);
        jTfPhoneCli.setEnabled(ena);
        jTaAddrCli.setEnabled(ena);
    }
    
    // Desabilita todos botões e inputs
    // Habilita o botão NOVO
    public void newCli(){
        btnNewCli.setEnabled(true);
        btnSaveCli.setEnabled(false);
        btnDltCli.setEnabled(false);
        btnCnlCli.setEnabled(false);
        btnEditCli.setEnabled(false);
        enableCli(false);
        limpaCli();
    }
    
    // Reseta todos os inputs
    public void limpaCli(){
        jTaAddrCli.setText("");
        jTfCodCli.setText("");
        jTfMailCli.setText("");
        jTfNameCli.setText("");
        jTfPhoneCli.setText("");
        
    }
    
    // Verifica se todos os inputs estão preenchidos
    public boolean verificaEdicaoCli(){
        return (!jTfCodCli.getText().isBlank() && !jTfNameCli.getText().isBlank() &&
            !jTfPhoneCli.getText().isBlank() && !jTfMailCli.getText().isBlank()
            && !jTaAddrCli.getText().isBlank());
    }
    // </editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="PRODUTO: FUNÇÕES ADICIONAIS">
    public void enablePro(boolean ena){
        
    }
    
    public void newPro(){
        
    }
    
    public void limpaPro(){
        
    }
    
    public boolean verificaEdicaoPro(){
        
    }
    //</editor-fold>
    
    //<editor-fold defaultstate="collapsed" desc="FORNECEDOR: FUNÇÕES ADICIONAIS">
    public void enableFor(boolean ena){
        
    }
    
    public void newFor(){
        
    }
    
    public void limpaFor(){
        
    }
    
    public boolean verificaEdicaoFor(){
        
    }
    //</editor-fold>
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane2 = new javax.swing.JScrollPane();
        jEditorPane1 = new javax.swing.JEditorPane();
        jTabbedPane1 = new javax.swing.JTabbedPane();
        jPanelCli = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTbCli = new javax.swing.JTable();
        jPanel2 = new javax.swing.JPanel();
        btnNewCli = new javax.swing.JButton();
        btnEditCli = new javax.swing.JButton();
        btnDltCli = new javax.swing.JButton();
        btnSaveCli = new javax.swing.JButton();
        btnCnlCli = new javax.swing.JButton();
        jLabel20 = new javax.swing.JLabel();
        jTfCodCli = new javax.swing.JTextField();
        jLabel21 = new javax.swing.JLabel();
        jTfNameCli = new javax.swing.JTextField();
        jLabel22 = new javax.swing.JLabel();
        jTfMailCli = new javax.swing.JTextField();
        jLabel23 = new javax.swing.JLabel();
        jTfPhoneCli = new javax.swing.JTextField();
        jLabel1 = new javax.swing.JLabel();
        jScrollPane5 = new javax.swing.JScrollPane();
        jTaAddrCli = new javax.swing.JTextArea();
        jPanelPro = new javax.swing.JPanel();
        jScrollPane3 = new javax.swing.JScrollPane();
        jTbPro = new javax.swing.JTable();
        jPanel3 = new javax.swing.JPanel();
        btnNewPro = new javax.swing.JButton();
        btnEditPro = new javax.swing.JButton();
        btnDltPro = new javax.swing.JButton();
        btnSavePro = new javax.swing.JButton();
        btnCnlPro = new javax.swing.JButton();
        jLabel24 = new javax.swing.JLabel();
        jTfCodPro = new javax.swing.JTextField();
        jLabel25 = new javax.swing.JLabel();
        jTfUnitPro = new javax.swing.JTextField();
        jLabel26 = new javax.swing.JLabel();
        jTfQtdPro = new javax.swing.JTextField();
        jLabel27 = new javax.swing.JLabel();
        jTfPricePro = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane6 = new javax.swing.JScrollPane();
        jTaDescPro = new javax.swing.JTextArea();
        jPanelFor = new javax.swing.JPanel();
        jScrollPane4 = new javax.swing.JScrollPane();
        jTbFor = new javax.swing.JTable();
        jPanel4 = new javax.swing.JPanel();
        btnNewFor = new javax.swing.JButton();
        btnEditFor = new javax.swing.JButton();
        btnDltFor = new javax.swing.JButton();
        btnSaveFor = new javax.swing.JButton();
        btnCnlFor = new javax.swing.JButton();
        jLabel28 = new javax.swing.JLabel();
        jTfCodFor = new javax.swing.JTextField();
        jLabel29 = new javax.swing.JLabel();
        jTfCttFor = new javax.swing.JTextField();
        jLabel30 = new javax.swing.JLabel();
        jTfMailFor = new javax.swing.JTextField();
        jLabel31 = new javax.swing.JLabel();
        jTfPhoneFor = new javax.swing.JTextField();
        jLabel3 = new javax.swing.JLabel();
        jScrollPane7 = new javax.swing.JScrollPane();
        jTaCompFor = new javax.swing.JTextArea();

        jScrollPane2.setViewportView(jEditorPane1);

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setTitle("SCCPF - SISTEMA DE CADASTRO CLIENTE - PRODUTO - FORNECEDOR");

        jTabbedPane1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jTbCli.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Código", "Nome", "Telefone", "Email", "Endereço"
            }
        ));
        jTbCli.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTbCliMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(jTbCli);

        jPanel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        btnNewCli.setText("Novo");
        btnNewCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNewCliActionPerformed(evt);
            }
        });

        btnEditCli.setText("Editar");
        btnEditCli.setEnabled(false);
        btnEditCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditCliActionPerformed(evt);
            }
        });

        btnDltCli.setText("Excluir");
        btnDltCli.setEnabled(false);
        btnDltCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltCliActionPerformed(evt);
            }
        });

        btnSaveCli.setText("Salvar");
        btnSaveCli.setEnabled(false);
        btnSaveCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveCliActionPerformed(evt);
            }
        });

        btnCnlCli.setText("Cancelar");
        btnCnlCli.setEnabled(false);
        btnCnlCli.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCnlCliActionPerformed(evt);
            }
        });

        jLabel20.setText("Código");

        jTfCodCli.setEnabled(false);
        jTfCodCli.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTfCodCliKeyReleased(evt);
            }
        });

        jLabel21.setText("Nome");

        jTfNameCli.setEnabled(false);
        jTfNameCli.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTfNameCliKeyReleased(evt);
            }
        });

        jLabel22.setText("Email");

        jTfMailCli.setEnabled(false);
        jTfMailCli.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTfMailCliKeyReleased(evt);
            }
        });

        jLabel23.setText("Telefone");

        jTfPhoneCli.setEnabled(false);
        jTfPhoneCli.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTfPhoneCliKeyReleased(evt);
            }
        });

        jLabel1.setText("Endereço");

        jTaAddrCli.setColumns(20);
        jTaAddrCli.setRows(5);
        jTaAddrCli.setEnabled(false);
        jTaAddrCli.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTaAddrCliKeyReleased(evt);
            }
        });
        jScrollPane5.setViewportView(jTaAddrCli);

        javax.swing.GroupLayout jPanel2Layout = new javax.swing.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel22)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfMailCli, javax.swing.GroupLayout.PREFERRED_SIZE, 241, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel23)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfPhoneCli, javax.swing.GroupLayout.DEFAULT_SIZE, 141, Short.MAX_VALUE))
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel20)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfCodCli)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jLabel21)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfNameCli, javax.swing.GroupLayout.PREFERRED_SIZE, 244, javax.swing.GroupLayout.PREFERRED_SIZE)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnEditCli, javax.swing.GroupLayout.DEFAULT_SIZE, 80, Short.MAX_VALUE)
                            .addComponent(btnNewCli, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel2Layout.createSequentialGroup()
                                .addComponent(jLabel1)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(jScrollPane5))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnSaveCli, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnCnlCli, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnDltCli, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNewCli)
                    .addComponent(jLabel20)
                    .addComponent(jTfCodCli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel21)
                    .addComponent(jTfNameCli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnEditCli)
                    .addComponent(jLabel22)
                    .addComponent(jTfMailCli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel23)
                    .addComponent(jTfPhoneCli, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDltCli)
                    .addComponent(jLabel1))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel2Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel2Layout.createSequentialGroup()
                        .addComponent(btnCnlCli, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnSaveCli))
                    .addComponent(jScrollPane5, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addGap(14, 14, 14))
        );

        javax.swing.GroupLayout jPanelCliLayout = new javax.swing.GroupLayout(jPanelCli);
        jPanelCli.setLayout(jPanelCliLayout);
        jPanelCliLayout.setHorizontalGroup(
            jPanelCliLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCliLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelCliLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 574, Short.MAX_VALUE)
                    .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanelCliLayout.setVerticalGroup(
            jPanelCliLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelCliLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 222, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel2, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Cliente", jPanelCli);

        jTbPro.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Codigo", "Descrição", "Unidade", "Quantidade", "Preço"
            }
        ));
        jTbPro.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTbProMouseClicked(evt);
            }
        });
        jScrollPane3.setViewportView(jTbPro);

        jPanel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        btnNewPro.setText("Novo");
        btnNewPro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNewProActionPerformed(evt);
            }
        });

        btnEditPro.setText("Editar");
        btnEditPro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditProActionPerformed(evt);
            }
        });

        btnDltPro.setText("Excluir");
        btnDltPro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltProActionPerformed(evt);
            }
        });

        btnSavePro.setText("Salvar");
        btnSavePro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveProActionPerformed(evt);
            }
        });

        btnCnlPro.setText("Cancelar");
        btnCnlPro.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCnlProActionPerformed(evt);
            }
        });

        jLabel24.setText("Código");

        jLabel25.setText("Unidade");

        jLabel26.setText("Quantidade");

        jLabel27.setText("Preço");

        jLabel2.setText("Descrição");

        jTaDescPro.setColumns(20);
        jTaDescPro.setRows(5);
        jScrollPane6.setViewportView(jTaDescPro);

        javax.swing.GroupLayout jPanel3Layout = new javax.swing.GroupLayout(jPanel3);
        jPanel3.setLayout(jPanel3Layout);
        jPanel3Layout.setHorizontalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel24)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfCodPro, javax.swing.GroupLayout.DEFAULT_SIZE, 123, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel25))
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel26)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfQtdPro)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel27)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfPricePro, javax.swing.GroupLayout.DEFAULT_SIZE, 208, Short.MAX_VALUE))
                            .addComponent(jTfUnitPro))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnEditPro, javax.swing.GroupLayout.DEFAULT_SIZE, 80, Short.MAX_VALUE)
                            .addComponent(btnNewPro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel3Layout.createSequentialGroup()
                                .addComponent(jLabel2)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(jScrollPane6))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnSavePro, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnCnlPro, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnDltPro, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap())
        );
        jPanel3Layout.setVerticalGroup(
            jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel3Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNewPro)
                    .addComponent(jLabel24)
                    .addComponent(jTfCodPro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel25)
                    .addComponent(jTfUnitPro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnEditPro)
                    .addComponent(jLabel26)
                    .addComponent(jTfQtdPro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel27)
                    .addComponent(jTfPricePro, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDltPro)
                    .addComponent(jLabel2))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel3Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel3Layout.createSequentialGroup()
                        .addComponent(btnCnlPro, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnSavePro))
                    .addComponent(jScrollPane6, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addGap(14, 14, 14))
        );

        javax.swing.GroupLayout jPanelProLayout = new javax.swing.GroupLayout(jPanelPro);
        jPanelPro.setLayout(jPanelProLayout);
        jPanelProLayout.setHorizontalGroup(
            jPanelProLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelProLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelProLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane3, javax.swing.GroupLayout.DEFAULT_SIZE, 574, Short.MAX_VALUE)
                    .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanelProLayout.setVerticalGroup(
            jPanelProLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanelProLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane3, javax.swing.GroupLayout.PREFERRED_SIZE, 222, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel3, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Produto", jPanelPro);

        jTbFor.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null},
                {null, null, null, null, null}
            },
            new String [] {
                "Codigo", "Nome", "Contato", "Telefone", "Email"
            }
        ));
        jTbFor.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTbForMouseClicked(evt);
            }
        });
        jScrollPane4.setViewportView(jTbFor);

        jPanel4.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        btnNewFor.setText("Novo");
        btnNewFor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnNewForActionPerformed(evt);
            }
        });

        btnEditFor.setText("Editar");
        btnEditFor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnEditForActionPerformed(evt);
            }
        });

        btnDltFor.setText("Excluir");
        btnDltFor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDltForActionPerformed(evt);
            }
        });

        btnSaveFor.setText("Salvar");
        btnSaveFor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnSaveForActionPerformed(evt);
            }
        });

        btnCnlFor.setText("Cancelar");
        btnCnlFor.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnCnlForActionPerformed(evt);
            }
        });

        jLabel28.setText("Código");

        jLabel29.setText("Contato");

        jLabel30.setText("Email");

        jLabel31.setText("Fone");

        jLabel3.setText("Empresa");

        jTaCompFor.setColumns(20);
        jTaCompFor.setRows(5);
        jScrollPane7.setViewportView(jTaCompFor);

        javax.swing.GroupLayout jPanel4Layout = new javax.swing.GroupLayout(jPanel4);
        jPanel4.setLayout(jPanel4Layout);
        jPanel4Layout.setHorizontalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel28)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfCodFor, javax.swing.GroupLayout.DEFAULT_SIZE, 126, Short.MAX_VALUE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel29))
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel30)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfMailFor)))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel31)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addComponent(jTfPhoneFor, javax.swing.GroupLayout.DEFAULT_SIZE, 210, Short.MAX_VALUE))
                            .addComponent(jTfCttFor))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnEditFor, javax.swing.GroupLayout.DEFAULT_SIZE, 80, Short.MAX_VALUE)
                            .addComponent(btnNewFor, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(jPanel4Layout.createSequentialGroup()
                                .addComponent(jLabel3)
                                .addGap(0, 0, Short.MAX_VALUE))
                            .addComponent(jScrollPane7))
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(btnSaveFor, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnCnlFor, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                            .addComponent(btnDltFor, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))))
                .addContainerGap())
        );
        jPanel4Layout.setVerticalGroup(
            jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel4Layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnNewFor)
                    .addComponent(jLabel28)
                    .addComponent(jTfCodFor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel29)
                    .addComponent(jTfCttFor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnEditFor)
                    .addComponent(jLabel30)
                    .addComponent(jTfMailFor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(jLabel31)
                    .addComponent(jTfPhoneFor, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(btnDltFor)
                    .addComponent(jLabel3))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(jPanel4Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addGroup(jPanel4Layout.createSequentialGroup()
                        .addComponent(btnCnlFor, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(btnSaveFor))
                    .addComponent(jScrollPane7, javax.swing.GroupLayout.PREFERRED_SIZE, 0, Short.MAX_VALUE))
                .addGap(14, 14, 14))
        );

        javax.swing.GroupLayout jPanelForLayout = new javax.swing.GroupLayout(jPanelFor);
        jPanelFor.setLayout(jPanelForLayout);
        jPanelForLayout.setHorizontalGroup(
            jPanelForLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelForLayout.createSequentialGroup()
                .addContainerGap()
                .addGroup(jPanelForLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane4, javax.swing.GroupLayout.DEFAULT_SIZE, 574, Short.MAX_VALUE)
                    .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addContainerGap())
        );
        jPanelForLayout.setVerticalGroup(
            jPanelForLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanelForLayout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane4, javax.swing.GroupLayout.PREFERRED_SIZE, 222, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(jPanel4, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );

        jTabbedPane1.addTab("Fornecedor", jPanelFor);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jTabbedPane1)
                .addContainerGap())
        );

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    
    /* ========== BOTÕES DE SALVAR ========== */
    // Cliente
    private void btnSaveCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveCliActionPerformed
        // TODO add your handling code here:
        int cod = Integer.parseInt(jTfCodCli.getText());
        String nome = jTfNameCli.getText();
        String telefone = jTfPhoneCli.getText();
        String email = jTfMailCli.getText();
        String endereco = jTaAddrCli.getText();
        
        int opt = JOptionPane.showConfirmDialog(null, 
                "Deseja realmente salvar essas informações?\n\n" + 
                "Código: " + cod +
                "\nNome: " + nome +
                "\nTelefone: " + telefone +
                "\nEmail: " + email +
                "\nEndereço: " + endereco,
                "Confirmar",
                JOptionPane.YES_NO_OPTION
                );
        
        if (opt == JOptionPane.YES_OPTION) {
            Cliente cliente = new Cliente(nome, telefone);
            cliente.setEndereco(endereco);
            cliente.setEmail(email);
            cliente.setCodigo(cod);
            
            enableCli(false);
            limpaCli();
            btnNewCli.setEnabled(true);
            btnSaveCli.setEnabled(false);
            btnCnlCli.setEnabled(false);
            if (editCli) {
                selectedCli = jTbCli.getSelectedRow();
                listaCliente.add(selectedCli, cliente);
                listaCliente.remove(selectedCli+1);
                editCli = false;
            }
            else{
                listaCliente.add(cliente);
            }
            newCli();
            tblCliente();
            saveCli();
        }
    }//GEN-LAST:event_btnSaveCliActionPerformed

    // Produto
    private void btnSaveProActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveProActionPerformed
        // TODO add your handling code here:
        int cod = Integer.parseInt(jTfCodPro.getText());
        String unidade = jTfUnitPro.getText();
        float preco = Float.parseFloat(jTfPricePro.getText());
        float qtd = Float.parseFloat(jTfQtdPro.getText());
        String desc = jTaDescPro.getText();
        
        int opt = JOptionPane.showConfirmDialog(null, 
                "Deseja realmente salvar essas informações?\n\n" + 
                "Código: " + cod +
                "\nUnidade: " + unidade +
                "\nPreço: " + preco +
                "\nQuantidade: " + qtd +
                "\nDescrição: " + desc,
                "Confirmar",
                JOptionPane.YES_NO_OPTION
                );
        
        if (opt == JOptionPane.YES_OPTION) {
            Produto produto = new Produto(cod, desc, unidade, qtd, preco);
            
            if (editPro) {
                selectedPro = jTbPro.getSelectedRow();
                editPro = false;
                listaProduto.add(selectedPro, produto);
                listaProduto.remove(selectedPro+1);
                
            }
            else{
                listaProduto.add(produto);
            }
            newPro();
            tblProduto();
            savePro();
        }
    }//GEN-LAST:event_btnSaveProActionPerformed

    // Fornecedor
    private void btnSaveForActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnSaveForActionPerformed
        // TODO add your handling code here:
        int cod = Integer.parseInt(jTfCodFor.getText());
        String comp = jTaCompFor.getText();
        String contato = jTfCttFor.getText();
        String fone = jTfPhoneFor.getText();
        String email = jTfMailFor.getText();
        
        int opt = JOptionPane.showConfirmDialog(null, 
                "Deseja realmente salvar essas informações?\n\n" + 
                "Código: " + cod +
                "\nEmpresa: " + comp +
                "\nContato: " + contato +
                "\nFone: " + fone +
                "\nEmail: " + email,
                "Confirmar",
                JOptionPane.YES_NO_OPTION
                );
        
        if (opt == JOptionPane.YES_OPTION) {
            Fornecedor fornecedor = new Fornecedor(cod, comp, contato, fone, email);
            
            if (editFor) {
                selectedFor = jTbFor.getSelectedRow();
                editFor = false;
                listaFornecedor.add(selectedFor, fornecedor);
                listaFornecedor.remove(selectedFor);
            }
            else{
                listaFornecedor.add(fornecedor);
            }
            newFor();
            tblFornecedor();
            saveFor();
        }
    }//GEN-LAST:event_btnSaveForActionPerformed

    
    /* ========== AÇÃO DE CLICAR NA LINHA DA TABELA ========== */
    // Cliente
    private void jTbCliMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTbCliMouseClicked
        // TODO add your handling code here:
        int selectedCli = jTbCli.getSelectedRow();
        
        enableCli(false);
        btnNewCli.setEnabled(false);
        btnCnlCli.setEnabled(true);
        btnEditCli.setEnabled(true);
        btnDltCli.setEnabled(true);
        
        jTfCodCli.setText(jTbCli.getValueAt(selectedCli, 0).toString());
        jTfNameCli.setText(jTbCli.getValueAt(selectedCli, 1).toString());
        jTfPhoneCli.setText(jTbCli.getValueAt(selectedCli, 2).toString());
        jTfMailCli.setText(jTbCli.getValueAt(selectedCli, 3).toString());
        jTaAddrCli.setText(jTbCli.getValueAt(selectedCli, 4).toString());
    }//GEN-LAST:event_jTbCliMouseClicked

    // Produto
    private void jTbProMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTbProMouseClicked
        // TODO add your handling code here:
        int selectedPro = jTbPro.getSelectedRow();
        
        enablePro(false);
        btnNewPro.setEnabled(false);
        btnCnlPro.setEnabled(true);
        btnEditPro.setEnabled(true);
        btnDltPro.setEnabled(true);
        
        jTfCodPro.setText(jTbPro.getValueAt(selectedPro, 0).toString());
        jTfPricePro.setText(jTbPro.getValueAt(selectedPro, 1).toString());
        jTfQtdPro.setText(jTbPro.getValueAt(selectedPro, 2).toString());
        jTfUnitPro.setText(jTbPro.getValueAt(selectedPro, 3).toString());
        jTaDescPro.setText(jTbPro.getValueAt(selectedPro, 4).toString());
    }//GEN-LAST:event_jTbProMouseClicked

    // Fornecedor
    private void jTbForMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTbForMouseClicked
        // TODO add your handling code here:
        int selectedFor = jTbFor.getSelectedRow();
        
        enableFor(false);
        btnNewFor.setEnabled(false);
        btnCnlFor.setEnabled(true);
        btnEditFor.setEnabled(true);
        btnDltFor.setEnabled(true);
        
        jTfCodFor.setText(jTbFor.getValueAt(selectedFor, 0).toString());
        jTaCompFor.setText(jTbFor.getValueAt(selectedFor, 1).toString());
        jTfCttFor.setText(jTbFor.getValueAt(selectedFor, 2).toString());
        jTfPhoneFor.setText(jTbFor.getValueAt(selectedFor, 3).toString());
        jTfMailFor.setText(jTbFor.getValueAt(selectedFor, 4).toString());
    }//GEN-LAST:event_jTbForMouseClicked

    
    /* ========== BOTÃO DE DELETAR ========== */
    // Cliente
    private void btnDltCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltCliActionPerformed
        // TODO add your handling code here:
        try {
            selectedCli = jTbCli.getSelectedRow();
            listaCliente.remove(selectedCli);
            saveCli();
            tblCliente();
            newCli();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Nenhuma linha selecionada para exclusão");
        }
    }//GEN-LAST:event_btnDltCliActionPerformed

    // Produto
    private void btnDltProActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltProActionPerformed
        // TODO add your handling code here:
        try {
            selectedPro = jTbPro.getSelectedRow();
            listaProduto.remove(selectedPro);
            savePro();
            tblProduto();
            newPro();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Nenhuma linha selecionada para exclusão");
        }
    }//GEN-LAST:event_btnDltProActionPerformed

    // Fornecedor
    private void btnDltForActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDltForActionPerformed
        // TODO add your handling code here:
        try {
            selectedFor = jTbFor.getSelectedRow();
            listaFornecedor.remove(selectedFor);
            saveFor();
            tblFornecedor();
            newFor();
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "Nenhuma linha selecionada para exclusão");
        }
    }//GEN-LAST:event_btnDltForActionPerformed

    /*
        ========== BOTÃO DE NOVO ==========
    */
    // Cliente
    private void btnNewCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNewCliActionPerformed
        // TODO add your handling code here:
        btnCnlCli.setEnabled(true);
        btnNewCli.setEnabled(false);
        enableCli(true);
    }//GEN-LAST:event_btnNewCliActionPerformed

    // Produto
    private void btnNewProActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNewProActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnNewProActionPerformed

    // Fornecedor
    private void btnNewForActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnNewForActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnNewForActionPerformed

    /*
        ========== BOTÃO DE CANCELAR ==========
    */
    // Cliente
    private void btnCnlCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCnlCliActionPerformed
        // TODO add your handling code here:
        limpaCli();
        enableCli(false);
        btnNewCli.setEnabled(true);
        btnSaveCli.setEnabled(false);
        btnCnlCli.setEnabled(false);
        btnEditCli.setEnabled(false);
        btnDltCli.setEnabled(false);
    }//GEN-LAST:event_btnCnlCliActionPerformed

    // Produto
    private void btnCnlProActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCnlProActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnCnlProActionPerformed

    // Fornecedor
    private void btnCnlForActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnCnlForActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnCnlForActionPerformed

    /*
        ========== CLIENTE: INPUT WRITE ==========
    */
    // Input cod
    private void jTfCodCliKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTfCodCliKeyReleased
        // TODO add your handling code here:
        btnSaveCli.setEnabled(verificaEdicaoCli());
    }//GEN-LAST:event_jTfCodCliKeyReleased

    // Input Name
    private void jTfNameCliKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTfNameCliKeyReleased
        // TODO add your handling code here:
        btnSaveCli.setEnabled(verificaEdicaoCli());
    }//GEN-LAST:event_jTfNameCliKeyReleased

    // Input Email
    private void jTfMailCliKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTfMailCliKeyReleased
        // TODO add your handling code here:
        btnSaveCli.setEnabled(verificaEdicaoCli());
    }//GEN-LAST:event_jTfMailCliKeyReleased

    // Input Phone
    private void jTfPhoneCliKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTfPhoneCliKeyReleased
        // TODO add your handling code here:
        btnSaveCli.setEnabled(verificaEdicaoCli());
    }//GEN-LAST:event_jTfPhoneCliKeyReleased

    // Input Address
    private void jTaAddrCliKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTaAddrCliKeyReleased
        // TODO add your handling code here:
        btnSaveCli.setEnabled(verificaEdicaoCli());
    }//GEN-LAST:event_jTaAddrCliKeyReleased

    /*
        ========== BOTÃO EDITAR =============
    */
    private void btnEditCliActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditCliActionPerformed
        // TODO add your handling code here:
        editCli = true;
        btnDltCli.setEnabled(false);
        enableCli(true);
    }//GEN-LAST:event_btnEditCliActionPerformed

    private void btnEditProActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditProActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEditProActionPerformed

    private void btnEditForActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnEditForActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnEditForActionPerformed

    
    
    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FormTabbed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormTabbed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormTabbed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormTabbed.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormTabbed().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnCnlCli;
    private javax.swing.JButton btnCnlFor;
    private javax.swing.JButton btnCnlPro;
    private javax.swing.JButton btnDltCli;
    private javax.swing.JButton btnDltFor;
    private javax.swing.JButton btnDltPro;
    private javax.swing.JButton btnEditCli;
    private javax.swing.JButton btnEditFor;
    private javax.swing.JButton btnEditPro;
    private javax.swing.JButton btnNewCli;
    private javax.swing.JButton btnNewFor;
    private javax.swing.JButton btnNewPro;
    private javax.swing.JButton btnSaveCli;
    private javax.swing.JButton btnSaveFor;
    private javax.swing.JButton btnSavePro;
    private javax.swing.JEditorPane jEditorPane1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel20;
    private javax.swing.JLabel jLabel21;
    private javax.swing.JLabel jLabel22;
    private javax.swing.JLabel jLabel23;
    private javax.swing.JLabel jLabel24;
    private javax.swing.JLabel jLabel25;
    private javax.swing.JLabel jLabel26;
    private javax.swing.JLabel jLabel27;
    private javax.swing.JLabel jLabel28;
    private javax.swing.JLabel jLabel29;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel30;
    private javax.swing.JLabel jLabel31;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPanel jPanel4;
    private javax.swing.JPanel jPanelCli;
    private javax.swing.JPanel jPanelFor;
    private javax.swing.JPanel jPanelPro;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JScrollPane jScrollPane3;
    private javax.swing.JScrollPane jScrollPane4;
    private javax.swing.JScrollPane jScrollPane5;
    private javax.swing.JScrollPane jScrollPane6;
    private javax.swing.JScrollPane jScrollPane7;
    private javax.swing.JTextArea jTaAddrCli;
    private javax.swing.JTextArea jTaCompFor;
    private javax.swing.JTextArea jTaDescPro;
    private javax.swing.JTabbedPane jTabbedPane1;
    private javax.swing.JTable jTbCli;
    private javax.swing.JTable jTbFor;
    private javax.swing.JTable jTbPro;
    private javax.swing.JTextField jTfCodCli;
    private javax.swing.JTextField jTfCodFor;
    private javax.swing.JTextField jTfCodPro;
    private javax.swing.JTextField jTfCttFor;
    private javax.swing.JTextField jTfMailCli;
    private javax.swing.JTextField jTfMailFor;
    private javax.swing.JTextField jTfNameCli;
    private javax.swing.JTextField jTfPhoneCli;
    private javax.swing.JTextField jTfPhoneFor;
    private javax.swing.JTextField jTfPricePro;
    private javax.swing.JTextField jTfQtdPro;
    private javax.swing.JTextField jTfUnitPro;
    // End of variables declaration//GEN-END:variables
}
