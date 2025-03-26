# BASH Cheatsheet

BASH = Born Again Shell

Linux does not care about file extensions
if you rename a cat.jpg to cat.txt, it will still be a jpg

Case sensitivity is important

Tab auto fill 

| pipe is used to join commands into one

root is the super user
to elevate our privilleges temporarily for a command, use sudo

`whoami` = gives the current user name
`uname` = gives system info
`history` = shows all commands run in this shell session
`clear` = clear the terminal
`man command` = access the manual on how to use a command
`--help` = add onto end of a command for usage
`cat` = print out the contents of a file
`head -2 chicken.txt` = print out specific number of lines from the start of a file
`tail -2 chicken.txt` = print out specific number of lines from the end of file
`ps -p $$` = what shell am i currently using
`history` = last 500 commands used
`history -c` = clear last commands used
    `!command id from history` = run a previousl;y used command
`ls` = show files in current directory
`ls -al` = show files in current directory, includes hidden files, shows long format
`curl` = a terminal http client
`curl imgurl --output filename` = download file to given location/name
`wget` = specifically used to download files and folders
`wget url -O filename` = download file to given location/name
`file filename` = gives info about a file and its type
`mv` = move, can be used to rename a file too
`mv cat.jp cat2.jp` = renaming cat to cat2
`cp` = copy
`cp cat.txt cat.jpg` = copy cat.txt as cat.jpg, both images
`rm` = remove a file
`rm -r directory` = remove a directory, -r recursively removes all files
`mkdir` = make a directory
`touch filename` = make an empty file
`nano file` = command line text editor
`nl filename` = show number of lines in a file
`cat chickenjoke.txt | grep chicken` = only give lines that contain chicken
`grep`
`apt` = a package manager to install/update/delete packages
`apt install tree` = install the tree package - wont work
`sudo apt install tree` = install the tree package with elevated privilleges
`sudo apt update -y` = update the known installable packages, download but not install them
Ensures we have the latest packages and confirms access to the internet
`-y` = answer yes to any confirmations
`sudo apt upgrade` = upgrades all installed packages on your system to the latest versions available
This is dangerous to do 
`pwd` present working directory
`sudo su username` = switch to user, provide no name defaults to super user

Directories
Home - home directory
Root - root of the system