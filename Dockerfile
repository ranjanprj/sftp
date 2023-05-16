FROM registry.access.redhat.com/ubi8/ubi:latest
ARG home=/home/sshuser
RUN yum -y update && \
    yum -y install openssh-server \
    openssh-clients && \
    /usr/bin/ssh-keygen -A && \
    groupadd sshgroup && \
    useradd -ms /bin/bash -g sshgroup sshuser && \
    echo 'sshuser:PASSWORD' | chpasswd && \
    mkdir $home/.ssh && \
    touch $home/.ssh/authorized_keys && \
    chown sshuser:sshgroup $home/.ssh/authorized_keys && \
    chmod 600 $home/.ssh/authorized_keys

COPY files/sshd_config.conf /etc/ssh/ssh_config.d/
RUN echo "Port 2222" >> /etc/ssh/ssh_config
RUN echo "Port 2222" >> /etc/ssh/sshd_config
RUN echo "Port 2222" >> /etc/ssh/ssh_config.d/05-redhat.conf
EXPOSE 2222
CMD /usr/sbin/sshd && sleep infinity
