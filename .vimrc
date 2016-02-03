
"--------------------------------------------------------------------------------
" VUNDLE
"--------------------------------------------------------------------------------
" do we want vundle?
if !filereadable(expand('~/.vim/novundle'))

  " do we have vundle?
  let vundle_setup = 0
  if !filereadable(expand('~/.vim/bundle/Vundle.vim/README.md'))
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
    let vundle_setup = 1
  endif

  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  Plugin 'christoomey/vim-tmux-navigator'
  " Custom Key Bindings for vim-tmux-navigator
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-Left> :TmuxNavigateLeft<cr>
  nnoremap <silent> <m-Left> :TmuxNavigateLeft<cr>
  nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-Down> :TmuxNavigateDown<cr>
  nnoremap <silent> <m-Down> :TmuxNavigateDown<cr>
  nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-Up> :TmuxNavigateUp<cr>
  nnoremap <silent> <m-Up> :TmuxNavigateUp<cr>
  nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <c-Right> :TmuxNavigateRight<cr>
  nnoremap <silent> <m-Right> :TmuxNavigateRight<cr>
  nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

  Plugin 'scrooloose/nerdTree'
  "autocmd StdinReadPre * let s:std_in=1
  "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  map <C-n> :NERDTreeToggle<CR>

  Plugin 'bling/vim-airline'

  Plugin 'scrooloose/nerdcommenter'

  Plugin 'majutsushi/tagbar'
  nnoremap <silent> <F9> :TagbarToggle<CR>
  let g:tagbar_autoclose = 1
  let g:tagbar_compact = 0
  let g:tagbar_indent = 1
  let g:tagbar_show_linenumbers = 1
  let g:tagbar_width = 50
  "let g:tagbar_autopreview = 0
  "let g:tagbar_previewwin_pos = "aboveleft"

  Plugin 'kien/ctrlp.vim'
  let g:ctrlp_map = '<c-p>'
  let g:ctrlp_cmd = 'CtrlP'

  Plugin 'AndrewRadev/switch.vim'
  let g:switch_mapping = '<c-t>'

  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line

  " firstime setup
  if vundle_setup == 1
    :PluginInstall
    :q
  endif
endif



"--------------------------------------------------------------------------------
" MY OWN CONFIG
"--------------------------------------------------------------------------------
" viMproved
set nocompatible

" moving around, searching and patterns
set wrapscan
set incsearch

" text display
set nowrap
set number

" syntax and highlighting
if has("gui_running")
	set background=light
	set guioptions=agimLt
else
	set background=dark
endif
syntax on
set hlsearch
 
" splitting / multiple windows
set splitbelow
set splitright

" messages and info
set showcmd
set ruler

" editing text
" set backspace=indent,eol,start

" tabs and identing
set tabstop=2
set shiftwidth=2
set expandtab

set autoindent
set smartindent
set copyindent
set preserveindent

" reading and writing files
set nobackup
set noundofile

" command line editing
set history=50

" ladder key
let mapleader=","
set timeout timeoutlen=1500

" jump to the last known position
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
