
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
