# Detailed file listing
alias l='ls -al'

# Go to root quickly
alias rootdir='cd ~/'

# Reload shell
alias rl='source ~/.bash_aliases && clear && echo "Shell successfully reloaded"'
alias reload='rl'

# Quick alias editing
alias a='vim ~/.bash_aliases'

# Better directory listing
alias ls='ls -G'

# Directory listing with sizes
alias size='echo "Diskspace report:" && df -P -kHl && echo "Calculating current directory content sizes..." && du -hs *'

# Filesize
alias fs='stat -f \"%z bytes\"'

# Jump to git repos
alias gits='cd ~/Git && clear &&  echo "Choose a repo, or start a new one!" && ls'

# Vim
alias v=vim

# Clear console
alias c='clear && echo "Bang and the dirt is gone!"'

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"