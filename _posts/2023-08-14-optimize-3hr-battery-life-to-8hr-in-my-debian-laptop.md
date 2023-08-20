---
layout: post
title: Optimize 3hr battery life to 8hr in my debian laptop🔋
date: 2023-08-14 16:32 +0630
tags: Linux
image: /assets/images/posts/lenovo-debian.jpg
---

After installing debian on my laptop, I found that my laptop battery last only 3-4hr
even though in windows it can last 7-10hr. So I decided to optimize my laptop battery life.

> See my previous post [Install debian on lenovo ideapad 5 pro 16ARH7](/articles/install-debian-on-lenovo-ideapad-5-pro-16arh7) for more information about my laptop.

I notice my GPU and CPU are always running at max frequency so fan is constantly running and
powerusage is always **35W+**. So I think this is the reason why my battery life is so bad.

## Optimize CPU frequency

For CPU frequency, I use `auto-cpufreq` to optimize my CPU frequency. It's a python script that automatically
optimize your CPU frequency. It's very easy to use. Just install it and run it.

#### Install auto-cpufreq

```
sudo snap install auto-cpufreq
```

After installing it, you can run it with `sudo auto-cpufreq --install` to install it as a service.
It will automatically optimize your CPU frequency.

See more information about `auto-cpufreq` in [https://github.com/AdnanHodzic/auto-cpufreq](https://github.com/AdnanHodzic/auto-cpufreq){:target="\_blank"}

## Optimize GPU

OK it's seems like CPU frequency is optimized. Now let's optimize GPU frequency.
My laptop have integrated GPU(AMD Raedom 660M) and dedicated GPU(Nvidia GTX 1650).
So I only want to use integrated GPU to save battery life. There is something call
nvidia optimus which allow you to switch between integrated GPU and dedicated GPU.
So I want to use that to switch to integrated GPU. After failing several hours to
get it working, I finally found a way to do this. It's really weird but it's working.
¯\\_(ツ)_/¯

#### Install bumblebee

First install `bumblebee` which is a program that allow you to switch between integrated GPU and dedicated GPU.

```
sudo apt install bumblebee primus
```

After installing it, you need to add your user to `bumblebee` group.

```
sudo adduser $USER bumblebee
```

Then run the following command to enable `bumblebee` service.

```
sudo systemctl start bumblebeed
```

You can view more information about bumblebee in [https://wiki.debian.org/Bumblebee](https://wiki.debian.org/Bumblebee){:target="\_blank"}

After installing `bumblebee` and reboot I thought bumblebeed will automatically handle switching between integrated GPU and dedicated GPU.
But it's not and fan still running at max speed and nothing really happen.

When I run `nvidia-smi` I found that my dedicated GPU is still running and consuming around **12W**.
I try several ways to disable dedicated GPU but nothing seems working. I can completely disable from
BIOS but I don't want to do that. I want to use it when I need it.

Then I thought I'll try uninstalling all nvidia driver, I don't need it anyway. So I uninstall all nvidia driver
using this command.

```
sudo apt purge "*nvidia*"
```

After reboot, surprisingly my fan is not running and power usage is around **10W**.
So I think it's working. But **10W** is still a lot. I think I can do better.

## Optimize more with tlp

After optimizing CPU and GPU, I think I can do better. So I install `tlp`
which is a program that optimize your laptop battery life.

```
sudo apt install tlp tlp-rdw
```

to install it. After installing it, you can run `sudo tlp start` to start it.

> TLP documentations said that it will not working properly with `auto-cpufreq`
> but I don't see any problem with it.

View more information about `tlp` in [https://linrunner.de/tlp/index.html](https://linrunner.de/tlp/index.html){:target="\_blank"}

### Optional: Powertop

If you want you can use `powertop` tunable to optimize your battery life even more.
But I don't think it's necessary. I don't see any improvement after using it.

## Final result

This is the report from `powertop` after everything is optimized while running
`chrome` with 6 tabs, `foot` terminal with `tmux` session, and `spotify` in 10% screen brightness.
Laptop battery have 73% charge left.

```
The battery reports a discharge rate of 7.10 W
The energy consumed was 143 J
The estimated remaining time is 7 hours, 5 minutes

Summary: 1933.1 wakeups/second,  0.0 GPU ops/seconds, 0.0 VFS ops/sec and 22.6% CPU use
```

It only consume around **5W** at idle compare to **35W+** before, I think it's a lot of improvement.

> I'm not sure if this is the best way to optimize battery life.
> But hey! it's working and I'm happy with it. 😁
