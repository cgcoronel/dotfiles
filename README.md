# Dot Files

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/4f/Neovim-logo.svg/2560px-Neovim-logo.svg.png" width="300" height="80">

## Instalación de Neovim

Sigue las instrucciones en [este enlace](https://github.com/neovim/neovim/wiki/Installing-Neovim) para instalar Neovim en tu sistema.

## Configuración

1. Copia el contenido de este repositorio dentro de la siguiente ubicación en tu sistema:

```console
.config/nvim/
```

2. Descarga los plugins necesarios ejecutando los siguientes comandos en tu terminal:

```console
cd .config/nvim/plugged

git clone -b release https://github.com/neoclide/coc.nvim
git clone https://github.com/junegunn/fzf
git clone https://github.com/junegunn/fzf.vim
git clone https://github.com/tpope/vim-fugitive
git clone https://github.com/airblade/vim-gitgutter
git clone https://github.com/cgcoronel/simple-term.vim
git clone https://github.com/pangloss/vim-javascript
```

3. Configura el plugin Coc ejecutando el siguiente comando en la consola de Neovim:

```console
:CocConfig
```

4. Instala FZF en tu sistema ejecutando el siguiente comando:

```console
:brew install fzf
```

5. Instala las dependencias de Python ejecutando el siguiente comando:

```console
# python3 -m pip install --user --upgrade pynvim
```
