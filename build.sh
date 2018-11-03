#!/bin/bash

# 1. generate static content
cd src
hugo
cd ..

# 2. Build container
docker build . -t asksven/better-website:latest

# 3. push container
docker push asksven/better-website:latest

# 4. run
echo to run the container
echo docker run -p 8080:80 asksven/better-website 
