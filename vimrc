" vim:et:ts=2:sw=2:fdm=marker
"
" All UTF-8 all the time
scriptencoding utf-8
set encoding=utf-8
set backspace=indent,eol,start

" Initialize Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'evanleck/vim-svelte'
Bundle 'supercollider/scvim'
Bundle 'tomlion/vim-solidity'

" Bundles
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
"Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'scrooloose/syntastic'
"Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'taglist.vim'
"Bundle 'PickAColor.vim'
Bundle 'BufOnly.vim'
"Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
Bundle 'kchmck/vim-coffee-script'
"Bundle 'groenewege/vim-less'
Bundle 'digitaltoad/vim-jade'
Bundle 'leafgarland/typescript-vim'
"Bundle 'godlygeek/csapprox'
"Bundle 'statusline.vim'
Bundle 'wavded/vim-stylus'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'Lokaltog/powerline/powerline'
"Bundle 'AutoTag'
Bundle 'JSON.vim'
Bundle 'guns/xterm-color-table.vim'
Bundle 'fatih/vim-go'
"Bundle 'aliva/vim-fish'
"Bundle 'Jinja'
Bundle 'milkypostman/vim-togglelist'
Bundle 'jsx/jsx.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'Raimondi/delimitMate'
Bundle 'vobornik/vim-mql4'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'junegunn/vim-easy-align'

Bundle 'rking/ag.vim'
Bundle 'JarrodCTaylor/vim-js2coffee'

" Track the engine.
Bundle 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Bundle 'honza/vim-snippets'

"Bundle 'jpalardy/vim-slime'
"Bundle 'mklabs/split-term.vim'

" hems remix
nnoremap <space> i<space><right><esc>
nnoremap subl :exe ':silent !subl % &'<enter>:redraw!<enter>

:tnoremap <Esc> <C-\><C-n>
:tnoremap kj <C-\><C-n>


" Q will quit if not in edit mode
map Q  :wa<CR>:q<CR>
map W  :wa<CR>:w<CR>
map ff :NERDTreeToggle<CR>
" change cursor in different modes
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" make SHIFT arrows work as expected when selecting text?
" check stackoverflow: https://stackoverflow.com/questions/9721732/mapping-shift-arrows-to-selecting-characters-lines
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

" try to implement cut/paste with C-c/x/v
"vmap <C-c> y<Esc>i
"vmap <C-x> d<Esc>i
"map <C-v> pi
"imap <C-v> <Esc>pi
"imap <C-z> <Esc>ui

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" borrowed from rocha again!
" UtliSnips
"let g:UltiSnipsExpandTrigger='<tab>'
"let g:UltiSnipsJumpForwardTrigger='<tab>'
"let g:UltiSnipsJumpBackwardTrigger='<s-tab>'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'

