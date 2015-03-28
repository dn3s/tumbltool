use strict;
#use warnings;
package TumblTool::Bundle;
use base 'Exporter';
our @EXPORT=('bundle');
use TumblTool::Include;
sub bundle
{
	(my $block)=@_;
	my $result="";
	foreach my $item (@{$block}) {
		if(ref($item) eq "HASH") {
			$result.=bundleBlock($item);
		}
		else {
			$result.=$item;
		}
	}
	return $result;
}
sub bundleBlock
{
	(my $block)=@_;
	my $name=$block->{"name"};
	return processIncludes() if($name eq "tumbltool_includes");
	return "{block:$name".bundle($block->{"children"})."{/block:$name}" if($block->{"children"});
	return "{$name}";
}
1;
