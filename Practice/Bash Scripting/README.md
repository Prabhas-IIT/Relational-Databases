# Bash Scripting Practice

A collection of beginner Bash scripts created while learning Linux and Bash scripting. These programs were written as part of hands-on practice to understand shell scripting fundamentals, user interaction, control flow, functions, arrays, and command-line arguments.

---

## Scripts

### 📋 questionnaire.sh
Prompts the user for:
- Name
- Location
- Favorite coding website

Then displays a personalized greeting using the collected information.

**Concepts Used**
- Variables
- User input (`read`)
- Output (`echo`, `echo -e`)
- String interpolation

---

### ⏳ countdown.sh
A countdown timer that counts down from a positive integer supplied as a command-line argument.

Example:

```bash
./countdown.sh 5
```

**Concepts Used**
- Command-line arguments (`$1`)
- Conditional statements (`if`)
- `while` loop
- Arithmetic operations (`(( ))`)
- `sleep`

---

### 🎲 bingo.sh
Generates a random Bingo number between **1 and 75** and prints the appropriate Bingo letter (B, I, N, G, or O).

Example Output:

```text
~~ Bingo Number Generator ~~

The next number is, G:58
```

**Concepts Used**
- Random number generation (`RANDOM`)
- Arithmetic expansion (`$(( ))`)
- Variables
- `if` / `elif` / `else`

---

### 🔮 fortune.sh
A simple Magic 8-Ball style fortune teller.

The program repeatedly prompts the user until they enter a valid yes/no question ending with a question mark (`?`), then returns a random response.

Possible responses include:
- Yes
- No
- Maybe
- Outlook good
- Don't count on it
- Ask again later

**Concepts Used**
- Arrays
- Functions
- Regular expressions (`=~`)
- `until` loop
- User input
- Random number generation

---

### ▶️ five.sh
Runs all four scripts sequentially.

```bash
./questionnaire.sh
./countdown.sh 3
./bingo.sh
./fortune.sh
```

This demonstrates how one Bash script can execute other Bash scripts.

---

## Bash Concepts Practiced

Throughout these exercises, I learned and used:

- Variables
- Arrays
- User input (`read`)
- Command-line arguments (`$1`)
- Arithmetic expansion (`$(( ))`)
- Random number generation (`RANDOM`)
- Conditional statements (`if`, `elif`, `else`)
- Loops (`while`, `until`)
- Functions
- Regular expressions
- String interpolation
- Escape sequences (`echo -e`)
- Executable scripts (`chmod +x`)
- Running scripts (`./script.sh`)

---

## Running the Scripts

Make the scripts executable:

```bash
chmod +x questionnaire.sh countdown.sh bingo.sh fortune.sh five.sh
```

Run any individual script:

```bash
./questionnaire.sh
./countdown.sh 10
./bingo.sh
./fortune.sh
```

Or run all of them together:

```bash
./five.sh
```

---

## Requirements

- Bash
- Linux, macOS, or Windows with WSL/Git Bash

---

## Purpose

This repository serves as a personal learning project documenting my progress while learning Linux command-line tools and Bash scripting. It demonstrates the core building blocks of Bash programming through small, interactive scripts.
