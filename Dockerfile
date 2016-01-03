FROM babim/centos6base:ssh

RUN yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts" && \
    yum install gedit file-roller firefox nano iputils openssh-server tigervnc-server -y && \
    yum clean all

ADD runssh.sh /usr/sbin/runssh.sh
RUN chmod +x /usr/sbin/runssh.sh
ENV AUTHORIZED_KEYS **None**

# Define default command.
CMD ["/usr/sbin/runssh.sh"]

# Expose ports.
EXPOSE 5901 22
