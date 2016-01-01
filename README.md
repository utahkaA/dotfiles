dotfiles
========
Backup with `tar` command
-------------------------
```
tar zcvf hoge.tar.gz --exclude-from=${HOME}/.tar-exclude hoge/
```

`.brewfile`
-----------
```
brew brewdle dump
```

と叩くと、`Brewfile` というのが生まれる。ここに `brew` でもってきたものが書かれる。

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
