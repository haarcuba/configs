all: packages bash neovim tmux lab zsh
.PHONY: packages sudo bash vim tmux zsh lab neovim

packages:
	sudo apt-get install -y vim-gtk neovim build-essential htop mc openssh-server tmux arandr netcat-openbsd zsh ctags curl python-is-python3

docker-packages:
	sudo apt-get install -y  neovim build-essential htop mc  tmux arandr netcat-openbsd zsh ctags curl git

lab:
	sudo cp lab/lab /usr/local/bin/lab

sudo:
	sudo bash -c 'printf "%%sudo\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers'

zsh:
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	cp zsh/.zshrc ~/

bash:
	cp bash/.bashrc ~/
	sudo cp bash/root.bashrc /root/.bashrc

neovim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	mkdir -p ~/.config/nvim/
	ln -s $(PWD)/vim/neovim/init.vim ~/.config/nvim
	cp -af vim/.vim/colors ~/.config/nvim

vim:
	cp vim/.vimrc ~/
	mkdir ~/.vim
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	cp -af vim/.vim/colors ~/.vim

cinnamon-config:
	dconf load /org/cinnamon < ./cinnamon.dconf

tmux:
	cp tmux/.tmux.conf ~/

tty-based-pinentry:
	sudo apt-get install pinentry-tty -y
	sudo update-alternatives --config pinentry
