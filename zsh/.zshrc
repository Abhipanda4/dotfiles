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

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/sbin:$PATH"

# Set name of the theme to load.
ZSH_THEME="agnoster"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
ENABLE_CORRECTION="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Dimmed color for autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'
