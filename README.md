# README
[![Build Status](https://travis-ci.org/kmcloughlin/bitmaker-OpenMD.svg)](https://travis-ci.org/kmcloughlin/bitmaker-OpenMD)

## Configuring PostgreSQL

bitmaker-OpenMD is a Rails app running a PostgreSQL db.

To use the app in development you will need to run a local PostgreSQL server
and add a specific role to your postgres db.

### Step 1: Run your postgres server
Click on the Postgres app (Mac OS X) and wait for it to start.

### Step 2: Access the postgres server from your terminal

`psql`

### Step 3: Create an 'openmd' role
`CREATE ROLE openmd WITH LOGIN;`

### Step 4: Update your database.yml file
`username: openmd`

### Step 5: Check for errors
Stop and restart your rails server.
Check to ensure your postgres set up is correct.
