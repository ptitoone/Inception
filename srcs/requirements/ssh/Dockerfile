FROM    alpine:3.14.6

EXPOSE  22

COPY    install.sh /tmp/install.sh

RUN     /tmp/install.sh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]

