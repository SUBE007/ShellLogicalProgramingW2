#!/bin/bash -x
echo "Enter the Password:"
read password

function isValidPassword()
{
local password=$1
local pattern="^(?=.*[a-zA-Z])(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"

	if [[ $password =~ $pattern ]]
	then
	 echo "valid Passwd"
	else
	echo "invalid passwd"
	fi
}
 isValidPassword $password



