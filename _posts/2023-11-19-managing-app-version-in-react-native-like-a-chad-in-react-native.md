---
layout: post
title: Managing app version in react native like a chad in react native
date: 2023-11-19 16:11 +0630
tags: React-Native
image: /assets/images/posts/manage-app-version-in-react-native.jpeg
---

Managing app version have been always annoy me. Each time I want to change app version I have to change in both ios and android.
That's pretty stupid. And each time I change version my git history will be messed up.

<figure>
    <img style="margin: 12px 0;" src="/assets/images/posts/manage-app-version-in-react-native.jpeg" alt="Manage app version in react native">
</figure>

After researching for a while, I found [react-native-config](https://www.npmjs.com/package/react-native-config)
which is a great package to manage environment variables in react native, work both js and native side.

### Setup

Install the package with yarn or npm, I will use yarn in this post

```bash
yarn add react-native-config
```

After installing the package, we need to link and configure it. For that please follow the official guide, it's pretty straight forward and easy to follow.

### Time to create `.env` file with our version configs

Create `.env` file in the root of your project and add the following lines

```bash
# .env
APP_VERSION=1.0.0 # use what ever name you want
BUILD_NUMBER=1  # use what ever name you want
```

### Use it in the IOS side

Open `ios/YourProjectName/Info.plist` and change the `CFBundleShortVersionString` and `CFBundleVersion` to the following

```xml
<key>CFBundleShortVersionString</key>
<string>$(APP_VERSION)</string>
<key>CFBundleVersion</key>
<string>$(BUILD_NUMBER)</string>
```


### Use it in the Android side

Open `android/app/build.gradle` and change the `versionName` and `versionCode` to the following

```gradle
versionName project.env.get("APP_VERSION")
versionCode project.env.get("BUILD_NUMBER").toInteger()
```


> Assuming you already setup the `react-native-config` in the native side in case it's not working
please follow the official guide.

Horay!! Now you can ignore `.env` file in your git repo and manage your app version like a chad.
No stup*d git history and no more changing version in both ios and android. 🎉🎉🎉
