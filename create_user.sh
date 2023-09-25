#!/bin/bash

# this script is to create a user in local system

# Ask for username

read -p 'Enter the username to create: ' USER_NAME

# ask for real name

read -p 'Enter the name of the account: ' COMMENT

# ask for the password

read -p 'Enter the password: ' PASSWORD

# create user

useradd -c "${COMMENT}" -m ${USER_NAME}

# set the password for the user

echo ${PASSWORD} | passwd --stdin ${USER_NAME}

# force password to change on first login

passwd -e ${USER_NAME}


