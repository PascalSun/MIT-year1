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

