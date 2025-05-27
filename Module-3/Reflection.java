import java.lang.reflect.*;

public class ReflectionExample {
    public static void sayHello() {
        System.out.println("Hello using Reflection!");
    }

    public static void main(String[] args) throws Exception {
        Class<?> clazz = Class.forName("ReflectionExample");

        Method[] methods = clazz.getDeclaredMethods();
        for (Method method : methods) {
            System.out.println("Method: " + method.getName());
        }

        Method method = clazz.getMethod("sayHello");
        method.invoke(null);
    }
}
