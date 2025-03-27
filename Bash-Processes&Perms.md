# BASH Variables, Processes & Permissions

## Contents
- [BASH Variables, Processes \& Permissions](#bash-variables-processes--permissions)
  - [Contents](#contents)
  - [Variables](#variables)
  - [Environment Variables](#environment-variables)
    - [Environment Variable Scopes](#environment-variable-scopes)
    - [Accessing \& Setting Environment Variables](#accessing--setting-environment-variables)
  - [Processes](#processes)
    - [Process Management in Bash](#process-management-in-bash)
    - [Understanding Process Hierarchies](#understanding-process-hierarchies)
    - [Scripting and Process Control](#scripting-and-process-control)
  - [Permissions](#permissions)
    - [File Permissions](#file-permissions)
    - [Changing Permissions](#changing-permissions)
    - [Ownership](#ownership)
    - [Process Permissions](#process-permissions)

## Variables

Bash variables can be used in the same way as any programming language.  
There are no data types; a variable in Bash can contain a number, a character, or a string of characters.

You do not need to declare a variable—just assigning a value to its reference will create it.

```bash
STR="Hello World!"
echo $STR

# Output:
# Hello World!
```

Example backup script:
```bash
OF=/var/my-backup-$(date +%Y%m%d).tgz
tar -cZf $OF /home/me/
```

Running this script uses `tar`: a program used to create and manipulate archive files.

- **-c**: Creates a new archive.
- **-Z**: Compresses the archive using the compress program.
- **-f $OF**: Specifies the name of the archive file.
- **$OF** is a variable that should contain the desired filename.

`OF` is a variable that will act as a filename for the backup:

- The path starts as `/var/my-backup-`
- Then an expression is used: `$(date +%Y%m%d)` is a command substitution that executes the `date` command and inserts its output into the variable `OF`.

  - `date +%Y%m%d` formats the current date as `YYYYMMDD`:
    - `%Y`: Year (e.g., 2025)
    - `%m`: Month (e.g., 03 for March)
    - `%d`: Day (e.g., 26)

Local variables can be created using the `local` keyword.

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

Environment variables, often referred to as ENVs, are dynamic values that wield significant influence over the behavior of programs and processes in the Linux operating system. These variables serve as a means to convey essential information to software and shape how they interact with the environment.

They are essentially key-value pairs that can influence the behavior of the system and applications.

### Environment Variable Scopes

1. **Global Environment Variables**:  
   These are system-wide variables available to all users and processes. They are typically defined in files like `/etc/environment`.

2. **Session Environment Variables**:  
   These are specific to a user's session and are usually defined in files like `~/.bashrc` or `~/.profile`.

3. **Shell Variables**:  
   These are specific to the current shell instance and are not inherited by child processes unless explicitly exported.

### Accessing & Setting Environment Variables

- **printenv**: Displays all environment variables or the value of a specified variable.
- **env**: Lists all environment variables.
- **set**: Lists all shell variables and functions.

To set an environment variable:

- `export VAR=value`: Sets and exports an environment variable.
- `VAR=value`: Sets a shell/local variable.
- `unset VAR`: Removes an environment variable.

Exporting an environment variable in Bash makes it available to child processes started from the current shell. This means that any programs or scripts you run from the shell will inherit the exported variables.

User environment variables can be made persistent by adding them to files like `~/.bashrc`, `~/.profile`, or `~/.bash_profile`.

To set a global environment variable, you need to have root privileges and add the variable to `/etc/environment`.

For example, to set a user environment variable, you might add the following line to your `~/.bashrc`:

  Login Shells:
  When you log in (e.g., via a text console, SSH, or a graphical login), Bash will typically execute ~/.bash_profile or, if that doesn't exist, ~/.profile. These files are meant for setting up your environment once during login.

  Interactive Non-Login Shells:
  When you open a new terminal window from your desktop environment (which usually starts an interactive non-login shell), Bash generally reads ~/.bashrc.
  Many users configure their ~/.bash_profile to source ~/.bashrc so that both login and non-login shells have similar settings.

```bash
export MY_VAR="some_value"
```

Or simply run:

```bash
echo 'export MY_VAR="value"' >> ~/.bashrc
source ~/.bashrc
```

The `source` command executes the commands in `~/.bashrc` within the current shell.

## Processes

Processes are active instances of programs in execution. While a program is a static collection of code and instructions, a process represents the running state of that program, with its own process ID (PID), memory space, and execution context.

### Process Management in Bash

- **Listing Processes:**  
  The `ps` command provides a snapshot of current processes. For example:
  ```bash
  ps aux
  ```
  This command lists all running processes with details such as user, PID, CPU usage, memory usage, and the command that started the process.

- **Real-Time Monitoring:**  
  The `top` or `htop` commands allow real-time monitoring of processes. They display dynamic information such as CPU and memory usage.
  ```bash
  top
  ```

- **Background & Foreground Processes:**  
  You can run processes in the background by appending an `&` at the end of a command:
  ```bash
  long_running_command &
  ```
  This allows the shell to remain available for other commands. Use the `jobs` command to list background jobs:
  ```bash
  jobs
  ```
  To bring a background job to the foreground, use:
  ```bash
  fg %job_number
  ```

- **Process Control:**  
  You can control processes using signals. For example, to terminate a process, use the `kill` command along with its PID:
  ```bash
  kill 1234
  ```
  More forceful termination can be achieved with:
  ```bash
  kill -9 1234
  ```

- **Job Control:**  
  Bash provides job control features that allow you to suspend, resume, and manage multiple processes. To suspend a running process, you can press `Ctrl+Z`. Then, use the `bg` command to resume it in the background or `fg` to resume it in the foreground.

- **Command Substitution and Process Substitution:**  
  Bash allows you to capture the output of a process using command substitution:
  ```bash
  result=$(ls -l)
  ```
  Process substitution can be used to treat the output of a process as if it were a file:
  ```bash
  diff <(command1) <(command2)
  ```

### Understanding Process Hierarchies

- **Parent and Child Processes:**  
  Every process in Linux, except for the init/systemd process, has a parent process. When a shell spawns a new process, that process becomes a child of the shell. You can view the relationship between processes using commands like:
  ```bash
  ps -ef --forest
  ```
  This displays processes in a hierarchical tree structure, showing how they are related.

- **Process IDs (PIDs):**  
  Each process is assigned a unique PID. Special process IDs like `1` (init or systemd) are reserved and play critical roles in system management.

### Scripting and Process Control

- **Running Scripts in the Background:**  
  When writing scripts, you might want to run multiple commands concurrently. Backgrounding processes within scripts can be done with `&`, and you can use the `wait` command to pause the script until all background processes have finished:
  ```bash
  command1 &
  command2 &
  wait
  echo "Both processes have finished."
  ```

- **Handling Signals in Scripts:**  
  Scripts can trap signals using the `trap` command to perform cleanup or other actions when a process receives a signal:
  ```bash
  trap "echo 'Interrupted!'; exit" SIGINT
  while true; do
      echo "Running..."
      sleep 1
  done
  ```

## Permissions

File and process permissions in Linux help protect data by controlling who can read, write, or execute files and programs. Permissions are set using a combination of user, group, and others, each of which can be assigned read, write, or execute permissions.

### File Permissions

- **Read (r)**: Permission to read the file.
- **Write (w)**: Permission to modify or delete the file.
- **Execute (x)**: Permission to run the file as a program.

Permissions are typically displayed using the `ls -l` command:

```bash
ls -l filename
```

The output might look like this:

```
-rwxr-xr-- 1 user group 4096 Mar 27 10:00 filename
```

- The first character indicates the file type (`-` for a regular file, `d` for a directory).
- The next nine characters are grouped into three sets representing permissions for the user, group, and others.
  - `rwx`: The user has read, write, and execute permissions.
  - `r-x`: The group has read and execute permissions.
  - `r--`: Others have only read permission.

### Changing Permissions

The `chmod` command is used to change file permissions. For example:

```bash
chmod 755 filename
```

This command sets the permissions as follows:

- `7` (user): read (4) + write (2) + execute (1) = 7
- `5` (group): read (4) + execute (1) = 5
- `5` (others): read (4) + execute (1) = 5

### Ownership

Files and directories have an owner and a group. You can change ownership with the `chown` command:

```bash
chown user:group filename
```

### Process Permissions

When a process runs, it inherits the permissions of the user who started it. However, some processes may need elevated privileges. These privileges can be granted temporarily using the `sudo` command.

For example, to edit a file with elevated privileges:

```bash
sudo nano /etc/hosts
```

The `sudo` command temporarily grants administrative privileges to execute the command.