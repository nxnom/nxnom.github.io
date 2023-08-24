---
layout: post
title: Connect ADB connection wirelessly
date: 2023-08-24 18:56 +0630
tags: Android
image: /assets/images/posts/adb-wireless-debugging.png
---

I always prefer to use real device for testing my android app. 
But it's really annoying to connect my phone to my laptop everytime I want to test my app and
and that st*pid USB cable is always in my way. Here is how I connect my phone wirelessly to my laptop.

> Assuming you have already installed ADB in your laptop. 

### Method 1: Using ADB over TCP/IP 

1. Connect your phone to your laptop using USB cable.
2. Open terminal and run following command
    ```sh
    adb devices
    ```
3. You should see your device listed in the output.
    ```sh
    List of devices attached
    2c510d77        device
    ```
4. Now run following command to connect your device wirelessly.
    ```sh
    adb tcpip 5555
    ```

    **Note:** `5555` is the port number. You can use any port number you want.

5. Now run following command connect your device wirelessly.
    ```sh
    adb connect <device-ip-address>:5555
    ```

    When you run `adb devices` command again, you should see your device listed with `device` status.

    ```sh
    List of devices attached
    2c510d77        device
    192.168.1.3:5555        device
    ```

6. Now you can disconnect your phone from your laptop and use it wirelessly.


### Method 2: Use Wireless debugging option

> This method is only available in Android 11 and above.

If you are using Android 11 or above, you can use wireless debugging option.
You can find this option in `Settings > Developer options > Wireless debugging`.
With this option enabled, you can connect your device wirelessly without using any USB cable.
Just make sure your phone and laptop are connected to same network and type the 
IP address & Port shown in your option. See image below.


![Wireless debugging option]({{ page.image }})

Now run following command to connect your device wirelessly.

```sh
adb connect 192.168.1.242:38157
```

> Replace ip address and port number with the one shown in your device.

You can also use `adb pair` command to pair your device with your laptop.
If you use Android Studio, you can also use `Pair device with QR code` option.

This option is quite handy if you are using Android 11 or above. But if you are using older version of Android,
you can use **Method 1** to connect your device wirelessly.
