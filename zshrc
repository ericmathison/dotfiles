# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ericmathison"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git history-substring-search)
plugins=(git)

# this command expands aliases Ctrl-X a
alias mathpi='echo π'


# ========== Files to Source ==========

source_list=($ZSH/oh-my-zsh.sh
             ~/scripts/z.sh
             /usr/local/share/chruby/chruby.sh
             ~/.private-zsh
             ~/.fzf.zsh)

for file in "${source_list[@]}"
do
    # make sure file exists before sourcing
    [ -f "$file" ] && source "$file"
done



# ========== Variables ==========

# Customize to your needs...
export PATH=/home/eric/scripts/bin:$PATH:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# for gpg vim plugin
export GPG_TTY=`tty`

export EDITOR=vim
export GOPATH=$HOME/go
export FZF_DEFAULT_OPTS='-x'
export BROWSER=firefox
export PATH=$PATH:$GOPATH/bin


# ========== Aliases ==========
pretty_format="format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"

# show graph of all branches/stashes
alias gla="git log --graph --pretty=$pretty_format --abbrev-commit --all"

# just log the current branch
alias gl="git log --pretty=$pretty_format --abbrev-commit"

alias gltrunc="git log --pretty=format:'%h - %an, %ar : %s' --graph --color=always | sed 's/^\(.\{160\}\).\+/\1/' |less -R"
alias gb='git branch -av'
alias gbd='git for-each-ref --sort=committerdate refs/heads/ refs/remotes/ --format="%(committerdate:short) %(objectname:short) %(refname:short)" | sort -r'
alias gst='git status'
alias gco='git checkout'
alias gpom='git push origin master'

alias gg='git grep'

# cd to git root
alias gr='cd "$(git rev-parse --show-toplevel)"'

# Show all uncommitted changes whether files are tracked or not. The downside to
# this implementation is that any changes which are currently staged will no
# longer be staged after running this. Another downside is that it won't show
# deleted files unless the deletion is first staged with git rm. :(
# addendum: I may try adding `git rm $(git ls-files --deleted)` once I've evaluated
# the safety of such a proposition.
alias gadiff='git add "$(git rev-parse --show-toplevel)" && git diff --cached && git reset HEAD'

alias l='ls -lhF --color=auto'
alias la='ls -lhFA --color=auto'
alias ls='ls -F --color=auto'
alias lsa='ls -FA --color=auto'
alias be='bundle exec'
alias am=alsamixer
alias zmu='z mu'
alias zm='z mu' # aliases `zm u` to `z mu`
alias zk='z k'
alias d='cd ~/Desktop'
alias vim='vim -p'
alias vi='vim -p'
alias gcalccmd='rlwrap gcalccmd'
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers"
alias cdgem='function _cdgem(){ cd "$(bundle show $1)" }; _cdgem'



# ========== Key Bindings ==========

# bind P and N for EMACS mode
# bindkey -M emacs '^P' history-substring-search-up
# bindkey -M emacs '^N' history-substring-search-down

# make C-z toggle suspension of vim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi



# ========== Miscellaneous ==========

chruby ruby

function countdown(){
   date1=$((`date +%s` + $1));
   while [ "$date1" -ge `date +%s` ]; do
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
}

function stopwatch(){
  date1=`date +%s`;
   while true; do
    echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
    sleep 0.1
   done
}
