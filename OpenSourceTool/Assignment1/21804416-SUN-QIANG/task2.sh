echo  'Task2'
echo  '-----------'
# Task2
# k follow with 1 order by the first column, 2-second column
(head -n 1 state-populations.txt && tail -n +2 state-populations.txt | sort -nr -k2) #> outcome.txt