all: packages sudo bash vim tmux
.PHONY: packages sudo bash vim tmux

packages:
	sudo apt install vim-gtk build-essential htop mc openssh-server tmux python3-pip arandr netcat-openbsd

sudo:
	sudo bash -c 'printf "%%sudo\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'

bash:
	cp bash/.bashrc ~/
	sudo cp bash/root.bashrc /root/.bashrc

neovim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim/
	cp vim/neovim/init.vim 

vim:
	cp vim/.vimrc ~/
	mkdir ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -af vim/.vim/colors ~/.vim

tmux:
	cp tmux/.tmux.conf ~/
