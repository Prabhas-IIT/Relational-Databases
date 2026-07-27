# Video Game Characters Database

A PostgreSQL relational database created as part of the freeCodeCamp **Build a Database of Video Game Characters** project.

This project demonstrates the fundamentals of relational database design by modeling video game characters and the relationships between their actions, sounds, and additional information.

---

## Database Overview

The database consists of five tables:

### `characters`
Stores the basic information about each video game character.

**Columns**
- `character_id`
- `name`
- `homeland`
- `favorite_color`

---

### `actions`
Stores the different actions that characters can perform.

**Columns**
- `action_id`
- `action`

---

### `character_actions`
A junction table representing the many-to-many relationship between characters and actions.

**Columns**
- `character_id`
- `action_id`

---

### `sounds`
Stores sound files associated with characters.

**Columns**
- `sound_id`
- `filename`
- `character_id`

---

### `more_info`
Stores additional information about each character.

**Columns**
- `more_info_id`
- `birthday`
- `height_in_cm`
- `weight_in_kg`
- `character_id`

---

## Concepts Practiced

Throughout this project, I practiced:

- Creating databases
- Creating tables
- Defining primary keys
- Defining foreign keys
- Creating one-to-one relationships
- Creating one-to-many relationships
- Creating many-to-many relationships
- Using junction tables
- Using `SERIAL` columns and sequences
- Applying `NOT NULL`
- Applying `UNIQUE` constraints
- Inserting records
- Updating records
- Deleting records
- Managing relational data in PostgreSQL
- Exporting a PostgreSQL database using `pg_dump`

---

## Entity Relationship Summary

```
characters
    │
    ├──────────────┐
    │              │
    │              │
more_info       sounds
    │              │
    └──────────────┘

characters
      │
      │
character_actions
      │
      │
   actions
```

---

## Files

```
video-game-database/
│
├── README.md
└── video_game.sql
```

---

## Restoring the Database

Create the database from the SQL dump using PostgreSQL:

```bash
psql -U postgres < video_game.sql
```

or

```bash
psql -U freecodecamp < video_game.sql
```

---

## Technologies Used

- PostgreSQL
- SQL
- Git
- GitHub

---

## Project

This project was completed as part of the **freeCodeCamp Relational Database Certification**.
