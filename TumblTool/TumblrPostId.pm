use strict;
package TumblTool::TumblrPostId;

sub processContent
{
	(my $content)=@_;
	my $posts=$content->{"blog"}->{"Posts"};
	my $id=1;
	foreach my $post (@{$posts}) {
		$post->{"PostID"}=$id;
		$post->{"Post$id"}=1;
		$post->{"Odd"}=$id%2;
		$post->{"Even"}=(++$id)%2;
	}
}
1;
