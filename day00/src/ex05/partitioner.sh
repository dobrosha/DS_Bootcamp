#!/bin/sh

# Проверка, что файл hh_positions.csv существует
if [ ! -f "../ex03/hh_positions.csv" ]; then
  echo "Файл hh_positions.csv не найден. Пожалуйста, выполните предыдущее задание, чтобы создать этот файл."
  exit 1
fi

mkdir partitions_files
cd partitions_files

# Создаем временный файл для хранения заголовка
header=$(head -n 1 ../../ex03/hh_positions.csv)

# Обрабатываем данные, разделяя их по дате
awk -F, -v header="$header" '
BEGIN {
  FS = ",";
}
NR > 1 {
  split($2, dateParts, "T");
  date = dateParts[1];
  print > (date ".csv");
}
' ../../ex03/hh_positions.csv

# Добавляем заголовок к каждому CSV файлу
for file in *.csv; do
  echo "$header" | cat - "$file" > temp && mv temp "$file"
done

echo "Данные разбиты на файлы по датам."
