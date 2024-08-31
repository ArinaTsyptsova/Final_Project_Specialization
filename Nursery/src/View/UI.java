package View;

import java.util.Map;
import java.util.Scanner;

/*
 * Класс для меню программы
 */
public class UI {
    /**
     * Конструктор для работы меню и взаимодействия с пользователем
     *
     * @param menu Отображение меню
     */
    public String menuShow(Map<String, String> menu) {
        // Поля
        Scanner scanner = new Scanner(System.in);
        String answear;

        for (String s : menu.keySet()) {
            System.out.println(s + " - " + menu.get(s));
        }
        System.out.print("> ");

        answear = scanner.next();

        if (!menu.containsKey(answear)) {
            answear = "";
        }

        return answear;
    }

    // Запрос числа у пользователя
    public int getInteger(String message) {
        Scanner scanner = new Scanner(System.in);

        System.out.print(message);
        return scanner.nextInt();
    }

    // Запрос сткрового значения у пользователя
    public String getString(String message) {
        Scanner scanner = new Scanner(System.in);

        System.out.print(message);
        return scanner.next();
    }

}
