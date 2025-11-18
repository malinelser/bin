#!/bin/bash

print_and_run() {
    "$@"                           # Execute command safely
}

script_name=$(basename "$0")

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
else
    echo "Hark! An error doth arise:"
    echo “Thy chosen project, $proj, liveth not, nor ever hath it been.”
    echo ""
    print_usage
    exit 1
fi

