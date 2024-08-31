package Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

/*
 * Класс для котов
 */
public class Cat implements Animal {
    // Поля
    private String name;
    private String color;
    private List<String> commands;
    private String dateBirth;

    public Cat() {
        this("", "", "", new ArrayList<>());
    }

    /**
     * Конструктор для котов
     *
     * @param name      Имя
     * @param color     Цвет
     * @param dateBirth Дата рождения
     * @param commands  Команды
     */
    public Cat(String name, String color, String dateBirth, List<String> commands) {
        this.name = name;
        this.color = color;
        this.commands = commands;
        this.dateBirth = dateBirth;
    }

    // методы
    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void addCommand(String newCommand) {
        if (commands.stream().filter(x -> x.equals(newCommand)).findFirst().isEmpty()) {
            return;
        }

        commands.add(newCommand);
    }

    @Override
    public void removeCommand(String command) {
        commands.remove(command);
    }

    @Override
    public List<String> getCommandList() {
        return commands;
    }

    @Override
    public String getColor() {
        return this.color;
    }

    @Override
    public int getCommandCount() {
        return commands.size();
    }

    @Override
    public void setColor(String color) {
        this.color = color;
    }

    @Override
    public void setDateBirth(String date) {
        this.dateBirth = date;
    }

    @Override
    public String getDateBirth() {
        return this.dateBirth;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        builder.append("Кот ").append(name).append(" ").append(color).append(" - ").append(dateBirth);

        return builder.toString();
    }

    @Override
    public boolean equals(Object o) {
        if (this == o)
            return true;
        if (o == null || getClass() != o.getClass())
            return false;
        Cat cat = (Cat) o;
        return Objects.equals(name, cat.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}