$line = "";
while(<>){
    if($_ =~ /\\$/){
        $line = "$line $_";
    } else {
        push @array, "$line$_";
        $line = "";
    }
}

print join "\n",  @array;