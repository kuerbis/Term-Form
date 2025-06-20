use 5.10.1;
use warnings;
use strict;
use ExtUtils::MakeMaker;

my %prereqs_os_specific;

if ( $^O eq 'MSWin32' ) {
    %prereqs_os_specific = (
        'Win32::Console::ANSI' => 0,
    );
}

WriteMakefile(
    PL_FILES         => {},
    MIN_PERL_VERSION => '5.10.1',
    LICENSE          => 'perl',
    META_MERGE => {
        'meta-spec' => { version => 2 },
        resources   => {
            bugtracker => {
                web => "https://github.com/kuerbis/Term-Form/issues",
            },
            repository => {
              type => 'git',
              web  => 'https://github.com/kuerbis/Term-Form',
              url  => 'https://github.com/kuerbis/Term-Form.git',
            },
        },
    },
    AUTHOR           => 'Matthaeus Kiem <cuer2s@gmail.com>',
    NAME             => 'Term::Form',
    ABSTRACT_FROM    => 'lib/Term/Form.pm',
    VERSION_FROM     => 'lib/Term/Form.pm',
    EXE_FILES        => [],
    BUILD_REQUIRES   => {
        'File::Spec::Functions' => 0,
        'FindBin'               => 0,
        'Test::More'            => 0,
        'Test::Fatal'           => 0,
    },
    PREREQ_PM => {
        'parent'                  => 0,
        'strict'                  => 0,
        'warnings'                => 0,
        'Carp'                    => 0,
        'Exporter'                => 0,
        'List::Util'              => '1.33',
        'Term::Choose'            => '1.773',
        'Term::Choose::Util'      => '0.145',
        %prereqs_os_specific,
    },
    dist  => {
        COMPRESS => 'gzip',
        SUFFIX   => '.gz',
        TARFLAGS => '--format=gnu -cvf',
    },
);
