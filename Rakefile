require './rake/packages'

def sudo
  if `whoami`.strip == 'root'
    ''
  else
    'sudo'
  end
end

def distro
  release_text = File.read "/etc/os-release"
  if release_text.include? 'Fedora'
    return :fedora
  elsif release_text.include? 'Ubuntu'
    return :ubuntu
  else
    raise "cannot figure out operating system"
  end
end

desc "install OS level packages"
task :packages do
  install_packages 
end

desc "setup oh-my-zsh"
task :ohmyzsh do
	sh "curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh"
    cp 'zsh/.zshrc', "#{Dir.home}/.zshrc" 
end

desc "setup neovim"
task :neovim do
	sh "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    mkdir_p "#{Dir.home}/.config/nvim/"
    ln_s "#{Dir.pwd}/vim/neovim/init.vim", "#{Dir.home}/.config/nvim"
    cp_r 'vim/.vim/colors',  "#{Dir.home}/.config/nvim"
	sh "pip install neovim ropevim"
end

desc "make gpg use TTY for passwords instead of annoying GUI"
task :"tty-pinentry" do
  case distro
  when :ubuntu
	sh "#{sudo} apt-get install pinentry-tty -y"
	sh "#{sudo} update-alternatives --config pinentry"
  when :fedora
    sh "#{sudo} dnf install -y pinentry-tty"
    mkdir_p "#{Dir.home}/.gnupg"
    open("#{Dir.home}/.gnupg/gpg-agent.conf", 'a') do |f|
      f.write "pinentry-program /usr/bin/pinentry-tty\n"
    end
  end
end

desc "setup tmux"
task :tmux do
    cp 'tmux/.tmux.conf', Dir.home
    mkdir_p "#{Dir.home}/.tmux/plugins"
	sh "git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm"
    puts File.read 'tmux/README.md'
end

desc "run all tasks on a fresh machine"
task :all => [ :packages, :neovim, :ohmyzsh, :tmux, :"tty-pinentry", ]
