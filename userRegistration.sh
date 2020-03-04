#!/bin/bash -x
printf "Validate email with given test cases.\n"
#cCONSTANTS
COUNTRYCODE=91

function validate()
{
	flag=0
	userCase="$1"
	testCase="$2"
	if [[ $userCase =~ $testCase ]]
	then
		flag=0
	else
		flag=1
	fi
}

#VALIDATE THE FIRST NAME
function checkFirstName()
{
	echo "Enter your first name:"
	read firstName
	namePat="^[A-Z][a-z]{2,}"
	validate $firstName $namePat
	if((flag==0))
   then 
      echo "Valid first name" 
   else
		echo "Invalid firstname"
	fi
}

#VALIDATE THE FIRST NAME
function checkLastName()
{
	echo "Enter your last name:"
	read lastName
	namePat="^[A-Z][a-z]{2,}"
	validate $lastName $namePat 
	if((flag==0))
   then 
      echo "Valid lastname" 
   else
      echo "Invalid lastname"
   fi

}

#VALIDATE EMAIL ADDRESS
function checkEmail()
{
	echo "Enter your email address:"
	read email
	emailPat="^abc([+]?[-]?[.]?[_]?[\w]+)?[@][a-z]+[.][a-z]{2,}([.]?[a-z]+)?$"
	validate $email $emailPat
	if((flag==0))
   then 
      echo "Valid email" 
   else
      echo "Invalid email"
   fi
 
}

#VALIDATE MOBILE NUMBER
function checkMobileNumber()
{
	echo "Enter your mobile number:"
	read mobileNumber
	mobilePat=^"$COUNTRYCODE""[ ][0-9]{10}$"
	if [[ $mobileNumber =~ $mobilePat ]]
	then
		echo "Valid mobile number"
	else
		echo "invalid mobile number"
	fi
}

#VALIDATE PASSWORD LENGTH
function checkLength()
{
	flag=0
	passwordPatLength="^.{8,}"
	validate $password $passwordPatLength
	if((flag==1))
   then
      echo "Invalid length atleast 8 char"
      checkPassword
   fi
}

#VALIDATE PASSWORD HAVE ATLEAST ONE UPPERCASE
function checkAtleastOneUppercase()
{
	flag=0
	passwordPatUpperCase="[A-Z]{1,}"
	validate $password $passwordPatUpperCase
	if((flag==1))
	then
		echo "Invalid length atleast 1 uppercase char"
		checkPassword
	fi
}

#VALIDATE PASSWORD HAVE ATLEAST ONE NUMERIC DIGIT
function checkAtleastOneNumeric()
{
	flag=0
	passwordPatNumeric="[0-9]+"
	validate $password $passwordPatNumeric
	if((flag==1))
   then 
      echo "Invalid password atleast 1 numeric digit" 
		checkPassword
   fi
}

#VALIDATE PASSWORD HAVE EXACTLY ONE SPECIAL CHARACTER
function checkExactlyOneSpecialChar()
{
	flag=0
	SPECIAL='!@#$%^&*(),.?":{}|<>'
	passwordPatSpecialChar="^[^$SPECIAL]*[$SPECIAL][^$SPECIAL]*$"
	validate $password $passwordPatSpecialChar
	if((flag==1))
   then 
      echo "Invalid password exactly 1 special character" 
      checkPassword
	else
		validation=1
	fi
}

#VALIDATE PASSWORD
function checkPassword()
{
	echo "Enter your password:"
	read password
	flag=0
	checkLength
	if((flag==0))
	then
		checkAtleastOneUppercase
	fi
	if((flag==0))
	then
		checkAtleastOneNumeric
	fi
	if((flag==0))
	then
		checkExactlyOneSpecialChar
	fi
	if((flag==0 && validation==1))
	then
		echo "Valid password"
	fi
}

checkFirstName
checkLastName
checkEmail
checkMobileNumber
checkPassword
