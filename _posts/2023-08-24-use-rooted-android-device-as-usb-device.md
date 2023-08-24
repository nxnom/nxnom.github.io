---
layout: post
title: Use rooted android device as flash drive with DriveDroid
date: 2023-07-24 14:26 +0630
tags: Android
image: /assets/images/posts/drivedroid.jpg
---

![drive-droid]({{ page.image }})

I'm a distro hopper. I like to try out new distros. 
But the problem is I always have to carry a flash drive with me and sometime I
forget to bring it with me. So I thought why not use my phone as a flash drive.
After some googling I found out that it is possible to use android device as a
flash drive. 

Meet the [DriveDroid](https://play.google.com/store/apps/details?id=com.softwarebakery.drivedroid&hl=en&gl=US)
by [Softwarebakery](https://softwarebakery.com/). It is a free app available on
Google Play Store. For more functionaly you can buy the paid version.

## How to use it

> There is `Download Image` option in the app but it is not working for me. 
> So I have to download the ISO file manually and then create a new image in the
> app.

1. Install the app from Google Play Store.
2. Download the ISO file of the distro you want to try.
3. Connect your phone to your computer via USB cable.
4. Open the app and click on the + icon on the bottom right corner.
5. Select `Create blank image`. Select the size of the image according to the
   size of the ISO file with some extra space.
6. Click on the image you just created and select `Writable USB on Mass Storage`.
   After that you will see your device in your computer as a flash drive.
7. Now you can use tools like `Rufus` to flash the ISO file to the image you
   created.

> Before you download the ISO file test the app with default image included in
the app. I think not every device is supported by the app.
