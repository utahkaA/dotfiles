# --- Env Variouses ---
set -x EDITOR '/Applications/MacVim.app/Contents/MacOS/Vim'

# --- Aliases ---
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# --- Setting pyenv ---
set -x PYENV_ROOT ~/.pyenv
set -x PATH $PYENV_ROOT/bin $PATH
. (pyenv init - | psub)
