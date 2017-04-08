#Use the OS-X system
#Student Number: 21804416
#Name: SUN QIANG

# Task1 
# Way 1 
##First install brew
##To install brew, run the scripts below !!!!
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
##Then install coreutils
##To install coreutils, run the scripts below
#brew install coreutils
#Then command to generate the file order by size
echo  'Task1'
echo  'Task1-Way1'
echo  '-----------'
du -hs *  | gsort -h
echo  '-----------'

echo 'Task1-Way2'

# Way 2
# List file in ascend order
echo  '-----------'
ls -l | sort -k3
echo  '-----------'
echo 'Task1-Way3'
echo  '-----------'
# Way 3
# List file in descend order
ls -l | sort -rk3
echo  '-----------'
echo  'Task2'
echo  '-----------'
# Task2
# k follow with 1 order by the first column, 2-second column
(head -n 1 state-populations.txt && tail -n +2 state-populations.txt | sort -nr -k2) #> outcome.txt
echo  '-----------'
echo  'Task3'
echo  '-----------'
# Task3
#first deal with the commas 
sed 's/[,.;[())-]//g' unix-1969-1971.txt > outcome.txt
cat outcome.txt | tr " " "\n" | sort | uniq 
rm outcome.txt
echo  '-----------'
echo 'Task4'

##task4 
## Get the date and the other three data outputs to another txt
## Then count the data in the range of (a-b), 
#if the date is weekdays, then count in weekdaysum, else count in weekendsum
#Compare each other

#the first command: get the data from the .csv file, put the outputs to file out.txt
(cat IDCJDW6111.201607.csv | grep 2016-07) > out.txt
#the second command: choose the data: date, max temp, wind speed and sun hours, put the outputs to file outs.txt
cat out.txt |awk -F',' '{print $2 " " $4 " " $7 " " $9; }' > outs.txt
#the third command: deal with date, ignore the 2016-07 and get the day, put the outputs to file out.txt
cat outs.txt |awk -F'-' '{print $1 " " $2 " " $3 " " $4; }' > out.txt
#the fourth command: extract the data with day, max temp, wind speed and sun hours
cat out.txt |awk -F' ' '{print $3 " " $4 " " $5 " " $6; }' > outs.txt
#the fifth command: choose the data that 14 < max temp < 20, sun hours > 5, wind speed <35, put the outputs to file goodday
cat outs.txt | awk 'NR<32{if($2<20 && $2 >14 && $3>5 && $4<35)print $1,$2,$3,$4;}' > goodday.txt
#the sixth command: find the times which good whether happened in weekends and weekdays, and compare them
cat goodday.txt | awk 'BEGIN{sum1=0;sum2=0}{b=$1%7;if(b ==2 || b ==3) sum1+=1; else sum2+=1}END{print sum1/2 " " sum2/5;if(sum1/2>sum2/5) print "weekeeds are better"; else print "weekdays are better" }'
#delete the txt file which generated during the process
rm outs.txt out.txt goodday.txt
