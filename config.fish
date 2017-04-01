function l
    ls -lhF --color=auto
end

function la
    ls -lhFA --color=auto
end

function lsa
    ls -FA --color=auto
end

function be
    bundle exec
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
    command vim -p
end

function vi
    vim
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
