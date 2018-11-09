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
au BufNewFile,BufRead *.feature set syntax=cucumber
au BufNewFile,BufRead *.feature norm zR

" Wed Oct 31 12:00:08 EDT 2018
au BufNewFile,BufRead *.js,*.json set syntax=javascript

execute pathogen#infect()

set errorformat=%f:%l%.%#

set foldmethod=indent

set path=.**

set ruler

set noswapfile
set nobackup

source $HOME/.vim/plugin/cecutil.vim
source $HOME/.vim/autoload/Align.vim
source $HOME/.vim/autoload/AlignMaps.vim
source $HOME/.vim/plugin/AlignPlugin.vim
source $HOME/.vim/plugin/AlignMapsPlugin.vim

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
  saveas `=join(['/Users/hmdcadministrator/tmp/',l:filename,'.',l:file_extension],'')`

  " let fl = readfile("%", "b")
  " call writefile(fl, "foocopy", "b")
endfunc

" Keep git diff happy 
" set noendofline

runtime macros/matchit.vim
filetype detect

" Good for creating temp file names that don't contain illegal characters
call histadd("cmd", "s/[^0-9A-Za-z_\.]/_/g")

" Convert item in php array to number (e.g., 2@z converts "$foo, $bar" => "0   , 0   "
" mnemonic: 'Z' is for Zeroing out variables names 0, 0, 0, ...
let @z = 'ver r0Ww'

" Trace line template for PHP debugging
" mnemonic: 'E' is for error_log
let @e = 'error_log("EAM Entering " . __FILE__ . ":" . __LINE__ . ", \$s = " . var_export($s, true));'

" Insert a timestamp in this format:
" ----------------------------
" Sun Aug  6 14:22:17 EDT 2017
" ----------------------------
" mnemonic: 'T' is for Timestamp
let @t = ':r!dateYppkkVr-jj.'


" Matching pairs of keywords
if exists('loaded_matchit')
  let b:match_ignorecase = 0
  let b:match_words =
        \ 'if:then:else:elif:elsif:elseif:else:fi,' .
        \ 'switch:case:esac,'
endif


" indent text that doesn't format correctly in a php formatted file
let @f = 'jVzjk20>z.zMz.zoz.'

" let @c = 'console.log("EAM trace a = " + util.inspect(a));'
" g/\v<(if|function|else|for|while)>.*\{$/ norm @c
" let @C = 'o	console.log("EAM€ü " + );BBBitrace, "%Pa:lxf):let @l = line('.')"LP'
" let @c = 'oi				consoel€kb€kble.lg€kbog();hi"",€kb +€ü autil.inspect(a)0f"liEAM€ü trace, l"%Pa::let @l = line('''' . '''')l"LPa, a = '

" store the argument to line() function in a register to address the
"   escape-quoting nightmare that is VimScript
let @e = "'.'"
" Insert a console.log() message with a placeholder for the line number
let @c = 'oconsole.log("EAM€ü trace, "%pa:REPLACE_ME_WITH_LINE_NO, a = " +€ü util.inspect(a));'
" Add the line number to the console.log() line
let @k = '0f:l:let @l = line('. @e . ')"LPldw'
" Run register c, then k
let @v = '@c@k'

let @u = 'var util = require("util")'

colorscheme koehler

autocmd! VimLeave * mksession!

" Vim emojis  (see https://github.com/junegunn/vim-emoji)
source $HOME/.vim/vim-emoji/autoload/emoji/data.vim
source $HOME/.vim/vim-emoji/autoload/emoji.vim
set completefunc=emoji#complete

set tags=./tags,tags,./TAGS

set undofile
set undodir=~/.vim/undodir
