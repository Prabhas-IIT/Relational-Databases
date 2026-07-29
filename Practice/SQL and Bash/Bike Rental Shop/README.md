# Bike Rental Shop

A command-line Bike Rental Shop Management System built with **Bash** and **PostgreSQL**.

## Overview

This project simulates a bike rental shop where customers can rent and return bicycles through a terminal interface. Customer information and rental history are stored in a PostgreSQL database, while a Bash script provides the interactive menu system.

## Features

* View all available bikes
* Rent a bike
* Return a rented bike
* Register new customers automatically
* Store customer information
* Track rental history
* Update bike availability after rentals and returns
* Prevent invalid rentals and returns with input validation

---

## Technologies Used

* Bash
* PostgreSQL
* SQL
* Linux Command Line

---

## Database Structure

### `bikes`

Stores information about every bicycle.

| Column    | Type             | Description         |
| --------- | ---------------- | ------------------- |
| bike_id   | SERIAL (INTEGER) | Primary Key         |
| type      | VARCHAR(50)      | Bike type           |
| size      | INTEGER          | Wheel size          |
| available | BOOLEAN          | Availability status |

---

### `customers`

Stores customer information.

| Column      | Type             | Description         |
| ----------- | ---------------- | ------------------- |
| customer_id | SERIAL (INTEGER) | Primary Key         |
| phone       | VARCHAR(15)      | Unique phone number |
| name        | VARCHAR(40)      | Customer name       |

---

### `rentals`

Stores every rental transaction.

| Column        | Type             | Description                       |
| ------------- | ---------------- | --------------------------------- |
| rental_id     | SERIAL (INTEGER) | Primary Key                       |
| customer_id   | INTEGER          | References customers(customer_id) |
| bike_id       | INTEGER          | References bikes(bike_id)         |
| date_rented   | DATE             | Rental date                       |
| date_returned | DATE             | Return date (NULL until returned) |

---

## Database Relationships

* One customer can rent multiple bikes.
* One bike can appear in multiple rental records over time.
* Active rentals are identified by `date_returned IS NULL`.

```
Customers
    │
    │ customer_id
    ▼
Rentals
    ▲
    │ bike_id
    │
Bikes
```

---

## Application Workflow

### Rent a Bike

1. Display all available bikes.
2. User selects a bike.
3. Validate bike selection.
4. Ask for customer's phone number.
5. Register customer if they are new.
6. Create a rental record.
7. Mark the selected bike as unavailable.
8. Display confirmation.

---

### Return a Bike

1. Ask for customer's phone number.
2. Display currently rented bikes.
3. User selects a bike to return.
4. Validate the selection.
5. Update the rental's return date.
6. Mark the bike as available.
7. Display confirmation.

---

## Validation

The application checks for:

* Invalid menu options
* Invalid bike numbers
* Attempting to rent unavailable bikes
* Returning bikes that are not currently rented
* Unknown customer phone numbers
* Customers without active rentals

---

## Files

```
bike-rental-shop/
│
├── bike-shop.sh      # Bash application
├── bikes.sql         # PostgreSQL database dump
└── README.md
```

---

## Running the Project

### Restore the Database

```bash
psql -U freecodecamp < bikes.sql
```

### Run the Application

```bash
bash bike-shop.sh
```

---

## Sample Menu

```
~~~~~ Bike Rental Shop ~~~~~

How may I help you?

1. Rent a bike
2. Return a bike
3. Exit
```

---

## Concepts Practiced

* Bash scripting
* Functions
* Variables
* User input handling
* Conditionals
* Loops
* SQL queries
* INSERT
* SELECT
* UPDATE
* INNER JOIN
* Foreign Keys
* Primary Keys
* Relational Database Design
* PostgreSQL
* Database normalization basics

---

## Project Status

✅ Completed
