use strict;
#use warnings;
package TumblTool::TumblrVar;
use TumblTool::TumblrPrefix;
use TumblTool::TumblrDate;
use TumblTool::TumblrPortrait;
use TumblTool::TumblrButton;
use TumblTool::TumblrNumber;
use base 'Exporter';
our @EXPORT=('printVar');
my $contentRoot='';
sub configure
{
	my $options=shift();
	$contentRoot = $options->{"contentRoot"} // $contentRoot;
}
sub printVar
{
	(my $var, my $content)=@_;
	my $text=(
		TumblTool::TumblrDate::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrPortrait::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrButton::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrNumber::printVar($var, $content, $contentRoot) //
		$content->{$var->{"name"}}
	);
	return tumblrPrefix($var->{"name"}, $text || "");
}
1;
