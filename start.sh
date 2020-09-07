#!/bin/bash

SHORTURL_DIR='shorturl'

# Check if the shorturl directory exists
if [ -d "$SHORTURL_DIR" ]; then
  echo "[SHORTURL START.SH] $SHORTURL_DIR Already exists" ;
  echo "[SHORTURL START.SH] Delete the shorturl repository and all its subfolder"
  rm -rf $SHORTURL_DIR
fi

# Create the shorturl directory
mkdir -p $SHORTURL_DIR;
echo "[SHORTURL START.SH] $SHORTURL_DIR directory is created"

# Change the current directory
cd $SHORTURL_DIR
echo "[SHORTURL START.SH] Working directory changed. Now, we are in $SHORTURL_DIR"

# Download repositories
echo "[SHORTURL START.SH] Check if GIT command exists"
if ! command -v git &> /dev/null
then
    echo "[SHORTURL START.SH] GIT could not be found"
    exit
fi
echo "[SHORTURL START.SH] GIT command exists"

echo "[SHORTURL START.SH] Start downloading API github repository"
git clone https://github.com/maelfosso/shorturl-api api && (cd api && npm install)
echo "[SHORTURL START.SH] API github repository downloaded"

echo "[SHORTURL START.SH] Start downloading WebApp github repository"
git clone https://github.com/maelfosso/shorturl-webapp webapp && (cd webapp && npm install)
echo "[SHORTURL START.SH] WebApp github repository downloaded"

echo "[SHORTURL START.SH] Start downloading Startup-Files github repository"
git clone https://github.com/maelfosso/shorturl-startup-files startup-files
echo "[SHORTURL START.SH] Startup-Files github repository downloaded"

ln -s $(pwd)/startup-files/docker-compose.development.yaml docker-compose.development.yaml

echo "[SHORTURL START.SH] Check if DOCKER-COMPOSE command exists"
if ! command -v git &> /dev/null
then
    echo "[SHORTURL START.SH] DOCKER-COMPOSE could not be found"
    exit
fi
echo "[SHORTURL START.SH] DOCKER-COMPOSE command exists"

docker-compose -f docker-compose.development.yaml up
