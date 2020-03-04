#!/bin/bash -x
printf "Feature to validate password length."
#cCONSTANTS
COUNTRYCODE=91
function validate()
{
	userCase="$1"
	testCase="$2"
	if [[ $userCase =~ $testCase ]]
	then
   	echo yes
	else
  		echo no
	fi
}
#VALIDATE THE FIRST NAME
echo "Enter your first name:"
read firstName
namePat="^[A-Z][a-z]{2}"
validate $firstName $namePat 
#VALIDATE THE FIRST NAME
echo "Enter your last name:"
read lastName
namePat="^[A-Z][a-z]{2}"
validate $lastName $namePat 
#VALIDATE EMAIL ADDRESS
echo "Enter your email address:"
read email
emailPat=^abc.[a-zA-Z0-9]*@bl.\co
validate $email $emailPat 
#VALIDATE MOBILE NUMBER
echo "Enter your mobile number:"
read mobileNumber
mobilePat=^"$COUNTRYCODE""[ ][0-9]{10}$"
if [[ $mobileNumber =~ $mobilePat ]]
then
	echo yes
else
	echo no
fi
#VALIDATE PASSWORD LENGTH
echo "Enter your password:"
read password
passwordPat="^.{8,}"
validate $password $passwordPat
