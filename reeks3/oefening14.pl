# Volgens de oplossing willen ze twee aparte arrays. Ik wil dat niet en wil gewoon alles in een hash steken.$
# Deze oplossing is wellicht verschillend van de vb oplossing want ik heb geen idee hoe een mailboxbestand eruit ziet.

# Paragraaf per paragraaf inlezen
$/ = "";

while(<DATA>){
    chomp;
    ($author, $subject, $message) = ($_ =~ /^From([^\n]+).*Subject:([^\n]+)\n(.+)/mgs);
    chomp $author, $subject, $message;
    $hash{$subject} = {
        author => $author,
        message => $message
    };
}

# Format the message nicely
while(($subject, $information) = each(%hash)){
    print "SUBJECT: $subject \n";
    print "FROM: " . $information->{author} . "\n";
    print "===================================\n";
    print $information->{message};
    print "\n\n";
}


__DATA__
From Simon DG
Subject: Broken English wereldtaal
I to think that it to be time to go international with the Broken English language.
Some key things:
1. in past tense: To write past before infinitive:
"I past to be very poort but now I to be very rich."
2. In future tense: To write future before infinitive:
"I future to be awesome."
3. In present tense no keyword is necessary.

From Demian Dirk Dekoninck
Subject: RE: Ascona
0/10
slechte broodjes
slechte kwaliteit