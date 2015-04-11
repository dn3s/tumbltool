use strict;
#use warnings;
package TumblTool::TumblrVar;
use TumblTool::TumblrPrefix;
use TumblTool::TumblrDate;
use TumblTool::TumblrPortrait;
use TumblTool::TumblrButton;
use TumblTool::TumblrNumber;
use TumblTool::TumblrPhoto;
use TumblTool::TumblrPlayer;
use TumblTool::TumblrLang;
use TumblTool::TumblrLink;
use base 'Exporter';
our @EXPORT=('printVar');
my $contentRoot='';
sub configure
{
	my $options=shift();
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
}
sub dumpConfig
{
	return "TumblTool::TumblrVar Config:\ncontentRoot='$contentRoot'\n\n";
}
sub printVar
{
	(my $var, my $content)=@_;
	my $text=(
		TumblTool::TumblrDate::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrPortrait::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrButton::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrNumber::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrPhoto::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrPlayer::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrLang::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrLink::printVar($var, $content, $contentRoot) //
		$content->{$var->{"name"}}
	);
	return tumblrPrefix($var->{"name"}, $text || "");
}
1;
