CURE_HOME=${ZDOTDIR:-${HOME}}/.cure
if [ ! -d "$CURE_HOME" ]; then
  git clone https://github.com/cgcoronel/cure "$CURE_HOME"
fi

source ${CURE_HOME}/init.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
export PATH=$PATH:/usr/local/bin

alias vim.='nvim .' 
alias ivm.='nvim .' 
alias imv.='nvim .'
alias ivm='nvim' 
alias vim='nvim' 
alias imv='nvim'


alias python=python3

alias config='cd /Users/Cristian/.config/nvim; vim .'

alias x='cd /Users/Cristian/projects/xepelin'
alias p='cd /Users/Cristian/projects/personal'
alias xt='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-xtree-orchestrator' 
alias xr='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-xraas-ms'
alias bu='cd /Users/Cristian/projects/xepelin/risk/xepelin-sls-buro-credito'
alias cl='cd /Users/Cristian/projects/xepelin/risk/xepelin-xtree-creditLine'
alias av='cd /Users/Cristian/projects/xepelin/risk/xtree-api-variables/'
alias xh='cd /Users/Cristian/projects/xepelin/risk/xtree-in-house/'
alias gl='cd /Users/Cristian/projects/xepelin/xepelin-server-global'
alias bo='cd /Users/Cristian/projects/xepelin/xepelin-backoffice-server'
alias cc='sh /Users/Cristian/.config/nvim/extra/clean.sh'
alias ap='cd /Users/Cristian/projects/xepelin/risk/xtree-api-variables'



# fnm
export PATH="/Users/Cristian/Library/Application Support/fnm:$PATH"
# eval "`fnm env`"
eval "$(fnm env --use-on-cd)"

alias save-branch='git rev-parse --abbrev-ref HEAD | pbcopy && echo "Branch actual copiada al portapapeles: $(pbpaste)"'

PS1='%(!.%B%F{red}%n%f%b in .${SSH_TTY:+"%B%F{yellow}%n%f%b in "})${SSH_TTY:+"%B%F{green}%m%f%b in "}%B%F{cyan}%~%f%b${(e)git_info[prompt]}${VIRTUAL_ENV:+" via %B%F{yellow}${VIRTUAL_ENV:t}%f%b"}${duration_info}
%B%(1j.%F{blue}*%f .)%(?.%F{green}.%F{red}%? )❯%f%b '

alias gco='sh /Users/Cristian/.config/nvim/extra/smart-commit.sh'

alias pr-main='gh pr create --base main --head devel --title "Release: devel → main" --body "devel into main" | tee >(pbcopy)'


#alias prd='sh /Users/Cristian/.config/nvim/extra/smart-review.sh'
prd() {
  cat <<EOF | pbcopy
Please review these PRs and leave inline code comments for any of the following:

- 🐞 Potential bugs or incorrect logic
- ✨ Possible improvements or refactors
- 🧼 Code that could be cleaner or more readable
- ❓ Ambiguous naming, unclear intent, or missing context
- 🛡️ Edge cases that may not be handled

Be thorough but concise.
EOF
}


