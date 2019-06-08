
open(my $FH, "test.txt");
while (defined($line = <$FH>) ) {
    chomp $line;
    if ($line =~ s/\\$//) {
        $line .= <$FH>;
        redo unless eof($FH);
    }
    
}