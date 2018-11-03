FROM nginx:alpine
COPY src/public/ /usr/share/nginx/html/

RUN ls -a /usr/share/nginx/html/*
