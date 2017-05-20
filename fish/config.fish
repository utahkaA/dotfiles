# --- Env Variouses ---
set -x EDITOR '/Applications/MacVim.app/Contents/MacOS/Vim'

set PATH /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /Library/TeX/texbin
set PATH /usr/local/opt/gnu-tar/libexec/gnubin $PATH
set PATH ~/.local/bin $PATH
set PATH ~/.nodebrew/current/bin $PATH

set -x LANG "en_US.UTF-8"
set -x LC_TYPE "en_US.UTF-8"
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_MESSAGE "en_US.UTF-8"
set -x LC_PAPER "en_US.UTF-8"
set -x LC_NAME "en_US.UTF-8"
set -x LC_ADDRESS "en_US.UTF-8"
set -x LC_TELEPHONE "en_US.UTF-8"
set -x LC_MEASUREMENT "en_US.UTF-8"
set -x LC_INDENTIFICATION "en_US.UTF-8"
set -x LC_ALL "en_US.UTF-8"

set -x NODE_PATH (npm root -g)

# --- Aliases ---
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

function ls
  /usr/local/bin/gls --color $argv
end

function la
  /usr/local/bin/gls --color -a $argv
end

function ll
  /usr/local/bin/gls --color -l $argv
end

function mv
  /usr/local/bin/gmv $argv
end

# --- Setting pyenv ---
set -x PYENV_ROOT ~/.pyenv
# set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
. (rbenv init - | psub)
