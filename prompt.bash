# создать файл
touch file
# удалить
rm file
# создать директорию
mkdir dir
# создать файл в директории
touch ./dir/file
# скопировать файл в директорию
cp file ./dir
# удалить из директория
rm ./dir/file
# rmdir dir удалит только пустую директорию 
# удалить директорию и содержимое
rm -r dir
# ......................
# STDOUT - стандартный поток выводв
# STDERR - стандартный поток ошибок
# STDIN - стандартный поток ввода
# ......................
# создать файл sout и записать в него STDOUT
# 1> STDOUT. 2> STDERR. > по умолчанию 1>
# >> добавит. > перезапишет
ls -l 1> sout
# вывести в STDOUT содержимое sout
cat sout
# переместить файл
mv file ./dir
#

#

#