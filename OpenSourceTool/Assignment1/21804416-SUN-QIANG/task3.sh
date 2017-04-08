echo  'Task3'
echo  '-----------'
# Task3
#first deal with the commas 
sed 's/[,.;[())-]//g' unix-1969-1971.txt > outcome.txt
cat outcome.txt | tr " " "\n" | sort | uniq  > outs.txt
# rm outcome.txt
echo  '-----------'