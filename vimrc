" This needs to be off for Vundle, turned back on after
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle - required!
Bundle 'gmarik/vundle'

" Vim Plugins
Bundle 'AndrewRadev/vim-eco'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'ervandew/screen'
Bundle 'ervandew/supertab'
Bundle 'godlygeek/tabular'
Bundle 'groenewege/vim-less'
Bundle 'isRuslan/vim-es6'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'mattn/webapi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'nviennot/molokai'
Bundle 'othree/html5.vim'
Bundle 'quentindecock/vim-cucumber-align-pipes'
Bundle 'rking/ag.vim'
Bundle 'rodjek/vim-puppet'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/gundo.vim'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'yaymukund/vim-rabl'
Bundle 'slim-template/vim-slim'
Bundle 'elixir-lang/vim-elixir'

"""""""""""""""""""""""""
" Basic features
"""""""""""""""""""""""""
set nocompatible

" Display options
syntax on
set nocursorline
set number
set encoding=utf-8
set fileencoding=utf-8
set list!
set listchars=tab:▸\ ,trail:•,extends:»,precedes:«
if $TERM =~ '256color'
  set t_Co=256
elseif $TERM =~ '^xterm$'
  set t_Co=256
endif
colorscheme molokai

" Misc
filetype plugin indent on       " Do filetype detection and load custom file plugins and indent files
set hidden                      " Don't abandon buffers moved to the background
set wildmenu                    " Enhanced completion hints in command line
set wildmode=list:longest,full  " Complete longest common match and show possible matches and wildmenu
set backspace=eol,start,indent  " Allow backspacing over indent, eol, & start
set complete=.,w,b,u,U,t,i,d    " Do lots of scanning on tab completion
set updatecount=100             " Write swap file to disk every 100 chars
set directory=~/.vim/swap       " Directory to use for the swap file
set diffopt=filler,iwhite       " In diff mode, ignore whitespace changes and align unchanged lines
set history=1000                " Remember 1000 commands
set scrolloff=3                 " Start scrolling 3 lines before the horizontal window border
set visualbell t_vb=            " Disable error bells
set shortmess+=A                " Always edit file, even when swap file is found
set directory=/tmp "sets the swap (.swp) file directory

" up/down on displayed lines, not real lines. More useful than painful.
noremap k gk
noremap j gj

" shift+k -> like shift+j, but no extra space
noremap <S-k> gJ

" Formatting, indentation and tabbing
set autoindent smartindent
set smarttab                    " Make <tab> and <backspace> smarter
set expandtab
set tabstop=2
set shiftwidth=2
set textwidth=80
set formatoptions-=t formatoptions+=croql

" viminfo: remember certain things when we exit
" (http://vimdoc.sourceforge.net/htmldoc/usr_21.html)
"   %    : saves and restores the buffer list
"   '100 : marks will be remembered for up to 30 previously edited files
"   /100 : save 100 lines from search history
"   h    : disable hlsearch on start
"   "500 : save up to 500 lines for each register
"   :1000 : up to 1000 lines of command-line history will be remembered
"   n... : where to save the viminfo files
set viminfo=%100,'100,/100,h,\"500,:1000,n~/.vim/viminfo

" ctags: recurse up to home to find tags. See
" http://stackoverflow.com/questions/563616/vim-and-ctags-tips-and-tricks
" for an explanation and other ctags tips/tricks
set tags+=tags;$HOME

" Undo
set undolevels=10000
if has("persistent_undo")
  set undodir=~/.vim/undo       " Allow undoes to persist even after a file is closed
  set undofile
endif

" Search settings
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch

" to_html settings
let html_number_lines = 1
let html_ignore_folding = 1
let html_use_css = 1
let xml_use_xhtml = 1

" When opening a file, always jump to the last cursor position
autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \     exe "normal g'\"zz" |
    \ endif |


" After 4s of inactivity, check for external file modifications on next keyrpress
au CursorHold * checktime

"""""""""""""""""""""""""
" Keybindings
"""""""""""""""""""""""""
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let mapleader=","
let localmapleader=","

" nmap <Leader>s :%S/
" vmap <Leader>s :S/

vnoremap . :normal .<CR>
vnoremap @ :normal! @

" Toggles
set pastetoggle=<F1>
" the nmap is just for quicker powerline feedback
nmap <silent> <F1>      :set invpaste<CR>
nmap          <F2>      :setlocal spell!<CR>
imap          <F2> <C-o>:setlocal spell!<CR>
nmap <silent> <F3>      :set invwrap<CR>
" TODO toggle numbers

map <Leader>/ :nohlsearch<cr>
map <Home> :tprev<CR>
map <End>  :tnext<CR>

