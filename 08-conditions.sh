#!/bin/bash

#it shows how conditions are working in shell

today=monday

if[ $today="monday" ]
then

echo "today we have class"

exit 1

echo "we can search for other days"

else

echo "we dont have class"
 exit 0

 echo " we can execyte exit statement"


fi