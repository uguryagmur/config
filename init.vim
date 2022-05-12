syntax on
filetype on
filetype plugin on
filetype indent on

set ai
set ruler
set number
set hlsearch
set autoread

set tabstop=2
set shiftwidth=2
set encoding=utf-8
set updatetime=750
set background=dark

colorscheme vscode

nnoremap <space> za
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>O<Tab><BS>

" Find files using Telescope command-line sugar.
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fh <cmd>Telescope help_tags<cr>

au CursorHold * checktime

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

lua require('init')
nnoremap cne :lua compile_and_execute_cc_file()<CR>

set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['pyright'].setup {}
EOF
