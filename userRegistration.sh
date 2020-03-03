#!/bin/bash -x
printf "Feature to validate email."

function validate()
{
	userCase=$1
	testCase=$2
	if [[ $firstName =~ $namePat ]];
	then
   	echo yes
	else
  		echo no
	fi
}

echo "Enter your first name:"
read firstName
namePat="^[A-Z]?[a-z]{2}"
#VALIDATE THE FIRST NAME
validate $firstname $namePat 

echo "Enter your last name:"
read lastName
namePat="^[A-Z]?[a-z]{2}"
#VALIDATE THE FIRST NAME
validate $lastname $namePat 

echo "Enter your email address:"
read email
emailPat=^abc.[a-zA-Z0-9]*@bl.\co
validate $email $emailPat 
