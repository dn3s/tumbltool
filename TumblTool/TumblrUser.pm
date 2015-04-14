use strict;
#use warnings;
package TumblTool::TumblrUser;
use Data::Dumper;
use TumblTool::ImageURL;
use TumblTool::ContentParser;
sub getUser #just because it makes a ton more sense for others to call it from here than from contentParser
{
	return TumblTool::ContentParser::getUser(shift());
}
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
			Title|
			URL|
			PortraitURL
		)?
		(?:-(16|24|30|40|48|64|96|128))?
		$
	/x and length($name)>0) { #all the groups are optional, but if none of them are there then string length will be zero
		my $prefix=$1 || "";
		my $attribute=$2 || "";
		my $username=(ref($content) eq "HASH"?$content->{$prefix}:$content) || TumblTool::ContentParser::getOwner();
		my $user=getUser($username);
		return imageURL($user->{"Portrait"}, $3) if($attribute eq "PortraitURL");
		return $user->{"URL"} if($attribute eq "URL");
		return $user->{"Title"} if($attribute eq "Title" and $prefix);
		return $username if($prefix);
	}
	return;
}
1;
