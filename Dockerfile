FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Jerusalem

RUN apt-get update
RUN apt-get install -y sudo readline-common bash-completion
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN bash -c 'printf "ubuntu\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'
RUN useradd -m ubuntu

USER ubuntu
WORKDIR /home/ubuntu

COPY Makefile .
ADD --chown=ubuntu:ubuntu vim/ vim/
ADD --chown=ubuntu:ubuntu tmux/ tmux/
ADD --chown=ubuntu:ubuntu zsh/ zsh/
