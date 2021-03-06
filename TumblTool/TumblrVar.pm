use strict;
#use warnings;
package TumblTool::TumblrVar;
use TumblTool::TumblrPrefix;
use TumblTool::TumblrDate;
use TumblTool::TumblrUser;
use TumblTool::TumblrButton;
use TumblTool::TumblrNumber;
use TumblTool::TumblrPhoto;
use TumblTool::TumblrPlayer;
use TumblTool::TumblrLang;
use TumblTool::TumblrLink;
use TumblTool::TumblrReblog;
use TumblTool::TumblrTags;
use TumblTool::TumblrAnswer;
use TumblTool::TumblrSettings;
use TumblTool::TumblrSource;
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
	#WARNING! $content can be either a HASH or a SCALAR; it is the module's responsibility to check for that.
	my $text=(
		TumblTool::TumblrSettings::printVar($var, $content) //
		TumblTool::TumblrAnswer::printVar($var, $content) //
		TumblTool::TumblrDate::printVar($var, $content) //
		TumblTool::TumblrUser::printVar($var, $content) //
		TumblTool::TumblrButton::printVar($var, $content) //
		TumblTool::TumblrNumber::printVar($var, $content) //
		TumblTool::TumblrTags::printVar($var, $content) //
		TumblTool::TumblrPhoto::printVar($var, $content) //
		TumblTool::TumblrPlayer::printVar($var, $content) //
		TumblTool::TumblrLang::printVar($var, $content) //
		TumblTool::TumblrLink::printVar($var, $content) //
		TumblTool::TumblrReblog::printVar($var, $content) //
		TumblTool::TumblrSource::printVar($var, $content) //
		((ref($content) eq "HASH")?($content->{$var->{"name"}}):($content))
	);
	return tumblrPrefix($var->{"name"}, $text || "");
}
1;
