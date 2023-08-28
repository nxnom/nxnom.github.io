---
layout: post
title: Create custom user & db on MongoDB docker init
date: 2023-08-28 13:35 +0630
tags: MongoDB Docker
image: http://s3.amazonaws.com/info-mongodb-com/_com_assets/cms/kuzt9r42or1fxvlq2-Meta_Generic.png
---

Everytime I create a new mongodb docker container, it's always a pain to create a new user and grant it the necessary permissions. 
I have to login to the container, open the mongo shell and run the commands to create the user and grant permissions.
Damn! that is a lot of work. Actually, MongoDB has a way to do this automatically when the container is created.

#### Why do we need to create a new user?

By default, MongoDB creates a root user and grants it all the permissions.
This is not a good practice. We should create a new user and grant it only the necessary permissions to prevent 
any accidental changes to the database.

<figure>
    <img width="320" style="margin: 12px 0;" src="/assets/images/posts/delete-database-meme.jpg" alt="delete-database-meme"/>
</figure>   


### Database Initialization Scripts

The `mongo` container has a mechanism to run scripts when the container is created.
You can mount a directory containing the scripts to `/docker-entrypoint-initdb.d` directory in the container.

Let's create `.env` file to store the environment variables.

```env
MONGO_INITDB_ROOT_USERNAME=admin
MONGO_INITDB_ROOT_PASSWORD=adminPassword

MONGO_INITDB_USERNAME=customUser
MONGO_INITDB_PASSWORD=customPassword
MONGO_INITDB_DATABASE=mydb
```

Now create a shell script `mongo-init.sh` to create the user and grant permissions.

```sh
mongosh -- "$MONGO_INITDB_DATABASE" <<EOF
    var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
    var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
    var admin = db.getSiblingDB('admin');
    admin.auth(rootUser, rootPassword);

    var user = '$MONGO_INITDB_USERNAME';
    var passwd = '$MONGO_INITDB_PASSWORD';
    var database = '$MONGO_INITDB_DATABASE';
    db.createUser({user: user, pwd: passwd, roles:[{ role: "readWrite", db: database }]});
EOF
```

> If you are using older version of MongoDB use `mongo` instead of `mongosh` in the above script.

Link  `mongo-init.sh`  file to  */docker-entrypoint-initdb.d/*  in mongoDB container.
So if mongo container is created for the first time our script will run and create dbAdmin and database.

eg. link in volume  *./mongo-init.sh:/docker-entrypoint-initdb.d/mongo-init.sh:ro*

```yaml
version: '3'
services:
  mongoDB:
    image: mongo
    container_name: mongoDB
    restart: unless-stopped
    ports:
      - "27017:27017"
    volumes:
      # Link shell script with docker-entrypoint to run on init
      - ./mongo-init.sh:/docker-entrypoint-initdb.d/mongo-init.sh:ro
    env_file: .env
```

Now when you run `docker-compose up -d` the script will run and create the user and grant permissions.
