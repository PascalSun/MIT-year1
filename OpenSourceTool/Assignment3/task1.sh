#! /bin/bash

#Student Number: 21804416
#Name: SUN QIANG

# Use Linux 

#Outcome
#1. The total number of Bytes transfered by different Channels
#2. Bytes and The number of occurance
#3. The frequency of use of different channels
#4. The proportion of different data types


#Ideas
#1. Deal with the data
#   - Back up data
#   - Remove data about time and Mac address with sed and regx
#   - Count the number of bytes(add the value together) for each channel, output 12.txt
#   - Split the processed text into different txt (1.txt - Bytes; 2.txt - Channels; 3.txt - Descriptions)
#   - Count the number of occurance of unique element and output speartely into 11.txt, 22.txt, 33.txt
#2. Draw the graphs with google use task1-pic.sh

rm -rf task1.html
cp "wificapture-1.txt" "text.txt"
# Back up the txt

sed -E -i "s/([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}//g" text.txt 
sed -E -i "s/[0-9]{10}.[0-9]{6}//g" text.txt
# Remove unrelated data

# Count the all bytes transfered by each channel and output 12.txt
cat "text.txt" |( while read line1 line2 line3
do
 
    if [ $line2 = 1 -a $line2 != ' ' ];then 
        value1=$[$value1+$line1]
    elif [ $line2 = 2 -a $line2 != ' ' ];then 
        value2=$[$value2+$line1]
    elif [ $line2 = 3 -a $line2 != ' ' ];then 
        value3=$[$value3+$line1]
    elif [ $line2 = 4 -a $line2 != ' ' ];then 
        value4=$[$value4+$line1]
    elif [ $line2 = 5 -a $line2 != ' ' ];then 
        value5=$[$value5+$line1]
    elif [ $line2 = 6 -a $line2 != ' ' ];then 
        value6=$[$value6+$line1]
    elif [ $line2 = 7 -a $line2 != ' ' ];then 
        value7=$[$value7+$line1]
    elif [ $line2 = 8 -a $line2 != ' ' ];then 
        value8=$[$value8+$line1]
    elif [ $line2 = 9 -a $line2 != ' ' ];then 
        value9=$[$value9+$line1]
    elif [ $line2 = 10 -a $line2 != ' ' ];then 
        value10=$[$value10+$line1]
    else 
        value11=$[$value11+$line1]
    fi

    
done
echo $value1 1 >>12.txt
echo $value2 2 >>12.txt
echo $value3 3 >>12.txt
echo $value4 4 >>12.txt
echo $value5 5 >>12.txt
echo $value6 6 >>12.txt
echo $value7 7 >>12.txt
echo $value8 8 >>12.txt
echo $value9 9 >>12.txt
echo $value10 10 >>12.txt
echo $value11 11 >>12.txt
)

# Output bytes , channels and description spearately into three files
cat text.txt | awk '{print $1}'>1.txt
cat text.txt | awk '{print $2}'>2.txt
cat text.txt | awk '{print $3}'>3.txt




# Count the number of unique elemnents in each txt and output spearately into 11.txt ,22.txt, 33.txt

for value in `cat 1.txt |sort -n | uniq `
do

    counter=`grep $value 1.txt |wc -l`
    echo $value $counter >>11.txt
done


for value in `cat 2.txt |sort -n | uniq`
do
  

    counter=`grep $value 2.txt |wc -l`
    echo $value $counter >>22.txt
done


for value in `cat 3.txt |sort  | uniq`
do

    counter=`grep $value 3.txt |wc -l`
    echo $value $counter >>33.txt
done

# Draw the graphs with google api, output is a html file which can be visited by web browser if the linux is a website host
./task1-pic.sh



