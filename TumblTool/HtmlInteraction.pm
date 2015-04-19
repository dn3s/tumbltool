use strict;
#use warnings;
package TumblTool::HtmlInteraction;
use Data::Dumper;
my $theme={};
sub configure
{
	my $options=shift();
	$theme = $options->{"theme"} // $theme;
}
sub dumpConfig
{
	return "TumblTool::HtmlInteraction Config:\ntheme=$theme\n\n";
}
sub getMetaTags
{
	foreach my $code (@{$theme}) {
		next if(ref($code eq "HASH")); #skip over non-strings. We don't need to worry about recursion because the meta tags shouldn't be in blocks
		
	}
}
sub extract
{
	(my $expr, my $chunk)=@_;
	$chunk=$chunk // $theme;
	my $result=[];
	foreach my $code (@{$chunk}) {
		if(ref($code) eq "HASH"){
			push(@{$result}, @{extract($expr, $code->{"children"})}) if($code->{"children"});
		}
		else{
			push(@{$result}, @{extractAll($expr, $code)});
		}
	}
	return $result;
}
sub extractAll
{
	(my $expr, my $txt)=@_;
	my $result=[];
	while(my @matches=$txt=~/^(.*?($expr))/) {
		my $len=length(shift(@matches)); #first match is EVERYTHING.
		push(@{$result}, @matches);
		$txt=substr($txt,$len);
	}
	return $result;
}
sub insert
{
	(my $expr, my $insert, my $chunk)=@_;
	$chunk=$chunk // $theme;
	foreach my $code (@{$chunk}) {
		if(ref($code) eq "HASH"){
			insert($expr, $insert, $code->{"children"}) if($code->{"children"});
		}
		else{
			$code=~s/($expr)/$insert\1/;
		}
	}
}
1;
