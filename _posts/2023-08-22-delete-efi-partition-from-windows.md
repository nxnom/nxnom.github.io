---
layout: post
title: Delete EFI partition from windows
date: 2023-07-22 14:26 +0630
tags: Windows
---

I was dual boot my laptop with windows and debian. 
But I change my mind and want to delete debian. 
So I delete debian partition from windows disk management. 
Even though I delete debian partition, it still show up in boot menu.
I try to delete it from windows disk management but it doesn't work.
Currently I only have windows installed on my laptop. 
So I have no choice but to use windows to delete EFI partition.

### Delete EFI partition with diskpart

Windows have diskpart command line tool to manage disk partition.

1. Open command prompt as administrator
2. Type `diskpart` and press enter
3. Type `list disk` and press enter to see the available disks
4. Select the disk that you want to delete EFI partition. In my case, I want to delete EFI partition from disk 0. So I type `select disk 0` and press enter
5. Type `list partition` and press enter to see the available partitions
6. Select the partition that you want to delete. In my case, I want to delete partition 3. 
So I type `select partition 3` and press enter.
7. Type `delete partition override` and press enter to delete the partition.

> Note: Double check everything before you press enter. 
