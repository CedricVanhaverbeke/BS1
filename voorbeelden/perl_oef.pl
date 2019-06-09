use Data::Dumper;

%h = (1, 2, 3, 2);

while(($key, $value) = each(%h)){
    push @{$a{$value}}, $key;
}

print Dumper \%a;