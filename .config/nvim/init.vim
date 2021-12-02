"****************************************************
"*************** general config *********************
"****************************************************

set clipboard=unnamedplus
set number " allow line numbers
"set relativenumber " display relative numbers to cursor position
set cursorline " highlight current line
set mouse=a
set noswapfile "no swap file
set nobackup
set nowritebackup
set expandtab " On pressing tab, insert 4 spaces
set tabstop=4 " show existing tab with 4 spaces width
set softtabstop=4 
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set laststatus=2
let g:jsx_ext_required = 0 "Enable JSX syntax higlighting in .js files
set noshowmode "as we got the status through airline don't need to display twice
set updatetime=100 "it's set low as recommended for git gutter
set autowrite "autosaves before changin buffers


" Changing the encoding thing for devicons
set encoding=UTF-8

" Making it faster to switch between modes
set timeoutlen=50
set ttimeoutlen=0 "no timeout when switching modes
" let mapleader = '\' "set space as mapleader
set nostartofline "keep cursor in same place when changing buffers
set splitbelow "new horizontal splits down
set splitright "new vertical splits at right
set scrolloff=3 "Start scrolling before cursor gets to the edge
set sidescrolloff=15
set sidescroll=1
set foldmethod=manual
au BufEnter * set fo-=c fo-=r fo-=o   "don't start auto comment

" Force j and k to work on display lines
nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

" autoreload changes made outside vim

if ! exists("g:CheckUpdateStarted")
  let g:CheckUpdateStarted=1
  call timer_start(1,'CheckUpdate')
endif
function! CheckUpdate(timer)
  silent! checktime
  call timer_start(1000,'CheckUpdate')
endfunction

"****************************************************
"**************** folding*************************
"****************************************************

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

"****************************************************
"**************** folding *************************
"****************************************************


"****************************************************
"**************** filetypes *************************
"****************************************************

autocmd Filetype javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype javascriptreact setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype scss setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab
autocmd Filetype python setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab

filetype plugin on

"for transparent bg to take terminal color uncomment:
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

"****************************************************
"*************** vim-plug section *******************
"****************************************************

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/nvim/plugged')

" helpers
Plug 'editorconfig/editorconfig-vim'
Plug 'suxpert/vimcaps'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'preservim/nerdtree'
" Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'moll/vim-bbye' " maintain Layout when closing buffers
Plug 'psliwka/vim-smoothie', { 'commit': 'a0414d1' }
Plug 'ghifarit53/tokyonight-vim'

" Icons 
Plug 'ryanoasis/vim-devicons'

" git things 
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" for commenting the codes
Plug 'preservim/nerdcommenter'

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

Plug 'arcticicestudio/nord-vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }

Plug 'ayu-theme/ayu-vim' 


Plug 'morhetz/gruvbox' 
Plug 'kaicataldo/material.vim'  

"Plug 'sainnhe/sonokai'
Plug 'ntk148v/vim-horizon'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'KabbAmine/vCoolor.vim' "requires to install 'zenity' for the color picker itself
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } " silver searcher or ripgrep: sudo apt-get ripgrep / silversearcher -ag

Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-slash' 
Plug 'mileszs/ack.vim'

" intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" snippets
Plug 'epilande/vim-react-snippets'
Plug 'epilande/vim-es2015-snippets'
Plug 'joaohkfaria/vim-jest-snippets'
Plug 'simonsmith/vim-custom-snippets'
Plug 'SirVer/ultisnips'

" syntax higlighting 
 Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
syntax on

"Plug 'sheerun/vim-polyglot'

"git stuff
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" tests
" Plug 'vim-test/vim-test'

" jsdoc
Plug 'heavenshell/vim-jsdoc', { 
  \ 'for': ['javascript', 'javascript.jsx','typescript'], 
  \ 'do': 'make install'
\}

 call plug#end()

"****************************************************
"****************** fugitive ************************
"****************************************************

set diffopt+=vertical

"****************************************************
"****************** vim test ************************
"****************************************************
let g:test#javascript#runner = 'jest'

"****************************************************
"****************** ack vim *************************
"****************************************************
let g:ackprg = 'ag --vimgrep'

"****************************************************
"****************** airline config ******************
"****************************************************

let g:airline_theme = "purify"
let g:purify_underline = 0   " default: 1
let g:purify_undercurl = 0   " default: 1

"let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#enabled = 1
"let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
"let g:airline#extensions#tabline#buffers_label = ''
"let g:airline#extensions#tabline#fnamemod = ':t' " Show the filename
"let g:airline#extensions#tabline#fnamecollapse = 0
"let g:airline#extensions#tabline#show_tab_nr = 0
"let g:airline#extensions#tabline#buffer_nr_show = 0
"let g:airline#extensions#tabline#show_buffers = 1
"let g:airline#extensions#tabline#show_close_button = 0

" powerline symbols
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''
  
"****************************************************
"******************** color scheme ******************
"****************************************************
"set termguicolors
"
"    let g:tokyonight_style = 'night' " available: night, storm
"    let g:tokyonight_enable_italic = 1
"
"colorscheme tokyonight
"
"
"" ayu
"
"set termguicolors     " enable true colors support
"    let ayucolor="mirage"   " for dark version of theme
"colorscheme ayu
"
colorscheme purify

