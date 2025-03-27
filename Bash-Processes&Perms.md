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
    - [Managing System Services with systemctl](#managing-system-services-with-systemctl)
    - [Job Control](#job-control)
  - [Permissions](#permissions)
    - [File Permissions](#file-permissions)
    - [Changing Permissions](#changing-permissions)
    - [Ownership](#ownership)
    - [Process Permissions](#process-permissions)
    - [Additional Notations](#additional-notations)
  - [Shebang](#shebang)

---

## Variables

Bash variables work similarly to variables in other programming languages. They have no strict data type and can store numbers, characters, or strings. No explicit declaration is required—a variable is created once you assign it a value.

```bash
STR="Hello World!"
echo $STR

# Output:
# Hello World!
```

**Example Backup Script:**

```bash
OF=/var/my-backup-$(date +%Y%m%d).tgz
tar -cZf $OF /home/me/
```

*Explanation:*
- **-c**: Creates a new archive.
- **-Z**: Compresses the archive using the `compress` program.
- **-f $OF**: Specifies the archive file name.
- The variable `OF` includes the current date in `YYYYMMDD` format via command substitution.

Local variables can be declared with the `local` keyword:

```bash
#!/bin/bash
HELLO="Hello"
function hello {
    local HELLO="World"
    echo $HELLO
}
echo $HELLO   # Outputs: Hello
hello         # Outputs: World
echo $HELLO   # Still outputs: Hello
```

---

## Environment Variables

Environment variables (ENVs) are dynamic key-value pairs that control system and application behavior.

### Environment Variable Scopes

1. **Global Environment Variables**:  
   Available system-wide and typically set in files like `/etc/environment`.

2. **Session Environment Variables**:  
   Specific to a user's session, defined in files like `~/.bashrc`, `~/.profile`, or `~/.bash_profile`.

3. **Shell Variables**:  
   Limited to the current shell instance and not inherited by child processes unless exported.

### Accessing & Setting Environment Variables

- **printenv**: Displays all environment variables or the value of a specific variable.
- **env**: Lists all environment variables.
- **set**: Lists all shell variables and functions.

**To set an environment variable:**

```bash
export MY_VAR="some_value"
```

Persistently add it to your `~/.bashrc`:

```bash
echo 'export MY_VAR="value"' >> ~/.bashrc
source ~/.bashrc
```

---

## Processes

Processes are running instances of programs. Each process has a unique process ID (PID) and its own memory space and execution context.

### Process Management in Bash

- **Listing Processes:**  
  Use the `ps aux` command to view all running processes:
  ```bash
  ps aux
  ```

- **Real-Time Monitoring:**  
  Use `top` (or `htop` if installed) for dynamic process information:
  ```bash
  top
  ```

- **Running Processes in Background & Foreground:**  
  Append `&` to run a command in the background:
  ```bash
  long_running_command &
  ```
  List background jobs:
  ```bash
  jobs
  ```
  Bring a background job to the foreground:
  ```bash
  fg %job_number
  ```

- **Process Control Using Signals:**  
  Terminate processes using `kill`:
  ```bash
  kill 1234          # Default (SIGTERM, signal 15)
  kill -1 1234       # Gentle termination (SIGHUP)
  kill -9 1234       # Forceful termination (SIGKILL)
  ```
  *Note:* Use signal `-15` (or the default) when a process has child processes.

### Understanding Process Hierarchies

Every process (except for `init`/`systemd`) has a parent process. To view the hierarchy:
```bash
ps -ef --forest
```

### Scripting and Process Control

- **Running Multiple Commands Concurrently:**  
  Run commands in the background and wait for their completion:
  ```bash
  command1 &
  command2 &
  wait
  echo "Both processes have finished."
  ```

- **Handling Signals in Scripts:**  
  Use `trap` to capture signals for cleanup or custom actions:
  ```bash
  trap "echo 'Interrupted!'; exit" SIGINT
  while true; do
      echo "Running..."
      sleep 1
  done
  ```

### Managing System Services with systemctl

The `systemctl` command is used to manage system processes such as web servers or FTP servers.

**Nginx Web Server:**
- Installing Nginx automatically starts the service.
- It is a widely used web server.

**Common Commands:**
```bash
sudo systemctl status nginx    # Check the status of Nginx
sudo systemctl start nginx     # Start Nginx
sudo systemctl stop nginx      # Stop Nginx
sudo systemctl restart nginx   # Restart Nginx
sudo systemctl enable nginx    # Enable Nginx as a startup service
```

`systemctl` can interact with various system processes, not just web servers—it also manages services like FTP servers and others.

### Job Control

Bash supports job control for managing foreground and background processes:
- **Bring a job to the foreground:**
  ```bash
  fg %job-id
  ```
- **Suspend a running process:**  
  Press `Ctrl+Z` to stop the process.
- **Resume a suspended process in the background:**
  ```bash
  bg
  ```

---

## Permissions

Permissions in Linux dictate who can read, write, or execute files and processes. They are set for the user, group, and others.

### File Permissions

File permissions include:
- **r**: Read permission
- **w**: Write permission
- **x**: Execute permission

Example of a detailed file listing:
```bash
ls -l filename
```
Example output:
```
-rwxr-xr-- 1 user group 4096 Mar 27 10:00 filename
```
- The first character denotes the file type (`-` for a regular file, `d` for a directory).
- The following nine characters are grouped into three sets (user, group, others).

### Changing Permissions

Use the `chmod` command to modify file permissions:
```bash
chmod 755 filename
```
- `7` (user): 4 (read) + 2 (write) + 1 (execute)
- `5` (group): 4 (read) + 1 (execute)
- `5` (others): 4 (read) + 1 (execute)

### Ownership

Files and directories have an owner and a group. Use `chown` (shorthand for "change owner") to change ownership:
```bash
chown user:group filename
```

### Process Permissions

A process inherits the permissions of the user who started it. For elevated privileges, use `sudo`:
```bash
sudo nano /etc/hosts
```

### Additional Notations

- **d**: Indicates a directory in file listings.
- **rwx**: Denotes read, write, and execute permissions.

---

## Shebang

The shebang (`#!/bin/bash`) at the beginning of a script specifies which shell to use. It tells the operating system the path to the shell interpreter.

```bash
#!/bin/bash
# Your script content here
```
