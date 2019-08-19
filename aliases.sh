# ------------------
# BASH ALIASES
# 
# Add `source ~/aliases/aliases.sh` to your main file
# Add any additional, private aliases in `extras.sh`

# ------------------
# Aliases

# Quick alias editing
alias a='vim ~/.aliases'

# Reload shell
alias rl='source ~/.aliases && echo "Reloaded aliases"'

# ------------------
# Paths

# Android SDK
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Java JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_191.jdk/Contents/Home

# NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# PHP
export PATH=/usr/local/php5/bin:$PATH

# Switch to PHP 5.6
php5() {
  sudo rm -rf /usr/local/php5
  sudo ln -s /usr/local/php5-5.6.33-20180201-140154 /usr/local/php5
  php -v
}

# Switch to PHP 7.0
php7() {
  sudo rm -rf /usr/local/php5
  sudo ln -s /usr/local/php5-7.0.27-20180201-135220 /usr/local/php5
  php -v
}

# Switch to PHP 7.2
php72() {
  sudo rm -rf /usr/local/php5
  sudo ln -s /usr/local/php5-7.2.9-20180821-074958 /usr/local/php5
  php -v
}

# ------------------
# Files

# Jump to desktop
alias desktop='cd ~/Desktop'
alias desk='cd ~/Desktop'

# Jump to documents
alias documents='cd ~/Documents'
alias docs='cd ~/Documents'

# Jump to downloads
alias downloads='cd ~/Downloads'
alias dls='cd ~/Downloads'
alias dl='cd ~/Downloads'

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
alias d1g="du -h / | grep '[0-9]G '"
size() {
  du -sk * | awk '$1 > 1000' | sort -nr;
}

# Colourised 'cat'
alias cat='ccat'

# Convert video to gif
video2gif() {
  ffmpeg -y -i "${1}" -vf fps=${3:-10},scale=${2:-320}:-1:flags=lanczos,palettegen "${1}.png"
  ffmpeg -i "${1}" -i "${1}.png" -filter_complex "fps=${3:-10},scale=${2:-320}:-1:flags=lanczos[x];[x][1:v]paletteuse" "${1}".gif
  rm "${1}.png"
}

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

# utf8 collation conversion
utf8convert() {
  replace 'utf8mb4' 'utf8' ${1};
  replace 'utf8mb4_unicode_ci' 'utf8_general_ci' ${1};
  replace 'utf8_unicode_520_ci' 'utf8_general_ci' ${1};
  replace 'utf8mb4_0900_ai_ci' 'utf8_general_ci' ${1};
  replace 'utf8_0900_ai_ci' 'utf8_general_ci' ${1};
}

# ------------------
# Editors

# Set $EDITOR
export EDITOR='/usr/bin/vim'

# Vim shortcuts
alias v=vim
alias vi=vim

# VSCode alias
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# -----------------
# Terminal

# ZSH config
alias zsh='vi ~/.zshrc'

# User
DEFAULT_USER="nik"

# Hyperterm config
alias hyper='vi ~/.hyper.js'

# ------------------
# Hosts and Ports

# Quickly edit hosts
alias hosts='sudo vim /etc/hosts'

# Get a domain's IP address
ip() {
  dig +short "$*"
}

# Search for a host entry
host() {
  cat /etc/hosts | grep "$*"
}

# Search if a domain's IP address is a host entry
iphost() {
  host "$(ip $*)"
}

# Kill a process on a port
killport() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs kill
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
alias gits='cd ~/dev'

# Log a repository's commits for a certain day
gitlog() {
  git log --after="${1} 00:00:00" --before="${1} 23:59:59" --pretty="[%cd] %cn - %s"
}

# Remove local tags
alias prunetags='git fetch --prune origin +refs/tags/*:refs/tags/*'

# Reset a repository completely
gitreset() {
  rm -rf .git
  git init
  git remote add origin ${1}
  git fetch
  git reset --hard origin/master
}

# ------------------
# Project management

# Composer
alias composer='php /usr/local/bin/composer'

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

# Open GitKraken
kraken () { open -n -b "com.axosoft.gitkraken"; }

# List global NPM packages
alias npmls='npm list -g --depth=0'

# Start a PHP development server
alias phpdev='php -S localhost:8000'

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

# Create a new WordPress website in the current directory
# @param dbname
# @param username
# @param password
# @parma email
wordpress() {
  wp core download
  wp core config --dbname="${1}" --dbuser="root" --dbpass="root"
  wp core install --url="http://localhost:8000" --title="WordPress" --admin_user="${2}" --admin_password="${3}" --admin_email="${4}"
}

# ------------------
# Extras

source ~/.aliases-extras

