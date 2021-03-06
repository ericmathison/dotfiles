if test -d /usr/local/go/bin
    set PATH /usr/local/go/bin $PATH
end

set PATH /home/eric/scripts/bin $PATH /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# for gpg vim plugin
set GPG_TTY tty

set EDITOR vim
set BROWSER firefox
set GOPATH $HOME/go
set PATH $PATH $GOPATH/bin
set -x RAILS_SYSTEM_TESTING_SCREENSHOT simple
set -x MOZ_USE_XINPUT2 1

set fish_greeting ''

if test -e ~/scripts/z.fish
    source ~/scripts/z.fish
end

function l
    ls -lhF --color=auto $argv
end

function la
    ls -lhFA --color=auto $argv
end

function lsa
    ls -FA --color=auto $argv
end

function be
    bundle exec $argv
end

function am
    alsamixer
end

function zmu
    z mu
end

function zm # aliases 'zm u' to 'z mu'
    z mu
end

function d
    cd ~/Desktop
end

function vim
    command vim -p $argv
end

function vi
    vim $argv
end

function v
    vis $argv
end

function gcalccmd
    rlwrap gcalccmd
end

function t
    gvfs-trash $argv
end

function trash
    gvfs-trash $argv
end

function pryr
    pry -r ./config/environment -r rails/console/app -r rails/console/helpers
end

function cdgem
    cd (bundle show $argv)
end

function gb
    git branch -avv
end

function gst
    git status $argv
end

function gco
    git checkout $argv
end

function gpom
    git push origin master
end

function gg
    git grep $argv
end

function gr
    cd (git rev-parse --show-toplevel)
end

function gl
    set -l pretty_format "format:%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
    git log --pretty=$pretty_format --abbrev-commit $argv
end

function gla
    set -l pretty_format "format:%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset"
    git log --graph --pretty=$pretty_format --abbrev-commit --all
end

function gdiff
    git add (git rev-parse --show-toplevel)
    and git diff --cached
    and git reset HEAD
end

# look here for configuration options:
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_git_prompt.fish
set red (set_color red)
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_color_branch red

# original fish_prompt function with __fish_git_prompt added
function fish_prompt --description 'Write out the prompt'
    set -l color_cwd
    set -l suffix
    switch $USER
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '>'
    end

    echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt) "$suffix "
end

function fish_user_key_bindings
    # hit escape key once to clear line
    bind \e beginning-of-buffer kill-line

    # twice to exit
    bind \e\e exit
end

function nvm
    bass source ~/.nvm/nvm.sh --no-use ';' nvm $argv
end

nvm use default > /dev/null

fry ruby > /dev/null
