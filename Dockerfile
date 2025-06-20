FROM ubuntu:24.10

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Jerusalem

RUN apt-get update
RUN apt-get install -y sudo readline-common bash-completion rake pipx tzdata git
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata



RUN git clone https://github.com/haarcuba/configs.git /configs

WORKDIR /configs

RUN rake packages
RUN rake neovim
RUN rake ohmyzsh
RUN rake tmux
RUN rake tty-pinentry
RUN rake git_config
RUN rake prepush

WORKDIR /root
ENV TERM=xterm-256color
CMD ["/bin/zsh"]

RUN nvim '+PlugInstall' '+qall'
