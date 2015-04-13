use strict;
#use warnings;
package TumblTool::TumblrUser;
use TumblTool::ImageURL;
use TumblTool::ContentParser;
sub printVar
{
	(my $var, my $content)=@_;
	my $name=$var->{"name"};
	if($name=~/^
		(
			ReblogParent|ReblogRoot|Asker|Answerer|Submitter|GroupMember|PostAuthor|Followed
		)?
		(
			Name|
			URL|
			PortraitURL-(16|24|30|40|48|64|96|128)
		)?$
	/x) {
		my $prefix=$1 || "";
		my $attribute=$2 || "";
		my $res=$3;
		my $user=TumblTool::ContentParser::getUser($content->{$prefix});
		return imageURL($user->{"Portrait"}, $res) if($attribute eq "PortraitURL");
		return $user->{"URL"} if($attribute eq "URL");
		return $content->{$prefix};
	}
	return;
}
1;
