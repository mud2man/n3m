
set nu                         " line numbers
set nocompatible               " more Vi compatible
set noswapfile                 " swap file
set nobackup                   " backup before save
set nowb                       " backup before overwrite
set nofoldenable               " disable folding
set foldcolumn=0               " fold column location
set backspace=indent,eol,start " allow backspacing over autoindent. line breaks, and start of insert
set history=50                 " keep 50 lines of command line history
set ruler		                   " show the cursor position all the time
set showcmd                    " display incomplete commands
set incsearch                  " do incremental searching
set tabstop=2                  " number of spaces a <Tab> counts for
set shiftwidth=2               " number of spaces used for each indent step
set softtabstop=2              " disable soft tab width (when inserting of spaces for tabs ?)
set expandtab                  " insert spaces for tabs
set autoindent                 " copy indent from current line when starting a new line
set smartindent                " insert new indents when syntax dictates it; i.e. after {
set textwidth=0                " don't autowrap lines
set cursorline                 " highlight line the cursor in on
set hlsearch                   " highlight searches (turn off with nohl)
set fileencodings=utf-8        " default to UTF-8 file encodings
set colorcolumn=80             " ugh, but ok I'll conform, most of the time :)
set timeoutlen=1000 ttimeoutlen=0
set t_Co=256

set undofile
set undodir=/home/n3m/.vimundo/

" ignore files/paths for vim and CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules

" Begin Vundle Configuration
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'wesleyche/SrcExpl'
Plugin 'majutsushi/tagbar'
Plugin 'chase/vim-ansible-yaml'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'flazz/vim-colorschemes'

call vundle#end()
filetype plugin indent on
" End Vundle Configuration

" ---
syntax enable                  " turn on syntax highlighting
set background=dark
colorscheme slate 
if has('mouse')
  set mouse=a                  " enable mouse for all 
  set ttymouse=xterm2
endif

" line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set nonumber
    set relativenumber
  endif
endfunc
call NumberToggle()
map <leader>1 :call NumberToggle()<cr>

" file extension mapping
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.less set filetype=css
au VimEnter * NERDTree
autocmd VimEnter * wincmd p

function! NERDTreeQuit()
  redir => buffersoutput
  silent buffers
  redir END
"                     1BufNo  2Mods.     3File           4LineNo
  let pattern = '^\s*\(\d\+\)\(.....\) "\(.*\)"\s\+line \(\d\+\)$'
  let windowfound = 0

  for bline in split(buffersoutput, "\n")
    let m = matchlist(bline, pattern)

    if (len(m) > 0)
      if (m[2] =~ '..a..')
        let windowfound = 1
      endif
    endif
  endfor

  if (!windowfound)
    quitall
  endif
endfunction
autocmd WinEnter * call NERDTreeQuit()


" SrcExpl config
let g:SrcExpl_pluginList = [ 
    \ "__Tagbar__", 
    \ "NERD_tree_1" 
    \ ] 
let g:SrcExpl_isUpdateTags = 0 
let g:SrcExpl_winHeight = 14
let g:SrcExpl_refreshTime = 100 

" bindings
nmap <leader>w :w!<cr>
map <leader><leader> :NERDTreeToggle<CR>:TagbarToggle<CR>:SrcExplToggle<CR><C-W><Right>
map <leader>d :nohl<CR>
map <leader>e :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" ctrlp
" start in the the directory of the current file, 
" unless it is a subdirectory of the cwd
let g:ctrlp_working_path_mode = 'a' 


