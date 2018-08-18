package # hide from PAUSE
Term::Form::Linux;

use warnings;
use strict;
use 5.008003;

our $VERSION = '0.500_01';

use parent 'Term::Choose::Linux';


my $Term_ReadKey; # declare but don't assign a value!
BEGIN {
    if ( eval { require Term::ReadKey; 1 } ) {
        $Term_ReadKey = 1;
    }
}

my $Stty = '';


sub __set_mode {
    my ( $self, $hide_cursor ) = @_;
    if ( $Term_ReadKey ) {
        Term::ReadKey::ReadMode( 'cbreak' );
    }
    else {
        $Stty = `stty --save`;
        chomp $Stty;
        system( "stty -echo cbreak" ) == 0 or die $?;
    }
    $self->__hide_cursor() if $hide_cursor;
};

sub __reset_mode {
    my ( $self, $hide_cursor ) = @_;
    $self->__show_cursor() if $hide_cursor;
    if ( $Term_ReadKey ) {
        Term::ReadKey::ReadMode( 'restore' );
    }
    else {
        if ( $Stty ) {
            system( "stty $Stty" ) == 0 or die $?;
        }
        else {
            system( "stty sane" ) == 0 or die $?;
        }
    }
}



1;

__END__
