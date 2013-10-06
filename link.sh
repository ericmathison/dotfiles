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
      if test ! -d `dirname ~/.$file`
      then
          mkdir -p `dirname ~/.$file`
      fi
      if test -h ~/.$file
      then
          unlink ~/.$file
      fi
      rm -rf ~/.$file 2>&1 >/dev/null
      ln -sf $DIR/$file ~/.$file
  fi
done

