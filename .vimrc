set expandtab
set shiftwidth=2
set winheight=99
set tabstop=2
set number
set smartcase
set ignorecase

set hlsearch

redir @a

syntax on

" filetype on
au BufNewFile,BufRead *.inc,*.module,*.info,*.install,*.php,*.test set syntax=php

execute pathogen#infect()

set errorformat=%f:%l%.%#

set foldmethod=indent

set path=.**

set ruler

set noswapfile
set nobackup

" source /Applications/MacVim.app/Contents/Resources/vim/runtime/plugin/cecutil.vim
" source /Applications/MacVim.app/Contents/Resources/vim/runtime/autoload/Align.vim
" source /Applications/MacVim.app/Contents/Resources/vim/runtime/autoload/AlignMaps.vim
" source /Applications/MacVim.app/Contents/Resources/vim/runtime/plugin/AlignPlugin.vim
" source /Applications/MacVim.app/Contents/Resources/vim/runtime/plugin/AlignMapsPlugin.vim

" let @e = 0f(bywoerror_log("EAM€ü trace " . __file€kb€kb€kb€kbFILE__ . ":" . __LINE__ . ", "€kbEntering pa");


" Set this per Drupal/OpenScholar coding standards
set endofline


function! MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function! MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

" enable motion commands to pass the newline boundary
" set whichwrap+=<,>,h,l

" Insert time stamp
let @t = ':r!dateYppkkVr-jj.'

" Save file using clipboard contents (but with invalid filename
"     characters replaced with underscores)
" let @s = '"*p0:s/\W/_/gD:sav ~/tmp/".php'
  let @s = '"*p0:s/[^0-9A-Za-z_\.]/_/gD:sav ~/tmp/".php'


""""""""""""""""""""""""""""""""""""""""
" Convert this old register to file name
"
" normal "*p0:s/\W/_/gD:sav ~/tmp/"
function! SaveAsClipboardContents() 
  let l:clipboard_contents = getreg('*')
  echo '\nl:clipboard_contents = ' l:clipboard_contents
  let l:file_extension = input('Enter file extension: ' )
  echo '\nl:file_extension = ' l:file_extension
  let l:filename = substitute(l:clipboard_contents, "[^a-zA-Z0-9_\.]", "_", "g")
  echo '\nl:filename = ' l:filename
  saveas `=join([l:filename,'.',l:file_extension],'')`

  " let fl = readfile("%", "b")
  " call writefile(fl, "foocopy", "b")
endfunc

" Keep git diff happy 
set noendofline

runtime macros/matchit.vim
filetype detect

" Good for creating temp file names that don't contain illegal characters
call histadd("cmd", "s/[^0-9A-Za-z_\.]/_/g")
