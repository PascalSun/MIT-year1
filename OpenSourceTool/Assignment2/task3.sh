#!/bin/sh

echo 'Task3'
echo '-------------------'
echo 'Explanation:'
echo 'First, the 4 subtasks below need to be done'
echo '  1. find the name of the file which owns the main function'
echo '  2. find the version number and update it by add 1'
echo '  3. get the date now as a variables'
echo '  4. find the version part which needs to be updated'
echo 'Then combine the different parts together as a variables'
echo 'In the end, replace all the old ones to be the new ones'

echo '--------------------'

#Find the name of the file
cd ./calcmarks
line=`find .|xargs grep -r main\( -l |cut -d "." -f2 | cut -d '/' -f2`
lines=`echo $line |cut -d ' ' -f2`
printf 'The name:  '
printf $lines
printf '\n'

echo '---'
printf 'The date: '


#Get the date
t=`date`
echo  $t
echo '---'

#Get the version number
printf 'The new version number: '
filename=$lines'.c'
old=`grep version $filename | cut -d '/' -f3`
num=`grep version $filename | cut -d "," -f2 | cut -d ' ' -f3`
nums=$((num+1))
printf $nums
printf '\n'

#The old version
echo '----'
printf 'The old version: '
echo  $old
echo '----'

#The new version
printf 'The new version: '
up=${lines}', version '$nums', released '$t
echo  $up
sed -i '' "s/${old}/${up}/g" *;
echo '---------------------'
echo "Update have been done"





