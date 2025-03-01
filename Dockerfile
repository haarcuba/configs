FROM ubuntu:24.10
ARG ME_USERNAME=me

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Jerusalem

RUN apt-get update
RUN apt-get install -y sudo readline-common bash-completion rake pipx tzdata git
RUN ln -fs /usr/share/zoneinfo/UTC /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
RUN bash -c 'printf "${ME_USERNAME}\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'

RUN echo useradd -m ${ME_USERNAME} > /zbabi
RUN useradd -m ${ME_USERNAME}

USER ${ME_USERNAME}
WORKDIR /home/${ME_USERNAME}

RUN git clone https://github.com/haarcuba/configs.git

WORKDIR /home/${ME_USERNAME}/configs

RUN rake packages
RUN rake neovim
RUN rake ohmyzsh
RUN rake tmux
RUN rake tty-pinentry
RUN rake git_config
RUN rake prepush

WORKDIR /home/${ME_USERNAME}
ENV USER=${ME_USERNAME}
CMD ["/bin/zsh"]
