alias gpu='git push'
alias gco='git commit'
alias gst='vim -c "0Git" .'
alias vim=nvim
alias vim.=nvim
alias vi=nvim
alias python=python3
alias r=pwd
alias x='cd /Users/cristiancoronel/projects/xepelin'
alias p='cd /Users/cristiancoronel/projects/personal'
alias b='git checkout $(git branch -a | fzf)'
alias config='cd /Users/cristiancoronel/.config/nvim; vim'
alias f='vim $(fzf --preview="tail -n 100 {}")'
alias 'q'=exit
alias ';q'=exit

#poner en el .zshenv
#export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'
