#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Game code function
NUMBER_GUESSING_GAME() {

  # Set guess counter to 0
  GUESS_COUNTER=0

  # Generate random number and store it in a variable
  RANDOM_NUMBER=$(( (RANDOM % 1000) + 1 ))

  # Echo Guess the secret number between 1 and 1000:
  echo -e "\nGuess the secret number between 1 and 1000:"

  # Loop through the following code until the guess is right
  while true; do

    # Get input
    read -r GUESSED_NUMBER

    # Check if the input is not an integer
    if ! [[ "$GUESSED_NUMBER" =~ ^-?[0-9]+$ ]]; then
      # Print that is not an integer guess again
      echo -e "\nThat is not an integer, guess again:"
      continue
    fi

    # Increment guess counter with 1
    ((GUESS_COUNTER++))

    # If the number to guess is higher
    if (( GUESSED_NUMBER < RANDOM_NUMBER )); then
      # Let user know guess is lower
      echo -e "It's higher than that, guess again:"

    # If the number to guess is lower
    elif (( GUESSED_NUMBER > RANDOM_NUMBER )); then
      # Let user know guess is lower
      echo -e "It's lower than that, guess again:"
    
    # If the guessed number is right
    else 
      # Print You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!
      echo -e "You guessed it in $GUESS_COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"

      # Save game result to the database
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, score) VALUES($USER_ID, $GUESS_COUNTER)")
      # Exit
      exit 0
    fi
  done
}

# Ask user for username
echo -e "\nEnter your username:"
read -r USERNAME

# Look in database if username is known
USER_DATA=$($PSQL "SELECT user_id, username FROM users WHERE username = '$USERNAME'")

# When username is not known
if [[ -z $USER_DATA ]]; then
  # Insert new user into database
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')") 
  # Welcome user
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."

# When username is known
else
  # Extract user_id and username
  USER_ID=$(echo $USER_DATA | cut -d '|' -f 1)
  USERNAME=$(echo $USER_DATA | cut -d '|' -f 2)

  # Get their information from the database
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
  HIGHSCORE=$($PSQL "SELECT MIN(score) FROM games WHERE user_id = $USER_ID")

  # Print welcome back message
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $HIGHSCORE guesses."
fi

# Execute game
NUMBER_GUESSING_GAME
