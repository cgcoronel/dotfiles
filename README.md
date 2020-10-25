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

### Comandos basicos 
```console

- Moverse entra palabras
[ w ] Para ir a la siguiente palabra
[ b ] Para ir a la anterior palabra
[ e ] Para ir al final de la palabra

[ gd ] Ir a la definicion
[ gf ] Ir al archivo marcado en la definicion

- Moverse de {, [, ( de inicio a  ), ], } de fin
[ % ] posicionarse en [, {, ( o ), }, ]

- Insertar texto
[ i ] Inserta texto anstes de donde este el cursor
[ a ] Inserta texto despues de donde este el cursor
[ Shift + i ] Inserta texto al principio de una linea
[ Shift + a ] Inserta texto al final de una linea
[ o ] Insertar una linea y texto por debajo
[ Shift + o ] Insertar una linea y texto por encima

[ u ] Deshacer
[ Ctrl + r ] Rehacer

- Eliminar texto
[ x ] Elimina los caracteres uno a uno de la parte derecha
[ dd ] Elimina una linea
[ dw ] Borra hasta el final de una palabra
[ ciw ] Borrar una palabra completa y se pocisiona en modo insercion
    
- Git commands

[ Space + d ]  Abrir Fugitive
[ a ] Pasar archivos a staged
[ u ] Pasar de staged a unstaged
[ dd ] Dentro de vim Fugitive abre un archivo con las diferencias
[ X ] Dentro de vim Fugitive realiza un checkout o clean del archivo seleccionado
[ :Gco ] commit cambios
[ :Gpush ] push cambios

- Multi cursor

[ Ctrl + n ] para seleccionar palabras iguales


- Dentro de NERDTree

[ s ] para abrir un archivo en y dividir la pantalla
[ gs ] para abrir un archivo y mantenerae en el explorador	

- Codigo
[ gd ] Ir a la definición de una función 
[ gf ] Para ir a un archivos desde un require	
[ espacio + F ] Búsqueda dentro de todos los archivos

- Remplazar ocurrencia de la linea donde esta el cursor
:s/busqueda/reemplazo/g

- Remplazar ocurrencia de todo el archivo
:%s/busqueda/reemplazo/g

```

### Screenshots

<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/1.jpeg" width='100%' aling="right">
<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/2.jpeg" width='100%' aling="right">
<img src="https://github.com/cgcoronel/vim-setup/blob/master/screens/3.jpeg" width='100%' aling="right">


