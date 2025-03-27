# BASH Cheatsheet

## Contents
- [BASH Cheatsheet](#bash-cheatsheet)
  - [Contents](#contents)
  - [What is BASH?](#what-is-bash)
  - [What is a Kernel](#what-is-a-kernel)
  - [What is a shell](#what-is-a-shell)
    - [Key Concepts:](#key-concepts)
  - [User \& System Information Commands](#user--system-information-commands)
  - [Root \& User Management](#root--user-management)
  - [File \& Directory Management](#file--directory-management)
  - [File Viewing \& Editing](#file-viewing--editing)
  - [Downloading Files](#downloading-files)
  - [Package Management (`apt`)](#package-management-apt)
    - [Using `sudo`](#using-sudo)
  - [Special Characters in BASH](#special-characters-in-bash)

[A really nice BASH scripting guide](https://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html#toc6)

## What is BASH?

**BASH** = **Bourne Again Shell**  
A command-line shell and scripting language for Unix/Linux systems.

## What is a Kernel
  The kernel is a computer program that is the core of a computer’s operating system, with complete control over everything in the system. It manages the following resources of the Linux system:

  - File management
  - Process management
  - I/O management
  - Memory management
  - Device management etc.

## What is a shell
  A shell is a special user program that provides an interface for the user to use operating system services. Shell accepts human-readable commands from users and converts them into something which the kernel can understand.

### Key Concepts:
- **Linux does not care about file extensions**  
  - Renaming `cat.jpg` to `cat.txt` does not change its actual type.
- **Case Sensitivity Matters**  
  - `FILE.txt` and `file.txt` are different files.
- **Tab Autocomplete**  
  - Press `Tab` while typing a command or filename to auto-fill it.
- **Pipes (`|`)**  
  - Used to pass output from one command to another.

## User & System Information Commands

| Command       | Description                                       |
|--------------|---------------------------------------------------|
| `whoami`      | Displays the current username                     |
| `uname`       | Shows system information                          |
| `history`     | Displays all commands run in this session         |
| `history -c`  | Clears command history                            |
| `!<id>`       | Runs a previously used command from history       |
| `clear`       | Clears the terminal screen                        |
| `ps -p $$`    | Displays the current shell being used             |
| `pwd`         | Prints the present working directory              |

## Root & User Management

- **`root`** = Superuser with all system privileges.
- **To run a command with elevated privileges:**  
  ```bash
  sudo <command>
  ```
- **Switch user:**  
  ```bash
  sudo su <username>
  ```
  - Running `sudo su` without a username switches to root.

## File & Directory Management

| Command                    | Description                                                       |
|----------------------------|-------------------------------------------------------------------|
| `ls`                       | Lists files in the current directory                              |
| `ls -al`                   | Lists all files (including hidden) in long format                |
| `pwd`                      | Displays the present working directory                            |
| `mkdir <directory>`        | Creates a new directory                                          |
| `rmdir <directory>`        | Removes an empty directory                                       |
| `rm <file>`                | Deletes a file                                                  |
| `rm -r <directory>`        | Recursively deletes a directory and its contents                |
| `mv <source> <destination>`| Moves or renames a file/directory                               |
| `cp <source> <destination>`| Copies a file/directory                                         |
| `touch <filename>`         | Creates an empty file                                           |

## File Viewing & Editing

| Command                          | Description                                               |
|----------------------------------|-----------------------------------------------------------|
| `cat <file>`                     | Displays the contents of a file                           |
| `nl <file>`                      | Displays file contents with line numbers                  |
| `head -n <num> <file>`           | Shows the first `n` lines of a file                       |
| `tail -n <num> <file>`           | Shows the last `n` lines of a file                        |
| `nano <file>`                    | Opens the file in the `nano` text editor                  |
| `file <filename>`                | Shows file type and metadata                              |
| `grep <pattern> <file>`          | Searches for a pattern in a file                          |

_Example:_  
```bash
cat jokes.txt | grep chicken
```
This command searches for the word "chicken" in `jokes.txt` and displays the matching lines.

## Downloading Files

| Command                              | Description                                                |
|--------------------------------------|------------------------------------------------------------|
| `curl <url>`                         | Fetches data from a URL                                    |
| `curl <url> --output <filename>`     | Downloads and saves a file with a specified name           |
| `wget <url>`                         | Downloads a file from the internet                         |
| `wget <url> -O <filename>`           | Downloads and saves a file under a new name                |

_Example:_  
```bash
wget https://example.com/file.txt -O myfile.txt
```

## Package Management (`apt`)

| Command                        | Description                                           |
|--------------------------------|-------------------------------------------------------|
| `apt update`                   | Updates the list of available packages              |
| `apt upgrade`                  | Upgrades all installed packages                      |
| `apt install <package>`        | Installs a package                                   |
| `apt remove <package>`         | Removes a package                                   |

### Using `sudo`
Most package management commands require elevated privileges:
```bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install tree
```
- The `-y` flag automatically confirms any prompts.

## Special Characters in BASH

| Symbol    | Meaning                                                        |
|-----------|----------------------------------------------------------------|
| `\|`      | Pipe: passes output from one command to another                |
| `>`       | Redirects output to a file (overwrites content)                |
| `>>`      | Redirects output to a file (appends to content)                |
| `<`       | Takes input from a file                                        |
| `&`       | Runs a process in the background                               |
| `&&`      | Executes the next command only if the previous one succeeds    |
| `\|\|`     | Executes the next command only if the previous one fails       |

_Example:_  
```bash
ls -l > filelist.txt  # Saves the output of 'ls -l' into filelist.txt
cat filelist.txt | grep ".txt"  # Displays only .txt files from filelist.txt
```

