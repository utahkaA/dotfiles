#!/bin/bash

if [ $(uname) = "Darwin" ]; then
  echo ">>> Your system is OS X. Start setting your enviroment"

  # Install Homebrew and Git
  if [ ! -x "$(which brew)" ]; then
    echo ">>> Installing Homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    brew install git
    echo "Successed installing git using brew"

    git clone https://github.com/utahkaA/dotfiles.git ~/dotfiles
    echo "Successed cloning utahkaA/dotfiles"

    cd ~/dotfiles
    brew file install
    echo ">>> Install brew formulas using bundle"
  else
    echo ">>> Homebrew is already installed"
  fi

  if [ -x "$(which pyenv)" ]; then
    echo "Start "
    pyenv install $(pyenv install -l | grep anaconda3 | tail -n 1)
    pyenv install $(pyenv install -l | grep anaconda2 | tail -n 1)
  fi

  # Install powerline
  # Install to the Python user install directory for your platform.
  # Typically ~/.local/
  echo ">>> Start to install powerline using pip"
  pip install --user git+git://github.com/powerline/powerline

  # Install powerline-fonts
  echo ">>> Start to install powerline-fonts via Github"
  git clone https://github.com/powerline/fonts.git
  ./fonts/install.sh
  mv fonts ~/.Trash

  # Install dein.vim
  if [ ! -d ~/.cache/dein ]; then
    mkdir -p ~/.cache/dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    mv installer.sh ~/.Trash
    echo ">>> Successed installing dein.vim"
  else
    echo ">>> dein.vim is already installed"
  fi

  # Install "monokai" color scheme
  if [ ! -e ~/.vim/colors/monokai.vim ]; then
    git clone https://github.com/sickill/vim-monokai.git
    mkdir -p ~/.vim/colors
    mv vim-monokai.git/colors/monokai.vim ~/.vim/colors/
  fi

  # Setting login shell to fish
  if [ $SHELL = "/usr/local/bin/fish" ]; then
    cat /etc/shells <(echo "/usr/local/bin/fish") | sudo tee /etc/shells
    chsh -s /usr/local/bin/fish
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
    ln -sf ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    ln -sf ~/dotfiles/fish/fishfile ~/.config/fish/fishfile
    fisher
  fi

  # Setting cron
  crontab ~/dotfiles/crontab.backup

  # make symbolic link
  ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
  ln -sf ~/dotfiles/.bashrc ~/.bashrc
  ln -sf ~/dotfiles/.emacs.el ~/.emacs.el
  ln -sf ~/dotfiles/.vimrc ~/.vimrc
  ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
  ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
  ln -sf ~/dotfiles/.tar-exclude ~/.tar-exclude
  ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
  cp ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
  cp ~/dotfiles/fish/fishfile ~/.config/fish/fishfile
fi

