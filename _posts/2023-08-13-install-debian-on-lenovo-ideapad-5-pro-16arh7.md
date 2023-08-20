---
layout: post
title: Install debian on Lenovo Ideapad 5 Pro 16ARH7
date: 2023-08-13 12:45 +0630
tags: Linux
image: /assets/images/posts/lenovo-debian.jpg
---

![Lenovo Ideapad 5 Pro 16ARH7]({{ page.image }})

I just bought a new laptop, Lenovo Ideapad 5 Pro 16ARH7. 
It comes with Windows 11 Home pre-installed. 
But hey! I'm a linux user, I don't need that shit OS.

But this laptop is fairly new, so linux support is not that great.
And most drivers are not included in the kernel yet.
Keyboard, wifi, bluetooth are not working out of the box.
After research I found that the latest kernel that support most of the hardware is 6+.

So it's time to decide which distro to use. Most stable distro still using 5.10 kernel.
I can update kernel manually, but I don't want to do that. 
So my choice are Arch, Fedora, and Debian.

As I'm not a fan of rolling release distro, and debian just release `bookworm` which is using 6.1 kernel.
So I decided to go with Debian. 


## Prepare

First, download [debian iso](https://www.debian.org/){:target="_blank"} and create a bootable usb.

## Install

The installation process is pretty straight forward.

- Turn off secure boot in bios.
- Select your usb drive as boot device.

Due to new kernel, keyboard is working perfectly fine. But wifi is still not working.
So I face another problem, how to install debian without internet connection. 
I also cannot use ethernet cable because this laptop doesn't have ethernet port.
After sometime, I decided I will just install base system first, then install wifi driver later.

#### How to install base system without internet connection

Actually it's pretty easy. Just follow the installation process, when you reach `Network configuration` step,
it will ask you to configure network. Just select `No network devices` and continue.

Then after sometime you will reach `Configure the package manager` step.
It will fail again cuz it cannot connect to the internet. 
Just enter localhost as mirror server and continue. Play around with this step I don't remember exactly what I did.

> __Note:__ If you are absolute beginner, follow video tutorial on youtube. I'm sure there are plenty of them.
You just to install base system without internet connection.

## Post install

After installing base system and reboot into your new system, you will only see a terminal.
That's because you haven't install desktop environment yet.

OK now we have working debian system, but we still don't have internet connection and desktop environment.

> To have internet connection, I need to install wifi driver. 
> But to install wifi driver, I need internet connection. It's like a chicken and egg problem.

#### Tethering

The simple easiest way to get internet connection is to use tethering from your phone.

- Connect your phone to your laptop via usb cable.
- Turn on tethering on your phone.

Boom! You have internet connection. **Just kidding, you still need to configure it.**

#### Configure internet connection

First type `ip a` to see your network interface. You will get the result like this.

```
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute
       valid_lft forever preferred_lft forever
2: enxbe2a24105ab4: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UNKNOWN group default qlen 1000
    link/ether be:2a:24:10:5a:b4 brd ff:ff:ff:ff:ff:ff
    inet 192.168.216.42/24 brd 192.168.216.255 scope global dynamic noprefixroute enxbe2a24105ab4
       valid_lft 3594sec preferred_lft 3594sec
    inet6 fe80::5668:198f:29af:c025/64 scope link noprefixroute
       valid_lft forever preferred_lft forever
```

As you can see, my network interface is `enxbe2a24105ab4`. Yours might be different.
Now we need to configure it. Run this command

```
sudo ip link set enxbe2a24105ab4 up
```

Replace `enxbe2a24105ab4` with your network interface. 
Then run `dhclient` to get ip address from your phone.

```
sudo dhclient enxbe2a24105ab4
```

Now you have internet connection. You can ping google.com to test it.

## Configure apt sources

Now we need to configure `apt` sources.
Go to `/etc/apt/sources.list` and replace the content with this.


```
deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware

deb http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian-security/ bookworm-security main contrib non-free non-free-firmware

deb http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
deb-src http://deb.debian.org/debian bookworm-updates main contrib non-free non-free-firmware
```

You can read more about `apt` sources [here](https://wiki.debian.org/SourcesList).

Now run the following command to update packages.

```
sudo apt update && sudo apt upgrade -y
```

## Install desktop environment

Now we have internet connection and updated packages.
It's time to install desktop environment with `tasksel` easiest way to install desktop environment.
Run `tasksel` in the terminal and select your favorite desktop environment. I choose `KDE Plasma` 
cuz it's the best desktop environment. :D 

## Install wifi driver

Now we have desktop environment, but we still don't have wifi driver.
My wifi card use `rtl8852be` if you have the same wifi card, you can follow this step.

I found this repo [https://github.com/lwfinger/rtw89](https://github.com/lwfinger/rtw89){:target="_blank"} which contain `rtl8852be` driver and
it working perfectly fine. You should check this repo for more information. Following is just a quick guide to get it working.

#### Prerequisite

Install the following packages.

```
sudo apt-get install make gcc linux-headers-$(uname -r) build-essential git
```

#### Clone the repo

```
git clone https://github.com/lwfinger/rtw89
cd rtw89
```

#### Build and install

```
make
sudo make install
```

#### Load the module

```
sudo modprobe -v rtw_8852ae
```

And reboot your system.

After reboot, you should have wifi driver working.

If it's not working, you should check the original repo
[https://github.com/lwfinger/rtw89](https://github.com/lwfinger/rtw89){:target="_blank"}
and try `DKMS` method. I'm sure there are more information about this driver.
Instructions above is just a quick guide to get it working.

If you want to use the same driver version as me, 
use this repo [https://github.com/oyhpnayiaw/rtw89](https://github.com/oyhpnayiaw/rtw89){:target="_blank"}.

#### Conclusion

Damn, it's a long post. I hope you enjoy it. If you have any question, feel free to ask me.

If you are interest read about how I optimize 3-4hr battery life to 7-10hr battery life
[here](/articles/optimize-3hr-battery-life-to-8hr-in-my-debian-laptop).
