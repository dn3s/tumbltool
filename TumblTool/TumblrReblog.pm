use strict;
#use warnings;
package TumblTool::TumblrReblog;

sub processContent
{
	(my $content)=@_;
	for my $post (@{$content->{"blog"}->{"Posts"}}) {
		if($post->{"ReblogParentName"}) {
			$post->{"RebloggedFrom"}=1;
		}
		else {
			$post->{"NotReblog"}=1;
		}
	}
}
sub printVar
{
	(my $var, my $content)=@_;
	return if(!(ref($var) eq "HASH"));
	my $name=$var->{"name"};

	return;
}
1;
