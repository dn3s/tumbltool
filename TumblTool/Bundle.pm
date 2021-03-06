use strict;
#use warnings;
package TumblTool::Bundle;
use base 'Exporter';
our @EXPORT=('bundle');
use TumblTool::Include;
use TumblTool::TumblrSettings;
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
	return TumblTool::TumblrSettings::settingsTags() if ($name eq "tumbltool_settings");
	return "{block:$name}".bundle($block->{"children"})."{/block:$name}" if($block->{"children"});
	return "{$name}";
}
1;
