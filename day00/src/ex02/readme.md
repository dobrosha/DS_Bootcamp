### Задание

**Сортировка файла**

Директория для сдачи задания: ex02/  
Файлы для сдачи: sorter.sh, hh_sorted.csv  
Разрешенные команды: cat, sort, head, tail

Иногда, чтобы данные были более удобны для последующего анализа, их может быть полезно отсортировать. В этом задании вам нужно отсортировать ваш CSV-файл по нескольким столбцам.

Напишите bash скрипт под названием `sorter.sh`, который:

1. Отсортирует файл `hh.csv` из предыдущего задания по столбцу `created_at`, а затем по столбцу `id` в порядке возрастания.
2. Сохранит результат в CSV-файл `hh_sorted.csv`.

CSV-файл должен сохранять заголовки в первой строке.  
Ваш скрипт должен быть исполняемым. Интерпретатор для выполнения — /bin/sh.  
Поместите ваш оболочечный скрипт, а также результат сортировки в папку `ex02` в корневом каталоге вашего репозитория.

### Решение задания



```

### Объяснение скрипта

1. **Проверка наличия файла**:
   - Проверяет, существует ли файл `hh.csv`. Если нет, выводит сообщение об ошибке и завершает выполнение.

2. **Извлечение заголовка**:
   - `head -n 1 hh.csv > header.csv` сохраняет первую строку (заголовок) в отдельный файл `header.csv`.

3. **Сортировка данных**:
   - `tail -n +2 hh.csv` извлекает все строки, кроме первой (заголовка).
   - `sort -t, -k2,2 -k1,1n` сортирует строки сначала по столбцу `created_at` (второй столбец), а затем по столбцу `id` (первый столбец). `-t,` указывает, что разделитель — запятая, а `-k2,2` и `-k1,1n` определяют ключи сортировки (второй и первый столбцы соответственно).
   - Сохраняет отсортированные данные в файл `body_sorted.csv`.

4. **Объединение заголовка и данных**:
   - `cat header.csv body_sorted.csv > hh_sorted.csv` объединяет заголовок и отсортированные данные в новый файл `hh_sorted.csv`.

5. **Очистка временных файлов**:
   - Удаляет временные файлы `header.csv` и `body_sorted.csv`.

6. **Вывод результата**:
   - Проверяет успешность выполнения и выводит соответствующее сообщение.

Теперь у вас есть скрипт `sorter.sh`, который выполнит сортировку и сохранит результат в `hh_sorted.csv`.

```

### Запуск скрипта

Чтобы сделать скрипт исполняемым, нужно выполнить команду:

```sh
chmod +x sorter.sh
```

Запуск скрипта выполняется так:

```sh
./sorter.sh
```