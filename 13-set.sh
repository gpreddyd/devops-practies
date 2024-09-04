#!/bin/bash


set -e 


trap 'failure "$LINENO" "$BASH_COMMAND" ' ERR 

failure(){

    echo " failed at $1: $2 "
}

echo " the comand is success"
echoo " it is filure"
echo " it again success "