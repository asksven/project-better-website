# better.asksven.org Hugo static website

## Build container

1. Build: `docker build . -t asksven/better-website:latest`
## Deploy container

## run hugo without locally installed hugo

`docker run --publish-all -v $(pwd):/src -v $(pwd)/public:/output jojomi/hugo:0.44`
