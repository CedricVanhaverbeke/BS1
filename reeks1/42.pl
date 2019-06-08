#Wijzig een invoerbestand, door gebruik te maken van een intermediair hulpbestand.

$^I = ".bak";

if($#ARGV != -1){
    while(<>){
        print $_ . "aangepast";
    }
}