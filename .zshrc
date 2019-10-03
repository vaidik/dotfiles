# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
PLATFORM=$(uname)

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python ruby node npm pip brew django fabric gem gnu-utils go golang macports osx redis-cli sublime svn vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin
export PATH=$PATH:/Users/vkapoor/Development/adt-bundle-mac-x86_64-20130522/sdk/platform-tools

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
. $HOME/.venvburrito/startup.sh
fi

# Virtualenv settings
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh

# pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Typesafe Activator
export PATH="/Users/vkapoor/Applications/activator/activator-dist:$PATH"

# Play Path
export PATH="/Users/vkapoor/Applications/play/play-dist:$PATH"

# Source aliases
source ~/dotfiles/aliases
source ~/.aliasrc

# Source Secrets
source ~/.secrets

# ZSH Prompt
# PROMPT="${ret_status}%{$fg_bold[green]%}%p[%m] %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}"

# Set kubectl prompt
autoload -U colors; colors
source /usr/local/etc/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'
