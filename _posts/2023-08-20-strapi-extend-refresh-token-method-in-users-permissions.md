---
layout: post
title: Strapi:extend refresh token method in users-permissions
date: 2023-08-20 16:11 +0630
tags: Strapi Javascript
image: https://assets.strapi.io/uploads/HP_meta_b32f546a40.png
---

After using strapi for a while, I notice there is no implementation to refresh the token. -_-"
I found an official article about how to do it [here](https://strapi.io/blog/how-to-create-a-refresh-token-feature-in-your-strapi-application).
But it is too long and all I need is just a simple refresh token method.

First, you need to create a new file in `extensions/users-permissions/strapi-server.js` and add the following code.

> Learn more plugin extensions [here](https://docs.strapi.io/dev-docs/plugins-extension#extending-a-plugin-s-interface).

```js
module.exports = (plugin) => {
  plugin.controllers.auth.refreshToken = async (ctx) => {
    // add you own logic here
    // this is just an example
    const newJwt = strapi.plugins["users-permissions"].services.jwt.issue({
      id: ctx.state.user.id,
    });
    return { newJwt };
  };

  plugin.routes["content-api"].routes.push({
    method: "POST",
    path: "/auth/refreshToken", // change the path to whatever you want
    handler: "auth.refreshToken",
    config: {
      prefix: "",
    },
  });

  return plugin;
};
```

Then you need to enable this endpoint in Strapi Admin Panel.
Go to `Settings > USERS & PERMISSIONS PLUGIN > Roles > Authicated > Users-permissions > refreshToken`
If you have other roles and want to enable this endpoint for them, you can do it there too.

### Let's test it out. 

I made `demo` user with `password` password.
First send the login request to get the token. I use `curl` with `jq` to format the response.

```bash
curl -X POST http://localhost:1337/api/auth/local -H "Content-Type: application/json" -d '
{
"identifier": "demo@email.com",
"password": "password"
}
' | jq
```

It response following data.

```json
{
  "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjkyNTIzOTc5LCJleHAiOjE2OTUxMTU5Nzl9.NEMDov-Eb3dLzRi8GZZgqUTzxZ7hf3VljwsemgUJFN0",
  "user": {
    "id": 1,
    "username": "user",
    "email": "demo@email.com",
    "provider": "local",
    "confirmed": true,
    "blocked": false,
    "createdAt": "2023-08-20T09:19:26.465Z",
    "updatedAt": "2023-08-20T09:19:26.465Z"
  }
}
```

Great! Now we have the token. Let's try to refresh it.
Remember to change the token to your token.

```bash
curl -X POST http://localhost:1337/api/auth/refreshToken -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjkyNTIzOTc5LCJleHAiOjE2OTUxMTU5Nzl9.NEMDov-Eb3dLzRi8GZZgqUTzxZ7hf3VljwsemgUJFN0"
```

Response

```json
{"newJwt":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjkyNTI0MzI4LCJleHAiOjE2OTUxMTYzMjh9.ZfQtiuu0-A9azZpXwRL6Ld6KNOj1DE-0tl-j1qE7-FY"}
```

Now we have a new token. You can use this new token to access the API.
This is just a simple example. You can add your own logic to the `refreshToken` method.
