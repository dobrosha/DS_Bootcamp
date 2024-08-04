### Задание

#### Преобразование JSON в CSV
Каталог для сдачи: ex01/
Файлы для сдачи: filter.jq, json_to_csv.sh, hh.csv
Разрешенные функции: jq

В предыдущем упражнении вы получили файл в формате JSON. Это популярный формат файлов для API, но он может быть неудобным для анализа данных. Поэтому необходимо преобразовать его в более удобный файл CSV.

Напишите сценарий оболочки под названием `json_to_csv.sh`, который:

1. Выполняет `jq` с фильтром, написанным в отдельном файле `filter.jq`.
2. Фильтрует следующие 5 столбцов, соответствующих вакансиям: “id”, “created_at”, “name”, “has_test”, и “alternate_url”.
3. Сохраняет результат в CSV-файл `hh.csv`.
4. CSV-файл должен иметь заголовки в первой строке.
5. Ваш сценарий должен быть исполняемым. Интерпретатор, который нужно использовать: /bin/sh.

Поместите файл фильтра, который преобразует JSON в CSV, а также результат вашего преобразования в папку ex01 в корневом каталоге вашего репозитория.

### Выполнение задания

#### 1. Создание фильтра `filter.jq`

Файл `filter.jq` будет содержать фильтр для `jq`, который извлекает нужные поля и преобразует JSON в формат CSV.


#### 2. Создание скрипта `json_to_csv.sh`

Скрипт `json_to_csv.sh` будет выполнять `jq` с фильтром из файла `filter.jq` и сохранять результат в файл `hh.csv`.


### Запуск скрипта

1. Убедитесь, что скрипт `json_to_csv.sh` исполняемый:
    ```sh
    chmod +x json_to_csv.sh
    ```

2. Запустите скрипт:
    ```sh
    ./json_to_csv.sh
    ```

### Проверка результата

После выполнения скрипта файл `hh.csv` должен содержать данные в формате CSV с заголовками в первой строке.