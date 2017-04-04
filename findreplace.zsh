# Recursive Find and Replace

# Usage:
#
# Replace all "bad" with "good" in files ending in ".txt"
#       findreplace bad good txt
#
# Replace all "bad" with "good" in .java files in the src/main directory
#       findreplace bad good java src/main
function findreplace () {
    find ${4:-.} -type f -name "*.${3:-java}" -exec sed -i "" s/$1/$2/ {} +
}

