#!/usr/bin/env bash

# Copied from:
# http://jmatthews.us/blog/2012/10/27/dots-pt1/

# Ignore certain files using egrep's extended regular expressions
IGNORE="(link.sh|test/.*)"

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo -e "\e[1;35mSymlinking config files:\e[m"
for file in $(git ls-files | egrep -v $IGNORE)
do
  if [ "$(readlink ~/.$file)" != "$DIR/$file" ]
  then
      echo $file
      [ ! -d `dirname ~/.$file` ] && mkdir -p `dirname ~/.$file`
      rm -rf ~/.$file
      ln -s $DIR/$file ~/.$file
  fi
done
