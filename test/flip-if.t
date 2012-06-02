use Test::More;
use strict;
use warnings;

sub run_flip_if {
    my ($input) = @_;
    `echo '$input' | ./bin/flip-if`
}

my $input = do {local $/ = undef; <DATA>};
my %cases = map {
    s/^\n|\s+$//;
    $_
} map {
    split /^becomes:\n/m, $_;
} split /\n\n/, $input;
plan tests => 2 * keys %cases;

for my $input (keys %cases) {
    my $expected = $cases{$input};
    my $actual = run_flip_if($input);
    is $actual, $expected, "flip-if:\n$input";
    ok run_flip_if($actual), "backwards";
}

#use Data::Dumper;
#warn Data::Dumper::Dumper(\%cases);

__DATA__
    if ($cond) {
        func();
    }
becomes:
    func()
        if $cond;

func() if $cond;
becomes:
if ($cond) {
    func();
}
