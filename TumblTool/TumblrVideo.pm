use strict;
#use warnings;
package TumblTool::TumblrVideo;
use TumblTool::DataURI;
use File::Spec;
use File::Basename;
my $dir=dirname(__FILE__);
my $inlineIframe=0;
sub configure
{
	my $options=shift();
	$inlineIframe = $options->{"inlineIframe" } // $inlineIframe;
}
sub dumpConfig
{
	return "TumblTool::TumblrVideo Config:\ninlineIframe='$inlineIframe'\n\n";
}
sub printVar
{
	(my $var, my $content, my $root)=@_;
	if($var->{"name"}=~/^Video(?:Embed)?-(700|500|400|250)$/) {
		my $width=$1;
		my $height=$1*9/16;
		my $src=File::Spec->rel2abs(File::Spec->catfile($dir, "VideoPlayer.html"));
		$src=dataURIFromFile($src) if($inlineIframe);
		return "<iframe src=\"$src\" width=\"$width\" height=\"$height\" frameborder=\"no\" scrolling=\"no\"></iframe>";
	}
	return;
}
1;
