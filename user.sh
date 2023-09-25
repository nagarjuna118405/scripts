#!/bin/bash


USER_NAME=$(id -un)

USER_NAME_TO_TEST='vagrant'

if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST}" ]]
then
  echo "Your user is matches ${USER_NAME_TO_TEST}"
fi

echo "hi"
