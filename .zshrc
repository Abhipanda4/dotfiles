# env variable settings
export DEFAULT_USER="abhipanda"
export TERM="xterm-256color"
export ZSH="/home/abhipanda/.oh-my-zsh"

# for colorized man pages
export LESS_TERMCAP_mb=$'\e[0;33m'
export LESS_TERMCAP_md=$'\e[0;35m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;34;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[0;31m'

# added by Miniconda3 installer
export PATH="/home/abhipanda/miniconda3/bin:$PATH"

# Set name of the theme to load.
ZSH_THEME="agnoster"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Aliases to work faster
alias e="exit"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# update packages
alias pacup="sudo pacman -Syu"

# basic git usage
alias ga="git add"
alias gs="git status"
alias gc="git commit -m"
alias gpush="git push origin master"

# make dir and cd into it
mkcd () {
	mkdir $1 && cd $1
}

# Misc.
alias sudo="sudo -E"
