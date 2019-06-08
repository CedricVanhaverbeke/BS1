#Verwijder een hash element met een specifieke index. Hoe kan dit veralgemeend worden tot meerdere elementen ?
%A = (1,2,3,4,5,6,7,8,9,10);

delete$A{1}; #1 key verwijderen
print join ", ", keys %A;
print "\n"; 

#Verwijderen van meerdere elementen
delete@A{(3,5)};
print join ", ", keys %A; 