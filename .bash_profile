# PATH
export PATH="${HOME}/.pyenv/shims:$PATH"
export PATH="${HOME}/.nodebrew/current/bin:${PATH}"
export LSCOLORS=gxfxcxdxbxegedabagacad
if [ -d /Users/utahkaA/Applications/MacVim.app ]; then
    export PATH="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim:${PATH}";
fi

# Prompt Settings
git_branch() {
    echo $(git branch 2> /dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\e[0;32m\]\W\[\e[00m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\]$ '

# alias
alias vim="/Users/utahkaA/Applications/MacVim.app/Contents/MacOS/Vim"
alias emacs="emacs -nw"
alias ll="ls -hl"
alias la="ls -a"
alias ls="ls -GF"
alias readlink="greadlink"
alias awk="gawk"
alias sed="gsed"
alias date="gdate"
