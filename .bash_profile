# Mac Profile
if [ `uname` = "Darwin" ]; then
	if [ -d ~/Applications/MacVim.app ]; then
		export PATH="${HOME}/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}"
	fi
  export EDITOR=vim
  # set locale vars.
  export LANG="en_US.UTF-8"
  export LC_TYPE="en_US.UTF-8"
  export LC_NUMERIC="en_US.UTF-8"
  export LC_TIME="en_US.UTF-8"
  export LC_COLLATE="en_US.UTF-8"
  export LC_MONETARY="en_US.UTF-8"
  export LC_MESSAGE="en_US.UTF-8"
  export LC_PAPER="en_US.UTF-8"
  export LC_NAME="en_US.UTF-8"
  export LC_ADDRESS="en_US.UTF-8"
  export LC_TELEPHONE="en_US.UTF-8"
  export LC_MEASUREMENT="en_US.UTF-8"
  export LC_INDENTIFICATION="en_US.UTF-8"
  export LC_ALL="en_US.UTF-8"

  export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"
  export PATH="${HOME}/.pyenv/shims:$PATH"
  export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export ARCHFLAGS='-arch i386 -arch x86_64'
  export XDG_CONFIG_HOME="${HOME}/.config" # for NeoVim

  eval "$(rbenv init -)"

  # setting of aliases
  if [ -e /Applications/MacVim.app/ ]; then
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
  elif [ -e /Users/utahka/Applications/MacVim.app/ ]; then
    alias vim="/Users/utahka/Applications/MacVim.app/Contents/MacOS/Vim"
  elif [ -e /Users/utahkaA/Applications/MacVim.app/ ]; then
    alias vim="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim"
  else
    echo "Didnt find MacVim.app in this machine."
  fi
  alias sudo='sudo -E'
  alias ls="gls"
  alias ll="ls -hl"
  alias la="ls -a"
  alias ls="ls --color=auto -F"
  alias awk="gawk"
  alias sed="gsed"
  alias date="gdate"
  alias readlink="greadlink"
  alias grep="grep --color"
  alias julia="/Applications/Julia-0.5.app/Contents/Resources/julia/bin/julia"
fi

# Linux Profile
if [ `uname` = "Linux" ]; then
	export PATH="${HOME}/.rbenv/bin:${PATH}"
	eval "$(rbenv init -)"
fi
test -r ~/.bashrc && . ~/.bashrc
