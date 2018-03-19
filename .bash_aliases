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
