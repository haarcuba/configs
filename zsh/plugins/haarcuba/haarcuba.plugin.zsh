alias mc='mc -S /usr/share/mc/skins/dark.ini'
alias ltr='ls -ltr'
alias vim='nvim'
alias vi='nvim'
alias uvvenv='source .venv/bin/activate'
alias prepush=./.git/hooks/pre-push
alias nvim=~/nvim-linux-x86_64/bin/nvim

function _fixDisplay {
    export DISPLAY=:0.0
}

function _loadVirtualEnvironment {
     source ~/venvs/${PWD:t}_python/bin/activate
}

function _configureGitHaarcuba {
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

function _load_heroku {
    export PATH=$HOME/cli-heroku/bin:$PATH
    rehash
}

function githooks_setup {
    cp ~/pre-push .git/hooks/pre-push
}
