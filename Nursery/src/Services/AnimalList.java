package Services;

import Model.Animal;
import Model.Cat;
import Model.Dog;
import Model.Hamster;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

/**
 * Класс для списка животных
 */
public class AnimalList<Animal> {
    // Поля
    private List<Animal> animals = new ArrayList<>();

    // Добавление животного
    public void addAnimal(Animal animal) {
        animals.add(animal);
    }

    // Удаление животного
    public boolean removeAnimal(Animal animal) {
        return animals.remove(animal);
    }

    // Отображение списка животных
    public List<Animal> getAnimals() {
        return animals;
    }

    // Отображение только котов
    public List<Animal> getCats() {
        return animals.stream().filter(x -> x instanceof Cat).toList();
    }

    // Отображение только собак
    public List<Animal> getDogs() {
        return animals.stream().filter(x -> x instanceof Dog).toList();
    }

    // Отображение только хомяков
    public List<Animal> getHamsters() {
        return animals.stream().filter(x -> x instanceof Hamster).toList();
    }

    // Просмотр добаленных животных
    public Cat findCat(String name) {
        List<Cat> cats = (List<Cat>) this.getCats();
        Cat cat = null;

        try {
            cat = cats.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        } catch (NoSuchElementException ex) {
            cat = null;
        }
        return cat;
    }

    public Dog findDog(String name) {
        List<Dog> dogs = (List<Dog>) this.getDogs();
        Dog dog = null;

        try {
            dog = dogs.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        } catch (NoSuchElementException ex) {
            dog = null;
        }
        return dog;
    }

    public Hamster findHamster(String name) {
        List<Hamster> hamsters = (List<Hamster>) this.getDogs();
        Hamster hamster = null;

        try {
            hamster = hamsters.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        } catch (NoSuchElementException ex) {
            hamster = null;
        }
        return hamster;
    }

}