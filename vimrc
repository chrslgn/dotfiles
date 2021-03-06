set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'scrooloose/nerdtree'
Bundle 'godlygeek/tabular'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'kien/ctrlp.vim'
Bundle 'briancollins/vim-jst'
Bundle 'nelstrom/vim-visual-star-search'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'vim-javascript'
Bundle 'vim-ruby/vim-ruby'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'jgdavey/vim-blockle'
Bundle 'ngmy/vim-rubocop'
Bundle 'rking/ag.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'thoughtbot/vim-rspec'


let vimrubocop_config='config/rubocop/rubocop.yml'

filetype plugin indent on

runtime macros/matchit.vim

" Set options for ctrlp.vim
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

let g:rails_projections = {
      \ "app/assets/javascripts/*.js.coffee": { "alternate": "spec/javascripts/%s_spec.coffee" },
      \ "spec/javascripts/*_spec.coffee": { "alternate": [
      \   "app/assets/javascripts/%s.js.coffee",
      \   "app/assets/javascripts/%s.jst.ejs"
      \ ] },
      \ "app/assets/javascripts/*.jst.ejs": { "alternate": "spec/javascripts/%s_spec.coffee" }
      \}

set wildignore+=*/spec/reports/*,*/vendor/*

" Remove the gf mapping that vim.rails adds from coffee files
" :verbose nmap gf
autocmd User Rails.javascript.coffee* nunmap <buffer> gf
"set path+=app/assets/javascripts/cde/*,spec/javascripts
set suffixesadd=.jst.ejs,.js.coffee

syntax on
set laststatus=2
set encoding=utf-8

map <leader>ff :CtrlP<CR>
map <leader>fb :CtrlPBuffer<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>t  :A<CR>
map <leader>ts :AS<CR>
map <leader>tv :AV<CR>
map <leader>rm :Rmodel<CR>
map <leader>rc :Rcontroller<CR>
map <leader>rh :Rhelper<CR>
map <leader>ru :Runittest<CR>
map <leader>rf :Rfunctionaltest<CR>
map <leader>ro :Robserver<CR>
map <leader>rv :Rview<CR>
map <leader>rl :Rlocale<CR>
imap jj <Esc>

set autoread    "Auto reload files changed outside of vim automatically
set wildmenu
set wildmode=list:longest
set splitright
set splitbelow
set cindent
set smartindent
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set hidden
set number
set ic
set hlsearch
set incsearch
set noswapfile
set nobackup
set autoread      "Autoreload files changed externally
set noeb vb t_vb=
set so=5
set foldmethod=syntax
set foldminlines=1
set foldlevel=100
set backspace=indent,eol,start   "Fix weird backspace issue with terminal vim
au GUIEnter * set vb t_vb=
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

colorscheme Molokai
set guifont=Monaco:h15

let g:Powerline_symbols = 'fancy'
"set guioptions-=T guioptions-=e guioptions-=L guioptions-=r
set shell=bash

let @c='ggjGf x:%s/ #.*$//gvapJ'

nnoremap <Leader>[ :tabprevious<CR>
nnoremap <Leader>] :tabnext<CR>
nnoremap <silent> <Enter> :nohlsearch<Bar>:echo<CR>

augroup vimrc
autocmd!
"autocmd GuiEnter * set columns=120 lines=70 number
augroup END

" remove whistespace at end of line before write
func! StripTrailingWhitespace()
  normal mZ
  %s/\s\+$//e
  normal `Z
endfunc
au BufWrite * if ! &bin | call StripTrailingWhitespace() | endif

" Add syntax highlighting for various filetypes
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.prawn setf ruby
au BufRead,BufNewFile *.hamlc setf haml

"Reload .vimrc after updating it
"if has("autocmd")
"  autocmd BufWritePost .vimrc source $MYVIMRC
"endif

let g:EasyMotion_leader_key = ','
nmap <leader>v :tabedit $MYVIMRC<CR>

nnoremap <Leader>h :h <C-r><C-w><CR>
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
nnoremap <Leader>sv :source $MYVIMRC<CR>

" Reload .vimrc after update
if has("autocmd")
  " autocmd BufWritePost .vimrc source $MYVIMRC
endif

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> :tablast<CR>

" Map in insert mode as well
map! <D-1> 1gt
map! <D-2> 2gt
map! <D-3> 3gt
map! <D-4> 4gt
map! <D-5> 5gt
map! <D-6> 6gt
map! <D-7> 7gt
map! <D-8> 8gt
map! <D-9> :tablast<CR>

"map $a <ESC>0 :echoerr "Anti pattern Alert!: Use A instead of $a"<CR>

map <F3> :source $MYVIMRC<CR>:echoerr ".vimrc reloaded"<CR>

"set showtabline=2

"" Search for visual selection
"xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
"xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>
"
"function! s:VSetSearch()
"  let temp = @s
"  norm! gv"sy
"  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
"  let @s = temp
"endfunction

if has("gui_running")
  set background=dark
  set showtabline=2 " Always show the tab bar
  set lines=999 columns=999 " Start vim maximized
  set guioptions+=a guioptions+=P " Enable autocopy on select to system clipboard
endif

if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif

"SPEECEEAL COnnfeg"
"" Shert-cuts to derectorees
ca cde cd ~/Projects/Corndog
ca etl cd ~/Projects/cde-etl

" Rspec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
