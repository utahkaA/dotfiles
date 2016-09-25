#!/bin/bash

# make symbolic link
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.emacs.el ~/.emacs.el
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/dotfiles/.tar-exclude ~/.tar-exclude
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

if [ $(uname) = "Darwin" ]; then
	echo ">>> Your system is OS X. Start setting your enviroment"

	# Install Homebrew
	if [ ! -x "$(which brew)" ]; then
    echo "Installing Homebrew"
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo ">>> Homebrew is already installed"
	fi

	# Install formulas using brewdle
  if [ -e Brewfile ]; then
    echo ">>> Install brew formulas with brewdle"
    brew bundle
  fi

  # Install dein.vim
  if [ ! -d ~/.cache/dein ]; then
    mkdir -p ~/.cache/dein
    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    mv installer.sh ~/.Trash
  else
    echo ">>> dein.vim is already installed"
  fi

  # Setting login shell to fish
  if [ $SHELL = "/usr/local/bin/fish" ]; then
    echo "If you wanna use fish, you add the following line to /etc/shells" > for_fish
    echo "  /usr/local/bin/fish" >> for_fish
    echo "Run the following command to change login shell" >> for_fish
    echo "  chsh -s /usr/local/bin/fish" >> for_fish
    echo "Run the following command to install fisherman" >> for_fish
    echo "  curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisherman" >> for_fish
    echo "Plz make symbolic link to ~/.config/fish/" >> for_fish
    echo "  ln -sf ~/dotfiles/config.fish ~/.config/fish/config.fish"
    echo "  ln -sf ~/dotfiles/fishfile ~/.cofig/fish/fishfile"
    echo "Run the last command" >> for_fish
    echo "  fisher" >> for_fish
  fi
fi

if [ $(uname) = "Linux" ]; then
	sudo apt-get remove vim-tiny
	sudo apt-get install vim
fi
