FROM    alpine:3.14.6

EXPOSE  6379

RUN     apk update \
        && apk add vim redis --no-cache

ENTRYPOINT ["redis-server", "--protected-mode no "] 
