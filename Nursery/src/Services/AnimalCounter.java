package Services;

/*
 * Интерфейс для счетика созданных животных
 */
public class AnimalCounter implements AutoCloseable {
    // Поля
    private static Integer counter = 0;

    // Методы
    public void add() {
        counter++;
    }

    public Integer getCount() {
        return counter;
    }

    @Override
    public void close() throws Exception {
    }
}
