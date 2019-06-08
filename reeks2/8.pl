while(<DATA>){
    # Split kan op deze manier gebruikt worden om stdin te splitten op whitespaces.
    for $woord (split){
        $H{$woord}++;
    }
}

while(($key, $value) = each(%H)){
    print "$key => $value \n";
}

__DATA__
Ik Blabla Cedric
Ik 
Jij 
Wij
Zij
Iedereen
Hallo