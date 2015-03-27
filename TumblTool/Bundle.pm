use strict;
use warnings;
package TumblTool::Bundle;
use base 'Exporter';
our @EXPORT=('bundle');
use TumblTool::Include;
sub bundle
{
	(my $block, my $assets, my $inline, my $strip)=@_;
	my $result="";
	foreach my $item (@{$block}) {
		if(ref($item) eq "HASH") {
			$result.=bundleObject($item, $assets, $inline, $strip);
		}
		else {
			$result.=$item;
		}
	}
	return $result;
}
sub bundleObject
{
	(my $block, my $assets, my $inline, my $strip)=@_;
	my $name=$block->{"name"};
	if($name eq "tumbltool_includes") {
		return processIncludes($assets, $inline, $strip);
	}
	elsif($block->{"children"}) {
		return "{block:$name".bundle($block->{"children"},$assets,$inline,$strip)."{/block:$name}";
	}
	else {
		return "{$name}";
	}
}
