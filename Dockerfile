FROM ubuntu:24.04

# package management
RUN apt-get update
RUN apt-get install -y openssh-server iproute2
RUN apt-get install -y ufw
RUN apt-get install -y net-tools
RUN apt-get install -y nginx

# group management
## mahasiswa
RUN groupadd mhs
## dosen
RUN groupadd dsn

# user management
RUN useradd -D -s /bin/bash
RUN useradd \
  -b /home/mhs \
  -m \
  -g mhs \
  -p '$y$j9T$ZuAJHa.7qWNMApki8uOjK0$wnmZbVLESvKjJEiRh65u3TzUFndvmdv2WUDM4ISIMp1' \
  steven
RUN useradd \
  -b /home/mhs \
  -m \
  -g mhs \
  -p '$y$j9T$rc884nmCaiRMSiT8PRUuq.$eH50th3g5meXOVwv4PD3xHSREIzkJfCinvcue2kJ0f3' \
  ivan
RUN useradd \
  -b /home/dsn \
  -m \
  -g dsn \
  -p '$y$j9T$rc884nmCaiRMSiT8PRUuq.$eH50th3g5meXOVwv4PD3xHSREIzkJfCinvcue2kJ0f3' \
  salam

# sshd management
COPY sshd_config_v1 /etc/ssh/sshd_config

# nginx management
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 8022

CMD service ssh start \
  && service nginx start \
  && ufw enable \
  && ufw allow from ${SSH_IP} to ${GUEST_IP} port 8022 \
  && ufw allow 80 \
  && bash
