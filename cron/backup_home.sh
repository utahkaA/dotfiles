#!/bin/bash
if [ -e /Volumes/utopia ]; then
  tar zcvf /Volumes/utopia/$(date "+%Y%m%d")".tar.gz" --exclude-from=${HOME}/.tar-exclude ${HOME}
else
  tar zcvf $(date "+%Y%m%d")".tar.gz" --exclude-from=${HOME}/.tar-exclude ${HOME}
fi
