<img src="https://culturacion.com/wp-content/uploads/2012/07/figura13.png" width='150px' aling="right">

# Mi Setup en Vim!

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

### Instalar Fuentes
```console
# mkdir -p ~/.local/share/fonts
 cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf

# sudo apt-get install fonts-powerline

```

### Instalar fd-find
```console
# sudo apt install fd-find
```

### Instalar Ripgrep
```
# brew install ripgrep
```

### Instalar dependencias Python
```console
# python3 -m pip install --user --upgrade pynvim

```

### Screenshots

<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/1.jpeg" width='100%' aling="right">
<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/2.jpeg" width='100%' aling="right">
<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/3.jpeg" width='100%' aling="right">


