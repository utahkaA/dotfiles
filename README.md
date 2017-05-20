dotfiles
========
Backup with `tar` command
-------------------------
```
tar zcvf hoge.tar.gz --exclude-from=${HOME}/.tar-exclude hoge/
```

Mac OS X
--------
Setup
------
<!-- - show bundle progress bar -->
### 1. Run script setup_all.sh
Run the following command to download my setup_all.sh

```
curl https://raw.githubusercontent.com/utahkaA/dotfiles/master/setup_all.sh
chmod +x setup_all.sh
./setup_all.sh
```

This command install {Homebrew, Homebrew formulas, Git, powerline, dein.vim} and set up cron.

### 2. Google Chrome
Go to `chrome://flags/#top-chrome-md` and change it's value to `Non-material`

### 3. Install Microsoft Office
### 4. Clean Finder side menu

Brew-file
---------
Python 2 is Needed.

`Brewfile`
-----------
To generate `Brewfile`

```
brew bundle dump
```

List of applications installed by `brew` is written on the `Brewfile`.
Excuting the following command installs packages or applications written in `Brewfile`.

```
brew bundle
```

In addition, you can uninstall softwares which you don not need written in Brewfile by deleting that line and excuting:

```
brew bundle cleanup
```

`Powerline-fonts`
-----------------
To install powerline fonts.

```
cd ~/Desktop
git clone git@github.com:powerline/fonts.git
./fonts/install.sh
```

Change iTerm font.

Ubuntu
------
Installation of Inconsolata on Ubuntu
-------------------------------------
run the command below.

```
apt-get install fonts-inconsolata
```

With the font installed, we can set our terminal's font by editing the menu `Edit/Profiles`.
