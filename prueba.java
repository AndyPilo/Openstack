public class prueba{
public static void main(String[] args) {
    System.out.println("hola mundo");

    int x = 10;
    int y = 20;

    System.out.println("el resultado de la suma es:  " + (x+y));
    Carro carro = new Carro("Alian",123);
    System.out.println("el nombre del carro es:  " + carro.getNombre());

    carro.setNombre("Andy");
    System.out.println("el nombre del carro es:  " + carro.getNombre());
}
}
