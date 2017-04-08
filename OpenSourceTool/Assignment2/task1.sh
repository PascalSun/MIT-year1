echo  'Task1'

echo '------------'

echo 'Explanation:'
echo 'The task can be divided into two small tasks:'
echo '   - find words which is 3 or more lower characters;'
echo '   - then compare them with the web2 dictionary'
echo 'So first I use grep with regex to find the words we need'
echo 'Then use a loop to find out the word which is not in the web2 dictionary'
echo  '-----------'

echo "The words might have potential spelling errors"
# Task1
#first deal with the commas 
#You can test other files by changing the 'unix-1969-1971.txt' to the file name
sed 's/[,.;[())-]//g' unix-1969-1971.txt > outcome.txt

#Then sort the words, find the unique words
cat outcome.txt | tr " " "\n" | sort | uniq  > outs.txt
#Then find the words which is 3 or more lower characters
egrep ^[a-z]\{3,\}$ outs.txt > wordlist.txt

rm outcome.txt
rm outs.txt
#Do the loop and find the words which are not in web2 dictionary
while read p; do
	if [[ $(grep ^$p\$ /usr/share/dict/web2) ]];then 
		echo $p > right.txt
	else
		echo $p	
	fi
done < wordlist.txt


rm wordlist.txt
rm right.txt

echo  '-----------'

#!/bin/sh
echo 'Task2'
echo '---------------'
echo 'Explanation:'
echo "First we should read the data from csv, ignore the first header line"
echo 'Then we deal with the data:'
echo '  - 1. use high to store the highest ratio for the state we are dealing with,'
echo '       use highschool to store the name of the university,'
echo '       use highest to store the highest ratio for the whole countries,'
echo '       use highestschool to store the name of it'
echo '  - 2. If the line is to show which state it is and the high is 0, then print the name of the state;'
echo '       If the line is to show which state it is and the high is not 0, then print the high and highschool for last state, then print the next state'
echo '       If the line is number, caculate the ratio 100*(other overseas + temperory entry)/all,'
echo '          Then judge whether it is larger than high and highest or not, if it is higher, then repalce the stores'
echo '  - 3. After all of these, print out the final outcome'
filename="university-enrolments-2015.csv"
IFS=","
high=0
highschool=''
highest=0
highestschool=''
echo '--------------------------------------------------------------------------'
echo '|the university with the highest ratio of overseas students in each state|'
echo '--------------------------------------------------------------------------'
sed '1d' $filename > outcome.csv
while read f1 f2 f3 f4 f5 f6 f7
do  

	if [ -z "$f6" ]; then
		if test $high -ne 0;then
			printf $highschool
			printf '    |   '
			printf $high
			printf '\n'
			printf $f1
			printf '\n'
			high=0
		else
			printf $f1
			printf '\n'
		fi
	else
		z=$((f6+f5))
		out=$((z*100/f7))
		if test $out -ge $high;then
			high=$out
			highschool=$f1
		fi

		if test $out -ge $highest;then
			highest=$out
			highestschool=$f1
		fi
		# printf $f1
		# printf '   '
		# printf $out
		# printf '\n'
	fi


	
done < 'outcome.csv'
printf $highschool
printf '    |    '
printf $high
printf '\n'
echo '------------------------------------------------------------'
printf '|the university with the highest ratio of overseas students|'
printf '\n'
echo '------------------------------------------------------------'
printf $highestschool
printf '    |    '
printf $highest
printf '\n'
rm outcome.csv

