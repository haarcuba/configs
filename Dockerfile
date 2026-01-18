FROM ubuntu:25.10

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
RUN rake nvm
RUN rake node

WORKDIR /root
ENV TERM=xterm-256color
CMD ["/bin/zsh"]

RUN pipx install python-lsp-server
RUN ~/nvim-linux-x86_64/bin/nvim '+PlugInstall' '+qall'
RUN /usr/bin/zsh -c 'source ~/.zshrc && omz theme set dockerized'
