# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="haarcuba"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  poetry
  pip
  dnf
  git
  kubectl
  docker
  aws

)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias mc='mc -S /usr/share/mc/skins/dark.ini'
alias ltr='ls -ltr'
alias vim='nvim'
alias vi='nvim'
export PATH=$PATH:$HOME/.local/bin
export PATH=~/go/bin:$PATH
export PATH=~/bin:$PATH

export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim
export EDITOR='nvim'


_fixDisplay() {
    export DISPLAY=:0.0
}

_loadVirtualEnvironment() {
     source ~/venvs/${PWD:t}_python/bin/activate
}

_configureGitHaarcuba() {
    git config user.email haarcuba@gmail.com
    git config user.name "Yoav Kleinberger"
}

function yaml_validate {
  python -c 'import sys, yaml, json; yaml.safe_load(sys.stdin.read())'
}

function yaml2json {
  python -c 'import sys, yaml, json; print(json.dumps(yaml.safe_load(sys.stdin.read())))'
}

function yaml2json_pretty {
  python -c 'import sys, yaml, json; print(json.dumps(yaml.safe_load(sys.stdin.read()), indent=2, sort_keys=False))'
}

function json_validate {
  python -c 'import sys, yaml, json; json.loads(sys.stdin.read())'
}

function json2yaml {
  python -c 'import sys, yaml, json; print(yaml.dump(json.loads(sys.stdin.read())))'
}

bindkey -v

source ~/key-bindings.zsh
source ~/completion.zsh

function _load_heroku {
    export PATH=$HOME/cli-heroku/bin:$PATH
    rehash
}

function nvim {
    zsh -c "source ~/neovim_venv/bin/activate && /usr/bin/nvim $@"
}

function githooks_setup () {
        cp ~/pre-push .git/hooks/pre-push
}

alias prepush=./.git/hooks/pre-push
