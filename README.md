dotfiles
========
Backup with `tar` command
-------------------------
```
tar zcvf hoge.tar.gz --exclude-from=${HOME}/.tar-exclude hoge/
```

`.vimrc`
--------
### NeoBundle

Follow the following the link(official README).
- [neobundle.vim](https://github.com/Shougo/neobundle.vim)

### How to install "monokai" color scheme

```
git clone https://github.com/sickill/vim-monokai.git
mkdir -p ~/.vim/colors
mv vim-monokai/colors/monokai.vim ~/.vim/colors/
```

Mac OS X
--------
`.brewfile`
-----------

to generate `Brewfile`

```
brew brewdle dump
```

List of applications installed by `brew` is written on the `Brewfile`.

この `Brewfile` があるディレクトリで、

```
brew brewdle
```

と叩くと、`Brewfile` に書かれているパッケージやアプリケーションなどがインストールされる。ちなみに、`.brewfile` のように改名していても問題ないらしい。

ほかにも、`.brewfile` に書かれていていらないものはその行を消してしまえば、

```
brew brewdle cleanup
```

で、消した行のものはアンインストールしたりしてくれる。

Ubuntu
------
Font
----
Ubunutu では、`apt-get` で `inconsolata` をインストールできる。

```
apt-get install fonts-inconsolata
```

あとはターミナルの Profile を設定して上げれば良い。
