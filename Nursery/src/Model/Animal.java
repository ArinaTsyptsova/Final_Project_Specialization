package Model;

import java.util.List;

/**
 * Интерфейс для каждого животного
 */
public interface Animal {
    // Методы

    String getName(); // Вывести имя животного

    void setDateBirth(String date); // Установить дату рождения

    String getDateBirth(); // Вывести дату рождедния

    void setName(String name); // Установить имя животного

    void addCommand(String newCommand); // Добавить команду

    void removeCommand(String command); // Удалить команду

    List<String> getCommandList(); // Вывести список команд

    String getColor(); // Вывести цвет животного

    int getCommandCount(); // Вывести список команд

    void setColor(String color); // Установить цвет животного
}