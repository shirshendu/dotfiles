".vimrc file - Save this file as .vimrc in your home directory. (e.g. /home/user/.vimrc). Open VIM, run :FirstSetup, then run :PluginInstall
" You might want to complete the YouCompleteMe setup after this, look at the
" docs.
command FirstSetup execute "!mkdir -p ~/.vim/bundle && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim" | source ~/.vimrc
" :PluginInstall

" General
set nocompatible

" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'kien/ctrlp.vim'
"Plugin 'claco/jasmine.vim'
"Plugin 'othree/javascript-libraries-syntax'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'burnettk/vim-angular'
"Plugin 'curist/vim-angular-template'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-cucumber'
Plugin 'tpope/vim-dispatch'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
"Plugin 'othree/yajs.vim'
"Plugin 'maksimr/vim-jsbeautify'
Plugin 'mxw/vim-jsx'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-markdown'
"Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vividchalk'
Plugin 'danro/rename.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'embear/vim-localvimrc'
Plugin 'jwhitley/vim-matchit'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'rodjek/vim-puppet'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let python_highlight_all=1

"" Load pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"
"call pathogen#infect()
se t_Co=16
let g:solarized_termcolors=16
syntax on
filetype plugin indent on
" Theme/Colours
set background=dark
colorscheme solarized

" Vim UI
set cursorline
"set cursorcolumn
hi CursorLine cterm=none
" Key mapping to avoid <Esc>
imap ii <Esc>
set ruler		"Show the line and column number of the cursor position

"-- Programming --
set autoindent		"Copy indent from current line when starting a new line
set smartindent
"-- Spaces/Tabs --
set softtabstop=2 "Unify
set expandtab		"Use spaces instead of tabs
set shiftwidth=2 "Unify
set tabstop=2 "Tab spacing (Settings below are just to unify it)
"-- Searching --
set hlsearch		"Highlight search results
"Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>

set mouse=a

set noshowmatch "Show matching brackets
set mat=5
set incsearch
set statusline=%t%m%r%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>:edit 
"Switch between tabs by pressing Shift-Tab
map <S-Tab> gt
"NERDTree Shortcut
map <F4> :NERDTreeToggle<CR>
imap <Tab> <C-P>
map <C-K> <Leader>ci
"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start

" manpage viewing in Vim
runtime ftplugin/man.vim

" latexSuite plugin
set grepprg=grep\ -nH\ $*

set number          " Line numbers
set ff=unix " Unix line endings
" Spell check plugin for vim 7
"setlocal spell spelllang=en_gb
"setlocal spell encoding=utf-8
autocmd VimEnter * NERDTree | wincmd p 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:vimrubocop_keymap = 0
nmap <Leader>r :SyntasticCheck rubocop<CR>
"let g:rspec_command = '!bundle exec zeus rspec --drb {spec}'
let g:rspec_command = "!bundle exec zeus rspec {spec}"
" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>
set tags=.git/tags
"let g:syntastic_ruby_mri_exec = '/usr/local/var/rbenv/versions/1.9.3/bin/ruby'
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_enable_ruby_rubocop_checker = 1
let g:syntastic_javascript_checkers = ['jshint']
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
let g:airline_powerline_fonts=1
"let g:used_javascript_libs = 'jquery,react'
".vimrc

map <c-f> :Autoformat<cr>
map <c-g> :%s/\s\+$//<cr>
" for html
"autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
" for css or scss
"autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore "node_modules" --ignore "vendor"'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

let g:EclimCompletionMethod = 'omnifunc'
let g:formatdef_rubocop_rb = '"rubocop --auto-correct"'
let g:formatters_ruby = ['rubocop_rb']

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
