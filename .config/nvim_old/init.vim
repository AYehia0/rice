" ######################## Global Sets ########################
set exrc 
set number

"set softtabstop=4
set mouse=a           "  using mouse in neovim
set encoding=UTF-8    "  encoding format
set termbidi

" Tabs
set tabstop=4         "  tabs are at proper location
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent

" set smartindent       "  does the right thing (mostly) in programs
set nohlsearch        "  no highlight after search  
set relativenumber
set hidden            "  keep any buffer being edited in the background
" set nowrap
set noswapfile
set nobackup
set binary
set noendofline

set timeoutlen=500
set ttimeoutlen=0 "no timeout when switching modes

" auto source on save
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" ---------- Leader ----------
let mapleader = " "

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR> nnoremap <leader>q :bp<cr>:bd #<cr>
nnoremap <leader>q :bp<cr>:bd #<cr>
" remap  q :bp:bd #


" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" ######################## Plugins Sets ########################

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" git
let g:signify_sign_add = "+"
let g:signify_sign_delete = "-"
let g:signify_sign_delete = "-" 

" Air-line full path
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

" system wide
set clipboard+=unnamedplus

" ######################## Plugins ######################## 
call plug#begin() 

Plug 'https://github.com/vim-airline/vim-airline' " Status bar 
Plug 'vim-airline/vim-airline-themes'
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw) 
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc 
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview 
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme 
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion 
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons 
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors 
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'preservim/nerdtree'
Plug 'haishanh/night-owl.vim' 
Plug 'edluffy/hologram.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'folke/todo-comments.nvim'
Plug 'sakshamgupta05/vim-todo-highlight'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'vim-ruby/vim-ruby' " For Facts, Ruby functions, and custom providers

" Dev 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'mhinz/vim-signify' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-rhubarb' 
Plug 'junegunn/gv.vim' 
Plug 'tmsvg/pear-tree'
Plug 'vim-test/vim-test'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

call plug#end() 
" ######################## Themes ######################## 

if (has("termguicolors")) 
	set termguicolors 
endif 

syntax enable
colorscheme night-owl

" To enable the lightline theme
let g:lightline = { 'colorscheme': 'nightowl' }

" ######################## Keybindings ########################

" ---------- NerdTree ----------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 0
let g:NERDTreeIgnore = ['node_modules']
let NERDTreeStatusLine='NERDTree'

" open terminal on ctrl+n
function! OpenTerminal()
	split term://zsh
	resize 10
endfunction

nnoremap <c-x> :call OpenTerminal()<CR>

let g:prettier#autoformat_config_present = 1
let g:prettier#config#config_precedence = 'prefer-file'

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>

" Moving through vim buffers windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Moving through nerdTabs
map <S-l> :bnext<CR>
map <S-h> :bprevious<CR>
nnoremap <S-c> :bp<cr>:bd #<cr>
" Start NERDTree and put the cursor back in the other window.
"autocmd VimEnter * NERDTree | wincmd p

" Open the existing NERDTree on each new tab.
"autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" CoC
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Telescope
" All Files
nnoremap <leader>af <cmd>Telescope find_files<cr>

" In File
nnoremap <leader>if <cmd>Telescope live_grep<cr>

" ######################## Configs ########################

" Prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" CoC
let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-json',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
noremap <silent> <space>p  :<C-u>CocListResume<CR>

" comments
lua << EOF
	require('todo-comments').setup() 
EOF