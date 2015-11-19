# Prompt Settings
git_branch() {
    echo $(git branch 2> /dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
PS1='\[\e[0;32m\]\W\[\e[00m\] \[\033[40;1;32m\]$(git_branch)\[\033[0m\]$ '

# alias
alias emacs="emacs -nw"
alias ll="ls -hl"
alias ls="ls -GF"
