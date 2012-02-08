use strict;
use warnings;

use Test::More;
use File::Temp;

my $tempdir = File::Temp->newdir;

diag "writing output to $tempdir";
system $^X, 'bin/ucsc-to-json.pl', (
    '-q',
    '--in'    => 'tests/data/hg19/database/',
    '--out'   => "$tempdir",
    '--track' => 'knownGene',
    '--cssclass' => 'transcript',
    '--subfeatureClasses' => qq|{"CDS":"transcript-CDS", "UTR": "transcript-UTR"}|,
    '--arrowheadClass' => 'transcript-arrowhead',
  );
ok( ! $?, 'ucsc-to-json.pl ran ok' );

done_testing;