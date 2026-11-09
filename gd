#!/bin/bash
print_usage() 
{
   echo "Usage: Git compare the diff files for one commit against another commit's diff files"
   echo ""
   echo "  arg1            first commit's hash"
   echo "  arg2            second commit's hash"
   echo ""
   echo "Example:"
   echo "                  gd 7a69ab43b7375d51fcc09ad83c0f457c469be5ff f31aed2bc75bb8e7992a92750f7b65452286f1e9"
   echo ""
}

COMMIT_A="$1"
COMMIT_B="$2"

if [[ -z "$COMMIT_A" || -z "$COMMIT_B" ]]; then
   echo "Hark! An error doth arise:"
   echo ""
   print_usage
   exit 1
fi

REPO_ROOT=$(git rev-parse --show-toplevel) || exit 1
cd "$REPO_ROOT" || exit 1

echo "Files changed in commit A:"
git diff-tree --no-commit-id --name-only -r "$COMMIT_A"

echo "Files changed in commit B:"
git diff-tree --no-commit-id --name-only -r "$COMMIT_B"

echo "Files changed in either commit:"
FILES=$(
    {
        git diff-tree --no-commit-id --name-only -r "$COMMIT_A"
        git diff-tree --no-commit-id --name-only -r "$COMMIT_B"
    } | sort -u
)

echo "$FILES"

echo "Comparing files:"
git difftool -d "$COMMIT_A" "$COMMIT_B" -- $FILES