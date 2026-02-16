#!/bin/bash

print_and_run() {
   echo -e "\033[36m** Casting spell **\033[0m"
   echo -e "\033[36m$*\033[0m"   # Print command in cyan
   echo "** * * * * * * * **"
   echo ""
   "$@"                           # Execute command safely
   echo -e "\033[1;35m$*\033[0m"   # Print command in cyan
   echo -e "\033[1;35m** spell finished **\033[0m"
}

script_name=$(basename "$0")
print_usage() 
{
   echo "Usage: Git stash"
   echo ""
   echo "  arg1            [s]taged             stash all, both staged and working directory
                  [w]orkingDirectory   stash only working directory
                  [l]ist               list all stashes
                  [a]pply              apply a stash from the list
                  [p]op                apply and delete a stash from the list
                  [d]rop               drop(delete) a stash from the list"
   echo ""
   echo "  arg2            name or number"
}

proj=$1
branch_name=$2

if [[ "$proj" == "l" ]]; then
   print_and_run git stash list
elif [[ "$proj" == "s" ]]; then
   print_and_run git stash -u -m "$branch_name"
elif [[ "$proj" == "w" ]]; then
   print_and_run git stash --keep-index -u -m "$branch_name"
elif [[ "$proj" == "d" ]]; then
   print_and_run git stash drop stash@{$branch_name}
elif [[ "$proj" == "a" ]]; then
   print_and_run git stash apply stash@{$branch_name}
elif [[ "$proj" == "p" ]]; then
   print_and_run git stash pop stash@{$branch_name}
else
   echo ""
   print_usage
   exit 1
fi
