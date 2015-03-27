use strict;
use warnings;
package TumblTool::Preview;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use CSS::Minifier;
use JavaScript::Minifier;
use TumblTool::FormatDate;
use TumblTool::PathUtils;
use TumblTool::Slurp;
use TumblTool::Include;
use base 'Exporter';
our @EXPORT=('render');
sub render #render a demo using $content for filler text, etc
{
	(my $block, my $content, my $assets, my $inline, my $strip)=@_;
	if($content->{"PostType"}) {#special case for Posts. Mark the type of post as True so it'll render the correct block TODO: better solution for special cases; there will be a lot of them
		$content->{ucfirst($content->{"PostType"})}=1;
	}
	my $result="";
	foreach my $item (@{$block}) {
		if(ref($item) eq "HASH") {
			$result.=renderBlock($item, $content, $assets, $inline, $strip);
		}
		elsif(!($item=~/^[\r\n\s]*$/)){ #don't concatenate if it's just a blank line; that's leftovers from block declarations. TODO: maybe this should be dealt with in the parse function???
			$result.=$item;
		}
	}
	return $result;
}
sub renderBlock #used by render to do most of the heavy lifting
{
	(my $block, my $content, my $assets, my $inline, my $strip)=@_;
	if($block->{"children"} and $content->{$block->{"name"}}) { #If the block has children, it's not just a placeholder, it's a block. Check if there is anything to go in the block, and if so, render it.
		if(ref($content->{$block->{"name"}}) eq "ARRAY") {#Is the relevant content an array (eg. posts, tags, etc)?
			my $result="";
			foreach my $contentItem (@{$content->{$block->{"name"}}}) { #iterate over said array
				$result.=render($block->{"children"}, $contentItem, $assets, $inline, $strip); #render the current block for each array item
			}
			return $result;
		}
		else { #No it's not an array; thank goodness. Just render it
			return render($block->{"children"}, $content, $assets, $inline, $strip);
		}
	}
	else { #since it's not a block, it's a placeholder.
		my $result="";
		if($block->{"name"} eq "tumbltool_includes") {
			$result=processIncludes($assets, $inline, $strip);
		}
		else {
			$result=renderVar($content, $block->{"name"});
		}
		return (($result eq "1")?"":$result); #if the text is just "1" don't print anything though
	}
}
sub renderVar
{
	(my $content, my $varName)=@_;
	my $text=(
		formatDate($varName, $content->{"Date"}) //
		$content->{$varName}
	);
	return applyPrefix($varName, $text || "");
}
sub applyPrefix
{
	(my $varName, my $val)=@_;
	if($varName=~/^RGB/) {
		$val=~/#?(..)(..)(..)/;
		return ("$1,$2,$3");
	}
	return stripHTML($val)          if($varName=~/^Plaintext/  );
	return jsQuote($val)            if($varName=~/^JS/         );
	return jsQuote(stripHTML($val)) if($varName=~/^JSPlaintext/);
	return uri_escape_utf8($val)    if($varName=~/^URLEncoded/ );
	return $val;
}
sub jsQuote
{
	my $text=shift();
	$text=~s/\\/\\\\/g;
	$text=~s/'/\\'/g;
	return "'$text'";
}
sub stripHTML
{
	my $text=shift();
	my $hs=HTML::Strip->new(emit_spaces=>0);
	return $hs->parse(encode_entities($text));
}
