#!/bin/bash

# Вывести столбец - В файле employees.txt строки имеют формат name department salary. Вывести только имена сотрудников
awk '{print $1}' employees.txt

# Вывести несколько столбцов - Вывести имя сотрудника и его зарплату
awk '{print $1, $3}' employees.txt

# Фильтрация строк - Вывести сотрудников с зарплатой больше 100000
awk '$3 > 100000 {print $1}' employees.txt

# Работа с CSV - В employees.csv поля разделены запятыми. Вывести имя и отдел
awk -F',' '{print $1, $2}' employees.csv

# Номер строки - Вывести каждую строку файла вместе с её порядковым номером
awk '{print NR, $0}' employees.txt

# Посчитать строки по условию - Определить количество сотрудников отдела IT
awk '$2 == "IT" {count++} END {print count}' employees.txt

# Посчитать сумму - Рассчитать общую сумму зарплат всех сотрудников
awk '{sum += $3} END {print sum}' employees.txt

# Рассчитать среднее - Рассчитать среднюю зарплату сотрудников
awk '{sum += $3} END {print sum / NR}' employees.txt

# Найти максимум - Найти сотрудника с максимальной зарплатой и вывести его имя и зарплату
awk '$3 > max {max = $3; name = $1} END {print name, max}' employees.txt

# Группировка по отделам - Посчитать количество сотрудников в каждом отделе
awk '{count[$2]++} END {for (dep in count) print dep, count[dep]}' employees.txt
