#!/bin/bash

# This script is to create users in local hosts

# This script can be executed only with root / sudo priviliges

if [[ "${UID}" -ne 0 ]]
then
  echo "Please run the script with priviliged user"
  exit 1
fi

# create user

read -p "Enter the username for the account: " USER_NAME

read -p "Enter the fullname of the account: " COMMENT

useradd -c "${COMMENT}" -m "${USER_NAME}"

if [[ "${UID}" -ne 0 ]]
then
   echo "User cannot be created"
   exit 1
fi

# set password

read -p "Enter the password: " PASSWORD

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# set temp password

passwd -e ${USER_NAME}

if [[ "${UID}" -ne 0 ]]
then
   echo "Password cannot be created"
   exit 1
fi

# Display the info.

echo 'username'
echo "${USER_NAME}"
echo
echo 'password'
echo "${PASSWORD}"
echo
echo 'hostname'
echo "${HOSTNAME}"




