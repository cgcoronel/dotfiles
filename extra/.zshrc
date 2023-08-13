alias vim.='nvim .'
alias vim=nvim
alias python=python3
alias x='cd /Users/cristiancoronel/projects/xepelin'
alias p='cd /Users/cristiancoronel/projects/personal'
alias b='git checkout $(git branch -a | fzf)'
alias config='cd /Users/cristiancoronel/.config/nvim; vim .'

eval "$(fnm env --use-on-cd)"
