#!/bin/bash
exec 10<&0
exec < $1
file="current_line.txt"
let count=0
while read LINE
do 
	((count++))
	echo $LINE	> $file
	if [$? -ne 0]
		echo "Error in writing to file ${file}; check this permission!"
		fi
done
echo "Number of line: $count"
echo "The last line of the file is: `cat ${file}`"
echo "Expected number of lines: `wc -l $in`"
exec 0<&10 10<&-