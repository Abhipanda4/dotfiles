# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

export VISUAL=vim
export EDITOR="$VISUAL"
export BROWSER=firefox
export VIRTUAL_ENV_DISABLE_PROMPT=1

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Add to history instead of overriding it
shopt -s histappend

# History lenght
HISTSIZE=1000
HISTFILESIZE=2000

# Window size sanity check
shopt -s checkwinsize

# User/root variables definition
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Colored XTERM promp
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# Colored prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function set_virtualenv () {
	if [[ -n "$VIRTUAL_ENV" ]]; then
		venv="$(tput setaf 1) → [venv]"
	else
		venv=""
	fi
	[[ -n "$venv" ]] && echo "$venv"
}
# Prompt
if [ -n "$SSH_CONNECTION" ]; then
	export PS1="\n\[$(tput setaf 1)\]┌─╼ [abhipanda]╺─╸\[$(tput setaf 3)\][\w]$(set_virtualenv) \n\[$(tput setaf 3)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \$(parse_git_branch)\\[$(tput setaf 2)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 2)\][ssh]\"; fi) \[$(tput setaf 4)\]"
else
	export PS1="\n\[$(tput setaf 1)\] ┌─╼ [abhipanda]╺─╸\[$(tput setaf 3)\][\w]$(set_virtualenv) \n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\] └────╼\$(parse_git_branch)\"; else echo \"\[$(tput setaf 1)\] └╼\"; fi) \[$(tput setaf 6)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# man pages
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;34;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;31m'
