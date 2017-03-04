" =============== ESCAPE MAPINGS =============== "

" =============== non input mode =============== "
map <esc>[A <up>
map <esc>[B <down>
map <esc>[D <left>
map <esc>[C <right>
map <esc>[1;H <home>
map <esc>[1;F <end>
map <esc>[5~ <pageup>
map <esc>[6~ <pagedown>
map <esc>[1;5A <c-up>
map <esc>[1;5B <c-down>
map <esc>[1;5D <c-left>
map <esc>[1;5C <c-right>
map <esc>[1;5H <c-home>
map <esc>[1;5F <c-end>
map <esc>[5;5~ <c-pageup>
map <esc>[6;5~ <c-pagedown>
map <esc>[1;2A <s-up>
map <esc>[1;2B <s-down>
map <esc>[1;2D <s-left>
map <esc>[1;2C <s-right>
map <esc>[1;2H <s-home>
map <esc>[1;2F <s-end>
map <esc>[5;2~ <s-pageup>
map <esc>[6;2~ <s-pagedown>
map <esc>[1;3A <m-up>
map <esc>[1;3B <m-down>
map <esc>[1;3D <m-left>
map <esc>[1;3C <m-right>
map <esc>[1;3H <m-home>
map <esc>[1;3F <m-end>
map <esc>[[5~ <m-pageup>
map <esc>[[6~ <m-pagedown>

" =============== input mode =================== "
map! <esc>[A <up>
map! <esc>[B <down>
map! <esc>[D <left>
map! <esc>[C <right>
map! <esc>[1;H <home>
map! <esc>[1;F <end>
map! <esc>[5~ <pageup>
map! <esc>[6~ <pagedown>
map! <esc>[1;5A <c-up>
map! <esc>[1;5B <c-down>
map! <esc>[1;5D <c-left>
map! <esc>[1;5C <c-right>
map! <esc>[1;5H <c-home>
map! <esc>[1;5F <c-end>
map! <esc>[5;5~ <c-pageup>
map! <esc>[6;5~ <c-pagedown>
map! <esc>[1;2A <s-up>
map! <esc>[1;2B <s-down>
map! <esc>[1;2D <s-left>
map! <esc>[1;2C <s-right>
map! <esc>[1;2H <s-home>
map! <esc>[1;2F <s-end>
map! <esc>[5;2~ <s-pageup>
map! <esc>[6;2~ <s-pagedown>
map! <esc>[1;3A <m-up>
map! <esc>[1;3B <m-down>
map! <esc>[1;3D <m-left>
map! <esc>[1;3C <m-right>
map! <esc>[1;3H <m-home>
map! <esc>[1;3F <m-end>
map! <esc>[[5~ <m-pageup>
map! <esc>[[6~ <m-pagedown>




" =============== KEY MAPINGS =============== "

" =============== navigation ================ "
map <silent> <s-up> 5<up>
map <silent> <s-down> 5<down>

" =============== tabs navigation =========== "
map <silent> <c-home> :tabp<cr>
map <silent> <c-end> :tabn<cr>
map! <silent> <c-home> <esc>:tabp<cr>a
map! <silent> <c-end> <esc>:tabn<cr>a

" =============== splits ==================== "
map <m-up> <c-w><up>
map <m-down> <c-w><down>
map <m-left> <c-w><left>
map <m-right> <c-w><right>
map! <m-up> <esc><c-w><up>a
map! <m-down> <esc><c-w><down>a
map! <m-left> <esc><c-w><left>a
map! <m-right> <esc><c-w><right>a

" =============== buffers =================== "
map <m-home> :bprevious<cr>
map <m-end> :bnext<cr>
"map <m-pageup> :bfirst<cr>
"map <m-pagedown> :blast<cr>
map! <m-home> <esc>:bprevious<cr>a
map! <m-end> <esc>:bnext<cr>a

" =============== plugins =================== "
map <silent> <f8> :JSHint<cr>
map! <silent> <f8> <esc>:JSHint<cr>
map <silent> <f10> :TagbarShowTag<cr>
map! <silent> <f10> <esc>:TagbarShowTag<cr>a
map <silent> <f11> :TagbarToggle<cr>
map! <silent> <f11> <esc>:TagbarToggle<cr>a
map <silent> <f12> :NERDTreeToggle<cr>
map! <silent> <f12> <esc>:NERDTreeToggle<cr>

" =============== interface ================= "
map <silent> <c-n><c-n> :set invnumber<cr>
map <silent> <c-l><c-l> :set cursorline!<cr>
map <silent> <c-k><c-k> :set colorcolumn=80<cr>
"map <silent> <c-k><c-k> :set cursorcolumn!<cr>
map <silent> <c-s><c-s> :nohlsearch<cr>
map! <silent> <c-n> <esc>:nohlsearch<cr>a
"map <c-s> :update<cr>
"map! <c-s> <esc>:update<cr>a





" =============== SETTINGS =============== "
filetype on
filetype plugin on
syntax on

" =============== common ================= "
set autoread  " auto-update if changed outside
set lazyredraw  " redraw only on type
set undolevels=1000
set history=200

set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" =============== view =================== "
set laststatus=2  " 1 = show status line only for multiply folds
set showtabline=1  " 1 = show tab bar only if more than one window / 2 - show allways
set fillchars="vert: ,fold: "  " fill folds separators with spaces, not signs
set ruler  " cursor pos in status line bar
set number  " show line numbers bar
set numberwidth=5  " numbers bar width
set list  " show specific symbols for text spaces
set listchars=tab:>-,trail:. ",eol:$
"set cursorline  " color current cursor line
set foldmethod=marker

" =============== edit =================== "
set backspace=start,indent,eol  " backspace work in this case
set matchpairs+=<:>  " navigation using %

" =============== tabs =================== "
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

" =============== search ================= "
set incsearch
set hlsearch
set ignorecase
set smartcase

" =============== last cursor position === "
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction
augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

" =============== over length ============ "
"highlight overlength ctermbg=red ctermfg=white
"match overlength /\%79v.\+/
"set colorcolumn=80
"hi ColorColumn ctermbg=darkgrey



" =============== COLORS =============== "
set t_Co=16
"highlight GROUP cterm=none ctermfg=none ctermbg=none

" =============== common =============== "
highlight statusline cterm=none ctermfg=black ctermbg=darkgreen
highlight statuslinenc cterm=none ctermfg=white ctermbg=darkgray
highlight tablinesel cterm=none ctermfg=white ctermbg=black
highlight tabline cterm=none ctermfg=black ctermbg=darkgray
highlight tablinefill cterm=none ctermfg=none ctermbg=darkgray
highlight vertsplit cterm=none ctermfg=none ctermbg=darkgray
highlight cursorline cterm=bold ctermfg=none ctermbg=darkgray
highlight cursorcolumn cterm=bold ctermfg=none ctermbg=darkgray
highlight linenr cterm=bold ctermfg=darkgrey ctermbg=none

" =============== search =============== "
"highlight search cterm=none ctermfg=none ctermbg=brown
"highlight incsearch cterm=none ctermfg=none ctermbg=yellow

" =============== syntax =============== "
highlight Comment cterm=none ctermfg=DarkGreen ctermbg=none
highlight String cterm=none ctermfg=DarkYellow ctermbg=none
highlight Character cterm=none ctermfg=DarkYellow ctermbg=none
highlight Number cterm=bold ctermfg=LightGreen ctermbg=none
highlight Float cterm=bold ctermfg=LightGreen ctermbg=none
highlight Boolean cterm=none ctermfg=DarkMagenta ctermbg=none
highlight Identifier cterm=none ctermfg=Brown ctermbg=none
highlight Function cterm=none ctermfg=Brown ctermbg=none
highlight Search cterm=none ctermfg=Black ctermbg=Yellow
"highlight Statement cterm=none ctermfg=DarkRed ctermbg=none











" =============== PYTHON =============== "
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufRead *.py highligh BadWhitespace ctermbg=red guibg=red
au BufRead *.py match BadWhitespace /^\t\+/
au BufRead *.py match BadWhitespace /\s\+$/
au BufRead *.py highlight overlength ctermbg=darkgray ctermfg=white
au BufRead *.py match overlength /\%80v.\+/
"au BufWritePre *.py :%s/\s\+$//e


" =============== JSON =============== "
au! BufRead,BufNewFile *.json set filetype=json
augroup json_autocmd
    autocmd!
    autocmd FileType json set autoindent
    autocmd FileType json set formatoptions=tcq2l
    autocmd FileType json set textwidth=78 shiftwidth=2
"    autocmd FileType json set softtabstop=2 tabstop=8
    autocmd FileType json set expandtab
    autocmd FileType json set foldmethod=syntax
augroup END





" =============== PLUGINS =============== "

" =============== tagbar ================ "
let g:tagbar_ctags_bin = "ctags"
"let g:tagbar_autoopen = 1
let g:tagbar_autoexpand = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 50
let g:tagbar_compact = 1
let g:tagbar_sort = 1  " name

" =============== nerd tree ============= "
"hl-CursorLine
let g:NERDChristmasTree = 1
let g:NERDTreeHighlightCursorline = 1
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeWinPos = 0  " on left
let g:NERDTreeWinSize = 40
"let g:NERDTreeIgnore=['\.pyc$']

" =============== tabbar ================ "
let g:Tb_MoreThanOne = 0
let g:Tb_ForceDisplay = 1
let g:Tb_SplitBelow = 0

" =============== autocomplete ============== "
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"set ofu=syntaxcomplete#Complete
"autocmd FileType python set omnifunc=pythoncomplete#Complete

"set complete=
"set completefunc=
"set completeopt=
"set dictionary=
"ins-completion
"set showfulltag
"set thesaurus=
"set spell "spell check

"autocmd FileType python set
"set omnifunc=pythoncomplete#Complete
"set ofu=syntaxcomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = '<c-x><c-n>'
"let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&completefunc']
"let g:SuperTabContextDiscoverDiscovery = ['&completefunc:<c-x><c-n>']


