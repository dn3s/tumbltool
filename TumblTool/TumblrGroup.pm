use strict;
#use warnings;
package TumblTool::TumblrGroup;

sub processContent
{
	(my $blog)=@_;
	if($blog->{"GroupMembers"} and $vars->{"group"}) {
		my $group=$blog->{"GroupMembers"};
		$blog->{"GroupMembers"}=1;
		$blog->{"GroupMember"}=$group;
	}
	else
	{
		$blog->{"GroupMembers"}=0;
	}
}
sub printVar
{
	(my $var, my $content)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};
	#TODO: implement
	return;
}
1;
