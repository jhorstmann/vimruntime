" vim: set expandtab tabstop=2 shiftwidth=2 fenc=utf8
" scriptencoding utf-8

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set enc=utf8

let jh_hi_use_bold=1

" No toolbars and menus, console dialogs
set guioptions-=t
set guioptions-=T
set guioptions-=m
set guioptions+=M

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set guifont=Monospace\ 9
set printfont=Monospace\ 9

if has("gui_running")
    winpos 0 0
    set lines=48
    set columns=132
    colorscheme jhlight
endif

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" always use forward slashes
set shellslash

set history=50		" keep 50 lines of command line history
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nobackup
set nowrap
set isf-==

set keywordprg=

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default FileType settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
  autocmd BufNewFile,BufRead *.groovy setf groovy
  autocmd BufNewFile,BufRead *.jws setf java
  autocmd BufNewFile,BufRead *.wsdd setf xml

  autocmd FileType java compiler javac
  autocmd FileType xml,xslt compiler xmlstarlet

  " add -.: to iskeyword
  autocmd FileType xml,xsd,xslt,xhtml,jsp,ant setlocal iskeyword+=45,46,58
  " complete block tag
  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant inoremap <buffer> <M-.> ><ESC>T<yiwf>a<CR></<C-R>"><C-O>O
  " complete inline tag
  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant inoremap <buffer> <M-,> ><ESC>T<yiwf>a</<C-R>"><ESC>F<i

  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant source /home/jh/.vim/closetag.vim

  " mappings for html entities 
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-Space> &nbsp;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-/> &#x201E;&#x201C;<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-&> &amp;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-<> &lt;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M->> &gt;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-'> &apos;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-"> &quot;
  
  autocmd FileType c,cpp inoreab <buffer> main int main(int argc, char *argv[])<CR>{<CR>}<C-O>O
  autocmd FileType c,cs,cpp,java,javascript inoreab <buffer> fori for (int i=0; i; i++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType c,cs,cpp,java,javascript inoreab <buffer> forj for (int j=0; j; j++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType python inoreab <buffer> fori for i in range():<LEFT><LEFT>
  autocmd FileType python inoreab <buffer> forj for j in range():<LEFT><LEFT>

  autocmd FileType c,cs,cpp,java,javascript,php,vala inoremap <buffer> { {<CR>}<C-O>O
  autocmd FileType python,tex,bib,antlr,jsp,ant inoremap <buffer> { {}<LEFT>

  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> [ []<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> ( ()<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> " ""<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant inoremap <buffer> ' ''<LEFT>

  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> "" ""
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> () ()
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> [] []
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant inoremap <buffer> '' ''

  autocmd FileType jsp setlocal ai

  autocmd FileType php source /home/jh/.vim/php2.vim
  autocmd FileType java source /home/jh/.vim/java.vim
  autocmd FileType xslt source /home/jh/.vim/xslt.vim
  autocmd FileType jsp source /home/jh/.vim/jstl.vim
  autocmd FileType pom source /home/jh/.vim/pom.vim

  " move to directory of current file
  if (has("netbeans_intg") || has("sun_workshop"))
      set autochdir
  endif

  nmap <leader>e :silent !nautilus %:p:h<CR>
  nmap <leader>sh :silent !gnome-terminal %:p:h<CR>
  nmap <leader>se :Se<CR>

  augroup END
else
  set autoindent		" always set autoindenting on
endif " has("autocmd")

set complete=.,w,i,t,b
set completeopt=
set shellpipe=>\ %s\ 2>&1

set lispwords-=do
set lispwords-=if
set lispwords+=module,syntax-rules,letrec*

let python_highlight_numbers = 1
let java_allow_cpp_keywords=1

"file-explorer
let g:explVertical=1      " Split vertically
let g:explStartRight=0    " Put new explorer window to the left of the current window
let g:explSplitRight=1    " Put new window to the right of the explorer
let g:explWinSize=30

let g:netrw_Winsize=30
let g:netrw_altv=1
let g:loaded_netrw=1
let g:loaded_netrwPlugin=1

let g:ctags_command="ctags -R"

set grepprg=grep\ -H\ -n
set cinoptions=l1,t0,(0,u1,W4,j1
set previewheight=5
" Always show statusline
set laststatus=2
set noruler

" Show buffer number, filetype, fileformat and fileencoding in statusline
set statusline=[%n]\ [%f]\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\ 

" Switch between buffers as in other windows apps
set confirm
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
nmap <C-F4> :confirm bd<CR>

nmap <leader>n :bnext!<cr>
nmap <leader>p :bprev!<cr>
nmap <leader>d :confirm bd<cr>
nmap <leader>w :confirm bw<cr>

nmap <c-space> <c-]>
imap <c-space> <c-]>

set lazyredraw
set nojoinspaces
set display=lastline
set dir=/tmp
set sw=4
set expandtab
set showmatch
set matchtime=3
set hidden
set lbr
set sidescrolloff=1
set listchars=eol:¶,tab:»·,extends:»,precedes:«,trail:·,nbsp:‗
set wildmenu
set wildchar=<Tab>
set wildcharm=<C-Z>

let html_no_rendering=1
let html_use_css=1

" split line
nnoremap S i<CR><Esc>

" shortcuts for system clipboard
nnoremap + "+y
vnoremap + "+y
nnoremap - "+P
vnoremap - d"+P

" remove object (-> black hole register)
nnoremap R "_d

imap <C-U> <ESC>gUiwgi
nmap <C-U> gUiw

nnoremap <C-T> >>
nnoremap <C-D> <<
vnoremap <C-T> >
vnoremap <C-D> <

inoremap <C-L> <DEL>
inoremap <M-h> <LEFT>
inoremap <M-l> <RIGHT>
inoremap <M-j> <DOWN>
inoremap <M-k> <UP>

nnoremap \xml :%!xmlstarlet fo -s 4<cr>
nnoremap \html :%!xmlstarlet fo -H -s 4<cr>

cnoreabbrev hlep help
cnoreabbrev hlpe help

nnoremap <F1> :help 
nnoremap <F3> [i
nnoremap <F4> [I

nnoremap <F5> :ptag /^<C-R><C-W><CR>
nnoremap <F6> <C-W>}
nnoremap <S-F5> <C-W>z
nnoremap <S-F6> <C-W>z
nnoremap <F7> :tprev<CR>
nnoremap <F8> :tnext<CR>
nnoremap <S-F7> :ptprev<CR>
nnoremap <S-F8> :ptnext<CR>

inoremap <F5> <C-O>:ptag /^<C-R><C-W><CR>
inoremap <F6> <C-O>:ptag <C-R><C-W><CR>
inoremap <S-F5> <C-O><C-W>z
inoremap <S-F6> <C-O><C-W>z
inoremap <F7> <C-O>:ptprev<CR>
inoremap <F8> <C-O>:ptnext<CR>

nnoremap <F9> :silent make %<CR>:silent cwindow 6<CR>
nnoremap <S-F9> :cclose<CR>
nnoremap <F10> :crewind<CR>
nnoremap <F11> :cp<CR>
nnoremap <F12> :cn<CR>

nnoremap zh 24zh
nnoremap zl 24zl

function! JHJump()
    if search('\(«--\)\@<=.\{-,200}--»','W') > 0
        execute "normal! hhhgh\<C-o>f»\<C-O>o"
    endif
endfunction

inoremap <C-J> <ESC>:call JHJump()<CR>
nnoremap <C-J> :call JHJump()<CR>

highlight JHJumpPoint guibg=#77aa77 ctermbg=darkgreen
match JHJumpPoint /«--.\{-,100}--»/

inoremap <buffer> <M-8> „
inoremap <buffer> <M-9> “
inoremap <buffer> <M-7> ‚
inoremap <buffer> <M-0> ‘

inoremap <buffer> <M-(> “
inoremap <buffer> <M-)> ”
inoremap <buffer> <M-/> ‘
inoremap <buffer> <M-=> ’
