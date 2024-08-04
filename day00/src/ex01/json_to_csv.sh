#!/bin/sh

# Проверка, что файл hh.json существует
if [ ! -f "../ex00/hh.json" ]; then
  echo "Файл hh.json не найден. Пожалуйста, выполните предыдущее задание, чтобы создать этот файл."
  exit 1
fi

# Выполнение jq с фильтром из файла filter.jq и сохранение результата в hh.csv
jq -f -r filter.jq ../ex00/hh.json > hh.csv

if [ $? -eq 0 ]; then
  echo "Результат преобразования сохранен в hh.csv"
else
  echo "Ошибка при выполнении команды jq"
fi
