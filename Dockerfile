FROM nginx:1.15-alpine
COPY public/ /usr/share/nginx/html/

RUN ls -a /usr/share/nginx/html/*
