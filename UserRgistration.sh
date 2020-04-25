#!/bin/bash -x
echo "Enter First Name:"
read fname
echo "Enter last Name:"
read lname
echo "Enter Email Of User:"
read email
echo "Enter Mobile no.of User:"
read mob
echo "Enter Passwd:"
read password
#--------------------First name
function isValidFirstName()
{
local fname=$1
pattern1="[A-Z][a-z]{3}"

if [[ $fname =~ $pattern1 ]]
then
	echo "Valid First Name"
else
	echo "Invalid First Name"
fi
}
# isValidFirstName $fname
#--------------------last name

function isValidLastName()
{
local lname=$1
pattern2="[A-Z][a-z]{3,}$"

if [[ $lname =~ $pattern2 ]]
then
        echo "Valid last Name"
else
        echo "Invalid last Name"
fi
}
#isValidLastName $lname
#--------------------email addrs

function isValidEmail()
{
local email=$1
pattern3="[a-z0-9]{2,}[.][a-z0-9]{3,}[@][a-z]{3,}[.][a-z]{2,3}[.][a-z]{2,3}$"

if [[ $email =~ $pattern3 ]]
then
        echo "Valid email address"
else
        echo "Invalid email address"
fi
}
#isValidEmail $email
#--------------------Mobile Number
function isValidPhone()
{
local mob=$1
pattern4="[0-9]{2}[ ]?[0-9]{10}"

if [[ $mob =~ $pattern4 ]]
then
        echo "Valid mobile no."
else
        echo "Invalid Mob no."
fi
}
 #isValidPhone $mob
#--------------------Password
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


