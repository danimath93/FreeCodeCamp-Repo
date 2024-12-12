#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"

  WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
  
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Script to insert data from games.csv

echo $($PSQL "TRUNCATE teams, games")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WIN_GOL OPP_GOL
do
  # Skip csv header
  if [[ $YEAR != "year" ]]
  # check all games
  then
    #get winner_team_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #if not found
    if [[ -z $WINNER_ID ]]
    then
      #insert winner team id
      INSERT_WIN_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WIN_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi
      #get new team_id
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    #get loser_team_id
    LOSER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    #if not found
    if [[ -z $LOSER_ID ]]
    then
      #insert loser team id
      INSERT_LOSE_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_LOSE_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
      #get new team_id
      LOSER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
    
    #insert game
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WINNER_ID, $LOSER_ID, $WIN_GOL, $OPP_GOL)")
    if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into Games, $YEAR $ROUND $WINNER $OPPONENT
    fi

  fi
done
