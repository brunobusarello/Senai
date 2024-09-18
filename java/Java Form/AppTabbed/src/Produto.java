/**
 * @author bruno_busarello
 */

public class Produto {

    private int cod;
    private String desc;
    private String unit;
    private float qtd;
    private float preco;

    public Produto() {
    }

    public Produto(int cod, String desc, String unit, float qtd, float preco) {
        this.cod = cod;
        this.desc = desc;
        this.unit = unit;
        this.qtd = qtd;
        this.preco = preco;
    }

    public int getCod() {
        return cod;
    }

    public void setCod(int cod) {
        this.cod = cod;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public float getQtd() {
        return qtd;
    }

    public void setQtd(float qtd) {
        this.qtd = qtd;
    }

    public float getPreco() {
        return preco;
    }

    public void setPreco(float preco) {
        this.preco = preco;
    }

}
