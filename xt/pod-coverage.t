use 5.10.1;
use strict;
use warnings;
use Test::More;

use Test::Pod::Coverage;
use Pod::Coverage;

plan tests => 1;
pod_coverage_ok( 'Term::Choose' );
#all_pod_coverage_ok();
