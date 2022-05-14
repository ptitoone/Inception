FROM alpine:3.14.6

EXPOSE 443

ARG USERNAME=USERNAME

COPY srcs.tar.gz /tmp/srcs.tar.gz
COPY install.sh /tmp/install.sh

RUN /tmp/install.sh

ENTRYPOINT ["/entry.sh"]

