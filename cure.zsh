#!/bin/zsh
# termina zsh plugin manager

target_dir="$HOME/.cure"

typeset -A plugins
plugins=(
  "zimfw/environment" "init.zsh"
  "zimfw/asciiship" "asciiship.zsh-theme"
  "zimfw/completion" "init.zsh"
  "zimfw/git-info" "init.zsh"
  "zimfw/input" "init.zsh"
  "zimfw/utility" "init.zsh"
  "zsh-users/zsh-autosuggestions" "zsh-autosuggestions.zsh"
  "zsh-users/zsh-completions" "zsh-completions.zsh"
  "zsh-users/zsh-history-substring-search" "zsh-history-substring-search.zsh"
  "zsh-users/zsh-syntax-highlighting" "zsh-syntax-highlighting.zsh"
)

if [[ ! -d "$target_dir" ]]; then
    echo "... installing Cure in '$target_dir'..."
    mkdir -p "$target_dir"
fi

fpath=($target_dir/zimfw/utility/functions $target_dir/zimfw/git-info/functions $target_dir/zsh-user/zsh-completions/src ${fpath})
autoload -Uz -- mkcd mkpw coalesce git-action git-info

for repo init_file in ${(kv)plugins}; do
    if [[ ! -d "$target_dir/$repo" ]]; then
        echo "installing module: '$repo'"
        git clone "https://github.com/$repo" "$target_dir/$repo" > /dev/null 2>&1
    fi

    if [[ -n $init_file && -f "$target_dir/$repo/$init_file" ]]; then
       source "$target_dir/$repo/$init_file"
    fi
done

function git-pull-all-modules() {
    target_dir="$HOME/.cure"

    if [[ -d "$target_dir" ]]; then
        for repo init_file in ${(kv)plugins}; do
            if [[ -d "$target_dir/$repo" ]]; then
                echo "Updating $repo..."
                (cd "$target_dir/$repo" && git pull)
            fi
        done
    else
        echo "Cure directory not found: $target_dir"
    fi
}

alias cure='cure_command'

function cure_command() {
    if [[ $# -eq 1 && $1 == "update" ]]; then
        git-pull-all-modules
    else
        echo "Usage: cure update"
    fi
}

