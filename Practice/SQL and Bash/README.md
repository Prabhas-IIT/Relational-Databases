# Student Database Importer (PostgreSQL + Bash)

A small ETL (Extract, Transform, Load) project that imports student and course data from CSV files into a normalized PostgreSQL database using a Bash script.

The project demonstrates how Bash can be used to automate SQL operations, populate relational tables, and maintain relationships between entities.

---

## Features

* Imports data from CSV files into PostgreSQL
* Automatically creates relationships between tables
* Prevents duplicate majors and courses
* Populates a many-to-many junction table
* Handles students without an assigned major
* Exports the completed database using `pg_dump`

---

## Technologies Used

* PostgreSQL
* Bash
* SQL
* CSV

---

## Database Schema

The database is normalized into four tables.

### `students`

Stores student information.

| Column     | Type                  |
| ---------- | --------------------- |
| student_id | SERIAL PRIMARY KEY    |
| first_name | VARCHAR(50)           |
| last_name  | VARCHAR(50)           |
| major_id   | INTEGER (Foreign Key) |
| gpa        | NUMERIC(2,1)          |

---

### `majors`

Stores available majors.

| Column   | Type               |
| -------- | ------------------ |
| major_id | SERIAL PRIMARY KEY |
| major    | VARCHAR(50)        |

---

### `courses`

Stores available courses.

| Column    | Type               |
| --------- | ------------------ |
| course_id | SERIAL PRIMARY KEY |
| course    | VARCHAR(100)       |

---

### `majors_courses`

Junction table representing the many-to-many relationship between majors and courses.

| Column    | Type    |
| --------- | ------- |
| major_id  | INTEGER |
| course_id | INTEGER |

Composite Primary Key:

* `(major_id, course_id)`

---

## Project Structure

```
student-database/
│
├── students.sql        # PostgreSQL database dump
├── insert_data.sh      # Bash ETL script
├── students.csv        # Student dataset
├── courses.csv         # Major-course dataset
└── README.md
```

---

## How It Works

The Bash script performs the following steps:

1. Connects to the PostgreSQL database.
2. Clears all existing data from the tables.
3. Reads `courses.csv`.
4. Inserts each unique major.
5. Inserts each unique course.
6. Creates entries in the `majors_courses` junction table.
7. Reads `students.csv`.
8. Matches each student's major with the corresponding `major_id`.
9. Inserts every student into the database.
10. Leaves students without a declared major as `NULL`.

---

## Running the Project

Start PostgreSQL.

```bash
sudo service postgresql start
```

Import the database schema.

```bash
psql --username=freecodecamp --dbname=postgres < students.sql
```

Run the data import script.

```bash
bash insert_data.sh
```

---

## Exporting the Database

The complete database can be exported using:

```bash
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
```

This generates a SQL dump containing:

* Database creation
* Tables
* Constraints
* Foreign keys
* Sequences
* INSERT statements

---

## Concepts Demonstrated

* Relational Database Design
* Database Normalization
* Primary Keys
* Foreign Keys
* Many-to-Many Relationships
* Composite Keys
* Bash Scripting
* CSV Parsing
* SQL Automation
* PostgreSQL
* Database Backup and Restoration

---

## Learning Outcomes

Through this project I learned how to:

* Design a normalized relational database
* Automate database operations using Bash
* Read and process CSV files
* Execute SQL commands from a shell script
* Use foreign keys to maintain data integrity
* Populate many-to-many relationships
* Export and restore PostgreSQL databases using `pg_dump`

---

## Sample Tables

* **31 Students**
* **7 Majors**
* **17 Courses**
* **28 Major-Course Relationships**

---

## Author

Created as part of the freeCodeCamp Relational Database curriculum to practice PostgreSQL, SQL, Bash scripting, and basic ETL workflows.
