$anon = {"test" => 1, "test2" => 2};
delete ${$anon}{"test"};
print  scalar keys %{$anon};