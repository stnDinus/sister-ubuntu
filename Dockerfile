FROM ubuntu:24.04

# package management
RUN apt-get update
RUN apt-get install -y openssh-server iproute2

# service management
RUN service ssh start

# group management
## mahasiswa
RUN groupadd mhs
## dosen
RUN groupadd dsn

# user management
RUN useradd -D -s /bin/bash
RUN useradd \
  -g mhs \
  -p '$y$j9T$ZuAJHa.7qWNMApki8uOjK0$wnmZbVLESvKjJEiRh65u3TzUFndvmdv2WUDM4ISIMp1' \
  steven
RUN useradd \
  -g mhs \
  -p '$y$j9T$rc884nmCaiRMSiT8PRUuq.$eH50th3g5meXOVwv4PD3xHSREIzkJfCinvcue2kJ0f3' \
  ivan
