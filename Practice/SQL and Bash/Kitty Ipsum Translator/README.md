# Bash Text Processing Utilities

A collection of Bash scripts and command-line exercises demonstrating text processing, file manipulation, input/output redirection, and regular expressions using standard Unix utilities.

The project focuses on automating common command-line tasks using tools such as `grep`, `sed`, `wc`, `diff`, pipes, and redirection.

---

## Features

* Translate Kitty Ipsum text into Doggy Ipsum using a Bash script
* Generate text statistics using standard Unix utilities
* Practice file input/output redirection
* Demonstrate text searching and pattern matching with regular expressions
* Compare translated files using `diff`

---

## Technologies Used

* Bash
* GNU sed
* grep
* wc
* diff
* cat
* Unix Shell

---

# Project Structure

```text
bash-text-processing/
│
├── translate.sh          # Bash script to translate Kitty Ipsum to Doggy Ipsum
├── kitty_ipsum_1.txt     # Sample input text
├── kitty_ipsum_2.txt
├── doggy_ipsum_1.txt     # Generated output
├── doggy_ipsum_2.txt
├── kitty_info.txt        # Statistics generated entirely from shell commands
└── README.md
```

---

# `translate.sh`

The translation script reads an input text file and converts cat-related words into their dog equivalents using `sed` with extended regular expressions.

Current replacements include:

| Original | Replacement |
| -------- | ----------- |
| cat      | dog         |
| catnip   | dogchow     |
| meow     | woof        |
| meowzer  | woof        |

Run the script using:

```bash
bash translate.sh kitty_ipsum_1.txt > doggy_ipsum_1.txt
```

or

```bash
bash translate.sh kitty_ipsum_2.txt > doggy_ipsum_2.txt
```

---

# Generated Statistics

The `kitty_info.txt` file was generated entirely from Bash commands executed in the terminal.

Information collected includes:

* Number of lines
* Number of words
* Number of characters
* Number of occurrences of **meow** and **meowzer**
* Line numbers where those words appear
* Number of occurrences of **cat**, **cats**, and **catnip**
* Line numbers where those words appear

The statistics were generated using combinations of:

* `cat`
* `grep`
* `wc`
* `sed`
* Pipes (`|`)
* Input (`<`) and output (`>`, `>>`) redirection

No information in `kitty_info.txt` was typed manually.

---

# Bash Concepts Demonstrated

This project demonstrates practical usage of:

* Variables
* Command-line arguments
* Pipes
* Standard Input (stdin)
* Standard Output (stdout)
* Standard Error (stderr)
* Input and output redirection
* Appending to files
* Executable shell scripts
* Shebangs (`#!/bin/bash`)
* Command substitution
* Regular expressions
* Extended regular expressions

---

# Unix Commands Practiced

* `cat`
* `grep`
* `sed`
* `wc`
* `diff`
* `chmod`
* `touch`
* `echo`
* `read`
* `man`

---

# Skills Demonstrated

* Shell scripting
* Text processing
* Regular expression matching
* Pattern replacement
* File manipulation
* Command-line automation
* Unix command-line workflow

---

# Learning Outcomes

Through this project, I learned how to:

* Write executable Bash scripts
* Process text using Unix command-line tools
* Search files with regular expressions
* Perform automated text replacement using `sed`
* Count and analyze text using `wc`
* Build command pipelines using Unix pipes
* Redirect standard input, output, and error streams
* Compare files using `diff`
* Automate repetitive command-line tasks

---

# Author

Created by Prabhas Chandra Singh while completing the freeCodeCamp Bash and Shell Scripting curriculum to practice Unix command-line tools, shell scripting, regular expressions, and text processing automation.
