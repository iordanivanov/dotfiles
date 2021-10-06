set number relativenumber
set scrolloff=5
set cursorline

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
Plug 'nvie/vim-flake8'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-sneak'
Plug 'danilo-augusto/vim-afterglow'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ycm-core/YouCompleteMe'
Plug 'leafgarland/typescript-vim'
Plug 'dense-analysis/ale'
Plug 'Quramy/tsuquyomi'
Plug 'axvr/org.vim'
Plug 'sainnhe/everforest'
Plug 'cocopon/iceberg.vim'
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-solarized8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

set termguicolors
set background=dark
colorscheme solarized8

" ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" jedi
" autocmd FileType python setlocal completeopt-=preview
" let g:jedi#use_tabs_not_buffers = 1
" let g:jedi#popup_on_dot = 0
" let g:jedi#show_call_signatures = 0
" let g:jedi#smart_auto_mappings = 0

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

" run flake8 when saving a python file
autocmd BufWritePost *.py call flake8#Flake8()

" CoC outline
nmap <F5> :CocOutline<CR>

" let g:tagbar_type_typescript = {
"   \ 'ctagstype': 'typescript',
"   \ 'kinds': [
"     \ 'c:classes',
"     \ 'n:modules',
"     \ 'f:functions',
"     \ 'v:variables',
"     \ 'v:varlambdas',
"     \ 'm:members',
"     \ 'i:interfaces',
"     \ 'e:enums',
"   \ ]
" \ }

" vimdiff sane colors
highlight DiffAdd    ctermfg=10 ctermbg=17 gui=NONE guifg=bg guibg=#00af5f
highlight DiffDelete ctermfg=10 ctermbg=17 gui=NONE guifg=#d70000 guibg=bg
highlight DiffChange ctermfg=10 ctermbg=17 gui=NONE guifg=NONE guibg=NONE
highlight DiffText   ctermfg=10 ctermbg=88 gui=NONE guifg=bg guibg=#afafff

" syntax highlighting
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

" org.vim
syntax enable
filetype plugin indent on

" ALE bindings
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    " For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  " For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  " Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  "  < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
