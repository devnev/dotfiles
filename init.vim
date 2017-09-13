set nocompatible

filetype off
call plug#begin("~/.config/nvim/bundle")
Plug 'editorconfig/editorconfig-vim'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.local/share/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'wellle/targets.vim'
Plug 'terryma/vim-multiple-cursors'
"Plug 'Valloric/YouCompleteMe'
Plug 'Shougo/unite.vim' " required by vimfiler
Plug 'Shougo/vimfiler.vim'

Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make'}

Plug 'morhetz/gruvbox'
Plug 'croaker/mustang-vim'
call plug#end()

" Actual settings start here
let mapleader=","
set number
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase
set smartcase
set showcmd
set modeline
nmap s <C-W>
nmap sN :vnew<CR>
"inoremap kj <esc>
"inoremap jk <esc>
command W w
command Q q
set noexrc " =default, but important
colorscheme mustang
set pastetoggle=<F9>
noremap ; :
set breakindent
set breakindentopt=shift:4
set linebreak
set mouse=a
set scrolloff=5
set updatetime=1000
set noswapfile
set completeopt=menu
let g:deoplete#enable_at_startup = 1
let g:vimfiler_as_default_explorer = 1
"nnoremap <leader>f :Files!<CR>
nnoremap <leader>f :call fzf#run({ 'sink': 'e', 'window': 'enew' })<cr>
nnoremap <leader>w :wa<CR>
nnoremap <leader>c :let @+=@0<CR>


if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

autocmd BufNewFile,BufRead *.ll setf lex
autocmd BufNewFile,BufRead *.yy setf yacc
autocmd BufNewFile,BufRead *.zsh-theme setf sh
autocmd BufNewFile,BufRead *.wsgi setf python
autocmd BufNewFile,BufRead SConstruct setf python
autocmd BufNewFile,BufRead CMakeLists setf cmake
autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.glslv,*.glslf setf glsl
autocmd BufNewFile,BufRead Hakefile setf haskell
autocmd BufNewFile,BufRead *.tex setf tex
autocmd BufNewFile,BufRead *.h setf c
autocmd BufNewFile,BufRead *.tla setf tla
autocmd BufNewFile,BufRead *.zsh-theme setf zsh
autocmd BufNewFile,BufRead *.bzl set ft=python
autocmd BufNewFile,BufRead BUILD set ft=python
autocmd BufNewFile,BufRead *.jsonschema set ft=json
autocmd Filetype javascript setlocal sw=4 sts=4 noet breakindentopt=shift:8
autocmd BufNewFile,BufRead */etc/hosts set ft=hostconf
autocmd BufNewFile,BufRead ~/.kube/config set ft=yaml
autocmd BufNewFile,BufRead *.yml.tmpl set ft=yaml
autocmd BufNewFile,BufRead *.service set ft=systemd
autocmd BufRead,BufNewFile *.ts set ft=typescript
autocmd Filetype javascript setlocal sw=2 sts=2 et breakindentopt=shift:4
autocmd Filetype xml setlocal ts=4 et sts=2 sw=2
autocmd Filetype lisp setlocal ts=8 et sts=2 sw=2
autocmd Filetype ruby setlocal ts=8 et sts=2 sw=2
autocmd Filetype vim setlocal ts=8 et sts=2 sw=2
autocmd Filetype haskell setlocal ts=8 et sts=2 sw=2
autocmd Filetype lhaskell setlocal ts=8 et sts=2 sw=2
autocmd Filetype matlab setlocal ts=8 et sts=2 sw=2
autocmd Filetype tex setlocal fdm=manual fdl=99
autocmd Filetype htmldjango setlocal ts=4 noet sts=4 sw=4
autocmd Filetype htmljinja setlocal ts=4 et sts=4 sw=4
autocmd Filetype c setlocal ts=8 et sts=4 sw=4 cino=(0 breakindentopt=shift:8
autocmd Filetype cpp setlocal ts=4 noet sts=4 sw=4 breakindentopt=shift:8
autocmd Filetype txt setlocal lbr nolist
autocmd Filetype tla setlocal ts=4 et sts=4 sw=4 ai si
autocmd Filetype proto setlocal ts=4 et sts=2 sw=2 ai si
autocmd Filetype rust setlocal ts=4 et sts=2 sw=2
autocmd Filetype css setlocal et sts=2 sw=2
autocmd Filetype groovy setlocal et sts=2 sw=2
autocmd Filetype html setlocal et ts=4 sts=2 sw=2
autocmd Filetype python setlocal et ts=8 sts=2 sw=2
autocmd FileType go setlocal noet ts=2 sts=2 sw=2
autocmd FileType javascript setlocal et ts=8 sts=2 sw=2
autocmd FileType yaml highlight link yamlKey Normal
autocmd FileType make setlocal noet ts=4 sts=4 sw=4
autocmd FileType typescript nmap gd :TSDef<CR>
autocmd FileType typescript nmap <leader>r :TSRefs<CR>
autocmd FileType typescript nmap <leader>b :TSGetErr<CR>
autocmd FileType go nnoremap <leader>b :w<CR>:GoBuild<CR>
autocmd FileType go nnoremap <leader>t :w<CR>:GoTestFunc<CR>
autocmd FileType go nnoremap <leader>d :w<CR>:GoDoc<CR>
autocmd FileType go nnoremap <leader>r :w<CR>:GoReferrers<CR>
autocmd FileType go nnoremap <leader>i :w<CR>:GoImplements<CR>

nnoremap <leader>s :call fzf#run({ 'source': 'rg --follow go/src 2>/dev/null', 'sink': 'e', 'window': 'enew' })<CR>
