#!/bin/sh

# Проверка, что файлы с датами существуют
shopt -s nullglob
files=partitions_files/*.csv
if [ ${#files[@]} -eq 0 ]; then
  echo "Нет файлов для объединения. Пожалуйста, выполните partitioner.sh перед этим."
  exit 1
fi

# Создаем объединенный файл с заголовком
{
  # Добавляем заголовок из первого файла
  head -n 1 $(ls partitions_files/*.csv | head -n 1)

  # Добавляем данные из всех файлов, пропуская заголовки
  for file in partitions_files/*.csv; do
    tail -n +2 "$file"
#    rm "$file"
  done
} > hh_combined.csv

echo "Все файлы объединены в hh_combined.csv"
