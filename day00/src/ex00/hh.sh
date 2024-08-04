#!/bin/sh

# Проверка, что передан аргумент
if [ -z "$1" ]; then
  echo "Название вакансии не указано"
  exit 1
fi

VACANCY_NAME="$1"
VACANCY_NAME=${VACANCY_NAME// /+}
FILE_NAME="hh.json"

# Выполнение запроса к API HeadHunter с использованием curl и jq
curl -s "https://api.hh.ru/vacancies?text=${VACANCY_NAME}&per_page=20" | jq '.' > "$FILE_NAME"

echo "Информация о вакансиях сохранена в $FILE_NAME"
