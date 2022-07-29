" mapping modes:
" :help :map
" :help :noremap
" :help recursive_mapping
" :help :map-modes
"

" Needed to fix vim-go
filetype plugin indent on

" leader is \
map <leader>B :BufstopFast<CR>
map <C-n> :NERDTreeToggle<CR>
nmap <leader>x :NERDTreeFind<CR>

set nocompatible
set cursorline
set number
set hlsearch
" incremental search
set is hls

set ignorecase
set smartcase

:nnoremap <CR> :nohlsearch<CR><CR>

colorscheme molokai

" *************** golang *****
" Golang stuff (go-vim) 
" use goimports for formatting
"let g:go_fmt_command = "goimports"
let g:go_fmt_command ="gofmt"
let g:go_debug_log_output = 'debugger'

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info =0 


" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>

au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>i <Plug>(go-info)
au FileType go nmap <leader>s <plug>(go-implements)
au FileType go nmap <leader>l <plug>(go-lint)
au FileType go nmap <leader>e <Plug>(go-rename)
au FileType go nmap <leader>dt <Plug>(go-def-tab)
au FileType go nmap <leader>ds <Plug>(go-def-split)

syntax on
" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" VIM Airline
set laststatus=2
let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'dark'

"ctrlP 
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra' " working directory nearest ancestor with .git 

"ignore list for ctrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
\ 'dir':  '\v[\/]\.(git|hg|svn)$',
\ 'file': '\v\.(exe|so|dll)$',
\ 'link': 'some_bad_symbolic_links',
\ }
	
let g:ctrlp_working_path_mode = 'ra'
