"pathogen setup
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"see vim-rails plugin doc [rails.txt]
set nocompatible
syntax on
filetype plugin indent on


" SHORTCUT KEY MAPPINGS """""""""""""""""""

"ctrl+alt+f for ack current word in command mode
map <C-M-f> :call AckGrep()<CR>
function! AckGrep()
  let command = "ack ".expand("<cword>")
  cexpr system(command)
  cw
endfunction

"prev/next in quickfix file listing (e.g. search results)
map <M-D-Down> :cn<CR>
map <M-D-Up> :cp<CR>

"select open file, MRU sorted
map <D-e> :FufBuffer<CR>

"open file
map <D-N> :FufFile **/<CR>

"opt-cmd-arrows [next & previous open files]
map <M-D-Left> :bp<CR>
map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

"Undo/Redo using undo tree with cmd-z/cmd-shift-z
map <D-z> :earlier 1<CR>
map <D-Z> :later 1<CR>

"file tree browser - backslash
map \ :NERDTreeToggle<CR>

"comment/uncomment visual selection with cmd+/
vmap <D-/> <plug>NERDCommenterToggle
"comment/uncomment current line with cmd+/
nmap <D-/> <plug>NERDCommenterToggle

"strip trailing whitespace on save for code files
"cocoa
autocmd BufWritePre *.m,*.h,*.c,*.mm,*.cpp,*.hpp :%s/\s\+$//e
"rails
autocmd BufWritePre *.rb,*.yml,*.js,*.css,*.less,*.sass,*.html,*.xml,*.erb,*.haml :%s/\s\+$//e
"misc
autocmd BufWritePre *.java,*.php :%s/\s\+$//e


" SETTINGS """"""""""""""""""""""""""""""""
if has("gui_macvim")
  set t_Co=256
  colorscheme vividchalk
endif

"Minibuf tab colors - must be set after colorscheme
"Changed + Hidden buffers
hi MBEChanged guibg=darkred ctermbg=darkred guifg=red ctermfg=red
"Changed + Visible buffers
hi MBEVisibleChanged guifg=darkred ctermfg=darkred

"Show whitespace, fullstops for trailing whitespace
set list
set listchars=trail:.

"Keep backup files somewhere else
set backupdir=~/.vim-tmp,~/tmp,/var/tmp,/tmp

"No swapfiles
set noswapfile

"no toolbar
set guioptions=-T

"font
set guifont=Inconsolata:h24

"history size
set history=1024

"incremental search
set incsearch

"no wrapping
set wrap!

"line numbers
set number

"always show statusline
set laststatus=2

"show matching brackets
set showmatch

"tab settings
set tabstop=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab

set scrolloff=3

" Rayban & Peter
let mapleader = ","

" FuzzyFinder and switchback commands
map <leader>e :e#<CR>
map <leader>b :FufBuffer<CR>
map <leader>f :FufFile<CR>
map <leader><C-N> :FufFile **/<CR>

" search
map <leader>s :%s/

" Split screen vertically and move between screens.
map <leader>v :vsp<CR>
map <leader>w ^Ww
map <leader>= ^W=

" Move between horizontally split screens.
map <leader>j ^Wj
map <leader>k ^Wk

" AckGrep current word
map <leader>a :call AckGrep()<CR>

" set question mark to be part of a VIM word. in Ruby it is!
set isk=@,48-57,_,?,!,192-255

" Insert ' => '
imap  <Space>=><Space>

" reload .vimrc
map <leader>rv :source ~/.vimrc<CR>

" ctags again with gemhome added
map <leader>t :!/usr/local/bin/ctags -R --exclude=.git --exclude=log * `rvm gemhome`/*<CR>

" F7 reformats the whole file and leaves you where you were (unlike gg)
map <F7> mzgg=G'z :delmarks z<CR>

" Make Cmd-// comment the current line, except Cmd-/ is bound, so it doesn't
" work right now.
"map <D-/><D-/> v<D-/>

" Turn on Ruby folding but unfold when you open a new file because it's
" annoying
"let ruby_fold=1
"au BufAdd *.rb foldopen!

" Write all writeable buffers when changing buffers or losing focus.
autocmd BufLeave * wall
autocmd FocusLost * wall

" Show typed command prefixes while waiting for operator.
set showcmd
set ruler           " cursor position

" more search options
set hlsearch
set smartcase
" Open reposh
map <C-G> :!reposh<CR>
map <C-A> :!gitx<CR><CR>

" Find tag
map <D-˜> :FufTag<CR>
