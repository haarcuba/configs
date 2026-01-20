local ret_status="%(?:%{$fg_bold[green]%}X %n@%m:%{$fg_bold[red]%}X )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(date +"%a %H:%M:%S"
) $(git_prompt_info)
$ '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
