#!/bin/bash

#PRINT HELLO WORLD

echo "Hello World"

#USE Variables and print them

name="Kshitij"

echo "Hello ${name}"

#SUM of two variables

num1=5
num2=6
sum=$(( $num1+$num2 ))
echo "SUM:${sum}"

#PRINT BUILT IN VARIABLES

#Print Home
echo $HOME

#PRINT BASH Process ID
echo $BASHPID

#Present working directory
echo $PWD

#Operating system type
echo $OSTYPE

#Path variable
echo $PATH

#List files in directory
extension=$1

if [[ -n "$extension" ]]; then
	echo "Listing files:"
	files=$(ls *.${extension})
	echo "${files}"
fi


