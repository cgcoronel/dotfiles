alias gpu='git push'
alias gco='git commit -m'
alias vim=nvim
alias vim.='nvim .'
alias vi=nvim
alias python=python3
alias r=pwd
alias version-monitor='npm run start --prefix $HOME/projects/tools/version-monitor/'
alias x='cd /Users/cristiancoronel/projects/xepelin'
alias b='git checkout $(git branch -a | fzf)'
alias migrate='sh /Users/cristiancoronel/projects/xepelin/migrate.sh'
alias up='pm2 start /Users/cristiancoronel/projects/xepelin/enviorement.json'
alias config='cd /Users/cristiancoronel/.config/nvim'

#poner en el .zshenv
#export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'
