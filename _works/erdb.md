---
layout: work
title: ERDB
date: 2023-08-03
tech: [Ruby, Open Source]
description: Ruby Gem for generation Entity-Relationship Diagrams (ERD), support sqlite, mysql and postgresql database.
image: /assets/images/projects/erdb/cover.png
live: https://github.com/nxnom/erdb
live-name: Github
---

- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)

## Introduction

{{ page.description }}

# ERDB [![Gem Version](https://badge.fury.io/rb/erdb.svg)](https://badge.fury.io/rb/erdb) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop)

ERDB is a Ruby Gem for generation Entity-Relationship Diagrams (ERD).
Currently it support `sqlite3`, `mysql2` and `postgresql` database.
ERDB is just a wrapper to automate the process of generating ERD using -

- [Azimutt(Open Source)](https://azimutt.app)
- [DBDiagram](https://dbdiagram.io)

## Demo

![erdb](https://github.com/nxnom/erdb/raw/main/images/erdb.gif)

## Installation

Use the package manager [gem](https://rubygems.org/) to install ERDB.

```bash
gem install erdb
```

> Important note for Linux users: You need to install the _xsel_ or the _xclip_ command-line program. On debian and ubuntu, _xsel_ can be installed with: `sudo apt-get install xsel`
> Visit [clipboard](https://github.com/janlelis/clipboard) for more details about clipboard.

#### Adapters

For `mysql2` and `postgresql` database, you have to install the required gems.

```bash
gem install mysql2
gem install pg
```

## Usage

After install ERDB, you can use `erdb` command to generate ER Diagram.

```bash
erdb
```

It use chrome browser by default to genereate ERD. 
You can use other browser by passing `--browser` option.

> See more options by running `erdb --help`

## Why I created this gem?

I know there are many tools available for generating ERD,
But I wanted to create a tool that is easy to use and can be used with any database.
And I don't want to repeat the same steps again and again for generating ERD. -_-
