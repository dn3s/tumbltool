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
	(my $var, my $content)=@_;
	print("name:".$var->{"name"}.",\t\tvalue:".$content->{$var->{"name"}}."\n");
	my $text=(
		TumblTool::TumblrDate::printVar($var, $content, $contentRoot) //
		TumblTool::TumblrPortrait::printVar($var, $content, $contentRoot) //
		$content->{$var->{"name"}}
	);
	return tumblrPrefix($var->{"name"}, $text || "");
}
1;
