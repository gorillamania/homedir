#!/bin/bash

# Abort on error
set -e

cd ~
for file in .vimrc .vim .selected_editor .profile .hushlogin ; do
  if [ -h $file ] ; then
    # File is already a symbolic link
    echo "Symlink for $file is already there"
    continue
  fi
  if [ -d $file -o -f $file ] ; then 
    echo "Backing up existing $file to $file.b4homedir"
    rm -rf $file.b4homedir
    mv $file $file.b4homedir
  fi
  echo "Creating symlink for $file"
  ln -s homedir/$file
done
