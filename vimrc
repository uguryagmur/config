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
				\| nnoremap fb :call Black()<CR>:edit!<CR>


function BracketClose(bracket_char)
	let pos = getpos('.')
	let line = getline('.')
	if col('.') ==# len(line)
		call setline('.', line . a:bracket_char)
	elseif line[col('.')] !=# a:bracket_char
		call setline('.', line[:col('.') - 1] . a:bracket_char . line[col('.'):])
	endif
	let pos[2] += 1
	call setpos('.', pos)
endfunction


function QuotMark(quote_char)
	let pos = getpos('.')
	let line = getline('.')
	if col('.') ==# 1 && line[col('.')] !=# a:quote_char
		call setline('.', a:quote_char . a:quote_char . line)
		let pos[2] -= 1
	elseif col('.') ==# len(line)
		call setline('.', line . a:quote_char . a:quote_char)
	elseif line[col('.')] !=# a:quote_char
		call setline('.', line[:col('.') - 1] . a:quote_char . a:quote_char . line[col('.'):])
	endif
	let pos[2] += 1
	call setpos('.', pos)
endfunction


function Black()
	let file_path = expand('%:p')	
	call system('black '. file_path)
endfunction


inoremap ' <Esc>:call QuotMark("'")<CR>a
inoremap " <Esc>:call QuotMark('"')<CR>a
inoremap ) <Esc>:call BracketClose(')')<CR>a
inoremap ] <Esc>:call BracketClose(']')<CR>a
inoremap } <Esc>:call BracketClose('}')<CR>a
