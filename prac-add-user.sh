#!/bin/bash

# This script is to create users with inputs

# This script can be executed only with super use priviliges / root user

if [[ "${UID}" -ne 0 ]]
then
  echo "execute script with super user or root user"
  exit 1
fi

# Enter the user details

read -p "Enter the username: " USER_NAME

read -p "Enter the Full Name: " COMMENT

read -p "Enter the password: " PASSWORD

# Create the user

useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check the execution status

if [[ "${?}" -ne 0 ]]
then
  echo "User Cannot be created"
  exit 1
fi

# Set password

echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"

# Check the execution status for setting password

if [[ "${?}" -ne 0 ]]
then
  echo "Password cannot be set"
  exit 1
fi

# Force password change on first login

passwd -e "${USER_NAME}"

# Display the information


echo 'username:'
echo "${USER_NAME}"
echo 'password:'
echo "${PASSWORD}"
echo 'host:'
echo "${HOSTNAME}"
tail -1 /etc/passwd
exit 0


