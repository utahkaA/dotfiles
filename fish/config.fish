# --- Env Variouses ---
set -x EDITOR '/Applications/MacVim.app/Contents/MacOS/Vim'
set -x PATH "/usr/local/opt/gnu-tar/libexec/gnubin" $PATH

# --- Aliases ---
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# --- Setting pyenv ---
set -x PYENV_ROOT ~/.pyenv
# set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
