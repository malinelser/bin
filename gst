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
   echo "  arg1            [e]verything         stash all, both staged and working directory
                  [w]orkingDirectory   stash working directory + staged and remove working directory
                  [s]taged             stash only staged files (but re-apply everything, but WD changes will overwrite staged)
                  [l]ist               list all stashes
                  [a]pply              apply a stash from the list
                  [p]op                apply and delete a stash from the list
                  [d]rop               drop(delete) one or several stash(es) from the list"
   echo ""
   echo "  arg2            name or stash number(s)"
   echo ""
   echo "Example:"
   echo "                  gst d 5 5 5 -> delete stashes 5 - 7"
   echo ""
}

proj=$1
names=("${@:2}")

if [[ "$proj" != "d" && $# -gt 2 ]]; then
   echo "Hark! An error doth arise:"
   echo ""
   print_usage
   exit 1
fi

if [[ "$proj" == "l" ]]; then
   print_and_run git stash list
   exit
fi

if [[ ${#names[@]} -eq 0 ]]; then
   echo "Hark! An error doth arise:"
   echo ""
   print_usage
   exit 1
fi

for branch_name in "${names[@]}"; do

   if [ -z "$branch_name" ]; then
         echo "Hark! An error doth arise:"
         echo ""
         print_usage
         exit 1
   elif [[ "$proj" == "e" ]]; then
      print_and_run git stash -u -m "$branch_name"
   elif [[ "$proj" == "w" ]]; then
      print_and_run git stash --keep-index -u -m "$branch_name"
   elif [[ "$proj" == "d" ]]; then
      print_and_run git stash drop stash@{$branch_name}
   elif [[ "$proj" == "a" ]]; then
      print_and_run git stash apply stash@{$branch_name}
   elif [[ "$proj" == "p" ]]; then
      print_and_run git stash pop stash@{$branch_name}
   elif [[ "$proj" == "s" ]]; then
      print_and_run git stash --keep-index -u -m {$branch_name}ALL  #working directory
      print_and_run git stash -u -m "$branch_name"
      print_and_run git stash apply stash@{1}
   else
      echo ""
      print_usage
      exit 1
   fi
done
