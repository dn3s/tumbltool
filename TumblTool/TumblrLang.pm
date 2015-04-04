use strict;
#use warnings;
package TumblTool::TumblrLang;
sub printVar
{
	(my $var)=@_;
	my $name=$var->{"name"};
	if($name=~/^lang:([A-z0-9 -]+)$/) {
		return $1;
	}
	return;
}
1;
