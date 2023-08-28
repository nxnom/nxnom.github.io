---
layout: post
title: "*chmod* Cheat Sheet"
date: 2023-08-24 18:28 +0630
tags: Unix cheat-sheet
image: /assets/images/posts/chmod.jpg
---

In Linux, you can change the permissions of a file or directory using the `chmod` command.
Problem is I can never remember the numbers to use for the permissions.
The only thing I can remember is `777` 🤣 

Syntax

```sh
chmod <options> <permissions> <file_name> 
```

Example

```sh
chmod 777 foo.txt
```

### Permissions

Following are the four possible digits and their respective permissions

Digit	Permission

| 4 | read |
| - | - |
| 2 | write |
| 1 | excute |
| 0 | no permission |

Users can also sumup these digits and can use like following

| Derived Digits |	Permission |
| - | - |
| 7	| 4+2+1 = read + write + execute |
| 6	| 4+2 = read + write |
| 5	| 4+1 = read + execute |
| 3	| 2+1 = write + execute |

Permissions for user, group, others

Owner of the file can set different permissions for user, group & others

Example

```sh
chmod u=rwx,g=rx,o=r foo.sh # this is same as chmod 754 foo.sh
u = user
g = group
o = others

r = read
w = write
x = execute
```
