# ------------------
# BASH ALIASES
# https://github.com/niksudan/aliases
# 
# Add `source ~/aliases/aliases.sh` to your main file
# Add any additional, private aliases in extra.sh

# ------------------
# Aliases

# Quick alias editing
alias a='vim ~/aliases/aliases.sh'

# Reload shell
alias rl='source ~/aliases/aliases.sh && echo "Reloaded aliases"'

# ------------------
# Paths

# Android SDK
export ANDROID_HOME=/Users/nik/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH

# Java JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_101.jdk/Contents/Home

# MAMP
export PATH=/Applications/MAMP/bin/php/php7.0.10/bin:$PATH

# ------------------
# Files

# Jump to desktop
alias desktop='cd ~/Desktop'

# Jump to documents
alias documents='cd ~/Documents'

# Jump to downloads
alias downloads='cd ~/Downloads'

# Detailed file listing
alias l='ls -alh'

# Better directory listing
alias ls='ls -aGpF'

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Output all directories over 1GB
alias d1g="du -h / | grep '[0-9]G'"

# ------------------
# Strings

# Find and replace
replace() {
  sed -ie "s/${1}/${2}/g" ${3};
  rm "${3}e";
  echo "Replaced '$1' with '$2' in $3";
}

# Copy file to clipboard
copy() {
  cat $1 | pbcopy && echo "Copied contents of ${1} to clipboard"
}

# Copy a lorem ipsum paragraph to clipboard
alias lorem='lorem-ipsum 1 paragraph --copy'

# ------------------
# Editors

# Set $EDITOR
export EDITOR='/usr/bin/vim'

# Vim shortcuts
alias v=vim
alias vi=vim

# ------------------
# Hosts

# Quickly edit hosts
alias hosts='sudo vim /etc/hosts'

# Search for a host entry
ip() {
  cat /etc/hosts | grep "$1"
}

# ------------------
# SSH

# Jump to SSH keys
alias sshs='cd ~/.ssh'

# Generate new ssh connection
conn() {
  keyName='id_rsa'
  sudo -- sh -c -e "echo '$2      $1' >> /etc/hosts";
  sudo -- sh -c -e "echo 'Host $1\n       User root\n     Port 22\n       IdentityFile ~/.ssh/$keyName' >> ~/.ssh/config"
  echo "SSH connection settings added for '$1'"
  echo "To connect and add the IP to your known hosts, run 'ssh $1'"
}

# ------------------
# Git

# Jump to repos
alias gits='cd ~/Git'

# Log a repository's commits for a certain day
gitlog() {
  git log --after="${1} 00:00:00" --before="${1} 23:59:59" --pretty="[%cd] %cn - %s"
}

# Remove local tags
alias prunetags='git fetch --prune origin +refs/tags/*:refs/tags/*'

# ------------------
# Project management

# Composer
alias composer='php /usr/local/bin/composer.phar'

# Editorconfig
editorconfig() {
  echo "root = true
  
[*]
indent_style = space
indent_size = 2" > ./.editorconfig
  echo "Created .editorconfig"
}

# Yarn shorthand
alias y='yarn'

# Clean out a yarn.lock
alias yarnc='rm -rf yarn.lock && rm -rf node_modules && yarn install'

# ------------------
# WordPress

# Create a Wordpress .htaccess
wpht() {
  echo "# BEGIN WordPress
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.php$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.php [L]
</IfModule>
# END WordPress" > ./.htaccess
  echo "Created .htaccess file for Wordpress"
}

# Create a Wordpress .htaccess for local uploads
wphtup() {
  echo "<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /wp-content/uploads/
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule ^(.*) ${1}/wp-content/uploads/\$1 [L,P]
</IfModule>" > ./wp-content/uploads/.htaccess
  echo "Created .htaccess file for Wordpress uploads on '${1}/wp-content/uploads/'"
}

# ------------------
# Extras

source ~/aliases/extras.sh
