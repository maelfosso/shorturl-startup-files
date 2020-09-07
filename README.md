# ShortURL

## Description

Starting point of a app for shorting URL

## Build With

- Docker
- Docker Compose
- Bash

## Prerequisite

- Git
- Docker
- Docker Compose

## Files

- `docker-compose.development.yaml`: Docker compose file for development environment. It will work only with the related repositories available, that is, [API - Backend](https://github.com/maelfosso/shorturl-api) and [WebApp - Frontend](https://github.com/maelfosso/shorturl-webapp)
- `docker-compose.production.yaml`: Docker compose file for production environment. Just run it and the magic will take place.
- `start.sh`: The easy way to start it in a development environment.

## Live Demo

TBA

## Getting Started

### Setup

Clone the repository
```
git clone https://github.com/maelfosso/shorturl-startup-files.git 
```

Run the application in `development` mode.
```
$> ./start.sh
```
It will 
1. Create a repository `shorturl`
2. Download the Github repository of the [Backend](https://github.com/maelfosso/shorturl-api) and put it into the folder `api`
3. Download the Github repository of the [Frontend](https://github.com/maelfosso/shorturl-webapp) and it into the folder `webapp`
3. Download the current repository
4. Run the docker composite file for `development`: `docker-compose.development.yaml`


To Run the application in `production` mode
```
$> curl -o docker-compose.development.yaml https://raw.githubusercontent.com/maelfosso/shorturl-startup-files/master/docker-compose.production.yaml
$> docker-compose -f docker-compose.production.yaml up
```
In `production` environemnt, no files will be downloaded, the context is directly connected to the Github repository.

## Authors
 
- **Mael FOSSO** : [Github](https://github.com/maelfosso) - [LinkedIn](https://linkedin.com/in/mael-fosso-650b6346/)

