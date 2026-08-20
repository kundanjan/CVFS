# Customised Virtual File System (CVFS)

A custom in-memory file system with its own interactive shell, written in C++. It simulates core operating-system file concepts — inodes, file descriptors, permissions, and a user file descriptor table — entirely in RAM (no disk I/O).

## Concepts

The file system is built from OS building blocks:

- **Inode** — per-file metadata: name, type, permissions, file size, and a data buffer. Inodes are maintained in a singly linked list.
- **User File Descriptor Table (UFDT)** — tracks the files opened by the "user" and what mode (read/write) they were opened in.
- **File Table & inode Table** — support structures linking file descriptors to inodes.

## Limits

| Resource                    | Limit |
|-----------------------------|-------|
| Maximum files in system     | 5     |
| Maximum concurrently open files | 20 |
| Maximum file size           | 100 bytes |

## Permissions

| Value | Permission    |
|-------|---------------|
| 1     | Read          |
| 2     | Write         |
| 3     | Read + Write  |

## Requirements

- `g++` and `make` (Linux)

## Build

```sh
make
```

Produces the `cvfs` binary.

## Usage

```sh
./cvfs
```

This starts the interactive shell:

```
Kundan CVFS > 
```

Type `help` for the command list or `man <command>` for details on a specific command.

## Commands

| Command             | Description                                | Example                    |
|---------------------|--------------------------------------------|----------------------------|
| `help`              | Show the command manual                     | `help`                     |
| `man <cmd>`         | Show a manual page for a command            | `man creat`                |
| `creat <name> <perm>`| Create a new file (returns its FD)         | `creat Demo.txt 3`         |
| `unlink <name>`     | Delete an existing file                     | `unlink Demo.txt`          |
| `stat <name>`       | Show statistical information about a file   | `stat Demo.txt`            |
| `ls`                | List all files in the file system           | `ls`                       |
| `write <fd>`        | Write data into an open file                | `write 3`                  |
| `read <fd> <size>`  | Read `size` bytes from a file               | `read 3 10`                |
| `clear`             | Clear the console                           | `clear`                    |
| `exit`              | Leave the CVFS shell                        | `exit`                     |

### Clean build artifacts

```sh
make clean
```

## Example session

```
Kundan CVFS > creat Demo.txt 3
File is succesfully created with FD : 3

Kundan CVFS > write 3
Please enter the data that you want to write into the file : 
Hello CVFS
13 bytes gets succesfully written into the file
Data from file is : Hello CVFS

Kundan CVFS > read 3 13
Read operation is successfull
Data from file is : Hello CVFS

Kundan CVFS > ls
File name  Size  Permissions

Demo.txt    13    3

Kundan CVFS > exit
Thank you for using Kundan CVFS
Deallocating all resources...
```
