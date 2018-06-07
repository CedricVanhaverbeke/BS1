# Verwerk de elementen van een array circulair: na het laatste element 
# moeten opnieuw het eerste en alle daaropvolgende elementen telkens opnieuw afgelopen worden.

@array = qw/Ik ben een array met wat elementen in/;
print join " ", @array;

print "\n Na het circulair verwerken: \n";

unshift(@array, pop(@array));
print join " ", @array;
