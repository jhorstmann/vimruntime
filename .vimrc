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

  "autocmd FileType bib nnoremap ~ gUli{<RIGHT>}<LEFT><ESC>

  "autocmd GUIEnter * simalt ~x
  autocmd FileType php setlocal smartindent
  "autocmd FileType php setlocal cindent
  "autocmd FileType php setlocal cinwords+=foreach,elseif
  autocmd FileType php compiler php
  "autocmd FileType php setlocal makeprg=php-cli\ -n\ -l\ -f\ %
  "autocmd FileType java setlocal makeprg=javac\ %
  "autocmd FileType java setlocal errorformat=%f:%l:%v:%*\\d:%*\\d:%*\\s%m
  autocmd FileType java compiler javac
  autocmd FileType xml,xslt compiler xmlstarlet

  " add -.: to iskeyword
  autocmd FileType xml,xsd,xslt,xhtml,jsp,ant setlocal iskeyword+=45,46,58
  " complete block tag
  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant inoremap <buffer> <M-.> ><ESC>T<yiwf>a<CR></<C-R>"><C-O>O
  " complete inline tag
  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant inoremap <buffer> <M-,> ><ESC>T<yiwf>a</<C-R>"><ESC>F<i

  autocmd FileType xml,xsd,xslt,xhtml,html,php,jsp,ant source /home/jh/.vim/closetag.vim

  " autocmd FileType xml,xsd,xslt,xhtml,html,php inoremap <buffer> <M-.> <<ESC>T<yiwf<a/<CR><C-R>"><C-O>O
  " autocmd FileType xml,xsd,xslt,xhtml,html,php inoremap <buffer> <M-,> <<ESC>T<yiwf<a/<C-R>"><ESC>F<i

  " mappings for html entities 
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-Space> &nbsp;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-/> &#x201E;&#x201C;<LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-&> &amp;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-<> &lt;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M->> &gt;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-'> &apos;
  autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs,jsp,ant inoremap <buffer> <M-"> &quot;
  
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-ß> &szlig;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-ö> &ouml;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-ä> &auml;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-ü> &uuml;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-S-Ö> &Ouml;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-S-Ä> &Auml;
  "autocmd FileType xml,xsd,xslt,xhtml,html,php,aspvbs inoremap <buffer> <M-S-Ü> &Uuml;

  autocmd FileType c,cpp inoreab <buffer> main int main(int argc, char *argv[])<CR>{<CR>}<C-O>O
  autocmd FileType c,cs,cpp,java,javascript inoreab <buffer> fori for (int i=0; i; i++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType c,cs,cpp,java,javascript inoreab <buffer> forj for (int j=0; j; j++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  autocmd FileType python inoreab <buffer> fori for i in range():<LEFT><LEFT>
  autocmd FileType python inoreab <buffer> forj for j in range():<LEFT><LEFT>

  "autocmd FileType php inoreab <buffer> fori for ($i=0; $i; $i++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  "autocmd FileType php inoreab <buffer> forj for ($j=0; $j; $j++) {<CR>}<UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  "autocmd FileType php iab <buffer> fori for ($i=0;$i;$i++<RIGHT> {<CR><UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>
  "autocmd FileType php iab <buffer> forj for ($j=0;$j;$j++<RIGHT> {<CR><UP><END><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT><LEFT>

  autocmd FileType c,cs,cpp,java,javascript,php,vala inoremap <buffer> { {<CR>}<C-O>O
  autocmd FileType python,tex,bib,antlr,jsp,ant inoremap <buffer> { {}<LEFT>
  autocmd FileType tex inoremap <buffer> " „“<LEFT>
  autocmd FileType tex inoremap <buffer> ' ‚‘<LEFT>
  "autocmd FileType tex inoremap <buffer> ,, „“<LEFT>
  "autocmd FileType tex inoremap <buffer> '' ‚‘<LEFT>

  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> [ []<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> ( ()<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> " ""<LEFT>
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant inoremap <buffer> ' ''<LEFT>

  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> "" ""
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> () ()
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant,scheme inoremap <buffer> [] []
  autocmd FileType c,cs,cpp,java,jsp,javascript,php,python,text,html,xml,xslt,antlr,ant inoremap <buffer> '' ''

  autocmd FileType jsp setlocal ai

  "autocmd FileType scheme source /home/jh/.vim/jhscheme.vim

  "autocmd FileType c setlocal path+=c:/programme/mingw/include
  "autocmd FileType php setlocal path+=.,c:/programme/php/PEAR
  "autocmd FileType php setlocal dictionary+=.,c:/programme/vim/vim70/phpfunctions.txt
  "autocmd FileType php setlocal tags+=c:/programme/php/PEAR/tags

  autocmd FileType php source /home/jh/.vim/php2.vim
  autocmd FileType java source /home/jh/.vim/java.vim
  autocmd FileType xslt source /home/jh/.vim/xslt.vim
  autocmd FileType jsp source /home/jh/.vim/jstl.vim
  autocmd FileType pom source /home/jh/.vim/pom.vim

  " move to directory of current file
  "autocmd BufEnter * exe "lcd " . escape(expand("<afile>:p:h"),"\" ")
  "autocmd BufRead * echo 'lcd ' . escape(expand("%:p:h"),"\" ")
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

"set runtimepath+=c:\programme\vim7\php
set complete=.,w,i,t,b
set completeopt=
set shellpipe=>\ %s\ 2>&1

set lispwords-=do
set lispwords-=if
set lispwords+=module,syntax-rules,letrec*

let python_highlight_numbers = 1
let java_allow_cpp_keywords=1
"let java_highlight_functions="style"
"unlet java_highlight_java_lang
"unlet java_highlight_java_lang_ids
"unlet java_highlight_java_lang

" FeralToggleCommentify
let g:FTCOperateOnFirstColumnOnly=0
let g:FTCOperateOnlyOnNonComments=1
let g:FTCOperateOnBlankLines=0

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
"set showfulltag

"let CVSCommandEnableBufferSetup=1
let CVSCommandDiffOpt="uwbB3"
let CVSCommandDeleteOnHide=1
let CVSCommandCommitOnWrite=1
let CVSCommandEdit="split"

set grepprg=grep\ -H\ -n
set cinoptions=l1,t0,(0,u1,W4,j1
set previewheight=5
" Always show statusline
set laststatus=2
set noruler

" Show buffer number, filetype, fileformat and fileencoding in statusline
set statusline=[%n]\ [%f]\ %w%y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ %l/%L,%-5c\ %P\ 

"set statusline=[%n]\ [%f]\ %y%r%m[%{&fileformat}][%{&fileencoding}]\ %=\ (%L)\ %l,%-5c\ %P\ 
"set rulerformat=%-25([%n]\ \ %l/%L,%-5c\ %P%)

" Switch between buffers as in other windows apps
set confirm
nmap <C-Tab> :tabnext<CR>
nmap <C-S-Tab> :tabprev<CR>
" map <C-F4> :call JHBufferClose()<cr>
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
"imap <C-L> <ESC>guiwgi
nmap <C-U> gUiw
"nmap <C-L> guiw

nnoremap <C-T> >>
nnoremap <C-D> <<
vnoremap <C-T> >
vnoremap <C-D> <
"nmap <C-J> %

inoremap <C-L> <DEL>
inoremap <M-h> <LEFT>
inoremap <M-l> <RIGHT>
inoremap <M-j> <DOWN>
inoremap <M-k> <UP>

nnoremap \xml :%!xmlstarlet fo -s 4<cr>
nnoremap \html :%!xmlstarlet fo -H -s 4<cr>

"nnoremap <Tab><Tab> :buffer! <C-Z>
"nnoremap <leader><S-Tab> :buffer! <C-Z><C-P><C-P>

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

"nnoremap <C-A> 2zh
"nnoremap <C-S> 2zl

nnoremap zh 24zh
nnoremap zl 24zl

function! TopCoderRunTest()
    let clazz = expand("%:t:r")
    let path  = expand("%:p:h")
    let cmd   = 'read !java -ea -cp ' . path . ' ' . clazz

    Sscratch
    normal ggdG
    silent execute cmd
    normal gg
    redraw

    if search('^Failed', 'wn') > 0
        echo 'Test Failed'
    elseif search('^Passed', 'wn') > 0
        echo 'Test Passed'
    endif
endfunction

nnoremap <C-F9> :call TopCoderRunTest()<CR>

function! JHJump()
    if search('\(«--\)\@<=.\{-,200}--»','W') > 0
        execute "normal! hhhgh\<C-o>f»\<C-O>o"
    endif
endfunction

inoremap <C-J> <ESC>:call JHJump()<CR>
nnoremap <C-J> :call JHJump()<CR>

highlight JHJumpPoint guibg=#77aa77 ctermbg=darkgreen
match JHJumpPoint /«--.\{-,100}--»/
