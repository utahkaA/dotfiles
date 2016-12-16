#!/bin/bash

if [ ! -e ~/.brewfile/Brewfile ]; then
  /usr/local/bin/brew file init
fi
cat ~/.brewfile/Brewfile > ~/dotfiles/homebrew/Brewfile
echo $(date)": Brewfile is updated" >> ~/dotfiles/homebrew/brew.log
