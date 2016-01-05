# alias Settings
alias vim="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim"
alias emacs="emacs -nw"
alias mv="mv -i"
alias ll="ls -hl"
alias la="ls -a"
alias ls="ls --color=auto -F"
alias readlink="greadlink"
alias awk="gawk"
alias sed="gsed"
alias date="gdate"
alias grep="grep --color"
alias julia="/Applications/Julia-0.4.2.app/Contents/Resources/julia/bin/julia"

# Prompt Settings
git_branch() {
    echo $(git branch 2> /dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\e[0;32m\]\W\[\e[00m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\]$ '
