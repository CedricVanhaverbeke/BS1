$^I = ".bak";

while(<>){ #Het programma blijft inlezen en de woorden uitschrijven tot ^Z uitgevoerd wordt.
    chomp;
    print "$_\n";
}

