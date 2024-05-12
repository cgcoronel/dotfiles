CURE_HOME=${ZDOTDIR:-${HOME}}/.cure

if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh

unset key

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(fnm env --use-on-cd)"

export PATH=$PATH:/usr/local/bin

alias vim.='nvim' ivm.='nvim' imv.='nvim'
alias ivm='nvim' vim='nvim' imv='nvim'

alias python=python3
xepelin='/Users/Cristian/projects/xepelin'

alias x='cd $xepelin'
alias config='cd /Users/Cristian/.config/nvim; vim .'
alias gcc='git branch --show-current | pbcopy'
alias te='npm run test' 
alias np='npm run'
alias gpu='git push' 

alias vim=nvim
alias python=python3
alias x='cd /Users/cristiancoronel/projects/xepelin'
alias p='cd /Users/cristiancoronel/projects/personal'
alias b='git checkout $(git branch -a | fzf)'
alias config='cd /Users/cristiancoronel/.config/nvim; vim .'

eval "$(fnm env --use-on-cd)"

# fnm
export PATH="/Users/Cristian/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

# zoxide
alias cd="z"
eval "$(zoxide init zsh)"
