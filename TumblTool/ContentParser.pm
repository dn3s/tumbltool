use strict;
#use warnings;
package TumblTool::ContentParser;
use JSON;
use TumblTool::Slurp;
use TumblTool::PathUtils;
use TumblTool::TumblrChat;
use TumblTool::TumblrLink;
use TumblTool::TumblrReblog;
use base 'Exporter';
our @EXPORT=('parseContent');

my $content="";
my $vars={};
my $users={};
my $blog={};

sub configure
{
	my $options=shift();
	$content = $options->{"content"} // $content;
	$vars    = $options->{"vars"   } // $vars;
}
sub dumpConfig
{
	return "TumblTool::ContentParser Config:\ncontent='$content'\nvars='$vars'\n\n";
}

sub getUser
{
	return $users->{shift()};
}
sub parseContent
{
	my $content=decode_json(slurp(getContentFile($content)));
	$users=$content->{"users"};
	$blog=$content->{"blog"};
	if($blog->{"GroupMembers"} and $vars->{"group"}) {
		my $group=$blog->{"GroupMembers"};
		$blog->{"GroupMembers"}=1;
		$blog->{"GroupMember"}=$group;
	}
	else
	{
		$blog->{"GroupMembers"}=0;
	}
	$blog->{"Following"}=1 if($blog->{"Followed"});
	$blog->{"Twitter"}=1 if($blog->{"TwitterUsername"});
	my $odd=1;
	for my $post (@{$blog->{"Posts"}}) {
		$post->{"Odd"}=$odd;
		$post->{"Even"}=!$odd;
		$odd=!$odd;
		$post->{"Submission"}=1 if($post->{"Submitter"});
	}
	TumblTool::TumblrChat::processContent($blog, $users);
	TumblTool::TumblrLink::processContent($blog, $users);
	TumblTool::TumblrReblog::processContent($blog, $users);
	return $content->{"blog"};
}
1;
