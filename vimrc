set tabstop=4
set splitright
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:
 
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
imap jk         <Esc>
map <C-a> <esc>ggVG<CR>
set belloff=all
 
"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/kuljeet/cp/Library/Template.cpp
 
map <F1> :<C-U>!g++ -DLOCAL -std=c++17 -Wall -Wextra -Wno-unused-result -static %:r.cpp -o %:r<CR>
map <F2> :<C-U>!./%:r<CR>

"LaTeX settings
autocmd FileType tex :NoMatchParen
autocmd FileType tex :set tw=110
 
filetype plugin indent on
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
let g:tex_flavor = 'latex'
let g:vimtex_motion_matchparen = 0
let g:vimtex_fold_manual = 1
let g:vimtex_matchparen_enabled = 0
 
"Clipboard configuration
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
        augroup WSLYank
                    autocmd!
                            autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
                                augroup END
                            endif
 
        au BufNewFile,BufRead *.tex
            \ set nocursorline |
            \ set nornu |
            \ set number |
            \ let g:loaded_matchparen=1 |
