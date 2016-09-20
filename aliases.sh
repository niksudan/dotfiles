# Detailed file listing
alias l='ls -alh'

# Better directory listing
alias ls='ls -aGpF'

# Reload shell
alias rl='source ~/.bash_aliases && echo "Reloaded aliases"'

# Quick alias editing
alias a='vim ~/.bash_aliases'

# Vim
alias v=vim
alias vi=vim

# Hosts
alias hosts='sudo vim /etc/hosts'

# SSH Keys
alias sshs='cd ~/.ssh'

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Jump to repos
alias gits='cd ~/Git'

# Generate new ssh connection
conn() {
~/Scripts/conn "$@"
}

# Composer
alias composer='php /usr/local/bin/composer.phar'

# Find and replace
replace() {
~/Scripts/replace "$@"
}

# Copy to clipboard
copy() {
cat $1 | pbcopy
}
