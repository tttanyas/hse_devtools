# 1 В файле app.log найти все строки, содержащие error
grep "ERROR" app.log

# 2 Найти error независимо от регистра ERROR, Error, error
grep -i "error" app.log

# 3 Найти строки с ERROR и показать номер каждой найденной строки
grep -n "ERROR" app.log

# 4 Определить, сколько строк файла содержит ERROR 
grep -c "ERROR" app.log

# 5 Вывести все строки файла, кроме содержащих DEBUG
grep -v "DEBUG" app.log

# 6 Найти строки, содержащие ERROR или WARN 
grep -E "ERROR|WARN" app.log

# 7 Найти слово error, но не считать совпадением error_code, errors и другие части слов
grep -iw "error" app.log

# 8 Найти ERROR во всех файлах каталога logs и его подкаталогах
grep -rn "ERROR" ./logs

# 9 Рекурсивно найти ERROR только в файлах с расширением .log
grep -r --include="*.log" "ERROR" ./logs

# 10 Найти в access.log все ipV4-подобные адреса и вывести только найденные значения, а не строки целиком
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' access.log

