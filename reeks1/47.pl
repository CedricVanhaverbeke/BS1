# Schrijf een random lijn uit van een invoerbestand. Gebruik hierbij zo weinig mogelijk geheugen.

$random = sprintf("%0.f", rand(20)); # Genereert een random getal van 0 tot 20
while(<>){
    if($. eq $random){
        print $_;
        last;
    }
}