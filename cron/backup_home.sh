#!/bin/bash
if [ -e /Volumes/utopia ]; then
  cd ~
  tar zcvf /Volumes/utopia/$(date "+%Y%m%d")".tar.gz" --exclude-from=${HOME}/dotfiles/etc/tar-exclude .
else
  cd ~
  tar zcvf ~/Backup/$(date "+%Y%m%d")".tar.gz" --exclude-from ${HOME}/dotfiles/etc/tar-exclude .
fi
