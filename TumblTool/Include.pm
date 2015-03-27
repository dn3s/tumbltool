use strict;
use warnings;
package TumblTool::Include;
use HTML::Strip;
use HTML::Entities;
use URI::Escape;
use CSS::Minifier;
use JavaScript::Minifier;
use TumblTool::TumblrDate;
use TumblTool::PathUtils;
use TumblTool::Slurp;
use base 'Exporter';
our @EXPORT=('processIncludes');
sub processIncludes
{
	(my $includes, my $inline, my $strip)=@_;
	my $result="";
	foreach my $name (@{$includes}) {
		$result.=include($name, ($inline and !($name=~/^http:\/\/.+$/)), $strip);
	}
	return $result;
}
sub include
{
	(my $uri, my $inline, my $strip)=@_;
	my $n=$strip?"":"\n";
	my $before="";
	my $after="";
	my $include=$inline?slurp(getFile($uri),$strip):getFile($uri);
	$include=minify(input=>$include) if $strip; #Somehow minify magically knows if it's CSS or JS???
	if($uri=~/\.css$/){
		$before=$inline?"<style>$n":"<link rel=\"stylesheet\" type=\"text/css\" href=\"";
		$after=$inline?"$n</style>":"\" />";
	}
	elsif($uri=~/\.js$/){
		$before=$inline?"<script>$n":"<script src=\"";
		$after=$inline?"$n</script>":"\"></script>";
	}
	return "$n$before$include$after$n";
}
