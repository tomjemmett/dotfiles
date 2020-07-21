" https://draculatheme.com/vim
packadd! dracula
syntax enable
colorscheme dracula

set number relativenumber

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

autocmd InsertEnter,InsertLeave * set cul!
