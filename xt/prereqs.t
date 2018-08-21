use 5.010000;
use warnings;
use strict;
use Test::More;

use Test::Prereq;

prereq_ok( undef, [ qw(
        Term::Choose::Constants
        Term::Choose::LineFold
        Term::Choose::Linux
        Term::Choose::Win32

        Data_Test_Arguments
        Data_Test_Readline
    )
] );
