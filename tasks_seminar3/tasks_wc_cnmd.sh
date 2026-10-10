# 1 Определить количество строк в файле app.log
wc -l app.log

# 2 Определить количество слов в файле article.txt
wc -w article.txt

# 3 Определить размер содержимого файла data.txt в байтах
wc -c data.txt

# 4 Определить количество символов в файле с учетом многобайтовых символов
wc -m text.txt

# 5 Посчитать количество строк отдельно в app.log, error.log и access.log
# а также получить общее количество
wc -l app.log error.log access.log

# 6 Определить количество строк app.log, содержащих ERROR
grep "ERROR" app.log | wc -l

# 7 Определить количество уникальных строк в users.txt
grep users.txt | uniq | wc -l

# 8 Определить количество обычных файлов в текущем каталоге и всех подкаталогах
find . -type f | ws -l

# 9 Определить количество файлов с расширением .log во всем каталоге logs
fins ./logs -type f -name "*.log" | wc -l

# 10 Найти ERROR во всех .log-файлах каталога logs и определить общее количество найденных строк 
grep -r --include="*.log" "ERROR" ./logs | wc -l


