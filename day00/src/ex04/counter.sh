#!/bin/sh

# Проверяем, что файл hh_positions.csv существует
if [ ! -f "../ex03/hh_positions.csv" ]; then
  echo "Файл hh_positions.csv не найден. Пожалуйста, выполните предыдущее задание, чтобы создать этот файл."
  exit 1
fi

# Подсчитываем уникальные значения в столбце name и их количество
{
  # Печатаем заголовок
  echo "\"name\",\"count\""

  # Подсчитываем уникальные значения и их количество
  awk -F, '
  NR > 1 {
    positions[$3]++
  }
  END {
    for (position in positions) {
      print "\"" position "\"," positions[position]
    }
  }' ../ex03/hh_positions.csv | sort -t, -k2,2nr
} > hh_uniq_positions.csv

if [ $? -eq 0 ]; then
  echo "Результат подсчета уникальных позиций сохранен в hh_uniq_positions.csv"
else
  echo "Ошибка при выполнении подсчета уникальных позиций"
fi
