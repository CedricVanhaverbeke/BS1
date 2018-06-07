
#Gebruik een reguliere expressie om uit een string in DD/MM/YYYY formaat de dag-, maand- en jaartallen te parsen.

#Manier 1:

my $datum = "22/06/2017";
$datum =~ /(\d\d)\/(\d\d)\/(\d\d\d\d)/;

my $day = $1;
my $month = $2;
my $year =$3;

print $day; 
print "\n";
print $month; 
print "\n";
print $year; 
print "\n";



#Manier 2:


(my $day, my $month, my $year) = ($datum =~ /(\d{2})\/(\d{2})\/(\d{4})/);

print $day; 
print "\n";
print $month; 
print "\n";
print $year; 
print "\n";
