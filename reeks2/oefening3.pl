# Verwijder in een string alle whitespace die zich vooraan of achteraan bevindt.
$string = "            Ik ben een string met whitespace achteraan en voorraan               ";

($output) = ($string =~ /^\s*(.*?)\s*$/);
print "^$output\$";

# Dit kan je ook doen met twee substities
$string =~ s/^\s+//;
$string =~ s/\s+$//;