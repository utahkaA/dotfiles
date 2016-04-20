# Mac Profile
if [ `uname` = "Darwin" ]; then
	if [ -d ~/Applications/MacVim.app ]; then
		export PATH="${HOME}/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}"
	fi

	export PATH="${HOME}/.pyenv/shims:$PATH"
	export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
	# export PATH="${HOME}/.nodebrew/current/bin:${PATH}"

	if [ -x $(which rbenv) -a -x $(which pyenv) ]; then
		eval "$(rbenv init -)"
		eval "$(pyenv init -)"
	fi

fi

# Linux Profile
if [ `uname` = "Linux" ]; then
	export PATH="${HOME}/.rbenv/bin:${PATH}"
	eval "$(rbenv init -)"
fi
test -r ~/.bashrc && . ~/.bashrc
