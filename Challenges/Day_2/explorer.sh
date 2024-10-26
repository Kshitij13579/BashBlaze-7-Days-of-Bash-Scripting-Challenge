#!/usr/bin/bash

echo "Welcome to Interactive File and Directory Explorer"
list_of_files=$(ls -lh | tail -n +2 | awk -F' ' '{if (substr($1,1,1) =="-") {print "File: " $9" "$5} else if (substr($1,1,1) == "d") {print "Directory: "$9" "$5}}')

echo "List of Files and Directories in current path"
echo ""	
echo "$list_of_files"
echo ""


while true; do

	read -p "Enter a line of text:" input

	if [[ -z "$input" ]]; then
		echo "Interactive File has Exited"
		break
	fi

	characters=$(echo ${input} | wc -m)
	echo "Number of characters: ${characters}"

done

