function current_dir {
  echo "${PWD/#$HOME/~}"
}

local ret_status="%(?:%{$fg_bold[green]%}$ :%{$fg_bold[red]%}$ %s)"

PROMPT='
%{$fg_bold[green]%}%p\
%{$terminfo[bold]$fg[cyan]%}\
 $(current_dir) \
%{$fg_bold[blue]%}\
$(git_prompt_info)\
%{$fg_bold[yellow]%}
${ret_status}% \
%{$reset_color%}'

# kube-ps1 settings
# https://github.com/jonmosco/kube-ps1
export KUBE_PS1_PREFIX=""
export KUBE_PS1_SUFFIX=""
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_DIVIDER=" "
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PROMPT='
 $(kube_ps1)'$PROMPT

ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})%{$fg[yellow]%}* %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
