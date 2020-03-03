#!/bin/bash -x
printf "Feature to validate first name."
echo "Enter your first name:"
read firstName
namePat="^[A-Z]?[a-z]{2}"
if [[ $firstName =~ $namePat ]];
then
	echo yes
else
	echo no
fi
