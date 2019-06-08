use Data::Dumper;

my $teller = 0;
while(<DATA>){
    chomp($_);
    if(/\\$/){
        $lijnen->[$teller] = $_;
    } else {
        $lijnen->[$teller] .= $_;
        $teller++;
    }
}

print Dumper @$lijnen;


__DATA__
DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) \
$(TEXINFOS) $(INFOS) $(MANS) $(DATA)
DEP_DISTFILES = $(DIST_COMMON) $(SOURCES) $(HEADERS) \
$(TEXINFOS) $(INFO_DEPS) $(MANS) $(DATA) \
$(EXTRA_DIST)