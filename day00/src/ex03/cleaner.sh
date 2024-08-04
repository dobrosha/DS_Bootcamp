#!/bin/sh

# Проверка, что файл hh_sorted.csv существует
if [ ! -f "../ex02/hh_sorted.csv" ]; then
  echo "Файл hh_sorted.csv не найден. Пожалуйста, выполните предыдущее задание, чтобы создать этот файл."
  exit 1
fi

# Извлекаем заголовок
head -n 1 ../ex02/hh_sorted.csv > header.csv

# Обрабатываем данные
tail -n +2 ../ex02/hh_sorted.csv | awk -F, '
BEGIN {
  # Определяем массив с ключевыми словами
  keywords["Junior"] = 1
  keywords["Middle"] = 1
  keywords["Senior"] = 1
}
{
  # Сохраняем все столбцы
  id = $1
  created_at = $2
  position = $3
  has_test = $4
  alternate_url = $5

  # Инициализируем результат
  result = "-"

  # Проверяем наличие ключевых слов в названии позиции
  for (keyword in keywords) {
    if (index(position, keyword) > 0) {
      if (result == "-") {
        result = keyword
      } else {
        result = result "/" keyword
      }
    }
  }

  # Печатаем строку с обновленным значением
  print id "," created_at "," result "," has_test "," alternate_url
}' > body_cleaned.csv

# Объединяем заголовок и очищенные данные
cat header.csv body_cleaned.csv > hh_positions.csv

# Удаляем временные файлы
rm header.csv body_cleaned.csv

if [ $? -eq 0 ]; then
  echo "Результат обработки сохранен в hh_positions.csv"
else
  echo "Ошибка при выполнении обработки"
fi
