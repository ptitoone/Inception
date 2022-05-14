#!/bin/sh

# Install dependencies

apk update && \
apk add --no-cache nginx openssl;

# Generate SSL certs
mkdir /etc/nginx/ssl;

openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=PACA/O=42Nice/CN=${USERNAME}.42.fr" -addext "subjectAltName=DNS:${USERNAME}.42.fr" -newkey rsa:2048 -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt;

# Extract and dispatch conf files
tar -xzvpf /tmp/srcs.tar.gz -C /tmp;
mv /tmp/*.conf /etc/nginx/http.d/;
mv /tmp/entry.sh /;

# Edit configuration files
sed -i "s/USERNAME/${USERNAME}/g" /etc/nginx/http.d/*.conf;

# Remove install files
rm /tmp/*;

