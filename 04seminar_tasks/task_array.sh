#!/bin/bash

# Создание массива
# Создать массив из трёх серверов и вывести первый элемент
servers=(web deb cache)
echo "${servers[0]}"

# Вывод всех элементов
# Вывести все серверы из массива
for s in "${servers[@]}"; do
    echo "$s"
done

# Количество элементов
# Посчитать количество серверов в массиве
echo "${#servers[@]}"

# Добавление элемента
# Добавить сервер backup в существующий массив
servers+=(backup)
printf '%s\n' "${servers[@]}"

# Перебор массива
# Вывести каждый сервер с текстом Server:
for s in "${servers[@]}"; do
    echo "Server: $s"
done

# Проверка наличия элемента
# Проверить, есть ли сервер db в массиве
found=no

for s in "${servers[@]}"; do
    if [[ "$s" == "db" ]]; then
        found=yes
        break
    fi
done
echo "$found"

# Фильтрация массива
# Из массива чисел вывести только значения больше 50
numbers=(10 60 25 90 51 5)
for n in "${numbers[@]}"; do
    if [[ "$n" -gt 50 ]]; then
        echo "$n"
    fi
done

# Сумма элементов
# Найти сумму всех чисел массива
numbers=(10 20 30 40)
sum=0
for n in "${numbers[@]}"; do
    ((sum += n))
done
echo "Сумма: $sum"

# Массив файлов
# Найти все .log-файлы в текущем каталоге и сохранить их пути в массив
mapfile -d '' files < <(find . -type f -name '*.log' -print0)
if ((${#files[@]} > 0)); then
    printf '%s\n' "${files[@]}"
fi

# Уникальные значения
# Получить массив уникальных имён пользователей из users.txt
mapfile -t users < <(sort -u users.txt)

if ((${#users[@]} > 0)); then
    printf '%s\n' "${users[@]}"
fi