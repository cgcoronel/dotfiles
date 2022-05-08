# Dot Files 

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/2560px-Neovim-logo.svg.png" width="300" height="80">

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
```


<img src="data:image/png;base64,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">
### Keyboard layout for HHKB

<img src="https://github.com/cgcoronel/dotfiles/blob/master/extra/layer1.jpeg">


<img src="https://github.com/cgcoronel/dotfiles/blob/master/extra/layer2.jpeg">