"*****************LightLine*************************
let g:lightline = {'colorscheme' : 'purify'}

"***************************************************
"***************** closetag ************************
"***************************************************
let g:closetag_filenames = "*.html,*.js,*.jsx,*.tsx"

"***************************************************
"******************* coc ***************************
"***************************************************
"autocmd fileType scss setl iskeyword+=@-@
"call coc#add_extension(
"      \'coc-pairs', 
"      \'coc-eslint', 
"      \'coc-prettier', 
"      \'coc-json', 
"      \'coc-tsserver', 
"      \'coc-css', 
"      \'coc-html', 
"      \'coc-snippets', 
"      \'coc-highlight', 
"      \'coc-emmet', 
"      \)
"
"command! -nargs=0 Prettier :CocCommand prettier.formatFile 
"
"" print semicolons
"let g:prettier#config#semi = 'false'
"
"nnoremap <Leader>k :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"	if &filetype == 'vim'
"		execute 'h '.expand('<cword>')
"	else
"		call CocAction('doHover')
"	endif
"endfunction
"
"
"***************************************************
"******************* nerdtree ********************
"***************************************************
"nnoremap <Leader>tr :NERDTreeToggle<CR>
nmap <silent> <C-N> :NERDTreeToggle<CR>


"***************************************************
"******************* fzf search ********************
"***************************************************
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" put FZF in the middle of the screen
if has('nvim')
  function! s:create_float(hl, opts)
    let buf = nvim_create_buf(v:false, v:true)
    let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
    let win = nvim_open_win(buf, v:true, opts)
    call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
    call setwinvar(win, '&colorcolumn', '')
    return buf
  endfunction

  function! FloatingFZF()
    " Size and position
    " on center screen
    let width = float2nr(&columns * 0.9)
    let height = float2nr(&lines * 0.8)
    let row = float2nr((&lines - height) / 2)
    let col = float2nr((&columns - width) / 2)

    " Border
    let top = '╭' . repeat('─', width - 2) . '╮'
    let mid = '│' . repeat(' ', width - 2) . '│'
    let bot = '╰' . repeat('─', width - 2) . '╯'
    let border = [top] + repeat([mid], height - 2) + [bot]

    " Draw frame
    let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
    call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

    " Draw viewport
    call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
    autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
  endfunction

  let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif

"***************************************************
"****************** git gutter *********************
"***************************************************
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified='•'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified_removed = '•'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0

"***************************************************
"******************** syntax ***********************
"*************************************************** 

let g:javascript_plugin_jsdoc=1 "vim-javascript for polyglot jsdoc

"***************************************************
"******************* key bindings ******************
"***************************************************
set nostartofline

nnoremap ñ /

" prev buffer
nnoremap <C-k> :bprevious<CR>

" Next buffer 
nnoremap <C-j> :bnext<CR>

" Move lines
nnoremap <a-j> :move+<CR>
xnoremap <a-j> :move'>+<CR>gv
nnoremap <a-k> :move-2<CR>
xnoremap <a-k> :move-2<CR>gv

" close buffer via bbye, keeping layout
nnoremap <Leader>bd :Bdelete<CR> 

" Open new line below and above current line
" nnoremap <leader>o o<esc>
" nnoremap <leader>O O<esc>

" allow us to go to normal mode in terminal mode so we can scroll etc
tnoremap <F1> <C-\><C-n>
"""""""""""""""""""""""""""""""""""""""""""""""""""" vcoolor
"let g:vcoolor_disable_mappings = 1

""Insert hex color.
"nnoremap <Leader>ch :VCoolor<CR> 

""Insert rgba
"nnoremap <Leader>cr :VCoolIns ra<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""" git gutter

nmap <Leader>hj <Plug>(GitGutterNextHunk)  
nmap <Leader>hk <Plug>(GitGutterPrevHunk)

nmap <F12> :GitGutterToggle<CR>

nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
nmap <Leader>hf :GitGutterEnable<bar>GitGutterQuickFix<bar>copen<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""" git messenger
"hunk blame
nmap <Leader>hb :GitMessenger<CR> 

""""""""""""""""""""""""""""""""""""""""""""""""""""" coc
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>rn <Plug>(coc-rename)
nmap <silent> <leader>sa :<C-u>CocAction<CR>
nnoremap <silent> <F11> :<C-u>CocList diagnostics<cr>
" Coc-fzf - search symbols
nmap <silent> <leader>sy :CocFzfList symbols<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""" fzf
nnoremap <leader>rg :Rg<CR>'
nnoremap <C-p> :Files<CR>
" Search on project term under cursor
nnoremap <C-f> :Rg <C-R><C-W> *<CR>
" Search on project visual selection
xnoremap <C-f> "vy:<C-u>Rg <C-r>v<CR>: 
"""""""""""""""""""""""""""""""""""""""""""""""""""" quickfix
nnoremap <leader>fj :cnext<CR>
nnoremap <leader>fk :cprev<CR> 

" close quickfix / location window
nnoremap <leader>fo :copen<cr>
nnoremap <leader>fc :cclose<bar>lclose<cr>

"""""""""""""""""""""""""""""""""""""""""""""""" Comments
map <C-_> <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>
