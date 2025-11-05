#!/usr/bin/env bash

# Function to get the user's guess and validate it's a number
function get_guess {
    local guess
    read -p "How many files are in the current directory? Enter your guess: " guess

    # Loop until a valid number is entered
    while ! [[ "$guess" =~ ^[0-9]+$ ]]; do
        echo "Invalid input. Please enter a whole number."
        read -p "Try again. Enter your guess: " guess
    done

    # Return the valid guess
    echo $guess
}

# --- Main Program ---

# Get the actual number of files (not directories or links)
# -maxdepth 1 = only look in the current directory
# -type f     = only count regular files
# wc -l       = count the lines
file_count=$(find . -maxdepth 1 -type f | wc -l)

# Initialize guess to a value that won't match
user_guess=-1

echo "--- Welcome to the Guessing Game! ---"

# Loop as long as the guess is incorrect
while [ $user_guess -ne $file_count ]; do

    # Call the function to get a valid guess
    user_guess=$(get_guess)

    # Check the guess
    if [ $user_guess -lt $file_count ]; then
        echo "Your guess is too low. Try again!"
    elif [ $user_guess -gt $file_count ]; then
        echo "Your guess is too high. Try again!"
    fi
done

# This code is only reached when the loop exits (guess is correct)
echo ""
echo "🎉 Congratulations! You guessed the correct number: $file_count"
echo "----------------------------------------------"
