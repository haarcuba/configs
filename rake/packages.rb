
def install_packages
  case distro
  when :ubuntu
    ubuntu_packages()
  when :fedora
    fedora_packages()
  end

  sh "curl -LsSf https://astral.sh/uv/install.sh | sh"
end

def ubuntu_packages
  sh "#{sudo} apt-get install -y diodon fzf git build-essential htop mc openssh-server tmux arandr netcat-openbsd zsh exuberant-ctags curl python-is-python3 python3-pip python3-venv docker.io docker-buildx ripgrep cmake pipx"
  sh "pipx ensurepath"
end

def fedora_packages
  sh "#{sudo} dnf groupinstall -y 'Development Tools'"
  sh "#{sudo} dnf install -y htop mc tmux zsh python3-pip"
end
