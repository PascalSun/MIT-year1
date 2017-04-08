#! /bin/bash

#Student Number: 21804416
#Name: SUN QIANG

# Use Linux 

#Outcome
#1. Percentage of status code
#2.  Different kinds of requests
#3. The bytes transfered by images/run/newcss

#Ideas
#1. Deal with the data
#   - Back up data
#   - Remove data about time and Mac address with sed and regx
#   - Count the number of bytes
#   - Split the processed text into different txt 
#   - Count the number of occurance of unique element and output speartely into 11.txt, 22.txt, 12.txt
#2. Draw the graphs with google use task2-pic.sh

rm -rf task2.html


# Join together
cat weblog-1.txt > weblog.txt
cat weblog-2.txt >> weblog.txt

#Remove the data I do not need 
sed -E -i "s/[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3} - -//g" weblog.txt
sed -E -i "s/\[.*\]//g" weblog.txt
sed -E -i 's/ \".{3,4} \/*//g' weblog.txt
sed -E -i 's/\/.+\"//g' weblog.txt
sed -E -i '/HTTP/d' weblog.txt
sed -E -i '/\"/d' weblog.txt
sed -E -i 's/-/0/g' weblog.txt


# Spilt data into different files to process more easily
cat weblog.txt | awk '{print $1}'>1.txt
cat weblog.txt | awk '{print $2}'>2.txt
cat weblog.txt | awk '{print $1,$3}'>3.txt


# Count the unique elements 
for value in `cat 1.txt |sort -n | uniq `
do

    counter=`grep $value 1.txt |wc -l`
    echo $value $counter >>11.txt
done

for value in `cat 2.txt |sort -n | uniq `
do

    counter=`grep $value 2.txt |wc -l`
    echo $value $counter >>22.txt
done

# Caculate the  total bytes for run, images and  newcss
cat "3.txt" |( while read line1 line2
do
 
    if [ $line1 = images -a $line1 != ' ' ];then 
        value1=$[$value1+$line2]
    elif [ $line1 = newcss  -a $line1 != ' ' ];then 
        value2=$[$value2+$line2]
    else 
        value3=$[$value3+$line2]
    fi

    # for word in $LINE
    # $i=0
    # do 
    #     echo $word >>$i.txt
    #     i+=1
    # done [ $line2 = 11 -a $line2 != ' ' ];then 
    
done
echo $value1 images >>12.txt
echo $value2 newcss >>12.txt
echo $value3 run >>12.txt
)

#Output a html

./task2-pic.sh