##############################
# EXPORTS
##############################
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export CLICOLOR=true
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=/home/ty/.oh-my-zsh export PATH=~/.npm-global/bin:$PATH 
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="agnoster"
ZSH_THEME="nanotech"
setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# ORDER
export TERM="xterm-256color"
# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-flow
  node
  sudo
  npm
  yarn
  psql
  docker
  wd
  debian
  common-aliases
  jsontools
  python
  django
  docker-compose
  aterminal
  z

)

source $ZSH/oh-my-zsh.sh

# User configuration


export SSH_KEY_PATH="~/.ssh/rsa_id"

# Added by n-install (see http://git.io/n-install-repo).


export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
##############################
# Apt & Package Managers
##############################
alias sag="sudo apt-get"
alias sagi="sag install"
alias sagu="sag update"
alias sagr="sag remove"
alias sa="sudo apt"
alias sau="sa update"
alias saug="sa upgrade"
alias sai="sudo apt install"
alias sar="sudo apt remove"
alias sacc="sudo apt autoremove && sudo apt autoclean"

##############################
# Utilities and Laziness
##############################

# display-link home 2 monitor setup
alias homedl="xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0  && sh ./.screenlayout/home2.sh"


# speed up the keyboard response 
alias faster="xset r rate 200 60"

# install .deb in ~/Downloads
alias ideb="sudo dpkg -i ~/Downloads/**.deb && rm -rf ~/Downloads/**.deb" 

# open files
alias o="xdg-open"

# prittee
alias ls="ls --color -l -h"
alias grep="grep -n --color" 
alias cls='clear'

# safety first
alias md="mkdir -pv"

# services shortcuts
alias _sys="sudo systemctl"
alias _sys-st="_sys start"
alias _sys-sp="_sys stop"
alias _sys-en="_sys enable"
alias _sys-dis="_sys disable"
alias _bat="sudo tlp bat"


##############################
# Yarn/Npm/Node
##############################

alias ys="yarn start"
alias yga="yarn global add"
alias py="python3.6" 
alias pyp="pip3" 
alias pypi="pip3 install" 
alias vc="code-insiders ." 

if (( $+commands[yarn] ))
then
  export PATH="$PATH:`yarn global bin`"
  fi

alias dc="docker-compose" 
alias drm="docker rm"
alias dps="docker ps"
alias pe="pipenv"
alias pr="pipenv run"
alias ccc="clear && ls"
alias cc="clear"
alias mynotes="code-insiders ~/github/My-Notes/"
alias jsg="json-schema-generator"
alias vcx="/usr/local/bin/VSCode-linux-x64/code-insiders"

##############################
# Django Aliases
##############################
alias djpe="pipenv run ./manage.py"
alias djmm="djpe makemigrations"
alias djm="djpe migrate"
alias djs="djpe runserver"
alias djdb="djpe dbshell"
alias djt="djpe test"
alias djsu="djpe createsuperuser"
alias djmmm="djmm && djm"
alias djsf="djpe flush"
alias djsh="djpe shell"
alias yo="yo"

# if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#        source /etc/profile.d/vte.sh
# fi

# ORDER


# Credits to https://coderwall.com/p/jpj_6q/zsh-better-history-searching-with-arrow-keys 

autoload -U up-line-or-beginning-search 
autoload -U down-line-or-beginning-search 
zle -N up-line-or-beginning-search 
zle -N down-line-or-beginning-search 
bindkey "^[[A" up-line-or-beginning-search 
# Up 
bindkey "^[[B" down-line-or-beginning-search 
# Down

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
fpath=($HOME/.homesick/repos/homeshick/completions $fpath)


# initialize autocomplete here, otherwise functions won't be loaded 
autoload -U compinit 
compinit
# load every completion after autocomplete loads
for file in ${(M)config_files:#*/completion.zsh} 
do
  source $file
done
