use strict;
#use warnings;
package TumblTool::TumblrFollow;
use TumblTool::TextTransforms;
use Data::Dumper;
sub wrangleVars
{
	(my $content)=@_;
	my $followed=$content->{"Following"};
	my $hash={"followed"=>$followed};
	$content->{"following"}=$hash;
	return $content;
}
1;
