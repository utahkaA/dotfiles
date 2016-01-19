# PATH
export PATH="${HOME}/.pyenv/shims:$PATH"
export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

eval "$(rbenv init -)"

# MacVim PATH
if [ -d /Users/utahkaA/Applications/MacVim.app ]; then
    export PATH="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}";
fi

test -r ~/.bashrc && . ~/.bashrc
