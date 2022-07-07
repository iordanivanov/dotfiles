set number relativenumber
set scrolloff=5
set cursorline
set list

" Shorter update time
set updatetime=500

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'justinmk/vim-sneak'
Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-python/python-syntax'
call plug#end()

set termguicolors
colorscheme afterglow

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

autocmd BufRead,BufNewFile *.js setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
autocmd BufRead,BufNewFile *.ts setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab
autocmd BufRead,BufNewFile *.html setlocal tabstop=2 shiftwidth=2 softtabstop=2 expandtab smarttab

" YAML
autocmd FileType yaml,yml setlocal ts=2 sts=2 sw=2 expandtab
" JSON
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
" CSS
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab

" vertical line for python
autocmd BufRead,BufNewFile *.py setlocal colorcolumn=80
" vertical line for restructured text
autocmd BufRead,BufNewFile *.rst setlocal colorcolumn=80
" vertical line for typescript
autocmd BufRead,BufNewFile *.ts setlocal colorcolumn=120

" vimdiff sane colors
highlight DiffAdd    ctermfg=10 ctermbg=17 gui=NONE guifg=bg guibg=#00af5f
highlight DiffDelete ctermfg=10 ctermbg=17 gui=NONE guifg=#d70000 guibg=bg
highlight DiffChange ctermfg=10 ctermbg=17 gui=NONE guifg=NONE guibg=NONE
highlight DiffText   ctermfg=10 ctermbg=88 gui=NONE guifg=bg guibg=#afafff

" python syntax highlighting
let g:python_highlight_all = 1

" sneak
let g:sneak#label = 1

" persistent undo
set undodir=~/.vim/temp/undo
set undofile

" airline
let g:airline_powerline_fonts = 1

set tabpagemax=35

" ez escape
imap jk <Esc>

" nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" CoC

" outline
nmap <F5> :CocOutline<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
