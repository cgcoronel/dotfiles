alias vim.='nvim .'
alias vim=nvim
alias python=python3
alias x='cd /Users/cristiancoronel/projects/xepelin'
alias p='cd /Users/cristiancoronel/projects/personal'
alias b='git checkout $(git branch -a | fzf)'
alias config='cd /Users/cristiancoronel/.config/nvim; vim .'
alias clear='echo "usa mejor cmm + k"'

#poner en el .zshenv
#export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'
eval "$(fnm env --use-on-cd)"
