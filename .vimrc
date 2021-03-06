"=====================================================
""" Vundle settings
"=====================================================
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

"=====================================================
"-------------------===   Vundle	===-----------------------------
Plugin 'gmarik/Vundle.vim'

"-------------------===	  Python	===-----------------------------
Plugin 'klen/python-mode'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

"-------------------===   Folding	===-----------------------------
Plugin 'tmhedberg/SimpylFold'

"-------------------===   AutoComplete	===-----------------------------
Bundle 'Valloric/YouCompleteMe'
Plugin 'Jiangmiao/auto-pairs'

"-------------------===   commentary	===-----------------------------
Plugin 'tpope/vim-commentary'

"-------------------===   Navigation	===-----------------------------
Plugin 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

"-------------------=== Snippets support ===--------------------
" Plugin 'garbas/vim-snipmate'                " Snippets manager
" Plugin 'MarcWeber/vim-addon-mw-utils'       " dependencies #1
" Plugin 'tomtom/tlib_vim'                    " dependencies #2
" Plugin 'honza/vim-snippets'                 " snippets repo

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

"-------------------=== Other ===-------------------------------
Plugin 'bling/vim-airline'                  " Lean & mean status/tabline for vim
Plugin 'vim-airline/vim-airline-themes'     " Themes for airline
Plugin 'Lokaltog/powerline'                 " Powerline fonts plugin
Plugin 'flazz/vim-colorschemes'             " Colorschemes
Plugin 'chriskempson/base16-vim'	    " dont know what is this
"Plugin 'nightsense/forgotten'
Plugin 'beigebrucewayne/Turtles'
"Plugin 'reewr/vim-monokai-phoenix'
Plugin 'lifepillar/vim-cheat40'

"=====================================================

call vundle#end()            " required
filetype on
filetype plugin on
filetype plugin indent on    " required

"=====================================================
""" general settings
"=====================================================

" split setting
set splitbelow
set splitright
"nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" folding
" - default folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
" - simpylFold folding
let g:SimpylFold_docstring_preview = 1

" other general
set nu			" set line number
set encoding=utf-8	" utf-8
syntax enable		" syntax highlight
set t_Co=256		" set 256 colors
set ruler
set ttyfast		" terminal acceleration
set cursorline		" shows line under the cursor's line
set showmatch		" shows matching part of bracket pairs (), [], {}
" Additional mappings for Esc (useful for MacBook with touch bar)
inoremap jj <Esc>

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10	" let 10 lines before/after cursor during scroll

set clipboard=unnamed  	" use system clipboard

" searching
set incsearch		" incremental search
set hlsearch		" highlight search results


" manually add PEP8
"" which is done in python-mode
au BufNewFile,BufRead *.py
    \set tabstop=4
    \set softtabstop=4
    \set shiftwidth=4
    \set textwidth=79
    \set expandtab
    \set autoindent
    \set fileformat=unix


"=====================================================
""" python-mode settings
"=====================================================
" python executables for different plugins
"let g:pymode_python='/usr/bin/python'
"let g:syntastic_python_python_exec='/usr/bin/python'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=0
let g:pymode_doc_key='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

"=====================================================
""" YouCompleteMe settings
"=====================================================
let g:ycm_python_binary_path = '/usr/bin/python'

" close preview after quiting insert mode
let g:ycm_autoclose_preview_window_after_completion=0
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" include string
let g:ycm_collect_identifiers_from_comments_and_strings = 0

" ignore cache and re-gen every time
let g:ycm_cache_omnifunc=0
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"=====================================================
""" syntastic settings
"=====================================================
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=5
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'
let g:syntastic_python_checkers=['flake8', 'pydocstyle', 'python']

"=====================================================
""" nerdtree settings
"=====================================================
" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
" make NERDTree run at startup
let g:nerdtree_tabs_open_on_console_startup=1

"=====================================================
""" ctrlP settings
"=====================================================
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }

"=====================================================
""" SnipMate settings
"=====================================================
"let g:snippets_dir='~/.vim/vim-snippets/snippets'
" imap <C-j> <Plug>snipMateNextOrTrigger
" smap <C-j> <Plug>snipMateNextOrTrigger
" ----------------------------------------------------
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<C-j>"

"=====================================================
""" AirLine settings
"=====================================================
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

" powerline settings
set laststatus=2
let g:Powerline_symbols='unicode'
let g:syntastic_shell='/bin/bash'

"=====================================================
""" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=35
autocmd BufEnter *.py :call tagbar#autoopen(0)
autocmd BufWinLeave *.py :TagbarClose

"=====================================================
""" colorscheme settings
"=====================================================
let base16colorspace=256
colorscheme smyck
