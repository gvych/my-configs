
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Bundle 'chase/vim-ansible-yaml'
Bundle 'bogado/file-line'


call vundle#end()            " required
filetype plugin indent on    " required

"autocmd BufNewFile *.yml call append(0,'---')
"autocmd BufNewFile *.yml call append(0,'# vim:ft=ansible:')

set paste
set noendofline binary

Bundle 'kana/vim-textobj-user'
Bundle 'beloglazov/vim-textobj-quotes'
