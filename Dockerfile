FROM ubuntu:24.04

# Packages to install
ENV PACKAGES="\
  apt-transport-https \
  apt-utils \
  bash-completion \
  build-essential \
  curl \
  git \
  python3 \
  sudo \
  vim \
  wget"

# Environment
ENV TERM=xterm
ENV PS1="\n\n>> sysed \W \$ "

# Install packages
RUN apt-get update && apt-get install $PACKAGES -y


# Allow passwordless sudo
RUN echo "%sudo  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nopasswd

# Start the container as Ubuntu 
WORKDIR /home/ubuntu
USER ubuntu

# Install dotfiles
ARG CACHEBUST=1
RUN git clone -b full-init https://github.com/mrtrebuchet/ezsh-labed.git /home/ubuntu/zsh-setup 
WORKDIR /home/ubuntu/zsh-setup 
RUN ./install.sh
WORKDIR /home/ubuntu
CMD ["zsh"]
