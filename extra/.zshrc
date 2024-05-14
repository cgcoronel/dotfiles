CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh

unset key

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/usr/local/bin

alias vim.='nvim' ivm.='nvim' imv.='nvim'
alias ivm='nvim' vim='nvim' imv='nvim'

alias python=python3
xepelin='/Users/Cristian/projects/xepelin'

alias config='cd /Users/Cristian/.config/nvim; vim .'
alias gcc='git branch --show-current | pbcopy'

alias x='cd $xepelin'
alias xt='cd $xepelin/risk/xepelin-sls-xtree-orchestrator' 
alias xr='cd $xepelin/risk/xepelin-sls-xraas-ms'
alias bu='cd $xepelin/risk/xepelin-sls-buro-credito'
alias cl='cd $xepelin/risk/xepelin-xtree-creditLine'
alias gl='cd $xepelin/xepelin-server-global'
alias bo='cd $xepelin/xepelin-backoffice-server'

# fnm
export PATH="/Users/Cristian/Library/Application Support/fnm:$PATH"
# eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

