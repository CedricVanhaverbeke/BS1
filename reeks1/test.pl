@lines = <DATA>;
$string = join "", @lines;

while($string =~ /(\w+)\s\1/gs){
    print $1, "\n";
}

__DATA__
tekst tekst ik ben een woord woord
cedric ik ben een tekst woord cedric
cedric lol lol