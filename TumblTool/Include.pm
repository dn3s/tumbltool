use strict;
#use warnings;
package TumblTool::Include;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use TumblTool::TextTransforms;
use TumblTool::TumblrDate;
use TumblTool::PathUtils;
use TumblTool::Slurp;
use base 'Exporter';
our @EXPORT=('processIncludes');
my $includes=[];
my $inlineCSS=0;
my $inlineJS=0;
my $minifyCSS=0;
my $minifyJS=0;
my $collapseHTML=0;
sub configure
{
	my $options=shift();
	$includes     = $options->{"includes"    } // $includes;
	$inlineCSS    = $options->{"inlineCSS"   } // $inlineCSS;
	$inlineJS     = $options->{"inlineJS"    } // $inlineJS;
	$minifyCSS    = $options->{"minifyCSS"   } // $minifyCSS;
	$minifyJS     = $options->{"minifyJS"    } // $minifyJS;
	$collapseHTML = $options->{"collapseHTML"} // $collapseHTML;
}
sub processIncludes
{
	my $result="";
	foreach my $name (@{$includes}) {
		$result.=include($name);
	}
	return $result;
}
sub include
{
	(my $uri)=@_;
	my $isURL=($uri=~/^http:\/\/.+$/);
	my $n=$collapseHTML?"":"\n";
	my $before="";
	my $after="";
	my $include="";
	if($uri=~/\.css$/){
		$include=($inlineCSS and !$isURL)?slurp(getFile($uri)):getFile($uri);
		$before=$inlineCSS?"<style>$n":"<link rel=\"stylesheet\" type=\"text/css\" href=\"";
		$after=$inlineCSS?"$n</style>":"\" />";
		$include=minifyCSS($include) if $minifyCSS; #Somehow minify magically knows if it's CSS or JS???
	}
	elsif($uri=~/\.js$/){
		$include=($inlineJS and !$isURL)?slurp(getFile($uri)):getFile($uri);
		$before=$inlineJS?"<script>$n":"<script src=\"";
		$after=$inlineJS?"$n</script>":"\"></script>";
		$include=minifyJS($include) if $minifyJS; #Somehow minify magically knows if it's CSS or JS???
	}
	return "$n$before$include$after$n";
}
1;
