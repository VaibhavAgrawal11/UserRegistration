#!/bin/bash -x
printf "Feature to validate last name."
echo "Enter your first name:"
read firstName
namePat="^[A-Z]?[a-z]{2}"
#VALIDATE THE FIRST NAME
if [[ $firstName =~ $namePat ]];
then
	echo yes
else
	echo no
fi
echo "Enter your last name:"
read lastName
namePat="^[A-Z]?[a-z]{2}"
#VALIDATE THE FIRST NAME
if [[ $lastName =~ $namePat ]];
then
   echo yes
else
   echo no
fi
