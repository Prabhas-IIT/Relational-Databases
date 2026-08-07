# Number Guessing Game

A Bash-based number guessing game that uses PostgreSQL to store player information, number of games played, and each player's best score.

## Features

* Prompts the user for a username.
* Creates a new player if the username does not exist.
* Welcomes returning players and displays their game statistics.
* Generates a random secret number between **1 and 1000**.
* Provides hints when a guess is too high or too low.
* Validates that guesses are integers.
* Tracks the number of guesses taken.
* Stores the total number of games played for each player.
* Tracks the player's best game.
* Supports usernames up to **22 characters**.
* Uses PostgreSQL to persist player data between games.

## Files

### `number_guess.sh`

The main Bash script containing the game logic.

It:

1. Connects to the PostgreSQL database.
2. Gets the player's username.
3. Checks whether the player already exists.
4. Creates a new player if necessary.
5. Generates a random number from 1 to 1000.
6. Handles the guessing loop and hints.
7. Updates the player's statistics after the game.

### `number_guess.sql`

PostgreSQL database dump containing the database structure required by the game.

The `players` table contains:

| Column            | Type          | Description                 |
| ----------------- | ------------- | --------------------------- |
| `player_id`       | `integer`     | Unique ID for each player   |
| `username`        | `varchar(22)` | Player's username           |
| `number_of_games` | `integer`     | Total games played          |
| `best_game`       | `integer`     | Fewest guesses taken to win |

The database also includes:

* A sequence for automatically generating `player_id`.
* A primary key on `player_id`.
* A unique constraint on `username`.
* Default values of `0` for `number_of_games` and `10000` for `best_game`.

## Requirements

* Bash
* PostgreSQL
* `psql` command-line client

## Database Setup

Create the database and tables using the SQL dump:

```bash
psql -U freecodecamp -f number_guess.sql
```

The script expects the PostgreSQL user to be named `freecodecamp` and the database to be named `number_guess`.

## Running the Game

Make the script executable:

```bash
chmod +x number_guess.sh
```

Then run:

```bash
./number_guess.sh
```

## Example

```text
Enter your username:
BeyMon10

Welcome, BeyMon10! It looks like this is your first time here.
Guess the secret number between 1 and 1000:
500
It's lower than that, guess again:
250
It's higher than that, guess again:
375
You guessed it in 3 tries. The secret number was 375. Nice job!
```

On subsequent games, the player's statistics are retrieved from PostgreSQL:

```text
Welcome back, BeyMon10! You have played 1 games, and your best game took 3 guesses.
```

## Database Schema

```text
players
├── player_id       INTEGER PRIMARY KEY
├── username        VARCHAR(22) UNIQUE NOT NULL
├── number_of_games INTEGER DEFAULT 0
└── best_game       INTEGER DEFAULT 10000
```

## Technologies

* **Bash** — game logic and user interaction
* **PostgreSQL** — persistent player data
* **SQL** — querying and updating player statistics
