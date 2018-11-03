# better.asksven.org Hugo static website

## run hugo without locally installed hugo

`docker run --publish-all -v $(pwd):/src -v $(pwd)/public:/output jojomi/hugo:0.44`

## Build container

1. Build: `docker build . -t asksven/better-website:latest`

## Run container locally

`docker run -p 80:8080 asksven/better-website:131`

## Deploy container

