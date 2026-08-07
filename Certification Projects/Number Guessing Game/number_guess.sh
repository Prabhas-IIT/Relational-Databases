#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo Enter your username:
read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'")
if [[ -z $PLAYER_ID ]]
then
  INSERT_PLAYER="$($PSQL "INSERT INTO players(username) VALUES('$USERNAME')")"
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$PLAYER_ID")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT number_of_games FROM players WHERE player_id=$PLAYER_ID")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$PLAYER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RAND=$((RANDOM%1000+1))
GUESSES=0
echo Guess the secret number between 1 and 1000:
read NUMBER

while [[ $NUMBER -ne $RAND ]]
do
  if [[ $NUMBER =~ ^[0-9]+$ ]]
  then
    if [[ $NUMBER -lt $RAND ]]
    then
      echo "It's higher than that, guess again:"
      read NUMBER
    else
      echo "It's lower than that, guess again:"
      read NUMBER
    fi
    ((GUESSES++))
  else
    echo "That is not an integer, guess again:"
    read NUMBER
  fi
done

((GUESSES++))
UPDATE_GAME="$($PSQL "UPDATE players SET number_of_games = number_of_games+1 WHERE player_id=$PLAYER_ID")"
if [[ $GUESSES -lt $BEST_GAME ]]
then
  UPDATE_BEST="$($PSQL "UPDATE players SET best_game = $GUESSES WHERE player_id=$PLAYER_ID")"
fi
echo "You guessed it in $GUESSES tries. The secret number was $RAND. Nice job!"
