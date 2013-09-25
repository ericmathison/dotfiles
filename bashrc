# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Eric's Custom Bash Prompt:
color="\[\e[1;93m\]"
red="\[\e[1;31m\]"

# end color
close="\[\e[m\]"

# \u is the username
# \h is the name of my computer
# \w is the current directory
# __git_ps1 retrieves the git branch name if in a git repository
PS1="$color\u@\h: \w $red"'$(__git_ps1 "(%s)")'"$color[\j]$ $close"

# Do some quoting magic so that the formatting string will have surrounding
# quotes both when run directly and after doing shell expansion interactively
# with C-M-e (to edit the branch name).
alias gl="git log --pretty=format:\''%h - %an, %ar : %s'\' -20"
alias gb='git branch -av'
alias gst='git status'
alias gco='git checkout'
# alias 'mit-scheme'='rlwrap mit-scheme'
# alias 'node'='rlwrap node'
alias r='pushd +1'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export PATH=$PATH:/home/eric/bin

# for gpg vim plugin
GPG_TTY=`tty`
export GPG_TTY

# give me lots of history in a custom file in case I switch OSes and it gets overwritten
export HISTSIZE=100000 HISTFILE=~/.bhistory
export EDITOR=vim

# z - Jump around - https://github.com/rupa/z
source ~/bin/z.sh

source /usr/local/share/chruby/chruby.sh
chruby 2.0.0-p247
