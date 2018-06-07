# Schrijf één of meerdere lijnen, met specifieke lijnnummer(s), uit van een invoerbestand.

@lijnen = (5, 10, 12, 15);
$l{$_} = undef foreach @lijnen;

while(<>){
    print "$. $_" if exists($l{$.});
}