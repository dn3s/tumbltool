use strict;
use warnings;
package TumblTool::ThemeParser;
use base 'Exporter';
our @EXPORT=('parseTheme');
sub parseTheme
{
	(my $theme)=@_;
	my $root={ "children" => [] };
	my $currBlock=$root;
	while((my $match, my $html, my $isBlock, my $closing, my $name) = $theme =~ /(^(.*?){((\/)?block:)?([A-z0-9-]+?)})/s) {
		$theme=substr($theme,length($match));#remove the part of the string we "consumed"
		push(@{$currBlock->{"children"}}, $html) if $html;#if we slurped up any HTML lets deal with that before we do anything else
		if(!$isBlock) { #now lets start with the easy case: the token we found is not a block, just a variable.
			push(@{$currBlock->{"children"}}, {
				"name"=>$name
			});
		}
		elsif(!$closing) { #this will be a bit more work. The token we found marks the opening of a block! I guess we have to make a block then ;(
			my $newBlock={
				"name"=>$name,
				"parent"=>$currBlock, #We'll need this later to back out of the block once it's done.
				"children"=>[]
			};
			my $i=push(@{$currBlock->{"children"}}, $newBlock);
			$currBlock=$newBlock;
		}
		else {#end of block
			my $parent=$currBlock->{"parent"};
			delete($currBlock->{"parent"});#clean up the parent ref; we don't need it any more
			$currBlock=$parent;
		}
	}
	push(@{$root->{"children"}},$theme);#WHOOPS THE PARSING LOOP DIDN'T GRAB THE LAST BIT OF HTML SINCE IT'S NOT FOLLOWED BY A TUMBLR TAG
	return $root->{"children"};#stip off the outer object
}
1;
