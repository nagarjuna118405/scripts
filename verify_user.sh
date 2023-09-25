#!/bin/bash

#Verify user

#if [[ $UID -eq 0 ]]
#then
#  echo "You are root"
#else
#  echo "You are not root"
#fi

# display username

USER_NAME=$(id -un)

# Test if command is successful

#if [[ "${?}" -ne 0 ]]
#then
#  echo "The id command is not executed successful"
#  exit 1
#fi
#echo "Your username is ${USER_NAME}"

# string test conditions

USER_NAME_TO_TEST='vagrant'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then
  echo "Your username is matched"
else
  echo "Your username is invalid"
fi
