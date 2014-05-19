# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Eric's Custom Bash Prompt:
color="\[\e[1;32m\]"  # currently green
red="\[\e[1;31m\]"

# end color
close="\[\e[m\]"

# \u is the username
# \h is the name of my computer
# \w is the current directory
# __git_ps1 retrieves the git branch name if in a git repository
PS1="$color\u@\h: \w $red"'$(__git_ps1 "(%s)")'"$color$ $close"

# Do some quoting magic so that the formatting string will have surrounding
# quotes both when run directly and after doing shell expansion interactively
# with C-M-e (to edit the branch name).
alias gl="git log --pretty=format:\''%h - %an, %ar : %s'\' -20"
alias gb='git branch -av'
alias gst='git status'
alias gco='git checkout'
alias l='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'
alias ls='ls -F --color=auto'
alias lsa='ls -FA --color=auto'

export PATH=$PATH:/home/eric/bin

# for gpg vim plugin
export GPG_TTY=`tty`

# give me lots of history in a custom file in case I switch OSes and it gets overwritten
export HISTSIZE=100000 HISTFILE=~/.bhistory
export EDITOR=vim

# z - Jump around - https://github.com/rupa/z
source ~/bin/z.sh

source /usr/local/share/chruby/chruby.sh
chruby 2.0.0-p247

# Fuzzy Finder: https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
