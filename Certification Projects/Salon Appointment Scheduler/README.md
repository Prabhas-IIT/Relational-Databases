# Salon Appointment Scheduler

A command-line salon appointment scheduler built with **Bash** and **PostgreSQL** as part of the **freeCodeCamp Relational Database Certification**.

The application allows customers to book salon appointments through an interactive terminal interface. Existing customers are recognized by their phone number, while new customers are automatically added to the database before scheduling an appointment.

## Features

* Interactive command-line menu
* View all available salon services
* Input validation for service selection
* Automatic customer lookup using phone number
* New customer registration
* Schedule appointments by selecting a service and time
* Persistent storage using PostgreSQL
* Relational database with primary and foreign key constraints

## Technologies Used

* Bash
* PostgreSQL
* SQL
* Linux Terminal

## Project Structure

```text
Salon/
│── README.md
│── salon.sql          # PostgreSQL database dump
│── salon.sh           # Bash appointment scheduler
│── example.txt        # Sample program interaction
```

## Database Schema

The project consists of three related tables:

### Services

Stores all salon services offered.

| Column     | Description  |
| ---------- | ------------ |
| service_id | Primary Key  |
| name       | Service name |

### Customers

Stores customer information.

| Column      | Description                  |
| ----------- | ---------------------------- |
| customer_id | Primary Key                  |
| phone       | Unique customer phone number |
| name        | Customer name                |

### Appointments

Stores appointment bookings.

| Column         | Description             |
| -------------- | ----------------------- |
| appointment_id | Primary Key             |
| customer_id    | Foreign Key → customers |
| service_id     | Foreign Key → services  |
| time           | Appointment time        |

## Application Workflow

1. Display available salon services.
2. Validate the selected service.
3. Ask for the customer's phone number.
4. Search for the customer in the database.
5. If the customer does not exist:

   * Ask for their name.
   * Create a new customer record.
6. Ask for the preferred appointment time.
7. Store the appointment in the database.
8. Display a confirmation message.

## Sample Output

```text
~~~~~ MY SALON ~~~~~

Welcome to My Salon, how can I help you?

1) cut
2) color
3) perm
4) style
5) trim

What's your phone number?

What time would you like your color, Fabio?

I have put you down for a color at 11am, Fabio.
```

## Concepts Practiced

* Bash scripting
* Functions
* Conditional statements
* User input handling
* PostgreSQL integration with Bash
* SQL queries
* INSERT and SELECT operations
* Foreign key relationships
* Primary and unique constraints
* Database normalization

## Learning Outcomes

Through this project I practiced:

* Designing a relational database schema
* Connecting Bash scripts to PostgreSQL using `psql`
* Querying databases from shell scripts
* Managing customer records dynamically
* Building a complete CRUD-style command-line application
* Implementing input validation and recursive menu handling

## Repository

This project is one of the certification projects completed for the **freeCodeCamp Relational Database Certification**.