" TODO Do also cnext and cprev as a fallback
map <PageDown> :lnext<CR>
map <PageUp>   :lprev<CR>

" Make Y consistent with D and C
function! YRRunAfterMaps()
  nnoremap <silent> Y :<C-U>YRYankCount 'y$'<CR>
endfunction

" Disable K for manpages - not used often and easy to accidentally hit
noremap K k

" Resize window splits
" TODO Fix mousewheel
nnoremap <Up>    3<C-w>-
nnoremap <Down>  3<C-w>+
nnoremap <Left>  3<C-w><
nnoremap <Right> 3<C-w>>

nnoremap _ :split<cr>
nnoremap \| :vsplit<cr>

map <Leader>l :set invwrap<cr>
map <Leader>p :set invpaste<cr>
map <Leader>s :SyntasticToggleMode<cr>

" interferes with the surround plugin
" vmap s :!sort<CR>

" Write file when you forget to use sudo
cmap w!! w !sudo tee % >/dev/null

"""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""
nnoremap <Leader>b :BufSurfBack<cr>
nnoremap <Leader>f :BufSurfForward<cr>

nnoremap <S-u> :GundoToggle<CR>
let g:gundo_close_on_revert=1


" TODO Merge the NERDTreeFind with Toggle inteilligently.
nnoremap <C-g> :NERDTreeToggle<cr>
" nnoremap <C-f> :NERDTreeFind<cr>

let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
                   \ '\.so$', '\.egg$', '^\.git$', '\.cmi', '\.cmo' ]
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1

map <silent> <Leader>gd :Gdiff<CR>
map <silent> <Leader>gb :Gblame<CR>
map <silent> <Leader>gg :Gbrowse<CR>

nnoremap <Leader>a :Ack

" Put a space around comment markers
let g:NERDSpaceDelims = 1

nnoremap <C-y> :YRShow<cr>
let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_manual_clipboard_check = 0

" Syntastic

let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['c', 'scss', 'html', 'scala'] }
let g:syntastic_javascript_checkers = ['jsxhint'] " depends on jsxhint (npm -g install jsxhint)


let g:quickfixsigns_classes=['qfl', 'vcsdiff', 'breakpoints']

let g:Powerline_symbols = 'unicode'
set laststatus=2

let g:ctrlp_map = '<Leader>.'
let g:ctrlp_custom_ignore = '/\.\|\.o\|\.so'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_regexp = 1
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files']
map <Leader>, :CtrlPMRU<CR>

noremap \= :Tabularize /=<CR>
noremap \: :Tabularize /^[^:]*:\zs/l0l1<CR>
noremap \> :Tabularize /=><CR>
noremap \, :Tabularize /,\zs/l0l1<CR>
noremap \{ :Tabularize /{<CR>
noremap \\| :Tabularize /\|<CR>
noremap \& :Tabularize /\(&\\|\\\\\)<CR>

nnoremap <Leader>t :TagbarOpen fjc<CR>

" Screen settings
let g:ScreenImpl = 'Tmux'
let g:ScreenShellTmuxInitArgs = '-2'
let g:ScreenShellInitialFocus = 'shell'
let g:ScreenShellQuitOnVimExit = 0

map <C-\> :ScreenShellVertical<CR>

nmap ,gi :Gist
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1

"""""""""""""""""""""""""
" Ruby Stuff
"""""""""""""""""""""""""
command -nargs=? -complete=shellcmd W  :w | :call ScreenShellSend("load '".@%."';")
map <Leader>r :w<CR> :call ScreenShellSend("bundle exec rspec ".@% . ':' . line('.'))<CR>
map <Leader>e :w<CR> :call ScreenShellSend("bundle exec cucumber --format=pretty ".@% . ':' . line('.'))<CR>
map <Leader>w :w<CR> :call ScreenShellSend("break ".@% . ':' . line('.'))<CR>
map <Leader>m :w<CR> :call ScreenShellSend("\e[A")<CR>

"""""""""""""""""""""""""
" Javascript / JSX syntax
"""""""""""""""""""""""""

let g:jsx_ext_required = 0 " set .js files to be highlighted as jsx files

"""""""""""""""""""""""""
" Cscope
"""""""""""""""""""""""""
if has("cscope")
  " Use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag

  " Check cscope for definition of a symbol before checking ctags. Set to 1 if
  " you want the reverse search order.
  set csto=0

  " Add any cscope database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
  endif

  " Show msg when any other cscope db is added
  set cscopeverbose
end

"
" Source custom vim from ~/.custom.vim
"
if filereadable(expand("~/.custom.vim"))
  source ~/.custom.vim
endif

" RABL syntax highlighting
au BufRead,BufNewFile *.rabl setf ruby
