#!/bin/bash

#it shows how conditions are working in shell

number=$1

if [ $number -gt 20 ]
then
     echo "the given number $number  is grater than 20 "

else
   
    echo " the given number $number is lessthan 20"
fi