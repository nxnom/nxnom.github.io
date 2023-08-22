---
layout: post
title: Remapping keys in wayland
date: 2023-08-22 14:50 +0630
tags: Linux Systemd Wayland
image: /assets/images/posts/keyd.jpg
---

As a vim user, without using vim keybindings, I feel like I'm
missing a limb. Everytime I need to use arrow keys, I was pressing `hjkl`
instead. I use `xmodmap` to remap keys. But `xmodmap` doesn't seems to work in wayland.
Then I found [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd). It's a daemon that can
remap keys using kernel level input primitives (evdev, uinput).

### Configuration

```bash
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
```

You can check if keyd is running using `sudo systemctl status keyd`.

After that you can edit `/etc/keyd/default.conf` to remap keys. 
Following is my configuration. I remap `Capslock` -> `Ctrl` and `Alt` + `hjkl` -> arrow keys.

```
[ids]

*

[main]

capslock = layer(capslock_layer)
leftalt = layer(leftalt_layer)

[leftalt_layer:A]

h = left
j = down
k = up
l = right

[capslock_layer:C]

[ = esc
```

After editing the configuration file, you need to restart keyd using `sudo systemctl restart keyd`.

If you are confusing which key you are pressing, you can use `sudo keyd monitor` to monitor key events.
See the original repository [https://github.com/rvaiya/keyd](https://github.com/rvaiya/keyd) for more information. 
