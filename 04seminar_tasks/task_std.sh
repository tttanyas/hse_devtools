# Запись в файл
# Записать текст Hello Bash в файл output.txt
echo "Hello Bash" > output.txt

# Добавление в файл
# Добавить строку Second line, не удаляя старое содержимое
echo "Second Line" >> output.txt

# Чтение из файла
# Посчитать количество строк файла, передав его через stdin
wc -l < output.txt

# Перенаправление ошибок
# Сохранить ошибки команды поиска несуществующего файла в errors.log
ls /no_such_file 2> errors.log

# Использование pipe
# Найти строки с ERROR и посчитать их количество
grep "ERROR" app.log | wc -l

# Разделение потоков
# Сохранить обычный вывод и ошибки команды в разные файлы
ls . /no_such_file 1> output.log 2> errors.log

# Объединение потоков
# Сохранить stdout и stderr в один файл
ls . /no_such_file > all.log 2>&1

# Вывод и запись одновременно
# Показать список файлов на экране и сохранить его в files.txt
ls | tee files.txt

# Добавление через tee
# Добавить текущую дату в events.log, одновременно выводя её в терминал
date | tee -a events.log

# Анализ с сохранением отчёта
# Найти 5 самых частых IP в access.log, показать результат и сохранить в top_ip.txt
awk '{print $1}' access.log | sort | uniq -c | sort -nr | head -5 | tee top_ip.txt