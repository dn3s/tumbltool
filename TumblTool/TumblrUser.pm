use strict;
#use warnings;
package TumblTool::TumblrUser;
use Data::Dumper;
use TumblTool::ImageURL;
use TumblTool::ContentParser;
sub printVar
{
	(my $var, my $content)=@_;
	my $name=$var->{"name"};
	print("$name\n");
	if($name=~/^
		(
			ReblogParent|ReblogRoot|Asker|Answerer|Submitter|GroupMember|PostAuthor|Followed
		)
		(
			Name|
			Title|
			URL|
			PortraitURL
		)?
		(?:-(16|24|30|40|48|64|96|128))?
		$
	/x) {
		my $prefix=$1 || "";
		my $attribute=$2 || "";
		my $res=$3;
		print("$prefix\n");
		if($prefix eq "GroupMember") {
			print(Dumper($content));
		}
		my $user={};
		if(ref($content) eq "HASH") {
			$user=TumblTool::ContentParser::getUser($content->{$prefix});
		}
		else {
			$user=TumblTool::ContentParser::getUser($content);
		}
		return imageURL($user->{"Portrait"}, $res) if($attribute eq "PortraitURL");
		return $user->{"URL"} if($attribute eq "URL");
		return $user->{"Title"} if($attribute eq "Title");
		return $content->{$prefix} if(ref($content) eq "HASH");
		return $content;
	}
	return;
}
1;
