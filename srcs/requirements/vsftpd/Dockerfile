FROM	alpine:3.14.6

EXPOSE 20 21

ARG WP_FTP_USER_NAME=WP_FTP_USER_NAME
ARG WP_FTP_USER_PASS=WP_FTP_USER_PASS
ARG AD_FTP_USER_NAME=AD_FTP_USER_NAME
ARG AD_FTP_USER_PASS=AD_FTP_USER_PASS
ARG ST_FTP_USER_NAME=ST_FTP_USER_NAME
ARG ST_FTP_USER_PASS=ST_FTP_USER_PASS

COPY install.sh /tmp/install.sh
COPY entry.sh /entry.sh

RUN /tmp/install.sh

ENTRYPOINT ["/entry.sh"] 
