# claude — oh-my-zsh plugin for Claude Code

Tab completion, aliases and a few helpers for the `claude` CLI.

## Install

```zsh
ln -s "$PWD" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/claude"   # run from this directory
```

Add `claude` to the `plugins=(...)` list in `~/.zshrc`, then:

```zsh
rm -f ~/.zcompdump*   # so compinit picks up the new completion
exec zsh
```

## Aliases

| Alias | Command |
|---|---|
| `cl` | `claude` |
| `clc` | `claude --continue` |
| `clr` | `claude --resume` |
| `clp` | `claude --print` |
| `clw` | `claude --worktree` |
| `clplan` | `claude --permission-mode plan` |
| `clauto` | `claude --permission-mode auto` |
| `clbg` | `claude --bg` |
| `clag` | `claude agents` |
| `clmcp` / `clmcpl` | `claude mcp` / `claude mcp list` |
| `clplug` | `claude plugin` |
| `cldoc` | `claude doctor` |
| `clup` | `claude update` |
| `clv` | `claude --version` |

Turn the aliases off (before oh-my-zsh is sourced): `zstyle ':omz:plugins:claude' aliases no`

## Functions

- `clask how do I ...` — one-shot question, no quoting needed.
- `git diff | clpipe write a commit message` — send stdin with an instruction.
- `clfix` — re-runs the previous command and asks Claude why it failed (it really runs the command again, so don't use it after anything destructive).
- `clm opus [args]` — start a session with a given model.

## Completion

Completes options, choice values (`--model`, `--effort`, `--permission-mode`, `--output-format` …), subcommands, `mcp` subcommands and server names, and session ids for `--resume` in the current directory.
