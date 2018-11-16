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
" Insert a console.log() message with a placeholder for the line number, and a util.inspect() on the yanked register (")
let @c = 'oconsole.log("EAM€ü trace, "%pa:REPLACE_ME_WITH_LINE_NO, " = " +€ü util.inspect("));'
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

function! SearchForHanCharacters() 
  " call search('[\u4e00-\u4eff\u4f00-\u4fff\u5000-\u50ff\u5100-\u51ff\u5200-\u52ff\u5300-\u53ff\u5400-\u54ff\u5500-\u55ff\u5600-\u56ff\u5700-\u57ff\u5800-\u58ff\u5900-\u59ff\u5a00-\u5aff\u5b00-\u5bff\u5c00-\u5cff\u5d00-\u5dff\u5e00-\u5eff\u5f00-\u5fff\u6000-\u60ff\u6100-\u61ff\u6200-\u62ff\u6300-\u63ff\u6400-\u64ff\u6500-\u65ff\u6600-\u66ff\u6700-\u67ff\u6800-\u68ff\u6900-\u69ff\u6a00-\u6aff\u6b00-\u6bff\u6c00-\u6cff\u6d00-\u6dff\u6e00-\u6eff\u6f00-\u6fff\u7000-\u70ff\u7100-\u71ff\u7200-\u72ff\u7300-\u73ff\u7400-\u74ff\u7500-\u75ff\u7600-\u76ff\u7700-\u77ff\u7800-\u78ff\u7900-\u79ff\u7a00-\u7aff\u7b00-\u7bff\u7c00-\u7cff\u7d00-\u7dff\u7e00-\u7eff\u7f00-\u7fff\u8000-\u80ff\u8100-\u81ff\u8200-\u82ff\u8300-\u83ff\u8400-\u84ff\u8500-\u85ff\u8600-\u86ff\u8700-\u87ff\u8800-\u88ff\u8900-\u89ff\u8a00-\u8aff\u8b00-\u8bff\u8c00-\u8cff\u8d00-\u8dff\u8e00-\u8eff\u8f00-\u8fff\u9000-\u90ff\u9100-\u91ff\u9200-\u92ff\u9300-\u93ff\u9400-\u94ff\u9500-\u95ff\u9600-\u96ff\u9700-\u97ff\u9800-\u98ff\u9900-\u99ff\u9a00-\u9aff\u9b00-\u9bff\u9c00-\u9cff\u9d00-\u9dff\u9e00-\u9eff\u9f00-\u9fff]')
  let @/ = '[\u4e00-\u4eff\u4f00-\u4fff\u5000-\u50ff\u5100-\u51ff\u5200-\u52ff\u5300-\u53ff\u5400-\u54ff\u5500-\u55ff\u5600-\u56ff\u5700-\u57ff\u5800-\u58ff\u5900-\u59ff\u5a00-\u5aff\u5b00-\u5bff\u5c00-\u5cff\u5d00-\u5dff\u5e00-\u5eff\u5f00-\u5fff\u6000-\u60ff\u6100-\u61ff\u6200-\u62ff\u6300-\u63ff\u6400-\u64ff\u6500-\u65ff\u6600-\u66ff\u6700-\u67ff\u6800-\u68ff\u6900-\u69ff\u6a00-\u6aff\u6b00-\u6bff\u6c00-\u6cff\u6d00-\u6dff\u6e00-\u6eff\u6f00-\u6fff\u7000-\u70ff\u7100-\u71ff\u7200-\u72ff\u7300-\u73ff\u7400-\u74ff\u7500-\u75ff\u7600-\u76ff\u7700-\u77ff\u7800-\u78ff\u7900-\u79ff\u7a00-\u7aff\u7b00-\u7bff\u7c00-\u7cff\u7d00-\u7dff\u7e00-\u7eff\u7f00-\u7fff\u8000-\u80ff\u8100-\u81ff\u8200-\u82ff\u8300-\u83ff\u8400-\u84ff\u8500-\u85ff\u8600-\u86ff\u8700-\u87ff\u8800-\u88ff\u8900-\u89ff\u8a00-\u8aff\u8b00-\u8bff\u8c00-\u8cff\u8d00-\u8dff\u8e00-\u8eff\u8f00-\u8fff\u9000-\u90ff\u9100-\u91ff\u9200-\u92ff\u9300-\u93ff\u9400-\u94ff\u9500-\u95ff\u9600-\u96ff\u9700-\u97ff\u9800-\u98ff\u9900-\u99ff\u9a00-\u9aff\u9b00-\u9bff\u9c00-\u9cff\u9d00-\u9dff\u9e00-\u9eff\u9f00-\u9fff]'
  " norm /h
endfunc


" Compile a list of Yabla search queries for each pinyin token
let @d = 'https://chinese.yabla.com/chinese-english-pinyin-dictionary.php?define='
let @q = ':s/\s\+/\r/g0{jI gv"DP'

" Replace the search term with the yanked term
let @r = ':s///"/g'
