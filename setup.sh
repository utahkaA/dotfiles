#!/bin/bash

# Install NeoBundle
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > ~/neobundle_install.sh
sh ~/neobundle_install.sh
rm -rf ~/neobundle_install.sh
git clone https://github.com/sickill/vim-monokai.git
mkdir -p ~/.vim/colors
mv ~/dotfiles/vim-monokai/colors/monokai.vim ~/.vim/colors/monokai.vim

if [ `uname` = "Linux" ]; then
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
