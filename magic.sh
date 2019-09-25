#!/bin/bash

for i in {1..100}
do
  jj=1
  while [ $jj -lt 20 ]
  do
    for ii in {1..20}
    do
    j=$(($jj*100))
    echo $i $j
    convert hayes.jpg -quality $i -resize $j\x$j target/target$i\_$j.jpg &
    jj=$(($jj+1))
    done
  wait
  done
done

finished=0
idx=0

while [ $finished -eq 0 ]
do
IFS=' ' read -r -a array <<< $(ls -l target|sort -k5 -n|head -2|tail -1)
echo $(echo ${array[8]})
if [ $(echo ${array[8]}|wc -c) -eq 1 ];
then
  echo "empty"
  finished=1
else
mv target/${array[8]} sortedTarget/target$idx.jpg
idx=$(($idx+1))
fi
done
