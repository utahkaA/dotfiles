#!/bin/bash

cd ~/dotfiles
if [ -e Brewfile ]; then
  mv Brewfile ~/.Trash/
fi

if [ -e .brewfile ]; then
  mv .brewfile Brewfile
fi

brew bundle dump
echo $(date)": Brewfile is updated" >> brew.log
