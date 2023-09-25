#!/bin/bash

# Get the username (login).

read -p 'Enter the username of your choice: ' USER_NAME

# Get the real name (contents for the description field).

read -p 'Enter the name of the user: ' COMMENT

# Get the password.

read -p 'Enter the password for the user: ' PASSWORD

# Create the user with the password.

useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeeded.

if [[ "${?}" = 0 ]]
then
  echo "User created successfully"
fi

# Set the password.

PASSWORD=$(date +%s%N | sha256sum | fold -w1 | shuf | head -c8)

# Check to see if the passwd command succeeded.

if [[ "${?}" = 0 ]]
then
  echo "Password created successfully"
fi

# Force password change on first login.

passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created.

echo "${USER_NAME}"${PASSWORD}
