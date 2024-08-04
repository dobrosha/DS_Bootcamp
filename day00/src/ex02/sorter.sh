#!/bin/sh

# Проверка, что файл hh.csv существует
if [ ! -f "../ex01/hh.csv" ]; then
  echo "Файл hh.csv не найден. Пожалуйста, выполните предыдущее задание, чтобы создать этот файл."
  exit 1
fi

# Отделяем заголовок
head -n 1 ../ex01/hh.csv > header.csv

# Сортируем данные по столбцам "created_at" и "id", пропуская заголовок
tail -n +2 ../ex01/hh.csv | sort -t, -k2,2 -k1,1n > body_sorted.csv

# Объединяем заголовок и отсортированные данные
cat header.csv body_sorted.csv > hh_sorted.csv

# Удаляем временные файлы
rm header.csv body_sorted.csv

if [ $? -eq 0 ]; then
  echo "Результат сортировки сохранен в hh_sorted.csv"
else
  echo "Ошибка при выполнении сортировки"
fi
