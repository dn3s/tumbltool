use strict;
#use warnings;
package TumblTool::TumblrPlayer;
use TumblTool::DataURI;
use File::Spec;
use File::Basename;
my $dir=dirname(__FILE__);
my $inlineIframe=0;
sub configure
{
	my $options=shift();
	$inlineIframe = $options->{"inlineIframe"} // $inlineIframe;
}
sub dumpConfig
{
	return "TumblTool::TumblrVideo Config:\ninlineIframe='$inlineIframe'\n\n";
}
sub printVar
{
	(my $var, my $content, my $root)=@_;
	$var->{"name"}="AudioEmbed-500" if($var->{"name"} eq "AudioEmbed");
	if($var->{"name"}=~/^(Video|Audio)(?:Embed)?-(\d+)?$/) {
		my $type=lc($1);
		my $width=$2;
		my $height=$type eq "video"?$width*9/16:20;
		my $src=File::Spec->rel2abs(File::Spec->catfile($dir, "Player.html"));
		$src=dataURIFromFile($src) if($inlineIframe);
		return "<iframe src=\"$src#$type\" width=\"$width\" height=\"$height\" frameborder=\"no\" scrolling=\"no\"></iframe>";
	}
	return;
}
1;
