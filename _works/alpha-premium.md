---
layout: work
title: Alpha Premium
date: 2023-07-30
tech: [Flutter, React.js, Socket.io, Node.js]
description: Alpha Premium Mobile is a subscription-based movie streaming app which allow users to stream or download movie or shows.
image: /assets/images/projects/alpha-premium/cover.jpg
webp-image: /assets/images/projects/alpha-premium/cover.webp
screenshots-folder: alpha-premium
live: https://play.google.com/store/apps/details?id=com.alphapremium.app
live-name: Play Store
---

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Features](#features)
    - [Admin Features](#admin-features)
    - [App Features](#app-features)
- [Screenshots](#screenshots)

## Introduction

{{ page.description }}

For this project I use Flutter for the mobile app with Node.js and Express.js for the backend.
During the development, I need to host videos and subtitles in a storage server. 
So I research and found Backblaze B2. It's cheaper than AWS S3 and Google Cloud Storage.
It also works well with Cloudflare CDN. So client can save a lot of money. 

Client also want to encrypt subtitle files. 
I use ChaCha20-Poly1305 encryption algorithm to encrypt and decrypt subtitle files.
Cuz this algorithm works very well in both Node.js and Dart.

I also create a Socket.io microservice to prevent users from sharing their premium account.
So users can only use their premium account in 2 devices.

I created an internal dart package and shared 75% of the codebase between the Mobile 
and [TV version](/works/alpha-premium-tv).

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
- `Mobile`: Flutter, Provider, Dio, Hive, Firebase, Socket.io, Crypto

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
