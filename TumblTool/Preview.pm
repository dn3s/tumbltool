use strict;
#use warnings;
package TumblTool::Preview;
use URI::Escape;
use CSS::Minifier;
use JavaScript::Minifier;
use TumblTool::PathUtils;
use TumblTool::Slurp;
use TumblTool::Include;
use TumblTool::TumblrVar;
use TumblTool::TumblrTags;
use TumblTool::TextTransforms;
use Data::Dumper;
use base 'Exporter';
our @EXPORT=('render');
my $includes=[];
my $strip=0;
my $contentRoot='';
my $vars={};
sub configure
{
	my $options=shift();
	$includes    = $options->{"includes"   } // $includes;
	$strip       = $options->{"strip"      } // $strip;
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
	$vars        = $options->{"vars"       } // $vars;
}
sub dumpConfig
{
	my $inc=$includes?"['".join("', '",@{$includes})."']":"[]";
	return "TumblTool::Preview Config:\nincludes=$inc\nstrip='$strip'\ncontentRoot='$contentRoot'\n\n";
}
sub render #render a demo using $content for filler text, etc
{
	(my $block, my $content)=@_;
	my $result="";
	foreach my $item (@{$block}) {
		if(ref($item) eq "HASH") {
			$result.=renderBlock($item, $content);
		}
		elsif(!($item=~/^[\r\n\s]*$/)){ #don't concatenate if it's just a blank line; that's leftovers from block declarations. TODO: maybe this should be dealt with in the parse function???
			$result.=$item;
		}
	}
	return $result;
}
sub renderBlock #used by render to do most of the heavy lifting
{
	(my $block, my $content)=@_;
	return render($block->{"children"}| $content) if($block->{"name"}=~/^English|Not(?:German|French|Italian|Japanese|Turkish|Spanish|Russian|Polish|PortuguesePT|PortugueseBR|Dutch|Korean)$/);#if english| or at least not another language| render block. OTHERWISE DONT
	if($block->{"children"} and $content->{$block->{"name"}}) { #If the block has children, it's not just a var, it's a block. Check if there is anything to go in the block, and if so, render it.
		if(ref($content->{ $block->{"name"} }) eq "ARRAY") {#Is the relevant content an array (eg. posts, tags, etc)?
			my $result="";
			foreach my $contentItem (@{$content->{$block->{"name"}}}) { #iterate over said array
				$result.=render($block->{"children"}, $contentItem); #render the current block for each array item
			}
			return $result;
		}
		else { #No it's not an array; thank goodness. Just render it
			return render($block->{"children"}, $content);
		}
	}
	else { #since it's not a block, it's a placeholder.
		my $result="";
		if($block->{"name"} eq "tumbltool_includes") {
			$result=processIncludes($includes);
		}
		else {
			$result=printVar($block, $content);
		}
		return $result;
	}
}
1;
