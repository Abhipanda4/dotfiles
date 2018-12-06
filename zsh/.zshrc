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
export PATH="/home/abhipanda/.gem/ruby/2.5.0/bin:$PATH"

# Set name of the theme to load.
ZSH_THEME="refined_panda"

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
source $HOME/.aliases

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
