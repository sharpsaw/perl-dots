" Undo the stuff this file changed.
let b:undo_ftplugin = "setlocal fo< com< cms< inc< inex< def< isf< kp<" .
	    \	      " | unlet! b:browsefilter"

" delimitMate doesn't optimize so well with Perl
let b:delimitMate_autoclose = 0

" Sweet keymaps:

" Ctrl+/ for arrow (which you have to type way too much).
imap <C-_> ->

" Ctrl+s for $self-> (which you also have to type way too much).
" Make sure you run `stty -ixon` in your shell rc files before you use this
" (otherwise it will buffer and wait for C-q, which annoys me anyway):
imap <C-s> $self->

" TODO, but what key?
" imap <something> my ($self) = @_;

" The mighty flip-if. Turns:
"   if (cond) {
"       func();
"   }
" to:
"   func()
"     if cond;
" ...and back.
map \if :!flip-if<cr>

" Show package+subs of the current file:
map \gs :!grepsubs %<cr>

" Run the debugger on the current file (great for .t files)
map \D :up<cr>:!perl -d -Ilib %<cr>

" Ingy's got \# covered.
" map \# :s/^/#/g<cr>:noh<cr>
map \$ :s/^#\s?//g<cr>:noh<cr>

" Auto-wrap text (see :h fpo-table )
setlocal formatoptions-=t

" This should be the vim default, I think:
au BufRead,BufNewFile *.t set ft=perl

" Search ./lib for things like vim's gf command.
let &path = "lib," . &path

" Use ':' in Ctrl+p/Ctrl+n/etc.:
set isfname+=: iskeyword+=:

" For the K command:
setlocal keywordprg=perldoc

" For the = command
setlocal equalprg=perltidy

" What happens when you :make. Maybe we should put this elsewhere.
setlocal makeprg=perl\ -wc\ %
" For more strictness:
" setlocal makeprg=perl\ -Wc\ %

setlocal errorformat=%m\ at\ %f\ line\ %l%.%#,
    \%-G%.%#


" You're on your own for finding a mapping for this.  I prefer:
" map <f3> :up<cr>:call RunLastT()<cr>
" imap <f3> <esc><f3>
function! RunLastT()
    if (expand('%:e') == 't')
        let $lasttfile = expand('%')
    endif
    if (!strlen($lasttfile))
       execute '!./' . expand('%')
    else
        !prove -lv $lasttfile
    endif
endf
"
" This lets you put a #: line at the top of some file you're working on with a
" command you'd like executed (maybe a GET or something?) each time you say
" \h.  It's a baby step before writing/running a test, and a little faster.
function! TryPerlCompile()
    let s:ext = expand('%:e')
    let s:command = 'perl -c -Ilib ' . expand('%')
    if (getline(1) =~ '^#:')
        let s:command = s:command . ' && '
                    \ . substitute(getline(1), '^#:', '', '')
    endif
    if (s:ext == 'pm' || s:ext == 'pl' || s:ext == 't' || s:ext == '')
        exec '!' . s:command
    endif
endf

function! QuietPerlCompile()
    let s:old_sp = &sp
    set sp=>&
    silent make
    let &sp = s:old_sp

    cwin
    if (! v:shell_error)
        echo 'syntax ok'
    endif
endf

" Return the module file corresponding to this test file, or the primary test
" corresponding to this module.  Note that this will find Foo.pm from
" Foo-bar.t, but not the other way round.
function! AlternateTestFile(file)
    if (match(a:file, '\.t$') != -1)
        return substitute(substitute(a:file, '^t/', 'lib/', ''), '\(-[^.]\+\)\?\.t$', '.pm', 'm')
    else
        return substitute(substitute(a:file, '^lib/', 't/', ''), '\.pm$', '.t', '')
    endif
endf

