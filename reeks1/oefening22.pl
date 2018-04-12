# Verwerk de elementen van een array, zoals je dat
# met pop of shift zou doen, maar nu meerdere elementen ineens.

@array = (1,2,3,4,5,6,7,8,9,10);
$grootte = 3; #constante

# poppen met meerdere elementen (elementen achteraan verwijderen)
splice @array, -$grootte;
print "@array\n";


# shiften met meerdere elementen (elementen vooraan verwijderen)
splice @array, 0, $grootte; #eerste argument is waar je begint, tweede waar je eindigt
print @array;