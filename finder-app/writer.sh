#!/bin/bash

# Assigning input arguments to variables
writefile=$1
writestr=$2

# Function to print error and exit
exit_with_error() {
    echo "$1" 1>&2
    exit 1
}

# Check if the number of arguments is less than 2
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments are required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

# Create the directory path if it does not exist
mkdir -p "$(dirname "$writefile")" || exit_with_error "Error: Failed to create directory path."

# Attempt to write to the file
echo "$writestr" > "$writefile" || exit_with_error "Error: Could not write to the file."

# Success message (optional)
echo "Success: Text written to $writefile"
