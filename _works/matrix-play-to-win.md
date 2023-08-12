---
layout: work
title: Matrix:Play to Win
date: 2023-08-01 
tech: [React Native, Expo, Socket.io]
description: Matrix is a play to earn application. Play games, try your luck with daily spins, compete with other players and earn cash.
image: /assets/images/projects/matrix/cover.jpg
webp-image: /assets/images/projects/matrix/cover.webp
screenshots-folder: matrix
---

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Features](#features)
    - [Admin Features](#admin-features)
    - [User Features](#user-features)
- [Screenshots](#screenshots)

## Introduction

{{page.description}}

In this app I use **Socket.io** for real time communication to update game status and leaderboard.
This applicaition has many HTML5 games, which heavily rely on HTML5 canvas. 

At first I was thinking about using **Flutter**. But After testing flutter webview. 
I notice current state of flutter webview is not good enough for this project because I started developing this project at late 2020. So I decided to use React Native instead. 

During the development I notice there is no good fortune wheel library for React Native. So I decided to create an [npm](https://www.npmjs.com/package/fortune-wheel-native){:target="_blank" rel="noopener noreferrer"} package.
You can also see the source code here: [fortune-wheel-native](https://github.com/oyhpnayiaw/fortune-wheel-native){:target="_blank" rel="noopener noreferrer"}.

> Unfortunately, This project is not active anymore cuz client decided to stop the project. 
But I think this project is worth to be in my portfolio.


## Technologies

Below are the technologies used in this project:

- `Backend:` Node.js, Socket.io, MongoDB, Expo, Docker, Nginx
- `Admin Panel:` React.js, Redux, Material UI 
- `Mobile:` React Native, Expo, Socket.io, Redux 

## Features

#### Admin Features

*These are the features of the admin panel. Due to security reason, I can't share the admin panel link or screenshots.*

- Manage Users
- Manage Games
- Manage Coinflip Games
- Manage Payments
- Manage Withdrawals
- Manage Daily Spins
- Manage Leaderboard
- Manage Settings
- Manage Ads
- Send Notifications

#### User Features

- Register and Login
- Light/Dark mode
- Play HTML5 games and earn cash
- Daily spin to earn cash.
- Compete with other players in leaderboard
- Create/join coinflip games
- Withdraw cash
