#!/usr/bin/bash
# guessinggame.sh
# This program will continuously ask the user to guess the number of files in the current directory, until they guess the correct number
# The user will be informed if their guess is too high or too low
# Once the user guesses the correct number of files in the current directory they should be congratulated.

isnum0() {
   regex="[0-9]+$"
   # echo "arg [$1]"
   if [[  $1 =~ $regex  ]]; then
      echo 0
   else
      echo 1
   fi
}
#echo $(isnum0 12)
#exit 0
# --------------------------------------------------------
echo "*** Welcome to gessinggame ! ***"
echo "You have to guess the numbers of files in the current directory."
nbfiles=$(ls -la | egrep "^-" | wc -l)
#echo "nbfiles : $nbfiles"
rep=-1
while [[ $rep -ne $nbfiles ]]; do
    read -p "How many files ? " rep
    rep=${rep/\//}
    rep=$((rep+0))
    chk=$(isnum0 "$rep")
    # echo "chk : $chk."
    if ! [[ chk -eq 0 ]]; then
       echo "Invalid answer \"$rep\"." 
       continue
    fi
     
    # echo "rep: $rep"
    if [[ rep -gt nbfiles ]]; then
       echo "$rep is too much ! may be you could try less..."
    elif [[ rep -lt nbfiles ]]; then
       echo "$rep is to few, you may try more..."
    fi
done
echo "*** Congratulations, you have it ! ***"
echo "there is $nbfiles files in $PWD"
ls -a
