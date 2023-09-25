#!/bin/bash

# Display user info

USER_NAME=$(id -un)

echo "Your username is ${USER_NAME}"

if [[ "${UID}" -eq 0 ]]
then
  echo 'You are root'
else
  echo 'You are not root'
fi
