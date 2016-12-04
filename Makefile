all: packages sudo bash terminator vim tmux

packages:
	sudo apt-get install aptitude
	sudo aptitude update
	sudo aptitude safe-upgrade -y
	sudo aptitude install vim-gtk build-essential terminator htop mc ipython openssh-server tmux python3-pip -y

config-sudo:
	sudo bash -c 'printf "%sudo\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'

config-bash:
	cp bash/.bashrc ~/
	sudo cp bash/root.bashrc /root/.bashrc

config-terminator:
	mkdir -p ~/.config/terminator
	cp terminator/config ~/.config/terminator/config

config-vim:
	cp vim/.vimrc ~/
	mkdir ~/.vim
	cp -af vim/.vim/colors ~/.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle

config-tmux:
	cp tmux/.tmux.conf ~/
