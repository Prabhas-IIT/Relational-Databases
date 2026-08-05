# Periodic Table Database

A Bash script that searches a PostgreSQL database of chemical elements and displays detailed information about an element based on its **atomic number**, **symbol**, or **name**.

This project was built as part of the freeCodeCamp Relational Database certification and helped me practice SQL, PostgreSQL, Bash scripting, and database design.

## Features

* Search elements by:

  * Atomic number (e.g. `8`)
  * Chemical symbol (e.g. `O`)
  * Element name (e.g. `Oxygen`)
* Retrieves information from a normalized PostgreSQL database using SQL joins.
* Displays:

  * Atomic number
  * Element name
  * Symbol
  * Element type
  * Atomic mass
  * Melting point
  * Boiling point
* Handles invalid inputs gracefully.

## Technologies Used

* Bash
* PostgreSQL
* SQL
* Git

## Database Structure

The database is normalized into three tables:

### `elements`

| Column        | Description     |
| ------------- | --------------- |
| atomic_number | Primary Key     |
| symbol        | Chemical symbol |
| name          | Element name    |

### `properties`

| Column                | Description                 |
| --------------------- | --------------------------- |
| atomic_number         | Foreign Key                 |
| atomic_mass           | Atomic mass (amu)           |
| melting_point_celsius | Melting point               |
| boiling_point_celsius | Boiling point               |
| type_id               | References the element type |

### `types`

| Column  | Description                                   |
| ------- | --------------------------------------------- |
| type_id | Primary Key                                   |
| type    | Element category (metal, nonmetal, metalloid) |

## Example Usage

```bash
$ ./element.sh 1

The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
```

```bash
$ ./element.sh O

The element with atomic number 8 is Oxygen (O). It's a nonmetal, with a mass of 15.999 amu. Oxygen has a melting point of -218 celsius and a boiling point of -183 celsius.
```

```bash
$ ./element.sh Carbon

The element with atomic number 6 is Carbon (C). It's a nonmetal, with a mass of 12.011 amu. Carbon has a melting point of 3550 celsius and a boiling point of 4027 celsius.
```

```bash
$ ./element.sh Gold

I could not find that element in the database.
```

## How It Works

1. The script checks whether an argument was provided.
2. It determines whether the input is:

   * an atomic number,
   * an element symbol,
   * or an element name.
3. An SQL query is constructed accordingly.
4. Data is retrieved using SQL joins across the `elements`, `properties`, and `types` tables.
5. The formatted result is printed to the terminal.

## Project Structure

```
.
├── element.sh
├── periodic_table.sql
└── README.md
```

## What I Learned

* Writing Bash scripts
* Using PostgreSQL from the command line
* Creating and querying relational databases
* Working with primary keys, foreign keys, and constraints
* Performing SQL joins
* Handling user input and formatting output in Bash

## Author

Built by **BeyMon10** as part of my journey in learning SQL, PostgreSQL, and backend fundamentals.
