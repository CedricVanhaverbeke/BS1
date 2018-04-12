$string = "Ik ben een testring
die verderloop op volgende lijnen";

while ($string =~ /(.)/g) {         # . is never a newline here
        # $1 has character, ord($1) its number
        print "karakter: $1, number: " . ord($1);
    }