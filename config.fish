set PATH /home/eric/scripts/bin $PATH /usr/local/go/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# for gpg vim plugin
set GPG_TTY tty

set EDITOR vim
set GOPATH $HOME/go
set BROWSER firefox
set PATH $PATH $GOPATH/bin

set fish_greeting ''

if test -e ~/scripts/z.fish
    source ~/scripts/z.fish
end

if test -e /usr/local/share/chruby/chruby.fish
    source /usr/local/share/chruby/chruby.fish
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

function gcalccmd
    rlwrap gcalccmd
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
    git branch -av
end

function gst
    git status
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
