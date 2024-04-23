use strict;
use warnings;

sub main {
  $#ARGV == 0 or die "Usage: $0 <input file>";

  my $head = undef;

  open(IN, "<$ARGV[0]") or die "Cannot open input file: $ARGV[0]";
  while(<IN>) {
    chomp;
    $head = {data=>$_, next=>$head};
  }
  close(IN);

  my $node = sort_list($head);
  while($node) {
    printf("%d\n", $node->{data});
    $node = $node->{next};
  }
}

sub sort_list {
  my $x = shift; 
    my $p, my $t, my $y, my $z;
    my $changed = 1;

    while ($changed) {
      $p = undef;
      $changed = 0;
      $y = $x;
      $z = $y->{next};
      while (defined($z)) {
        if ($y->{data} >= $z->{data}) {
          $t = $z->{next};
          $changed = 1;
          $y->{next} = $t;
          $z->{next} = $y;
          if (!defined($p)) { 
            $x = $z;
          } else {
            $p->{next} = $z;
          }
          $p = $z;
          $z = $t;
        } else {
          $p = $y;
          $y = $z;
          $z = $y->{next};
        }
      }
    }

    return $x;
}

main();
