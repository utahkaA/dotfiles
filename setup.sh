#!/bin/bash

if [ $(uname) = "Darwin" ]; then
	echo "Your system is OS X. Start setting your enviroment."
	# Install brew
	if [ ! -x "$(which brew)"]; then
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	else
		echo "brew is already installed."
	fi

	# Install formulas with brewdle
	cp .brewfile Brewfile
	brew brewdle
	mv Brewfile ~/.Trash
fi

# Install NeoBundle
if [ -d ~/Applications/MacVim.app ]; then
	curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ~/dotfiles/neobundle_install.sh
	sh ~/dotfiles/neobundle_install.sh
	mv ~/dotfiles/neobundle_install.sh ~/.Trash
	git clone https://github.com/sickill/vim-monokai.git
	mkdir -p ~/.vim/colors
	mv ~/dotfiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim
fi

if [ $(uname) = "Linux" ]; then
	sudo apt-get remove vim-tiny
	sudo apt-get install vim
fi

# make symbolic link
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.emacs.el ~/.emacs.el
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc
ln -sf ~/dotfiles/.tar-exclude ~/.tar-exclude
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
