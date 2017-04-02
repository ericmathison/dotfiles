set PATH /home/eric/scripts/bin $PATH /usr/local/go/bin /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# for gpg vim plugin
set GPG_TTY tty

set EDITOR vim
set GOPATH $HOME/go
set BROWSER firefox
set PATH $PATH $GOPATH/bin

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
