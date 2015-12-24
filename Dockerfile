FROM babim/centos6base:ssh

MAINTAINER "Duc Anh Babim" <ducanh.babim@yahoo.com>

RUN yum -y groupinstall "Desktop" "Desktop Platform" "X Window System" "Fonts" && \
    yum install gedit file-roller firefox nano iputils openssh-server tigervnc-server -y && \
    yum clean all

ADD runssh.sh /usr/sbin/runssh.sh
RUN chmod +x /usr/sbin/runssh.sh
ENV AUTHORIZED_KEYS **None**
ENV LC_ALL en_US.UTF-8
ENV TZ Asia/Ho_Chi_Minh

# Define default command.
CMD ["/usr/sbin/runssh.sh"]

# Expose ports.
EXPOSE 5901 22
