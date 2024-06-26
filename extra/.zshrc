CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/usr/local/bin

alias vim.='nvim' ivm.='nvim' imv.='nvim'
alias ivm='nvim' vim='nvim' imv='nvim'

alias python=python3

alias config='cd /Users/Cristian/.config/nvim; vim .'

alias x='cd /Users/Cristian/projects/xepelin'
alias p='cd /Users/Cristian/projects/personal'
alias xt='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-xtree-orchestrator' 
alias xr='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-xraas-ms'
alias bu='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-buro-credito'
alias cl='cd /Users/Cristian/projects/xepelin/risk/xepelin-xtree-creditLine'
alias gl='cd /Users/Cristian/projects/xepelin/xepelin-server-global'
alias bo='cd /Users/Cristian/projects/xepelin/xepelin-backoffice-server'


# fnm
export PATH="/Users/Cristian/Library/Application Support/fnm:$PATH"
# eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

