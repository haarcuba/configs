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
    sh 'sudo chsh -s $(which zsh) $(whoami)'
    cp 'zsh/haarcuba.zsh-theme',   "#{Dir.home}/.oh-my-zsh/themes/"
    cp 'zsh/dockerized.zsh-theme', "#{Dir.home}/.oh-my-zsh/themes/"
    cp 'zsh/key-bindings.zsh', Dir.home
    cp 'zsh/completion.zsh', Dir.home
end

desc "setup neovim"
task :neovim do
    nvim_install_dir = "#{Dir.home}/nvim-linux-x86_64"
    unless Dir.exist?(nvim_install_dir)
      sh "tar -xzf #{Dir.pwd}/vim/neovim/nvim-linux-x86_64.tar.gz -C #{Dir.home}"
    else
      puts "Neovim already installed at #{nvim_install_dir}, skipping extraction"
    end

    # Install vim-plug
    sh "curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    # Setup config files
    mkdir_p "#{Dir.home}/.config/nvim/lua"
    ln_s "#{Dir.pwd}/vim/neovim/init.vim", "#{Dir.home}/.config/nvim/"
    ln_s "#{Dir.pwd}/vim/neovim/legacy.vim", "#{Dir.home}/.config/nvim"
    ln_s "#{Dir.pwd}/vim/neovim/config.lua", "#{Dir.home}/.config/nvim/lua"
    cp_r 'vim/.vim/colors',  "#{Dir.home}/.config/nvim"
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

desc "git configs"
task :git_config do
  sh "git config --global alias.remaster 'branch -f master origin/master'"
  sh "git config --global alias.fp 'push --force-with-lease'"
  sh "git config --global rerere.enabled true"
  sh "git config --global init.defaultBranch master"
end

desc "make AMI"
task :ami do
  sh "packer init ./pinuk_ami.pkr.hcl"
  sh "packer build ./pinuk_ami.pkr.hcl"
end

desc "add me to the docker group"
task :docker_group do
  sh 'sudo usermod -aG docker $(whoami)'
end

desc "setup prepush script"
task :prepush do
  cp "pre-push", Dir.home
end

desc "configure ptpython"
task :ptpython do
  destination_directory = "#{Dir.home}/.config/ptpython"
  mkdir_p destination_directory
  cp "ptpython/config.py", "#{destination_directory}/config.py"
  cp "ptpython/sync.py", Dir.home
end

desc "install nvm (Node Version Manager)"
task :nvm do
  nvm_dir = "#{Dir.home}/.nvm"
  unless Dir.exist?(nvm_dir)
    sh "curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash"
  else
    puts "nvm already installed at #{nvm_dir}, skipping installation"
  end
end

desc "install latest stable node version using nvm"
task :node => :nvm do
  sh ". #{Dir.home}/.nvm/nvm.sh && nvm install --lts && nvm use --lts"
end

desc "make a workstation docker image"
task :dockerize do
  sh "docker build --no-cache --progress=plain -t haarcuba/workstation:latest ."
end

desc "run all tasks on a fresh machine"
task :all => [ :packages, :neovim, :ohmyzsh, :tmux, :"tty-pinentry", :git_config, :prepush ]
