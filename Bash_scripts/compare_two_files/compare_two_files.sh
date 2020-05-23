#!/bin/bash

#---------------------------------------------------------
# Check if there are lines at which two files differ, 
# and what those lines are.
#---------------------------------------------------------

if [ $# -ne 2 ]; then
   echo ' '
   echo $0: no arguments provided for "gauss_output.sh"
   echo ' '
   exit 1

elif [ $# -eq 2 ]; then
   len1=$(cat $1 | wc -l) # number of lines in file 1
   len2=$(cat $2 | wc -l) # number of lines in file 2
   if [ $len1 -gt $len2 ]; then
      len=$len1
   elif [ $len2 -ge $len1 ]; then
      len=$len2
   fi

   let n_diff=0 # number of lines that are different in the two files

   for (( i = 1; i <= $len; i++ )) 
   do
      line_i_1=$(cat $1 | head -$i | tail -1) # ith line in file 1
      line_i_2=$(cat $2 | head -$i | tail -1) # ith line in file 2
      if [ "$line_i_1" != "$line_i_2" ]; then
         echo At line $i: | cat >> output
         echo $1:   $line_i_1 | cat >> output
         echo $2:   $line_i_2 | cat >> output
         echo '-----------------------------------------------------------------' | cat >> output
         n_diff=$((n_diff+1))
      fi
   done
   echo The files differ at $n_diff lines
fi
