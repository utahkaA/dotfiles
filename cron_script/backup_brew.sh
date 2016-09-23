cd ~/dotfiles
if [ -e .brewfile ]; then
  mv .brewfile Brewfile
fi

brew bundle dump
echo $(date)": Brewfile is updated"
