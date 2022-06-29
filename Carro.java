public class Carro{
    private String nombre;
    private int chapa;

    public Carro(String nombre,int chapa){
        setNombre(nombre);
        setChapa(chapa);
    }
    public String getNombre(){
        return this.nombre;
    }
    public void setNombre(String nombre){
        this.nombre = nombre;
    }
    public int getChapa(){
        return this.chapa;
    }
    public void setChapa(int chapa){
        this.chapa = chapa;
    }
}
