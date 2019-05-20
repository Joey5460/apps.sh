all=""

for i in "$@" 
do 
    all+="$i "
done
echo $all
word=$(grep "${all::-1}" -ir ~/Documents/notes/dict)
echo "$word"

