#!/bin/bash

# 1. generate static content
export HUGO_BASEURL="/"
docker run --publish-all -v $(pwd)/src:/src -v $(pwd)/public:/output jojomi/hugo:0.53

# 2. Build container
docker build . -t asksven/better.asksven.io:new
docker run -p 8080:80 asksven/better.asksven.io:new

# 3. push container
#docker push asksven/better-website:latest
