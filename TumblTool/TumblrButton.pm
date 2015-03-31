use strict;
#use warnings;
package TumblTool::TumblrButton;
use TumblTool::DataURI;
sub printVar
{
	(my $varName, my $content, my $root)=@_;
	my $dir=dirname(__FILE__);
	if($varName=~/^(Like|Reblog)Button$/) {
		my $type=$1;
		return likeButton() if($type eq "Like");
		return reblogButton() if($type eq "Reblog");
	}
	return;
}
sub likeButton
{
	
}
sub likeButtonIframe
{
	
}
sub reblogButton
{
	
}
1;
