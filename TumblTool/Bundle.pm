use strict;
#use warnings;
package TumblTool::Bundle;
use base 'Exporter';
our @EXPORT=('bundle');
use TumblTool::Include;
my $includes=[];
my $inline=0;
my $strip=0;
sub configure
{
	my $options=shift();
	$includes = $options->{"includes"} // $includes;
	$inline   = $options->{"inline"  } // $inline;
	$strip    = $options->{"strip"   } // $strip;
}
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
	return processIncludes($includes, $inline, $strip) if($name eq "tumbltool_includes");
	return "{block:$name".bundle($block->{"children"})."{/block:$name}" if($block->{"children"});
	return "{$name}";
}
1;
