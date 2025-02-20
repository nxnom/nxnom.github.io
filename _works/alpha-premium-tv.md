---
layout: work
title: Alpha Premium TV
date: 2023-06-31 
tech: [Flutter, Android, Leanback]
description: Android TV version of Alpha Premium, Movie and TV series streaming platform.
image: /assets/images/projects/alpha-premium-tv/cover.jpg
webp-image: /assets/images/projects/alpha-premium-tv/cover.webp
screenshots-folder: alpha-premium-tv
is-landscape-screenshots: true
---

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Features](#features)
    - [Admin Features](#admin-features)
    - [App Features](#app-features)
- [Screenshots](#screenshots)

## Introduction

This is the Android TV version of Alpha Premium, a movie and TV series streaming platform.
You can read more about the mobile version of Alpha Premium [here](/works/alpha-premium).

This is my first time working with Android TV and it was a great experience. 
I learned a lot about the Android TV platform and how to build apps for it. 
I also learned how to use the Leanback library to build a TV app. 

I created an internal dart package and shared 75% of the codebase between the [Mobile](/works/alpha-premium) and TV version.

> Due to strict copyright policy, you need to enable streaming and download feature manually in the app setting.
<br/><br/> 
Go to `Settings`. You will see this setting `Zat Kar Kyi Yan Enabled Loat Pr` which mean *Enable Video Playback* in Burmese.
<br/><br/> 
When you try to enable this setting, you have to enter a password.
Enter `1111` as password. Then you can enable this setting and stream or download movies.

You can download the app from [Play Store]({{page.live}}){:target="_blank" rel="noopener noreferrer"}.

## Technologies

Below are the technologies used in this project:

- `Backend:` Node.js, Express.js, Socket.io, MongoDB, Firebase, Docker, Nginx
- `Admin Panel:` React.js, Redux, Material UI
- `TV App`: Flutter, Provider, Dio, Hive, Firebase, Socket.io, Crypto

## Features

#### Admin Features

*These are the features of the admin panel. Due to security reason, I can't share the admin panel link or screenshots.*

- Manage Users
- Manage Movies
- Manage TV Shows
- Manage Episodes
- Manage Genres
- Manage Premium Plans
- Manage Purchases
- Manage Settings
- Manage Ads
- Encrypt/Decrypt Subtitles 
- Limit Premium Account to 2 Devices - TV and Mobile
- Send Notifications

#### App Features

- Login/Register
- Change Password
- Search Movies/TV Shows
- Watch Movies/TV Shows
- Purchase Movies/TV Shows
- Filter Movies and TV Shows by Genre
- Filter Movies and TV Shows by Year
- Download Movies/TV Shows
- Select Premium/Free Plan
- View Trailer
- Change Video Quality
- Change Subtitles
- Receive Push Notifications
