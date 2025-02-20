---
layout: work
title: Myan Game
date: 2019-10-14
tech: [React.js, PWA, Feathers.js]
description: Myan Game Shop is a Progressive Web App for an e-commerce store that sells in-game items and gift cards. 
image: /assets/images/projects/myan-game/cover.jpg
webp-image: /assets/images/projects/myan-game/cover.webp
screenshots-folder: myan-game
is-landscape-screenshots: true
---

- [Introduction](#introduction)
- [Technologies](#technologies)
- [Features](#features)
    - [Admin Features](#admin-features)
    - [Client Features](#client-features)
- [Screenshots](#screenshots)

## Introduction

{{ page.description }}

For this app I use React.js with Feathers.js for backend. I also use PWA to make it installable on devices.

For the authentication, I use OAuth2 with Google and Facebook. I also use JWT for the API authentication.

For Order Managements, I have to send email notifications to the customers.
So after some research, I found [Zoho Mail](https://www.zoho.com/mail/) which is free for 5 users and 5GB storage. 
I use it to send emails to customers and also to receive emails from customers.

You can visit the live site [here]({{ page.live }}){:target="_blank" rel="noopener noreferrer"}.

## Technologies

Below are the technologies used in this project:

- `Backend:` Node.js, Socket.io, MongoDB, Docker, Nginx
- `Frontend:` React.js, Redux, Material UI

## Features

### Admin Features

- Manage Products
- Manage Orders
- Manage Users
- Manage Roles
- Manage Categories
- Manage Coupons
- Manage Settings
- Manage Email Templates
- Manage Payment Methods
- Manage Pages
- Manage Notifications

### Client Features

- Register/Login
- View Products
- View Product Details
- Checkout Products
- View Orders
- View Order Details
- View Profile
- View Pages
- View Notifications

