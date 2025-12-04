#!/bin/bash

print_and_run() {
    "$@"                           # Execute command safely
}

script_name=$(basename "$0")
print_usage() 
{
   echo "Example:"
   echo ". b 1 -> ~/code/sw-ecu/BSW"
   echo ". b 2 -> ~/code/second-sw-ecu/BSW"
   echo ". b 3 -> ~/code/third-sw-ecu/BSW"
   echo ". b t -> ~/code/sw-ecu/BSW/TargetTest"
   echo ". b p -> ~/playground"
   echo ". b rd -> ~/code/req-dbc"
   echo ""
}
proj=$1


if [[ "$proj" == "1" ]]; then
    project="sw-ecu"
print_and_run cd ~/code/${project}/BSW
elif [[ "$proj" == "2" ]]; then
    project="second-sw-ecu"
print_and_run cd ~/code/${project}/BSW
elif [[ "$proj" == "3" ]]; then
    project="third-sw-ecu"
print_and_run cd ~/code/${project}/BSW
elif [[ "$proj" == "t" ]]; then
print_and_run cd ~/code/sw-ecu/BSW/TargetTest
elif [[ "$proj" == "rd" ]]; then
print_and_run cd ~/code/req-dbc
elif [[ "$proj" == "p" ]]; then
print_and_run cd ~/playground
else
    echo "Hark! An error doth arise:"
    echo “Thy chosen project, $proj, liveth not, nor ever hath it been.”
    echo ""
    print_usage
    exit 1
fi

