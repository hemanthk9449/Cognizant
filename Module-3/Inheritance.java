class Animal {
    void makeSound() {
        System.out.println("Animal makes a sound");
    }
}
class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Bark");
    }
}
public class InheritanceExample {
    public static void main(String[] args) {
        Animal genericAnimal = new Animal();
        Dog dog = new Dog();

        genericAnimal.makeSound();
        dog.makeSound();
    }
}
