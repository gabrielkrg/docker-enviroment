# FROM nginx:alpine
FROM nginx:latest

COPY nginx.conf /etc/nginx/
COPY ssl/ /etc/nginx/ssl/

RUN apt-get update && apt-get install -y \
    vim
