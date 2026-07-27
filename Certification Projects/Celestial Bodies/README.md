# Celestial Bodies Database

A PostgreSQL relational database modeling a fictional universe consisting of galaxies, stars, planets, moons, and asteroids. This project was built as part of the **freeCodeCamp Relational Database Certification**.

## Overview

The database demonstrates the design and implementation of a normalized relational database using PostgreSQL. It models hierarchical relationships between celestial objects while enforcing data integrity through primary keys, foreign keys, unique constraints, and sequences.

## Database Schema

The database contains **5 interconnected tables**:

| Table | Description |
|--------|-------------|
| **galaxy** | Stores information about galaxies. |
| **star** | Stores stars belonging to galaxies. |
| **planet** | Stores planets orbiting stars. |
| **moon** | Stores moons orbiting planets. |
| **asteroid** | Stores asteroids associated with stars. |

### Entity Relationships

```text
Galaxy
   │
   ▼
 Star
 ├──────────────┐
 ▼              ▼
Planet      Asteroid
   │
   ▼
 Moon
```

## Features

- Relational database designed using PostgreSQL
- Fully normalized schema
- Primary and foreign key relationships
- Unique constraints on entity names
- Auto-incrementing primary keys using sequences
- Realistic sample data for all entities
- Hierarchical modeling of celestial bodies

## Database Statistics

| Entity | Records |
|---------|---------:|
| Galaxies | 7 |
| Stars | 7 |
| Planets | 14 |
| Moons | 24 |
| Asteroids | 16 |

## Technologies Used

- PostgreSQL
- SQL

## Files

```
.
├── universe.sql
└── README.md
```

## Getting Started

1. Create a PostgreSQL database.
2. Import the SQL dump:

```bash
psql -U <username> -d postgres -f universe.sql
```

or

```bash
psql -U <username> < universe.sql
```

3. Connect to the database:

```sql
\c universe
```

## Example Queries

### List all planets with their stars

```sql
SELECT p.name AS planet,
       s.name AS star
FROM planet p
JOIN star s
ON p.star_id = s.star_id;
```

### List all moons of a planet

```sql
SELECT m.name
FROM moon m
JOIN planet p
ON m.planet_id = p.planet_id
WHERE p.name = 'Aeon';
```

### Count planets in each star system

```sql
SELECT s.name,
       COUNT(p.planet_id) AS planets
FROM star s
LEFT JOIN planet p
ON s.star_id = p.star_id
GROUP BY s.name;
```

## Learning Outcomes

Through this project, I practiced:

- Database design
- Relational modeling
- One-to-many relationships
- SQL DDL (CREATE, ALTER)
- SQL DML (INSERT)
- Constraints and data integrity
- Sequences
- PostgreSQL database dumps

## Author

Created by **Prabhas Chandra Singh** as part of the freeCodeCamp Relational Database Certification.
