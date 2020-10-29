" Vundle requirements
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'hashivim/vim-terraform'
Plugin 'preservim/nerdtree'
"Plugin 'mrk21/yaml-vim'
Plugin 'Yggdroot/indentLine'
"Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
"
" Reactivate filetype
filetype on

" To activate color for airline plugin
set t_Co=256

" Remove preview Window
set completeopt-=preview

" set syntax on
:syntax on

" set txt file for sh syntax
au BufReadPost *.txt set syntax=sh

" set tabs to have 4 spaces
set ts=4

" indent when moving to the next line while writing code
set autoindent

" expand tabs into spaces
set expandtab

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Run python or Go with F9
autocmd FileType python nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
autocmd FileType go nnoremap <buffer> <F9> :exec '!go run' shellescape(@%, 1)<cr>

" Remember position of last edit and return on reopen
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Set F2 to activate/deactivate paste mode
set pastetoggle=<F2>

" Set F1 NERDtree
map <silent> <F1> :NERDTreeToggle<CR>

" Set F5: Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_align=1
" Allow vim-terraform to automatically fold (hide until unfolded) sections of terraform code. Defaults to 0 which is off.
let g:terraform_fold_sections=0
" Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt. 
" You can also do this manually with the :TerraformFmt command.
let g:terraform_fmt_on_save=1

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab indentkeys-=0# indentkeys-=<:> foldmethod=indent nofoldenable

" Prevent auto italic/bold text (disable indentplugin for some file types) 
let g:indentLine_fileTypeExclude = ['json', 'markdown', 'dockerfile']
set conceallevel=0


let g:ycm_python_binary_path='./env/bin/python'
