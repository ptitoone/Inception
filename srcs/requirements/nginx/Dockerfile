FROM debian:buster

EXPOSE 80 443

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install nginx -y

COPY default /etc/nginx/sites-available/default 
COPY ft_server.crt /etc/nginx/ssl/ft_server.crt 
COPY ft_server.key /etc/nginx/ssl/ft_server.key

CMD ["nginx", "-g", "daemon off;"]
