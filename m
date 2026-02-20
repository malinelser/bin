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
   echo "Usage:"
   echo "  arg1 <proj>"
   echo "  arg2 <cmd>"
   echo ""
   echo "Example:"
   echo "  ${script_name} ice msw"
   echo "  ${script_name} bev vecu"
   echo "  ${script_name} mule diag_desc"
   echo "  ${script_name} mice msw"
   echo "  ${script_name} mbev msw"
   echo ""
}

# Check for argument
if [[ -z "$1" ]]; then
   print_usage
   exit 1
fi

proj=$1
cmd=$2

if [[ -z "$2" ]]; then
   echo "Error: missing last command"
   print_usage
   exit 1
fi

if [[ "$cmd" == "msw" ]]; then
   command="vision"
else
   command="$cmd"
fi

if [[ "$proj" == "bev" ]]; then
   project="P_CCM4_T3_HMBEV"
elif [[ "$proj" == "mule" ]]; then
   project="P_CCM4_T2_HMMUL"
elif [[ "$proj" == "ice" ]]; then
   project="P_CCM4_T3_HMICE"
elif [[ "$proj" == "mice" ]]; then
   project="P_CCM4_T2_MBICE"
elif [[ "$proj" == "mbev" ]]; then
   project="P_CCM4_T2_MMBEV"
elif [[ "$proj" == "sice" ]]; then
   project="P_CCM4_T3_HSICE"
elif [[ "$proj" == "bas" ]]; then
   project="P_TEST_MPC574"
elif [[ "$proj" == "dmcm" ]]; then
   project="P_DMCM1_G"

elif [[ "$proj" == "all" ]]; then
   project=("P_CCM4_T2_HMMUL"
      "P_CCM4_T3_HSICE"
      "P_CCM4_T3_HMICE"
      "P_CCM4_T3_HBICE"
      "P_CCM4_T2_MBICE"
      "P_CCM4_T3_HMBEV"
      "P_CCM4_T2_MMBEV"
      "P_TEST_MPC574"
      "P_DMCM1_G")


      print_and_run tmux clear-history
      i=0
      while [ $i -lt ${#project[@]} ]; do
         if [[ "$cmd" == "vecu" ]]; then 
            print_and_run make PROJECT=${project[$i]} vecu_clean
         else
            print_and_run make PROJECT=${project[$i]} clean
         fi
         ((i++))   # increment index
      done
      i=0
      while [ $i -lt ${#project[@]} ]; do
         print_and_run make PROJECT=${project[$i]} ${command}
         ((i++))   # increment index
      done
      echo -e "\033[1;35m** search 'build did not' to find failures **\033[0m"

   else
      echo "Hark! An error doth arise:"
      echo “Thy chosen project, $proj, liveth not, nor ever hath it been.”
      echo ""
      print_usage
      exit 1
fi

if [[ "$proj" != "all" ]]; then
   # print_and_run make clean
   if [[ "$cmd" == "vecu" ]]; then 
      print_and_run make PROJECT=${project} vecu_clean
   else
      print_and_run make PROJECT=${project} clean
   fi
   print_and_run make PROJECT=${project} ${command}
fi
