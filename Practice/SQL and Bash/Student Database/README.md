# Student Database Management System (PostgreSQL + Bash)

A PostgreSQL database project that demonstrates relational database design, data import automation, and SQL querying using Bash scripts.

The project imports student and course information from CSV files into a normalized PostgreSQL database, establishes relationships between entities, and provides a Bash-based reporting tool that executes a variety of SQL queries to analyze the stored data.

---

## Features

* Imports data from CSV files into PostgreSQL
* Automates data loading using Bash
* Eliminates duplicate majors and courses during import
* Populates a many-to-many junction table
* Maintains referential integrity using foreign keys
* Handles students without an assigned major
* Generates analytical reports using SQL queries
* Exports the complete database using `pg_dump`

---

## Technologies Used

* PostgreSQL
* SQL
* Bash
* CSV

---

# Database Schema

The database is normalized into four related tables.

## `students`

Stores student information.

| Column     | Type                  |
| ---------- | --------------------- |
| student_id | SERIAL PRIMARY KEY    |
| first_name | VARCHAR(50)           |
| last_name  | VARCHAR(50)           |
| major_id   | INTEGER (Foreign Key) |
| gpa        | NUMERIC(2,1)          |

---

## `majors`

Stores available majors.

| Column   | Type               |
| -------- | ------------------ |
| major_id | SERIAL PRIMARY KEY |
| major    | VARCHAR(50)        |

---

## `courses`

Stores available courses.

| Column    | Type               |
| --------- | ------------------ |
| course_id | SERIAL PRIMARY KEY |
| course    | VARCHAR(100)       |

---

## `majors_courses`

Junction table representing the many-to-many relationship between majors and courses.

| Column    | Type    |
| --------- | ------- |
| major_id  | INTEGER |
| course_id | INTEGER |

Composite Primary Key:

* `(major_id, course_id)`

---

# Project Structure

```text
student-database/
│
├── students.sql         # PostgreSQL database dump
├── insert_data.sh       # Imports CSV data into the database
├── student_info.sh      # Executes analytical SQL queries
├── students.csv         # Student dataset
├── courses.csv          # Major-course dataset
└── README.md
```

---

# How It Works

## Data Import (`insert_data.sh`)

The import script performs the following steps:

1. Connects to the PostgreSQL database.
2. Clears all existing table data.
3. Reads `courses.csv`.
4. Inserts each unique major.
5. Inserts each unique course.
6. Creates entries in the `majors_courses` junction table.
7. Reads `students.csv`.
8. Matches each student's major with its corresponding `major_id`.
9. Inserts every student into the database.
10. Assigns `NULL` to students without a declared major.

---

## Database Queries (`student_info.sh`)

The reporting script connects to the database and executes several SQL queries demonstrating different SQL concepts.

These include:

* Filtering records using `WHERE`
* Pattern matching with `LIKE` and `ILIKE`
* Sorting results using `ORDER BY`
* Limiting results with `LIMIT`
* Aggregate functions (`COUNT`, `AVG`, `ROUND`)
* Grouping data using `GROUP BY`
* Filtering groups with `HAVING`
* Joining multiple tables using:

  * INNER JOIN
  * RIGHT JOIN
  * FULL JOIN
* Handling `NULL` values using `IS NULL`
* Aliasing columns using `AS`
* Removing duplicates with `DISTINCT`

Example reports generated include:

* Students with a 4.0 GPA
* Average GPA of all students
* Student count and average GPA for each major
* Majors without enrolled students
* Courses with only one enrolled student
* Courses not taken by any student
* Pattern-based searches on student names and course titles

---

# Running the Project

## Start PostgreSQL

```bash
sudo service postgresql start
```

---

## Restore the Database

```bash
psql --username=freecodecamp --dbname=postgres < students.sql
```

---

## Import Data

```bash
bash insert_data.sh
```

---

## Run Analytical Queries

```bash
bash student_info.sh
```

---

# Exporting the Database

The database can be exported using:

```bash
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
```

The generated SQL dump contains:

* Database creation
* Table definitions
* Primary keys
* Foreign keys
* Sequences
* Constraints
* Data (`INSERT` statements)

---

# SQL Concepts Demonstrated

* Database Creation
* Table Design
* Data Types
* Constraints
* Primary Keys
* Foreign Keys
* Composite Keys
* Many-to-Many Relationships
* Database Normalization
* Aggregate Functions
* Filtering
* Sorting
* Pattern Matching
* Aliases
* GROUP BY
* HAVING
* DISTINCT
* INNER JOIN
* RIGHT JOIN
* FULL JOIN
* NULL Handling

---

# Bash Concepts Demonstrated

* Variables
* Command Substitution
* Conditional Statements
* Loops
* Reading CSV Files
* Automating SQL Execution
* Data Import Automation
* Shell Scripting

---

# Learning Outcomes

Through this project, I learned how to:

* Design a normalized relational database
* Model one-to-many and many-to-many relationships
* Import structured CSV data into PostgreSQL
* Execute SQL commands programmatically using Bash
* Automate repetitive database operations
* Query relational databases using joins and aggregate functions
* Generate reports from SQL queries
* Export and restore PostgreSQL databases using `pg_dump`

---

# Dataset Summary

| Entity                     | Count |
| -------------------------- | ----: |
| Students                   |    31 |
| Majors                     |     7 |
| Courses                    |    17 |
| Major-Course Relationships |    28 |

---

# Future Improvements

Some potential improvements for this project include:

* Using PostgreSQL transactions for safer imports
* Using `INSERT ... RETURNING` to reduce extra queries
* Implementing `ON CONFLICT` for duplicate handling
* Bulk importing data using PostgreSQL's `COPY` command
* Adding indexes for faster query performance
* Building a simple CLI menu for interactive querying

---

# Author

Created by Prabhas Chandra Singh as part of the freeCodeCamp **Relational Database** curriculum to practice PostgreSQL, SQL, Bash scripting, relational database design, ETL workflows, and database querying.
