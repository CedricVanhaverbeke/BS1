use Data::Dumper;
# Naam student: Cedric Vanhaverbeke
#
# Status implementatie:
#   extractie naam klasse ? 
#   extractie type klasse ? 
#   extractie ouderklasse ? 
#   extractie en bijhouden verzameling verplichte attributen ? 
#   extractie en bijhouden verzameling hulpklassen ? 
#   stap 1: op naam gesorteerde lijst van alle klassen met verplichte attributen ? 
#   stap 1: op naam gesorteerde lijst, per klasse, van alle verplichte attributen ? 
#   stap 1: correct aantal lijnen (97) ? 
#   stap 2: uitbreiding verplichte attributen met verplichte attributen van hulpklassen ? 
#   stap 2: correct aantal lijnen (99) ? 
#   stap 3: opsporen hierarchie van opeenvolgende ouderklassen ? 
#   stap 3: uitbreiding verplichte attributen met verplichte attributen van hierarchische ouderklassen ? 
#   stap 3: komt een attribuut maximaal ��nmaal voor in de verplichte attributen van een klasse ? 
#   stap 3: correct aantal lijnen (alle klassen) ? Het werkte eerst, maar door alles uit commentaar te halen niet meer, dus nvm
#   stap 4: eliminatie klassen waarvoor objectClassCategory niet 1 ? 
#   stap 4: eliminatie klassen die ouderklasse zijn van een andere klasse ? 
#   stap 4: eliminatie klassen met top als ouderklasse ? 
#   stap 4: correct aantal lijnen (74) ? 
#
# Eventuele tekortkomingen: 
#

@ARGV = "./data/3";

# Inlezen
while (<>) {
  $class->{lDAPDisplayName} = $1 if /^lDAPDisplayName:\s+(.*)/i;
  $class->{objectClassCategory} = $1 if /^objectClassCategory:\s+(.*)/i;
  $class->{subClassOf} = $1 if /^subClassOf:\s+(\w+)/i;
  push @{$class->{mustContain}}, $2 if  /^(systemMustContain|mustContain):\s+(.*)/i;
  push @{$class->{auxiliaryClass}}, $2 if /^(systemAuxiliaryClass|auxiliaryClass):\s+(.*)/i;

  push @$classes, $class if /^$/;
  $class = {} if /^$/; #Make it empty again
} 

#Stap 1
printf("Aantal klassen met verplichte attributen: %d\n", scalar grep {defined $_->{mustContain}} @$classes);
foreach my $class (sort {$a->{lDAPDisplayName} cmp $b->{lDAPDisplayName}} grep {defined $_->{mustContain}} @$classes){
  printf("%s: %s\n", $class->{lDAPDisplayName}, join "|", @{$class->{mustContain}});
}

print "\n\n";

# Stap 2
# Klassen uitbreiden
foreach my $class(grep {defined $_->{auxiliaryClass} and $_->{lDAPDisplayName}} @$classes){
  foreach $name (@{$class->{auxiliaryClass}}) {
    my $auxiliaryClass = [grep {$_->{lDAPDisplayName} eq $name} @$classes]->[0];
    push @{$class->{mustContain}}, @{$auxiliaryClass->{mustContain}};
  }
}

printf("Aantal klassen met verplichte attributen: %d\n", scalar grep {defined $_->{mustContain} and scalar @{$_->{mustContain}} != 0}  @$classes);
foreach my $class (sort {$a->{lDAPDisplayName} cmp $b->{lDAPDisplayName}} grep {defined $_->{mustContain} and scalar @{$_->{mustContain}} != 0} @$classes){
  printf("%s: %s\n", $class->{lDAPDisplayName}, join "|", @{$class->{mustContain}});
}

print("\n\n");

# Stap 3
foreach my $class(grep {$_->{lDAPDisplayName} eq "group" }@$classes){
   # Find parent class 
   my $parentClass = [grep {$_->{lDAPDisplayName} eq $class->{subClassOf}} @$classes]->[0]; 
   while(defined $parentClass){
     push @{$class->{mustContain}}, @{$parentClass->{mustContain}};
      $parentClass = defined $parentClass->{subClassOf} ?  # Stel nieuwe parentklasse in
           [grep {$_->{lDAPDisplayName} eq $parentClass->{subClassOf}} @$classes]->[0]
          : undef;
   }
}

printf("Aantal klassen met verplichte attributen: %d\n", scalar grep {defined $_->{mustContain} and scalar @{$_->{mustContain}} != 0}  @$classes);
foreach my $class (sort {$a->{lDAPDisplayName} cmp $b->{lDAPDisplayName}} grep {defined $_->{mustContain} and scalar @{$_->{mustContain}} != 0} @$classes){
  printf("%s: %s\n", $class->{lDAPDisplayName}, join "|", @{$class->{mustContain}});
}

print "\n\n";

# Stap 4
$allNames{$_} = undef foreach map {$_->{lDAPDisplayName}} @$classes; #alle klassen
$parentNames{$_} = undef foreach map {$_->{subClassOf}} grep { defined $_->{subClassOf} } @$classes; #alle ouders


delete @allNames{keys %parentNames}; # Alle niet-ouders zitten hier nu in

$stap4classes = [grep { exists $allNames{$_->{lDAPDisplayName}} 
                        and $_->{objectClassCategory} == 1
                        and $_->{subClassOf} ne "top"} 
                        @{$classes}];

printf("Aantal klassen die voldoen aan voorwaarden: %d\n", scalar @$stap4classes);
  foreach my $class (@$stap4classes){
    printf("%s: %s\n", $class->{lDAPDisplayName});
}

