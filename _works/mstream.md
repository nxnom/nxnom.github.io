---
layout: work
title: mStream
date: 2023-08-10
tech: [Flutter, React.js, Node.js, PostgresDB]
description: mStream is a movie streaming app which allow users to stream or download movie or shows.
image: /assets/images/projects/mstream/cover.jpg
webp-image: /assets/images/projects/mstream/cover.webp
screenshots-folder: mstream
live: https://play.google.com/store/apps/details?id=com.myanstream.app
live-name: Play Store
---

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Features](#features)
    - [Admin Features](#admin-features)
    - [App Features](#app-features)
- [Screenshots](#screenshots)


## Introduction

{{page.description}}

I already have experience in developing movie streaming app before.
So I don't have any problem developing this app. 

For the movie storage I use Backblaze B2. It's cheaper than AWS S3 and Google Cloud Storage. 
And I can use together with Cloudflare CDN. So client can save a lot of money.

As usual I use Firebase for push notification and analytics. It's easy to use and free. :)

For this app, client relies on Ads to generate revenue. So to prevent removing from Play Store. 
I create a separate Simple Video Player App instead of using in app video player like I did before in [Alpha Premium](/works/alpha-premium). 
Amazingly it have no problem with policy violation.

I created an internal dart package and shared 75% of the codebase between the Mobile 
and [TV version](/works/mstream-tv).

> Due to strict copyright policy, you need to enable streaming and download feature manually in the app setting.
<br/><br/> Go to `Settings` ~> `Watch Setting` ~> Turn on `Enable Direct Playback`

You can download the app from [Play Store]({{page.live}}){:target="_blank" rel="noopener noreferrer"}.

## Technologies

Below are the technologies used in this project:

- `Backend:` Node.js, Express.js, Postgres, Firebase, Docker, Nginx
- `Admin Panel:` React.js, Redux, Material UI
- `Mobile`: Flutter, Provider, Dio, Hive, Firebase

## Features

#### Admin Features

*These are the features of the admin panel. Due to security reason, I can't share the admin panel link or screenshots.*

- Manage Movies
- Manage TV Shows
- Manage Seasons
- Manage Episodes
- Manage Genres
- Manage Channels
- Manage Settings
- Manage Ads
- Send Notifications

#### App Features

- Search Movies and TV Shows
- Watch Movies and TV Shows
- Download Movies and TV Shows
- Filter Movies and TV Shows by Genre
- Filter Movies and TV Shows by Year
- Filter Movies and TV Shows by Cast
- Change Video Quality
- Watch Live TV
- Watch Football Live
- Recieve Push Notification
