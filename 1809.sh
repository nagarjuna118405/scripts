#!/bin/bash

echo -e "today date is " `date`

echo -e "\nenter the path of the directory"

read the_path

echo -e "\nyour path has the following files and directories"

ls $the_path
