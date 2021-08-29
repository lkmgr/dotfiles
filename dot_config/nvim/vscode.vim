"" config for neovim VSCode extension

call plug#begin(expand('~/.config/nvim/plugged-vscode'))
Plug 'tpope/vim-sensible'
" fzf?
call plug#end()

let mapleader=' '

set hlsearch
set incsearch
set ignorecase
set smartcase

set scrolloff=6

"" keep search results centered on screen
nnoremap n nzzzv
nnoremap N Nzzzv

cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Tabs - change to vscode function calls
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <Cmd>call VSCodeNotify('workbench.action.focusBelowGroup')<CR>
noremap <C-k> <Cmd>call VSCodeNotify('workbench.action.focusAboveGroup')<CR>
noremap <C-l> <Cmd>call VSCodeNotify('workbench.action.focusRightGroup')<CR>
noremap <C-h> <Cmd>call VSCodeNotify('workbench.action.focusLeftGroup')<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" vim-commentary alternative
xmap gc <Plug>VSCodeCommentary
nmap gc <Plug>VSCodeCommentary
omap gc <Plug>VSCodeCommentary
nmap gcc <Plug>VSCodeCommentaryLine

"" vscode specific
nnoremap <C-w>gd <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
nnoremap ? <Cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>

