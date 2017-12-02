# ========== Files to Source ==========

source_list=(~/scripts/z.sh
             /usr/local/share/chruby/chruby.sh
             ~/.fzf.bash)

for file in "${source_list[@]}"
do
    # make sure file exists before sourcing
    [ -f "$file" ] && source "$file"
done



# ========== Variables ==========

# Eric's Custom Bash Prompt:
color="\[\e[1;32m\]"  # currently green
red="\[\e[1;31m\]"

# end color
close="\[\e[m\]"

function git_head {
    # git-symbolic-ref ouptuts the name of HEAD if it exists. Otherwise repo
    # is in detached head state and we should use git-rev-parse to find a hash.
    # If neither outputs a value, we are not in a git repo and should simply
    # return.
    ref=$(git symbolic-ref --short HEAD 2> /dev/null || git rev-parse --short HEAD 2> /dev/null) || return
    echo "("$ref")"
}

# \u is the username
# \h is the name of my computer
# \w is the current directory
PS1="$color\u@\h: \w $red"'$(git_head)'"$color$ $close"


# for gpg vim plugin
export GPG_TTY=`tty`

# give me lots of history in a custom file in case I switch OSes and it gets
# overwritten
export HISTSIZE=100000 HISTFILE=~/.bhistory
export EDITOR=vim
export PATH=$PATH:/home/eric/scripts/bin



# ========== Aliases ==========

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



# ========== Miscellaneous ==========

if which chruby; then
    chruby ruby
fi

# append to the history file, don't overwrite it
shopt -s histappend
