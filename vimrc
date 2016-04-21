" Vundle setup
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" Bundles
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'uarun/vim-protobuf'
Bundle 'kien/ctrlp.vim'
Bundle 'ervandew/supertab'
Bundle 'fatih/vim-go'
Bundle 'Shougo/neocomplete.vim'
Bundle 'majutsushi/tagbar'

" Reenable filetype stuff
filetype plugin indent on

" Actual settings start here
set number
set tabstop=4
set shiftwidth=2
set softtabstop=2
set expandtab
set ignorecase
set smartcase
nmap s <C-W>
nmap sN :vnew<CR>
inoremap kj <esc>
inoremap jk <esc>
command W w
command Q q
set noexrc " =default, but important
set pastetoggle=<F9>
noremap ; :
nmap <CR> :w<CR>
set breakindent
set breakindentopt=shift:4
set linebreak
set mouse=a
set scrolloff=3
colorscheme mustang
set updatetime=1000
let g:neocomplete#enable_at_startup = 1

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
autocmd Filetype javascript setlocal sw=4 sts=4 noet breakindentopt=shift:8
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
autocmd Filetype html setlocal noet ts=4 sts=4 sw=4
autocmd Filetype python setlocal noet ts=8 sts=2 sw=2
autocmd FileType go setlocal noet ts=2 sts=2 sw=2

if has("autocmd")
  let g:wordhi = 0

  aug wordhi
    au!
  aug END

  fun! MatchCWord()
    sil! exe printf('sil mat IncSearch /\<%s\>/', expand('<cword>'))
  endfun

  fun! ToggleCWordMatch()
    let g:wordhi = !g:wordhi
    if g:wordhi
      au wordhi CursorMoved * call MatchCWord()
      call MatchCWord()
      redraw
      echo "wordhi on"
    else
      au! wordhi
      match
      redraw
      echo "wordhi off"
    endif
  endfun

  fun! FixCWordMatch()
    if g:wordhi
      au! wordhi
    else
      let g:wordhi = 1
    endif
    call MatchCWord()
    echo "wordhi fix"
  endfun

  nnoremap <silent><F7> :call ToggleCWordMatch()<CR>
  nnoremap <silent><F6> :call FixCWordMatch()<CR>
endif

nnoremap <silent><F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
  \ 'ctagstype' : 'go',
  \ 'kinds' : [
    \ 'p:package',
    \ 'i:imports:1',
    \ 'c:constants',
    \ 'v:variables',
    \ 't:types',
    \ 'n:interfaces',
    \ 'w:fields',
    \ 'e:embedded',
    \ 'm:methods',
    \ 'r:constructor',
    \ 'f:functions',
  \ ],
  \ 'sro' : '.',
  \ 'kind2scope' : {
    \ 't' : 'ctype',
    \ 'n' : 'ntype'
  \ },
  \ 'scope2kind': {
    \ 'ctype' : 't',
    \ 'ntype' : 'n',
  \ },
  \ 'ctagsbin' : 'gotags',
  \ 'ctagsargs' : '--sort --silent',
\ }
