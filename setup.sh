#!/bin/bash

if [ $(uname) = "Darwin" ]; then
  echo ">>> Your system is OS X. Start setting your enviroment"
  echo "=========================================================================="
  # Install Homebrew
  if [ ! -x $(which brew) ]; then
    echo "=========================================================================="
    /usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    if [ -x $(which brew) ]; then
      echo ">>> Successed installing Homebrew"
    fi
  else
    echo ">>> Homebrew is already installed"
  fi

  # Install Git using Homebrew
  if [ -x $(which brew) ]; then
    if ! brew list | grep -q git; then
      echo "=========================================================================="
      brew install git
      echo ">>> Successed installing Git using brew"
    fi
  else
    echo ">>> Git is already installed"
  fi


  # Clone dotfiles
  if [ -x $(which git) ]; then
    echo "=========================================================================="
    git clone https://github.com/utahkaA/dotfiles.git ~/dotfiles
    if [ -d ~/dotfiles ]; then
      echo ">>> Successed cloning utahkaA/dotfiles"
    fi
  fi

  # Install Brewfile using Homebrew
  if [ -x $(which brew) ]; then
    echo "=========================================================================="
    if brew list | grep -q brew-file; then
      echo ">>> brew-file is already installed"
    else
      brew install rcmdnk/file/brew-file
    fi
    if [ ! -d ~/.brewfile/ ]; then
      mkdir ~/.brewfile
      cat ~/dotfiles/homebrew/Brewfile > ~/.brewfile/Brewfile
    fi
    if [ -e ~/.brewfile/Brewfile ]; then
      brew file install
      echo ">>> Install brew formulas using bundle"
    fi
  fi


  # Install Anacondas using pyenv
  if [ -x "$(which pyenv)" ]; then
    echo "=========================================================================="
    echo ">>> Start installing Anaconda2 and Anaconda3"
    pyenv install $(pyenv install -l | grep anaconda3 | tail -n 1)
    pyenv install $(pyenv install -l | grep anaconda2 | tail -n 1)
    pyenv rehash
    pyenv global $(pyenv install -l | grep anaconda3 | tail -n 1)
  fi

  # Install latest Ruby using rbenv
  if [ -x $(which rbenv) ]; then
    rbenv install $(rbenv install -l | \
                        sed 's/ //g' | grep -e '^[1-3].[0-9].[0-9]$' | tail -n 1)
    rbenv rehash
    rbenv global $(rbenv install -l | \
                       sed 's/ //g' | grep -e '^[1-3].[0-9].[0-9]$' | tail -n 1)
  fi

  # Install powerline
  # Install to the Python user install directory for your platform.
  # Typically ~/.local/
  # if [ -x $(which pip) ]; then
  #   echo "=========================================================================="
  #   echo ">>> Start installing powerline using pip"
  #   pyversion=$(python --version 2>&1 | awk -e '{print $2}' | sed -e 's/\./ /g' | \ 
  #               awk -e '{print $1}')
  #   if [ "$(python --version 2>&1 | awk -e '{print $4}')" = "Anaconda" ]; then
  #     is_anaconda=0
  #   fi
  #   if [ $pyversion = "3" -a $is_anaconda = 0 ]; then
  #     # pip install --user https://github.com/powerline/powerline
  #     pip install --user powerline-status
  #   fi
  # fi

  # Install powerline-fonts
  if brew list | grep -q git; then
    if (($(find ~/Library/Fonts -type f | grep powerline | wc -l) == 0)); then
      echo "=========================================================================="
      echo ">>> Start to install powerline-fonts via Github"
      git clone https://github.com/powerline/fonts.git
      ./fonts/install.sh
      rm -rf fonts
    fi
  fi

  # Install dein.vim
  if [ ! -d ~/.cache/dein ]; then
    mkdir -p ~/.cache/dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm installer.sh
    echo ">>> Successed installing dein.vim"
  else
    echo ">>> dein.vim is already installed"
  fi

  # Install "monokai" color scheme
  if [ ! -e ~/.vim/colors/monokai.vim ]; then
    if [ -x $(which git) ]; then
      git clone https://github.com/sickill/vim-monokai.git
      mkdir -p ~/.vim/colors
      mv vim-monokai/colors/monokai.vim ~/.vim/colors/
      rm -rf vim-monokai
    else
      echo ">>> Unknown command 'git'"
    fi
  else
    echo ">>> monokai color scheme has already insalled"
  fi

  # Setting login shell to fish
  if [ ! $SHELL = "/usr/local/bin/fish" ]; then
    cat /etc/shells <(echo "/usr/local/bin/fish") | sudo tee /etc/shells
    if [ -e /usr/local/bin/fish ]; then
      chsh -s /usr/local/bin/fish
    fi
    curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman
    cp ~/dotfiles/fish/config.fish ~/.config/fish/config.fish
    cp ~/dotfiles/fish/fishfile ~/.config/fish/fishfile
    fisher
  fi

  if [ -x $(which git) ]; then
    git clone https://github.com/creationix/nvm.git ~/.nvm
    cd ~/.nvm
    git checkout $(git describe --abbrev=0 --tags)
    git clone https://github.com/passcod/nvm-fish-wrapper.git ~/.config/nvm-wrapper
  fi

  # Setting cron
  crontab ~/dotfiles/cron/crontab.backup

  # make symbolic link
  ln -sf ~/dotfiles/bash/.bashrc ~/.bashrc
  ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
  ln -sf ~/dotfiles/etc/.gitconfig ~/.gitconfig
  ln -sf ~/dotfiles/etc/.latexmkrc ~/.latexmkrc
  ln -sf ~/dotfiles/etc/tar-exclude ~/.tar-exclude
  ln -sf ~/dotfiles/etc/.tmux.conf ~/.tmux.conf
fi

