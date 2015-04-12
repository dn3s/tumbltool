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

sub parseContent
{
	my $content=decode_json(slurp(getContentFile($content)));
	if($content->{"GroupMembers"} and $vars->{"group"}) {
		my $group=$content->{"GroupMembers"};
		$content->{"GroupMembers"}=1;
		$content->{"GroupMember"}=$group;
	}
	else
	{
		$content->{"GroupMembers"}=0;
	}
	$content->{"Following"}=1 if($content->{"Followed"});
	$content->{"Twitter"}=1 if($content->{"TwitterUsername"});
	my $odd=1;
	for my $post (@{$content->{"Posts"}}) {
		$post->{"Odd"}=$odd;
		$post->{"Even"}=!$odd;
		$odd=!$odd;
		$post->{"Submission"}=1 if($post->{"Submitter"});
	}
	TumblTool::TumblrChat::processContent($content);
	TumblTool::TumblrLink::processContent($content);
	TumblTool::TumblrReblog::processContent($content);
	return $content;
}
1;
