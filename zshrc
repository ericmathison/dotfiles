# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="ericmathison"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
plugins=(git)
 # history-substring-search
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/home/eric/node_modules/cssbeautify/bin:/home/eric/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

alias gl="git log --pretty=format:'%h - %an, %ar : %s' --graph"
alias gltrunc="git log --pretty=format:'%h - %an, %ar : %s' --graph --color=always | sed 's/^\(.\{160\}\).\+/\1/' |less -R"
alias gb='git branch -av'
alias gst='git status'
alias gco='git checkout'
alias gpom='git push origin master'
alias gr='cd "$(git rev-parse --show-toplevel)"'
# alias 'mit-scheme'='rlwrap mit-scheme'
# alias 'node'='rlwrap node'
alias r='pushd +1'
alias l='ls -CF'
alias la='ls -CFA'
alias hackernews='(midori https://news.ycombinator.com &)'
alias be='bundle exec'

# for gpg vim plugin
GPG_TTY=`tty`
export GPG_TTY

# z - Jump around - https://github.com/rupa/z
source ~/Documents/software/z/z.sh

source /usr/local/share/chruby/chruby.sh
chruby 2.0.0-p247

source ~/.oh-my-zsh/plugins/history-substring-search/history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# make C-z toggle suspension of vim
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

source ~/.redis-credentials
