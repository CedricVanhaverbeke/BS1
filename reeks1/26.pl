# De Perl functie sort sorteert default in ascii volgorde. Sorteer een array op de numerieke waarden.

@array = qw/3 2 1 4 5 6 1900/;
print join ", ", sort {$a <=> $b} @array;