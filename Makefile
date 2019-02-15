all: packages sudo bash vim tmux
.PHONY: packages sudo bash vim tmux

packages:
	sudo apt install vim-gtk neovim build-essential htop mc openssh-server tmux python3-pip arandr netcat-openbsd

sudo:
	sudo bash -c 'printf "%%sudo\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'

zsh:
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	cp zsh/.zshrc ~/

bash:
	cp bash/.bashrc ~/
	sudo cp bash/root.bashrc /root/.bashrc

neovim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim/
	ln -s $(PWD)/vim/neovim/init.vim ~/.config/nvim

vim:
	cp vim/.vimrc ~/
	mkdir ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -af vim/.vim/colors ~/.vim

tmux:
	cp tmux/.tmux.conf ~/
