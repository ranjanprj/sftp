FROM alpine:latest
MAINTAINER Adrian Dvergsdal [atmoz.net]

# Steps done in one RUN layer:
# - Install packages
# - OpenSSH needs /var/run/sshd to run
# - Remove generic host keys, entrypoint generates unique keys
RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk add --no-cache bash shadow@community openssh-server-pam openssh-sftp-server && \
    ln -s /usr/sbin/sshd.pam /usr/sbin/sshd && \
    mkdir -p /var/run/sshd && \
    rm -f /etc/ssh/ssh_host_*key*

ADD files/sshd_config /etc/ssh/sshd_config
ADD files/create-sftp-user /usr/local/bin/


ADD files/entrypoint /

RUN chmod +x /entrypoint

EXPOSE 2222
ENTRYPOINT ["/entrypoint"]
