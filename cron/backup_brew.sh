#!/bin/bash

cd ~/dotfiles
/usr/local/bin/brew file init
cat ~/.brewfile/Brewfile > homebrew/Brewfile
echo $(date)": Brewfile is updated" >> homebrew/brew.log
