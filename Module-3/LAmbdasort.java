import java.util.*;

public class LambdaSort {
    public static void main(String[] args) {
        List<String> names = new ArrayList<>();
        names.add("Zara");
        names.add("Mike");
        names.add("Anna");
        names.add("Bob");

        Collections.sort(names, (a, b) -> a.compareTo(b)); // lambda for alphabetical sort

        System.out.println("Sorted Names:");
        for (String name : names) {
            System.out.println(name);
        }
    }
}
