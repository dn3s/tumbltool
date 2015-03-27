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
			$result.=bundleBlock($item, $assets, $inline, $strip);
		}
		else {
			$result.=$item;
		}
	}
	return $result;
}
sub bundleBlock
{
	(my $block, my $assets, my $inline, my $strip)=@_;
	my $name=$block->{"name"};
	return processIncludes($assets, $inline, $strip) if($name eq "tumbltool_includes");
	return "{block:$name".bundle($block->{"children"},$assets,$inline,$strip)."{/block:$name}" if($block->{"children"});
	return "{$name}";
}
