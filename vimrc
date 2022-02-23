syntax on
filetype on
filetype plugin on
filetype indent on

set ai
set ruler
set number
set hlsearch

set tabstop=2
set shiftwidth=2
set encoding=utf-8
set background=dark

colorscheme vscode

nnoremap <space> za
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O<Tab><BS>

autocmd BufNewFile,BufRead *.py
        \ set tabstop=4
        \| set softtabstop=4
        \| set shiftwidth=4
        \| set expandtab
        \| inoremap {<CR> {<CR><BS><BS>}<Esc>O<Tab><BS><BS>

function BracketClose(bracket_char)
        let pos = getpos('.')
        let line = getline('.')
        if col('.') ==# len(line)
                call setline('.', line . a:bracket_char)
                let pos[2] += 1
                call setpos('.', pos)
        elseif line[col('.')] !=# a:bracket_char
                call setline('.', line[:col('.') - 1] . a:bracket_char . line[col('.'):])
                let pos[2] += 1
                call setpos('.', pos)
        else
                let pos[2] += 1
                call setpos('.', pos)
        endif
endfunction

inoremap ) <Esc>:call BracketClose(')')<CR>a
inoremap ] <Esc>:call BracketClose(']')<CR>a
inoremap } <Esc>:call BracketClose('}')<CR>a
