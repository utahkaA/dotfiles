# alias Settings
alias emacs="emacs -nw"
# alias mv="mv -i"
alias grep="grep --color"

# for OSX
if [ `uname` = "Darwin" ]; then
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
  alias julia="/Applications/Julia-0.5.app/Contents/Resources/julia/bin/julia"
fi

# for Linux
if [ `uname` = "Linux" ]; then
  # source /opt/ros/indigo/setup.bash
  # source ~/WorkTree/catkin_ws/devel/setup.bash
  alias listusers="cat /etc/passwd | cut -d : -f 1"
fi

# Prompt Settings
git_branch() {
  echo $(git branch 2> /dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\e[0;32m\]\W\[\e[00m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\]\n$ '
