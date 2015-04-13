use strict;
#use warnings;
package TumblTool::TumblrGroup;

my $group=1;
sub config
{
	(my $options)=@_;
	$group = $options->{"group"} // $group;
}
sub processContent
{
	(my $blog)=@_;
	if($blog->{"GroupMembers"} and $group) {
		my $group=$blog->{"GroupMembers"};
		$blog->{"GroupMembers"}=1;
		$blog->{"GroupMember"}=$group;
	}
	else
	{
		$blog->{"GroupMembers"}=0;
	}
}
1;
