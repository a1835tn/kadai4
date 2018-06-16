#!/bin/bash

CHAR=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z)
char=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
symb=(\! \" \# \$ \% \& \' \( \) \= \~ \| \@ \` \[ \{ \; \+ \: \* \] \} \, \< \. \> \/ \? \_)
numb=(0 1 2 3 4 5 6 7 8 9)
prgm_name="18745135_2nd"
max_numb=67280421310721
FAIL="1"
SUCCESS="0"
test_result=$SUCCESS

# Error check for invalid input

# 1 : CHAR check (when prgm_name failed, it succed.)
for i in ${CHAR[@]}; do
  ./$prgm_name $i > /dev/null 2>&1 && ( echo "CHAR check Faild. input : $i" ; test_result=$FAIL )
#  echo "i=$i : test_result=$test_result"
done

# 2 : char check (when prgm_name failed, it succed.)
for i in ${char[@]}; do
  ./$prgm_name $i > /dev/null 2>&1 && ( echo "char check Faild. input : $i" ; test_result=$FAIL )
#  echo "i=$i : test_result=$test_result"
done

# 3 : symb check (when prgm_name failed, it succed.)
for i in ${symb[@]}; do
  ./$prgm_name $i > /dev/null 2>&1 && ( echo "symb check Faild. input : $i" ; test_result=$FAIL )
#  echo "i=$i : test_result=$test_result"
done

# 4 : zero check (when prgm_name failed, it succed.)
./$prgm_name 0 > /dev/null 2>&1 && ( echo "zero check Faild. input : $i" ; test_result=$FAIL )
#echo "i=0 : test_result=$test_result"

# 5 : non-int check (when prgm_name failed, it succed.)
for i in ${numb[@]}; do
  for j in ${numb[@]}; do
#    echo "i=$i,j=$j : test_result=$test_result"
    ./$prgm_name $i\.$j > /dev/null 2>&1 && ( echo "non-int check Faild. input : $i\.$j" ; test_result=$FAIL )
  done
done

# 6 : negative check (when prgm_name failed, it succed.)
for i in ${num[@]}; do
  ./$prgm_name \-$i > /dev/null 2>&1 && ( echo "symb check Faild. input : \-$i" ; test_result=$FAIL )
#  echo "i=\-$i : test_result=$test_result"
done

# 7 : exceed check (when prgm_name failed, it succed.)
./$prgm_name $((max_numb+1)) > /dev/null 2>&1 && ( echo "exceed check Faild. input : $((max_numb+1))" ; test_result=$FAIL )
#echo "i=$((max_numb+1)) : test_result=$test_result"


if [ $test_result -eq 0 ]
  then
#    echo "success"
    exit 0
  else
#    echo "fail"
    exit 1
fi
