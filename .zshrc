# Path to your oh-my-zsh installation.
export ZSH="/Users/u631185/.oh-my-zsh"

ZSH_THEME="nanotech"

plugins=(git)

#ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias vi=nvim
alias python=python3
alias r=pwd

export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'

