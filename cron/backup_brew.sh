#!/bin/bash

cd ~/dotfiles
brew file init
cat ~/.brewfile/Brewfile > homebrew/Brewfile
echo $(date)": Brewfile is updated" >> homebrew/brew.log
