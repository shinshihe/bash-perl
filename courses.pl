#!/usr/bin/perl -w
use LWP::Simple;

$key = $ARGV[0];
# print $key;
$url = "http://www.timetable.unsw.edu.au/current/" . $key . "KENS.html";
$web_page = get($url) or die "Unable to get $url";
# print $web_page > web.html;

$filename = "pperl.txt";
if( -e $filename){
    unlink($filename);
}
open(FH, '>' ,$filename) or die "can't create file";
open(SEC, '>' , "test.txt" ) or die "can't create file";
for $line ( $web_page){
    if( $line =~ /$key/){
    #    print $line;
        print FH $line;     
    }
}
close FH;
open($lines,'<',"pperl.txt");
while(<$lines>){
    print SEC $_ if ($_ =~ /$key/);
}
close SEC;



open(Third, '>' , "test2.txt" ) or die "can't create file";
open($lines,'<',"test.txt");
while(<$lines>){
    $_ =~ s/<\/a>//g;
    $_ =~ s/<\/td>//g;
    #$_ =~ s/^[^.html">]*//g;
    $_ =~ s/.*html\">//g; 
    print Third $_
}
close Third;




@words = ();
open (HF, "test2.txt") or die ("No such file");
foreach $line (<HF>){
	push @words,"$line";
	}
close (HF);

open(Fourth, '>' , "final.txt" ) or die "can't create file";
@sentances = ();
$fir = 0;
$sec = 1;
$len = @words;


while( $fir < $len){
    $bri = $words[$fir];
    #print $bri;
    $bri =~ s/\n//g;
    $tmp = $bri . " " . $words[$sec];
    #print $tmp;
    #$tmp =~ s/\n//g;
    push @sentances,"$tmp";
    $fir = $fir + 2;
    $sec = $sec + 2;
}
close (Fourth);


sub uniq {
    my %seen;
    grep !$seen{$_}++, @_;
}

@filtered = uniq(@sentances) ;
#print @sentances;
#print "@filtered";
foreach (@filtered){
    $_ =~ s/^\s+//;
    print $_;
}