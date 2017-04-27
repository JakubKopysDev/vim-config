call pathogen#infect()
syntax on
filetype plugin indent on

<<<<<<< HEAD
" Solarized color scheme
" filetype on
" syntax enable
" set background=dark
" colorscheme solarized
"
" Railscasts colorscheme config
syntax on
 set t_Co=256
 colorscheme railscasts
=======
filetype on
syntax enable
set background=dark
let g:solarized_termcolors=256 "this is what fixed it for me
colorscheme solarized
set number
>>>>>>> cea6eb233336a608049f32133eacedb75ac65c40

" display line numbers
set number

filetype indent on
set whichwrap=b,s,<,>,h,l      " those keys can exceed linebreaks
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set autoindent

set formatoptions=c,r,t        " c - autowrap comments using textwidth
                               " r - automatically insert the current comment leader after hitting <Enter>
                               " t - autowrap text using textwidth(does not apply to comments)

set backspace=indent,eol,start " allow backspacing over everything in insert mode

set nobackup                   " don't create backup files
set nowritebackup              " nor create them for edit time

set splitbelow                 " :sp to open new window over active one
set splitright                 " :vs to open new window on the righht side of active one

set linebreak                  " don't break words across the line

set display+=lastline          " show incomplete paragraphes

set paste                      " paste without indentations

set ruler                      " show cursor position

" remove whitespaces on save
autocmd BufWritePre * :%s/\s\+$//e

" searching highlights found words
set hlsearch

" ability to cancel a serach with Escape
nnoremap <silent> <Esc> :nohlsearch<Bar>:echo<CR>

" Open NERDTree automatically when vim starts up if no files were specifeid
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle NERDTree with Ctrl+n
map <C-n> :NERDTreeToggle %<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeIgnore=['\.DS_Store', '\~$', '\.swp', '\.idea']
" Autoclose vim if only remaining is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" treat <li> and <p> tags like block tags they are
let g:html_indent_tags = 'li\|p'

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Show git branch in the statusline (lightline.vim and vim-fugitive)
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

" no transparent bg using vim
let g:solarized_termtrans = 0
