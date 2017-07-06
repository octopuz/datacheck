#!/bin/sh

list=$1
echo 'BEGIN' |tee mislist errlist

for((i=1;i<=10000;i++))
do
   m=`cat $list |grep -w "$i.jpg" |wc -l`
   if [ $m -eq 0 ];then
       echo "{$i} is missing." >> mislist
   elif [ $m -gt 1 ];then
       echo "$i is repeated $m times." >> errlist
   fi
done

echo 'END'
