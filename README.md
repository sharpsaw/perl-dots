perl-dots
=========

Perl-related dotfiles and scripts.

Context
-------

Why "-dots"?  See the system I start with:

  curl sharpsaw.org/init | sh

Perl CLI Stuff
--------------

<!--
Requires: https://github.com/sharpsaw/perl-dots (for its bin/bin-docs)
Update by having sharpsaw/perl-dots then yy@" on the next line:
jjV}k!bin-docs
-->
* `GETf` ⇒ `GET -UseS "$@"`
* `HEADf` ⇒ `HEAD -UseS "$@"`
* `POSTf` ⇒ `POST -UseS "$@"`
* `bin-docs` ⇒ Auto-doc'er for `bin/` scripts!
* `flip-if` ⇒ Switch "if ($cond) { stmt; }" to "stmt if $cond;" (and back!)
* `grepsubs` ⇒ Colorize package/sub stuff from a .pm (also `<leader>gs` in vim)
* `mi` ⇒ `make all install && rm -f Makefile.old`
* `mp` ⇒ `make purge "$@"`
* `mt` ⇒ `make test "$@"`
* `mtb` ⇒ Make tarball (from Makefile.PL)
* `perlcheck` ⇒ Like a souped-up `perl -c`
* `perldd` ⇒ `perl -MData::Dumper "$@"`
* `perlsw` ⇒ `perl -Mstrict -Mwarnings "$@"`
* `perlxxx` ⇒ `perl -MXXX "$@"`
* `pfunk` ⇒ `perl -MConfig -MYAML -e "print Dump \%Config" | vim -`
* `plv` ⇒ `prove -lv "$@"`
* `pmf` ⇒ `perl Makefile.PL $PMF\&ARGS "$@"`
* `smi` ⇒ `sudo make install "$@"`
* `tl` ⇒ `test-less "$@" # (Part of Test::Less)`
* `tlp` ⇒ `test-less --prove "$@" # (Part of Test::Less)`
* `vim-pm` ⇒ Edit the Foo.pm that perl finds via -MFoo

Vim Stuff
---------

Look in `.vim/ftplugin/*.vim` (note, the auto-running of ftplugin stuff
depends on `filetype plugin indent on` (actually the `indent` part of that
isn't related, but it's good.)).

If you also add `loop-dots` and `vim-dots` to your `.../config`, you should be
set.

Contact
-------

rking-perl-dots@sharpsaw.org

Ask/tell/demand anything. I'll be receptive.
