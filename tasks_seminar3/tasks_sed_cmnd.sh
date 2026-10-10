# 1 В файле config.txt заменить первое вхождение localhost на 127.0.0.1 в каждой строке
sed 's/localhost/127.0.0.1/' config.txt

# 2 Заменить все вхождения слова ERROR на CRITICAL
sed 's/ERROR/CRITICAL/g' config.txt

# 3 Удалить из вывода все строки, содержащие DEBUG
sed '/DEBUG/d' app.log

# 4 Вывести только строки, содержащие ERROR
sed -n '/ERROR/p' app.log

# 5 Вывести строки с 10 по 20-ю из файла
sed -n '10,20p' app.log

# 6 Удалить из текста все пустые строки
sed '/^$/d' data.txt

# 7 Удалить строки, которые начинаются с #
sed '/^#/d' data.txt

# 8 В файле заменить строку PORT=8080 на PORT=9090
sed -i 's/PORT=8080/PORT=9090' conf.conf

# 9 Удалить пробелы и табуляции в начале каждой строки 
sed 's/^[[:spase:]]*//' data.txt

# 10 Из config.conf удалить комментарии и пустые строки, а результат сохранить в clean.conf
sed -e '/^[[:space:]]#/d' -e '/^[[:space:]]$/d' config.conf > clean.conf
