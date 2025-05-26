public class TypeCastingExample {
    public static void main(String[] args) {
        double d = 9.78;
        int i = (int) d; // narrowing conversion
        System.out.println("Double to int: " + i);
        int num = 10;
        double d2 = num; // widening conversion
        System.out.println("Int to double: " + d2);
    }
}
