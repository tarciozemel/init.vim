call plug#begin('$HOME/.config/nvim/plugged')

" @see https://www.gregjs.com/vim/2016/neovim-deoplete-jspc-ultisnips-and-tern-a-config-for-kickass-autocompletion/
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'crusoexia/vim-monokai'
Plug 'wakatime/vim-wakatime'
call plug#end()










"
"
" GENERAL COMMANDS
"
" @see http://stackoverflow.com/questions/2001190/adding-a-command-to-vim	
"

" save as sudo
ca w!! w !sudo tee "%"

" remove hidden characters '^M' from Windows® docs
command AdjustEndOfLine execute '%s/\r\(\n\)/\1/g' 

" Tabs to spaces
command Tabs2Spaces execute ':1,$s/\t/  /g'

" 2 spaces to 4 spaces
command TwoSpaces2FourSpaces execute ':%s/^\s*/&&/g'










"
"
" GENERAL CONFIGS
" 	
"

" UTF-8 encoding
set encoding=utf-8

" Change <Leader>
let mapleader = ","

" Use dash in autocomplete
set iskeyword+=\-

" Store swap files in fixed location, not current directory
" http://stackoverflow.com/a/4331812/922143
set dir=~/.config/nvim/swap//,/tmp//,.

" Autocomplete
    augroup omni_complete
        " clear commands before resetting
        autocmd!

        " Enable omnicomplete for supported filetypes
        autocmd FileType css,scss,sass setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    augroup END

    " Remap code completion to Ctrl+Space
    " inoremap <Nul> <C-x><C-o>

" Undo leves
set history=300
set undolevels=300

" Don't break lines in the middle of words
set linebreak

" TABs
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" Line numbers
set number
set relativenumber

" Identing
set autoindent

" Search

    " Incremental search
    set incsearch
    
    " Ignore case in search
    set ignorecase
 
    " Highlighted search results
    set hlsearch

    " Highlighted search results; press Space to turn off highlighting
    :nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Highlight actual line
set cursorline

" When scrolling, keep cursor 5 lines away from screen border
set scrolloff=5

" Folding and unfolding
"
" za : toggle folding
" zM : fold everything
" zR : unfold everything
" zm & zr : get those folds just right
"
" http://stackoverflow.com/a/10644424/922143
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=0         "this is just what i use"

    " Don't screw up folds when inserting text that might affect them,
    " until leaving insert mode. Foldmethod is local to the window.
    " http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
    autocmd InsertEnter * let w:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave * let &l:foldmethod=w:last_fdm

" Sort selected lines
vnoremap <F9> :sort<CR>

" Easier moving of code blocks
vnoremap < <gv
vnoremap > >gv

" Abbreviations
cab W! w!
cab Q! q!
cab Wq wq
cab Wa wa
cab wQ wq
cab WQ wq
cab W w
cab Q q

" Theme
syntax on
colorscheme monokai










"
" PLUGINS CONFIGS
" 	

" deoplete

    " Enable deoplete at startup
    let g:deoplete#enable_at_startup = 1

    " Disable auto-autocompletion
    " let g:deoplete#disable_auto_complete = 1

    " deoplete tab-complete
    inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<C-j>"
    inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<C-k>"

    " Tern

		" Deoplete config to play nice with multiple omnifunctions provided by third-party plugins
		let g:deoplete#omni#functions = {}
		let g:deoplete#omni#functions.javascript = [
			\ 'tern#Complete',
			\ 'jspc#omni'
		\]

		" Adjust which sources Deoplete pulls from when showing completions
		set completeopt=longest,menuone,preview
		let g:deoplete#sources = {}
		let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
		let g:tern#command = ['tern']
		let g:tern#arguments = ['--persistent']

		" gb keybinding for moving the cursor straight to a variable definition using Tern’s JS code analysis engine
		autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

		" Automatically closing the scratch window at the top of the vim window on finishing a complete or leaving insert
		autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

		" Disable the preview entirely
		" set completeopt-=preview"

" ctrlp

    " Custom ignore folders & files
    let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|ttf|woff|woff2|jpg|png|gif))$'

" gitgutter

    " The length of time Vim waits after you stop typing before it triggers the plugin
    set updatetime=250

" NERDTree

    " F3 to toggle NERDTree
    map <F3> :NERDTreeToggle<CR>

    " Ignore files on NERDTree
    let NERDTreeIgnore = [
        \'\.git[[dir]]',
        \'\.sass-cache[[dir]]',
        \'node_modules[[dir]]',
        \'bower_components[[dir]]',
        \'\.pyc$',
        \'\.pyo$',
        \'\.idea$',
        \'\.vscode$',
        \'\.tags$'
    \]

    " Show hidden files
    let NERDTreeShowHidden=1

    " Open NERDTree automatically when vim starts up on opening a directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

    " Close vim if the only window left open is a NERDTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERD Commenter

    " Make sure that you have filetype plugins enabled
    filetype plugin on
    
    " Add spaces after comment delimiters by default
    let g:NERDSpaceDelims = 1

" indentLine

    " Change Character Color
    let g:indentLine_color_term = 239

    " Change Indent Char
    let g:indentLine_char = '┆'

    " Remove indent lines from NERDTree
    autocmd FileType help,nerdtree IndentLinesToggle

" editorconfig-vim
    
    " Avoid loading EditorConfig for any remote files over ssh
    let g:EditorConfig_exclude_patterns = ['scp://.*']

" Airline

let g:airline_powerline_fonts          = 1
let g:airline_symbols                  = {}
let g:airline_symbols.branch           = ''
let g:airline_section_b                = '%{fugitive#head()}'
let g:airline#extensions#hunks#enabled = 0
