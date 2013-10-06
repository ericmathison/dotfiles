#!/usr/bin/env roundup

describe 'link.sh'

before() {
    project_root=`git rev-parse --show-toplevel`
    rand_num=`od -vAn -N8 -tu8 < /dev/urandom | sed 's/ *//'`

    # This line is really important. If it is missing, calls to link.sh below
    # could quite easily destroy important dotfiles in the actual home directory
    HOME="/tmp/dotfiles-$rand_num"

    mkdir $HOME
}

it_symlinks_vimrc() {
    bash $project_root/link.sh
    [ -h ~/.vimrc ]
}

it_symlinks_vimrc_using_correct_path() {
    bash $project_root/link.sh
    [ "`readlink ~/.vimrc`" = "$project_root/vimrc" ]
}
