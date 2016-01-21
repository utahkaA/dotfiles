# MacVim PATH
if [ `uname` = "Darwin" ]; then
	if [ -d /Users/utahkaA/Applications/MacVim.app ]; then
    		export PATH="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}";
	fi

    export PATH="${HOME}/.pyenv/shims:$PATH"
    export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
    export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

    eval "$(rbenv init -)"
fi

test -r ~/.bashrc && . ~/.bashrc
