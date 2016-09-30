#!/bin/bash
if [ -e /Volumes/utopia ]; then
  tar zcvf /Volumes/utopia/$(date "+%Y%m%d")".tar.gz" --exclude-from=${HOME}/.tar-exclude ${HOME}
else
  cd ~
  tar zcvf ~/Backup/$(date "+%Y%m%d")".tar.gz" --exclude-from ${HOME}/dotfiles/etc/tar-exclude .
fi
