# Hoe kun je een variabele instellen met een default waarde, enkel op voorwaarde dat die variabele op dat ogenblik geen waarde heeft ?

# Antwoord: met de // operator
# extra: If used in the main program, it will shift (remove and return) the first value from @ARGV, 
# the argument list of your program. If used inside a subroutine, 
# it will shift the first value from @_, the argument list of the sub.
# See the documentation for more info.

$my_variable = shift // 'default_file';