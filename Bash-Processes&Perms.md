# BASH Variables, Processes & Permissions

## Contents
- [BASH Variables, Processes \& Permissions](#bash-variables-processes--permissions)
  - [Contents](#contents)
  - [Variables](#variables)
  - [Environment Variables](#environment-variables)
    - [Accessing \& Setting Environment Variables](#accessing--setting-environment-variables)
  - [Processes](#processes)
  - [Permissions](#permissions)

## Variables

Bash variables can be used in the same way as any programming language
There are no data types A variable in bash can contain a number, a character, a string of characters.

You have no need to declare a variable, just assigning a value to its reference will create it.

```bash
STR="Hello World!"
echo $STR

$ Hello World!
```

Example backup script:
```bash
OF=/var/my-backup-$(date +%Y%m%d).tgz
tar -cZf $OF /home/me/
```

Running this script uses tar: a program used to create and manipulate archive files

* -c: Creates a new archive.
* -Z: Compresses the archive using the compress program.
* -f $OF: Specifies the name of the archive file.
* $OF is a variable that should contain the desired filename.


        OF is a variable which will act as a file name for the backup
        The path starts as "/var/my-backup-"
        Then an expression is used


        The expression $(date +%Y%m%d) inside the braces is a command substitution that executes the date command and inserts its output into the variable OF.

        date +%Y%m%d: This command formats the current date as YYYYMMDD.
        %Y: Year (e.g., 2025)
        %m: Month (e.g., 03 for March)
        %d: Day (e.g., 26)

Local variables can be created by using the keyword local.

```bash
#!/bin/bash
HELLO=Hello 
function hello {
        local HELLO=World
        echo $HELLO
}
echo $HELLO
hello
echo $HELLO
```

## Environment Variables

    Environment variables, often referred to as ENVs, are dynamic values that wield significant influence over the behavior of programs and processes in the Linux operating system. These variables serve as a means to convey essential information to software and shape how they interact with the environment

    They are essentially key-value pairs that can influence the behavior of the system and applications

Environment Variables have 3 Scopes

1. **Global Environment** Variables: These are system-wide variables available to all users and processes. They are typically defined in files like /etc/environment.
2. **Session Environment Variables**: These are specific to a user's session and are usually defined in files like ~/.bashrc or ~/.profile.
3. **Shell Variables**: These are specific to the current shell instance and are not inherited by child processes unless explicitly exported.

### Accessing & Setting Environment Variables

- printenv: Displays all environment variables or the value of a specified variable.
- env: Lists all environment variables.
- set: Lists all shell variables and functions.

- export VAR=value: Sets and exports an environment variable.
- VAR=value: Sets a shell/local variable
- unset VAR: Removes an environment variable.

Exporting an environment variable in Bash makes it available to child processes started from the current shell. This means that any programs or scripts you run from the shell will inherit the exported variables. 

    User environment variables can be made persistent by adding them to files like ~/.bashrc, ~/.profile, or ~/.bash_profile

    To set a global environment variable, you need to have root privileges. You can add the variable to /etc/environment

    To set a user environment variable , you might add the following line to your ~/.bashrc:

```bash
export MY_VAR="some_value"
```
or simply running

```bash
echo 'export MY_VAR="value"' >> ~/.bashrc
source ~/.bashrc
```
    source executes the command in /.bashrc

## Processes
Processes carry out tasks within the operating system.

Programs in OS are a static sequence of instructions stored in a file, whereas the Process is an active instance of a program in execution

Task and process are terms that Linux uses interchangeably

## Permissions

