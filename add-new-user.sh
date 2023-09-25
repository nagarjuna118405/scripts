#!/bin/bash

# Creating new users 

# Please execute the script using superuser priviliges or root user


if [[ "${UID}" -ne 0 ]]
then
   echo "Please use superuser or root user to execute this script"
   exit 1
fi

# Give prompts and help option for script execution

if [[ "${#}" -lt 1 ]]
then
  echo "Please use parameters to create user"
  exit 1
fi

# The first parameter is the user name

USER_NAME="${1}"

# enter the full name of the account owner

shift
COMMENT="${@}"

# Create Password

PASSWORD=$(date +%s%N | sha256sum | head -c8)

# create user

useradd -c "${COMMENT}" -m ${USER_NAME}

# check the command executed succefully

if [[ "${?}" -ne 0 ]]
then
  echo "user cannot be created"
  exit 1
fi


# Set Password
  
echo "${PASSWORD}" | passwd --stdin ${USER_NAME}


# Check the password created status


if [[ "${?}" -ne 0 ]]
then
  echo "password cannot set"
  exit 1
fi

# force password reset after 1st login

passwd -e "${USER_NAME}"


# Display the info of the user

echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0

