
#### FIG ENV VARIABLES ####
# Please make sure this block is at the start of this file.
[ -s ~/.fig/shell/pre.sh ] && source ~/.fig/shell/pre.sh
#### END FIG ENV VARIABLES ####
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
[ -f $HOME/.env_variables.zsh ] && source $HOME/.env_variables.zsh # local env variables
[ -f $HOME/.local_scripts.zsh ] && source $HOME/.local_scripts.zsh 
#NODE_PATH='/usr/local/lib/node_modules'
GREP_COLOR='1;32'

# Extra ZSH Built-Ins
autoload -U zmv

# zsh-syntax-highlighting Customization https://github.com/zsh-users/zsh-syntax-highlighting/tree/master/highlighters/main
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=red'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="nanotech"
# ZSH_THEME="avit"
# ZSH_THEME="frisk"
# ZSH_THEME="af-magic"
ZSH_THEME="spaceship"

# Spaceship-theme prompt on
SPACESHIP_CHAR_SYMBOL="☕️>_"
SPACESHIP_PROMPT_ORDER=(user dir host git_branch ruby exec_time line_sep battery vi_mode jobs char) 
# SPACESHIP_GIT_BRANCH_PREFIX=" "
SPACESHIP_GIT_BRANCH_PREFIX="🌿"
SPACESHIP_GIT_BRANCH_SUFFIX=" " 
SPACESHIP_VI_MODE_INSERT="[i]"
SPACESHIP_VI_MODE_NORMAL="[c]"
SPACESHIP_EXEC_TIME_PREFIX="⏱ "
SPACESHIP_RUBY_SYMBOL="💎"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
KEYTIMEOUT=1

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

SPACESHIP_ROOT=$HOME/dotfiles/zsh-custom/themes/spaceship-prompt
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/dotfiles/zsh-custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew z macos common-aliases npm vi-mode tmux tmuxinator dirhistory history-substring-search zsh-autosuggestions zsh-syntax-highlighting)

# history-substring-search = ZSH_CUSTOM/plugins/zsh-history-substring-search (from git)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# User configuration

export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export PATH="$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
# export PATH="/Users/lsparlin/.rvm/gems/ruby-2.1.5/bin:/Users/lsparlin/.rvm/gems/ruby-2.1.5@global/bin:/Users/lsparlin/.rvm/rubies/ruby-2.1.5/bin:/usr/local/opt/elasticsearch/bin:/usr/local/mysql/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/opt/elasticsearch/bin:/usr/local/mysql/bin:/Users/lsparlin/.rvm/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

# eval "$(rbenv init -)"

source $ZSH/oh-my-zsh.sh
eval spaceship_vi_mode_enable

ulimit -n 8192

# Homebrew completion setup
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
  compinit
fi

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
# 

# Java
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
# source ~/.asdf/plugins/java/set-java-home.zsh

## --- Functions --- ##

function watchp() {
# watch the last command (excludes itself)
  WATCH_S=${1:-10}

  fc -ln -5 | \
		grep -ve '^watchp' | \
		tail -1 | \
		xargs -I{} watch -n $WATCH_S {}
}

function mac-notify() {
  MESSAGE=${1:-[No Message]}
  osascript -e "display notification \"$MESSAGE\" with title \"CLI Message\" sound name \"Pop\""
}

alias prevcmd="fc -ln -5 | grep -ve '^prevcmd' -ve '^fc ' | tail -1"

function prevcmd_to_alias() {
  if [[ $# -lt 1 ]]; then
		echo "Enter alias name as parameter"
		return 1
	fi

	prevcmd | xargs -I{} echo "alias $1=\"{}\""
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gst='git status -s'
alias mmv='noglob zmv -W'
alias vit='vi ~/.tmux.conf'
alias srcp='exec zsh'
alias srct='tmux source-file ~/.tmux.conf'
alias gitrepo='cd ~/Development/git'
alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias rmi='rm -i'
alias flushcache="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder;"
alias redis="redis-server"
alias lswc="ls | wc"
alias vi='vim'
alias vimp='vim -p'
alias vimf='vim $(fzf --multi)'
alias spotlight_reset="sudo mdutil -E -a -i on"
alias tmux_panetitle='tmux set pane-border-status bottom; tmux set pane-border-format "#{pane_current_command}"'
alias lsl="exa --header --long --group --color=always --sort=type"
alias grep="grep --color=auto"
alias mux="tmuxinator"
alias lse="exa"
alias weather="curl -s wttr.in\?1TFn"
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# mysql
alias mysql-localhost='mysql -u root -p'

# github
function gh_open() { # gh_open filename|dir [remote] [branch]
  if [[ $# -lt 1 ]] || [[ ! -e $1 ]]; then
		echo "Enter valid filename or directory as parameter!"
		return 1
	fi
	url_path="blob"
	if [[ -d $1 ]]; then
		url_path="tree"
	fi

	curr_branch=$(git branch --show-current)

	git remote get-url ${2:-origin} | \
		sed -E "s;git@github.com:(.*)/(.*)\.git;https://github.com/\1/\2/$url_path/${3:-$curr_branch}/;g" | \
    xargs -I% open "%$(git rev-parse --show-prefix)$1"
}

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/Users/lewis/Library/Caches/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;

##
### ---- Appended commands
##

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

. /opt/homebrew/opt/asdf/libexec/asdf.sh

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
