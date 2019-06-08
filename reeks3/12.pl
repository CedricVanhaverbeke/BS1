
# Shift the first element out of the arguments
@super = split(/\//, shift @ARGV);
@output;

foreach $i (0..32){
    %hash{$i} = 2^(32 - $i)
}


# Zolang de array niet leeg is
#while(scalar(@ARGV)){
#    @subadres = split(/\//, shift @ARGV);
#    while(@subadres[0] != @super[0] && @subadres[1] != @super[1]){
#        push @output, 
#    }
#}