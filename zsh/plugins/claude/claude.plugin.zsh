# oh-my-zsh plugin for the Claude Code CLI (`claude`)
#
# Provides: tab completion (see _claude), short aliases, and a few helpers.
# Disable the aliases with:  zstyle ':omz:plugins:claude' aliases no

if (( ! $+commands[claude] )); then
  return
fi

# Make sure the completion function next to this file is found, even when the
# plugin is sourced outside oh-my-zsh (oh-my-zsh adds plugin dirs to fpath itself).
fpath=("${0:A:h}" $fpath)

if zstyle -T ':omz:plugins:claude' aliases; then
  alias cl='claude'
  alias clc='claude --continue'             # continue last session in this dir
  alias clr='claude --resume'               # pick a session to resume
  alias clp='claude --print'                # one-shot, print and exit
  alias clw='claude --worktree'             # session in a fresh git worktree
  alias clplan='claude --permission-mode plan'
  alias clauto='claude --permission-mode auto'
  alias clbg='claude --bg'                  # start a background session
  alias clag='claude agents'                # list background sessions
  alias clmcp='claude mcp'
  alias clmcpl='claude mcp list'
  alias clplug='claude plugin'
  alias cldoc='claude doctor'
  alias clup='claude update'
  alias clv='claude --version'
fi

# clask <question...>  — quick one-shot question, no quoting needed.
#   clask how do I list open ports on linux
clask() {
  if (( $# == 0 )); then
    echo "usage: clask <question...>" >&2
    return 1
  fi
  claude --print -- "$*"
}

# <cmd> | clpipe <instruction...>  — send stdin to Claude with an instruction.
#   git diff | clpipe write a commit message for this
#   cat error.log | clpipe what went wrong
clpipe() {
  if [[ -t 0 ]]; then
    echo "usage: <command> | clpipe <instruction...>" >&2
    return 1
  fi
  claude --print -- "${*:-Explain this.}"
}

# clfix  — re-run the previous command, capture its output, and ask Claude why it failed.
clfix() {
  local last
  last=$(fc -ln -1)
  last=${last## }
  if [[ -z $last || $last == clfix* ]]; then
    echo "clfix: no previous command to analyse" >&2
    return 1
  fi
  local out
  out=$(eval "$last" 2>&1)
  local rc=$?
  printf 'Command: %s\nExit code: %d\nOutput:\n%s\n' "$last" "$rc" "$out" \
    | claude --print -- "This shell command misbehaved. Explain the cause briefly and give the corrected command."
}

# clm <model> [args...]  — start a session with a given model (fable, opus, sonnet, haiku, or full id).
clm() {
  if (( $# == 0 )); then
    echo "usage: clm <model> [claude args...]" >&2
    return 1
  fi
  local model=$1; shift
  claude --model "$model" "$@"
}
