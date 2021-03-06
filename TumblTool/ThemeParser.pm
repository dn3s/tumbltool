use strict;
#use warnings;
package TumblTool::ThemeParser;
use TumblTool::TumblrAnswer;
use base 'Exporter';
our @EXPORT=('parseTheme');
sub parseTheme
{
	(my $theme)=@_;
	my $root={ "children" => [] };
	my $currBlock=$root;
	while((my $match, my $html, my $isBlock, my $closing, my $name, my $paramStr) = $theme =~ /
		(                             #capture ALL OF IT in a group. to get length of processed string
			^(.*?)                     #non-tumblr-variable code, such as HTML is captured into its own group
			{                           #the magic token we seek is braces.
				((\/)?block:)?           #block declaration, optionally a closing block
				(
					(?:[a-z]+:)?
					[A-z0-9- ]+
				)   #valid var or block name, optionally starting with lang:
				((?:                       #param group
					\ [A-z]+\=\"[A-z0-9]+\" #ParamName="ParamValue"
				)*)
			}
		)
	/sx) {
		$theme=substr($theme,length($match));#remove the part of the string we "consumed"
		push(@{$currBlock->{"children"}}, $html) if $html;#if we slurped up any HTML lets deal with that before we do anything else
		my $params=parseParams($paramStr);
		if(!$isBlock) { #now lets start with the easy case: the token we found is not a block, just a variable.
			push(@{$currBlock->{"children"}}, {
				"name"=>$name,
				"params"=>$params
			});
		}
		elsif(!$closing) { #this will be a bit more work. The token we found marks the opening of a block! I guess we have to make a block then ;(
			my $newBlock={
				"name"=>$name,
				"params"=>$params,
				"parent"=>$currBlock, #We'll need this later to back out of the block once it's done.
				"children"=>[]
			};
			TumblTool::TumblrAnswer::config({answerBlock=>1}) if($name eq "Answer"); #SHOULD NOT EXIST IF TUMBLR'S API WAS SANE
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
sub parseParams
{
	(my $str)=@_;
	my $params={};
	foreach my $paramString (split(/ +/, $str)) {
		if($paramString=~/^([A-z]+)="(.*?)"$/) {
			$params->{$1}=$2;
		}
	}
	return $params;
}
1;
