<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/2560px-Neovim-logo.svg.png">

# Dot Files 

### Instalar nvim!

```console
 https://github.com/neovim/neovim/wiki/Installing-Neovim 
```

### Copiar init.vim dentro de 
```console
.config/nvim/
```

### Instalar vim-plug para gestionar plugins en vim

```console
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Instalar Plugins, correr desde la consola de Vim
```console
:PlugInstall
```

### Configurar Coc, correr desde la consola de Vim.
```console
:CocConfig
```

#### Agregar la siguientre configuración
```console
 {
  "suggest.noselect": false,
  "coc.preferences.formatOnSaveFiletypes": [
    "javascript",
    "typescript",
    "typescriptreact",
    "json",
    "javascriptreact",
    "typescript.tsx",
    "graphql",
    "css",
    "scss"
  ]
 }
```
### Instalar fd-find
```console
# sudo apt install fd-find
```

### Instalar Ripgrep
```console
# brew install ripgrep
```

### Agregar la siguiente linea al .bashrc o .zshrc
```console
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*}"'
```

### Instalar dependencias Python
```console
# python3 -m pip install --user --upgrade pynvim

