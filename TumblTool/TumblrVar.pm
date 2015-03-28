use strict;
#use warnings;
package TumblTool::TumblrVar;
use TumblTool::TumblrPrefix;
use TumblTool::TumblrDate;
use TumblTool::TumblrPortrait;
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
	(my $content, my $varName)=@_;
	my $text=(
		tumblrDate($varName, $content, $contentRoot) //
		tumblrPortrait($varName, $content, $contentRoot) //
		$content->{$varName}
	);
	return tumblrPrefix($varName, $text || "");
}
1;
