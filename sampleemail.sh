#!/bin/bash -x
echo "Enter Email Of User:"
read email
pattern="[a-z0-9]{2,}[@,-,.,+][a-z]{3,}[.][a-z]{3,}$"

if [[ $email =~ $pattern ]]
then
        echo "Valid email address"
else
        echo "Invalid email address"
fi