" YCM + Snippets
"UltiSnips"{
function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<c-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<tab>"
            endif
        endif
    endif
    return ""
endfunction
autocmd BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <c-r>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"


" Enable filetype-specific indenting, syntax, and plugins
filetype plugin indent on
syntax on

set t_Co=256
colorscheme roshambo

" transparent background
hi Normal guibg=NONE ctermbg=NONE

" Vim 7.3 and newer can persist undo history across sessions
if v:version >= 703
  set undofile
  set undodir=~/.vim/tmp
endif

" Keep Vim from freaking out under Fish Shell
set shell=bash

set directory=~/.vim/tmp "where to put swap files
set backupdir=~/.vim/backup "where to put backups
set viewdir=~/.vim/view
set autoread "re-read files when they're changed externally
set nobackup
set nowritebackup
set noswapfile

set clipboard+=unnamed "yanks and pastes use the clipboard instead
"set foldlevelstart=99 "no folds, please
set timeoutlen=250 "time to wait for a command (after leader, for example)
set hidden "change buffer without saving
set showmatch "show matching brackets
set matchtime=2 "how many tenths of a second to blink

" Modelines
set modeline
set modelines=5

" Tabs and spacing
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab "expandtab for spaces, noexpandtab for tabs
set smarttab
set autoindent
set smartindent
set shiftround

set colorcolumn=80

" Language-specific settings
autocmd FileType,BufEnter,BufWinEnter python set expandtab tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79 "PEP0008 compliance
autocmd FileType,BufEnter,BufWinEnter ruby,html,htmldjango,eruby set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType,BufEnter,BufWinEnter django set ft=django.html
autocmd FileType,BufEnter,BufWinEnter eruby set ft=eruby.html
autocmd FileType,BufEnter,BufWinEnter less set ft=less.css
autocmd FileType,BufEnter,BufWinEnter scss set ft=scss.css
autocmd FileType,BufEnter,BufWinEnter pug,jade,stylus set expandtab tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType,BufRead,BufNewFile *.json set ft=json
autocmd FileType,BufRead,BufNewFile *.pug set ft=pug
autocmd FileType,BufRead,BufNewFile *.go set filetype=go
autocmd FileType,BufRead,BufNewFile *.rive set filetype=rivescript

set ruler
set nowrap
set number
set laststatus=2
set report=0
set listchars=tab:\▸\ ,trail:·,eol:¶

" Show current line in current window only
set cursorline
autocmd WinEnter,BufEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Automatically strip trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Searching
set nohlsearch "don't highlight search results by default
set ignorecase
set smartcase
set incsearch "search-as-you-type
set gdefault "assume the /g flag on :s substitutions to replace all matches in a line
set wrapscan "searches wrap around the end of the file

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=.DS_Store,*.pyc,*.scssc,COMMIT_EDITMSG
set wildignore+=*/.git/*,*/node_modules/*
set wildignore+=*/tmp/*
set wildignore+=*/vendor/*
set wildignore+=sass-cache/*,.sass-cache/*,*.scssc
set infercase "ignore case on insert completion

" Window management
set splitbelow "open new horizontal splits below the current
set splitright "open new veritcal splits to the right of the current

" Enable the mouse in terminal Vim (if supported)
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Text formatting options, mostly around comments. See fo-table.
set formatoptions+=rocr


" KEYBINDINGS

" The comma is way easier to reach than the backslash, the default <leader>
let mapleader=','

" Escape key alternatives
imap kj <Esc>
vmap kj <Esc>

" remapping vim-multiple-cursors
"let g:multi_cursor_use_default_mapping=0

" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"let g:multi_cursor_prev_key='<C-p>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='kj'

"let g:multi_cursor_quit_key='kj'

" can press <Tab> as well!
"nnoremap <Tab> <Esc>
"vnoremap <Tab> <Esc>gV
"onoremap <Tab> <Esc>
"inoremap <Tab> <Esc>`^
"inoremap <Leader><Tab> <Tab>
" Show registers
map <Leader>r :registers<CR>

" Toggles
map <Leader>i :set invlist<CR>:exe ":echo 'toggling invisibles'"<CR>
map <Leader>. :set number! nonumber?<CR>
map <Leader>s :set hlsearch! hlsearch?<CR>
map <Leader>w :set wrap! wrap?<CR>
map <Leader>p :set paste! nopaste?<CR>

" Tabs
nmap TT :wa<CR>:tabnew<CR>

" Buffers
nmap BN :wa<CR>:bnext<CR>
nmap BP :wa<CR>:bprev<CR>
nmap BO :wa<CR>:BufOnly<CR>
nmap BD :wa<CR>:bdelete<CR>

" Remove empty buffers
function! g:CleanEmptyBuffers()


  let buffers = filter(range(0, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val)<0')
  if !empty(buffers)
  exe 'bw '.join(buffers, ' ')
  endif
endfunction

nmap BC :call g:CleanEmptyBuffers()<CR>

" Session management
nmap SSA :wa<CR>:mksession! ~/.vim/session/
nmap SO :wa<CR>:so ~/.vim/session/

" Splits
map SP :wa<CR>:sp<CR>
map VS :wa<CR>:vs<CR>

" Tri-Split
nmap SSS :wa<CR>:vs<CR><C-w><C-l>:sp<CR><C-w><C-h>:exe ":echo 'Pew pew pew!'"<CR>

" File Handling
nmap E :wa<CR>:e

" Shortcut to open stuff in the Vim directory (mostly just to ease .vimrc
" hacking)
nmap <Leader>v :wa<CR>:e ~/.vim/

" Spaces and tabs settings
nmap <Leader>1 :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>:exe ":echo 'Spaces, 4'"<CR>
nmap <Leader>2 :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>:exe ":echo 'Spaces, 2'"<CR>
nmap <Leader>3 :set noexpandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>:exe ":echo 'Tabs, 4'"<CR>
nmap <Leader>4 :set noexpandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>:exe ":echo 'Tabs, 2'"<CR>

" Visual Mode Blockwise Indent
" This keeps the current visual block selection active after changing indent
" with '<' or '>'. Usually the visual block selection is lost after you shift
" it, which is incredibly annoying.
" http://vim.wikia.com/wiki/Short_mappings_for_common_tasks
vmap > >gv
vmap < <gv

" PLUGIN CONFIGURATION

" NERDTree
map <Leader>n :NERDTreeToggle<CR>
map <Leader>f :NERDTreeFind<CR>
map ff :NERDTreeFind<CR>

let NERDChristmasTree=1
let NERDTreeHighlightCursorline=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeHijackNetrw=1
let NERDTreeIgnore=['\.$', '\~$', '\.git', '\.DS_Store', '.*\.pyc']

" NERDCommenter
let NERDSpaceDelims=0 "number of spaces to add before comments
map <c-c> <plug>NERDCommenterToggle<cr>
imap <c-c> <esc><plug>NERDCommenterToggle<cr>a

" Exuberant CTags
map <Leader>l :TlistToggle<CR>
map <Leader>m :TagbarToggle<CR>


"let g:CoffeeAutoTagDisabled=<0 or 1>     " Disables autotaging on save (Default: 0 [false])
"let g:CoffeeAutoTagFile=<filename>       " Name of the generated tag file (Default: ./tags)
"let g:CoffeeAutoTagIncludeVars=<0 or 1>  " Includes variables (Default: 0 [false])
"let g:CoffeeAutoTagTagRelative=<0 or 1>  " Sets file names to the relative path from the tag file location to th

map CC :CtrlPClearCache<CR>
let g:ctrlp_max_height = 20
let g:ctrlp_jump_to_buffer = 2 "if the file's already open somewhere (anywhere) jump to it
let g:ctrlp_working_path_mode = 2 "try and find the repo root and search from there

map <leader>b :CtrlPBuffer<CR>

" SuperTab
"autocmd FileType go let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabDefaultCompletionType = '<C-X><C-O>'

" SnipMate
let g:snips_author='Christian Rocha'

" Configure ack.vim to use The Silver Searcher instead of Ack
" See: https://github.com/ggreer/the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" AutoTag (find tagfile and auto-generate tags on save)
" Requires Vim with Python
let autoTagsFile = '~/.vim/bundle/AutoTag/plugin/autotag.vim'
if filereadable(autoTagsFile)
  source autoTagsFile
endif

" Syntastic
"map <Leader>e :Errors<CR>
nmap <script> <silent> <leader>e :call ToggleLocationList()<cr>
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=2
let g:syntastic_always_populate_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_warning_symbol='W>'
let g:syntastic_enable_balloons = 1
let g:syntastic_python_flake8_args='--ignore=E501,E128,E226,E261,E265,E401' " ignore line length warnings

" JSX support. For this to work you'll need to do the following:
"    npm install -g eslint
"    npm install -g babel-eslint
"    npm install -g eslint-plugin-react
" For more info see the notes at: https://github.com/jaxbot/syntastic-react
let g:syntastic_javascript_checkers = ['eslint']

" Allow JSX in normal JS files
let g:jsx_ext_required = 0

" Syntastic/Flake8
" We have to run a mini Python script here to append 'site-packages' to the Python
" path at runtime.
if has('python')
python << EOF
import os, sys, vim
sys.path.append('/usr/local/lib/python2.7/site-packages')
EOF
endif

" CoffeeTags
" The CoffeeTags gem is required for this. The code below was generated via:
" $ coffeetags --vim-conf --includevars >> ~/.vimrc
let g:tagbar_type_coffee = {
\ 'kinds' : [
\ 'f:functions',
\ 'o:object'
\ ],
\ 'kind2scope' : {
\ 'f' : 'object',
\ 'o' : 'object'
\},
\ 'sro' : ".",
\ 'ctagsbin' : 'coffeetags',
\ 'ctagsargs' : ' ',
\}

" Golang
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck', 'go']

let g:go_fmt_command = "goimports"
let g:go_bin_path = expand("~/.go/bin")
