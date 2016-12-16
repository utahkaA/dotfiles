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

to generate `Brewfile`

```
brew bundle dump
```

List of applications installed by `brew` is written on the `Brewfile`.

run the command below in the directory which has `Brewfile`.

```
brew bundle
```

`Brewfile` に書かれているパッケージやアプリケーションなどがインストールされる。

ほかにも、`Brewfile` に書かれていていらないものはその行を消してしまえば、

```
brew bundle cleanup
```

で、消した行のものはアンインストールしたりしてくれる。

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

