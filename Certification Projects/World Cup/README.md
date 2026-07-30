# ⚽ World Cup Database

A PostgreSQL database project built as part of the **freeCodeCamp Relational Database Certification**. The project models FIFA World Cup knockout-stage matches from the **2014** and **2018** tournaments, demonstrating relational database design, data import automation using Bash, SQL queries, and database dumps.

## 📌 Project Overview

The project consists of:

* Designing a normalized relational database.
* Importing CSV data into PostgreSQL using a Bash script.
* Maintaining relationships using primary and foreign keys.
* Writing SQL queries to retrieve meaningful statistics from the data.
* Exporting the completed database using `pg_dump`.

---

## 🗂️ Project Structure

```
World Cup/
├── games.csv
├── insert_data.sh
├── queries.sh
├── worldcup.sql
└── expected_output.txt
```

---

## 📁 Files

### `games.csv`

Contains the raw match data for every knockout-stage game from the 2014 and 2018 FIFA World Cups.

Each record stores:

* Year
* Round
* Winning Team
* Opponent
* Winner Goals
* Opponent Goals

---

### `insert_data.sh`

Automates importing the CSV data into PostgreSQL.

Features:

* Supports both production and test databases.
* Clears existing data before import.
* Inserts teams only once.
* Retrieves generated team IDs.
* Inserts every match into the `games` table.
* Preserves foreign-key relationships.

---

### `queries.sh`

Runs all required SQL queries, including:

* Total goals scored by winning teams.
* Total goals scored overall.
* Average goals.
* Highest goals scored in a match.
* Number of games with more than two winning goals.
* 2018 World Cup champion.
* Teams reaching the 2014 Round of 16.
* Unique winning teams.
* World Cup champions by year.
* Teams whose names begin with `"Co"`.

The output matches the provided `expected_output.txt`.

---

### `worldcup.sql`

Complete PostgreSQL database dump generated using `pg_dump`.

Includes:

* Database creation
* Tables
* Sequences
* Constraints
* Primary keys
* Foreign keys
* Imported data

---

### `expected_output.txt`

Reference output used to verify that the SQL queries produce the expected results.

---

## 🗄️ Database Schema

### `teams`

| Column  | Type                        |
| ------- | --------------------------- |
| team_id | SERIAL PRIMARY KEY          |
| name    | VARCHAR(25) UNIQUE NOT NULL |

### `games`

| Column         | Type                         |
| -------------- | ---------------------------- |
| game_id        | SERIAL PRIMARY KEY           |
| year           | INTEGER                      |
| round          | VARCHAR(25)                  |
| winner_id      | INTEGER (FK → teams.team_id) |
| opponent_id    | INTEGER (FK → teams.team_id) |
| winner_goals   | INTEGER                      |
| opponent_goals | INTEGER                      |

---

## 🛠️ Technologies Used

* PostgreSQL
* SQL
* Bash
* Linux
* CSV

---

## 🚀 Running the Project

### Restore the database

```bash
psql -U freecodecamp < worldcup.sql
```

### Import data from CSV

```bash
bash insert_data.sh
```

For the test database:

```bash
bash insert_data.sh test
```

### Execute the queries

```bash
bash queries.sh
```

---

## 📚 Concepts Demonstrated

* Relational database design
* Primary and foreign keys
* Data normalization
* CSV parsing in Bash
* SQL joins
* Aggregate functions
* Filtering and sorting
* PostgreSQL database dumps
* Bash scripting for database automation

---

## 🎓 Certification

This project was completed as part of the **freeCodeCamp Relational Database Certification**.
