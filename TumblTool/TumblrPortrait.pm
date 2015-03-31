use strict;
#use warnings;
package TumblTool::TumblrPortrait;
use TumblTool::ImageURL;
sub printVar
{
	(my $var, my $content, my $root)=@_;
	my $name=$var->{"name"};
	if($name=~/^(ReblogParent|ReblogRoot|Asker|Answerer|Submitter|GroupMember|PostAuthor|Followed)?PortraitURL-(16|24|30|40|48|64|96|128)$/) {
		my $prefix=$1 || "";
		my $res=$2;
		return imageURL($content->{"${prefix}Portrait"}, $res);
	}
	return;
}
1;
