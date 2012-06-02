perl-dots
=========

Perl-related dotfiles and scripts for `...`

Perl CLI Stuff
--------------

*    flip-if - Switch "if ($cond) { stmt; }" to "stmt if $cond;" (and back!)
*   grepsubs - Colorize package/sub stuff from a .pm (also `<leader>gs` in vim)
*         mt - make test "$@"
*  perlcheck - Like a souped-up `perl -c`
*        plv - prove -lv "$@"
*        pmf - perl Makefile.PL, respects `$PMF_ARGS` and passed-in args.
*        smi - sudo make install
*         tl - test-less (Part of Test::Less)
*        tlp - test-less --prove (Part of Test::Less)

Vim Stuff
---------

Look in `.vim/ftplugin/*.vim` (note, the auto-running of ftplugin stuff
depends on `filetype plugin indent on` (actually the `indent` part of that
isn't related, but it's good.)).

Context
-------

Why "-dots"?  See: http://github.com/ouicode/rkingy-dots-conf
