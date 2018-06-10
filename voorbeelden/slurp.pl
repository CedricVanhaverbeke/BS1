undef $/;

$_ = <DATA>;

while(/^<voorbeeld>.*?<\/voorbeeld>/gsm){
    print "test \n";
}
__DATA__
<voorbeeld>
Ik ben een tekst
</voorbeeld>
<voorbeeld>
Ik ben ook een test
</voorbeeld>