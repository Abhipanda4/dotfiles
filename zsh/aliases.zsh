alias e="exit"
alias c="clear"
alias o="xdg-open"
alias sudo="sudo -E"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# easy source/edit zshrc
alias sz="source $HOME/.zshrc"
alias ez="nvim $HOME/.zshrc"

# make dir and cd into it
function mkcd() {
	mkdir -p $1 && builtin cd $1
}

# neovim is the way to go
alias vim="nvim"

# tmux with sensible options
alias tmux="tmux -u -2"

# use bat instead of cat
function cat() {
    # TODO: handle empty args
    bat --theme OneHalfDark --color always --style full --paging never "$1" \
        | less --tabs 4 -RS
}

# USEFUL GIT ALIASES
# ==================

# Basic
alias gc="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"

alias gau="git add --update"
alias gs="git status"
alias gd="git diff"
alias gr="git rebase"
alias gco="git checkout"

alias gsa="git stash apply"
alias gst="git stash"

# more useful git log
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Branch specific pull/push
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'
alias gp="git pull"
