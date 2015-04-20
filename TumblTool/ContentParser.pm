use strict;
#use warnings;
package TumblTool::ContentParser;
use Data::Dumper;
use JSON;
use TumblTool::Slurp;
use TumblTool::PathUtils;
use TumblTool::TumblrChat;
use TumblTool::TumblrLink;
use TumblTool::TumblrReblog;
use TumblTool::TumblrGroup;
use TumblTool::TextTransforms;
use TumblTool::TumblrSource;
use TumblTool::TumblrPostId;
use base 'Exporter';
our @EXPORT=('parseContent');

my $content="";
my $vars={};
my $users={};
my $blog={};
my $owner="";

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
	(my $user)=@_;
	return $users->{$user};
}
sub getOwner
{
	return $owner;
}
sub parseContent
{
	my $content=decode_json(slurp(getContentFile($content)));
	$users=$content->{"users"};
	$blog=$content->{"blog"};
	$owner=$content->{"blog"}->{"Owner"};
	$blog->{"Following"}=1 if($blog->{"Followed"});
	$blog->{"Twitter"}=1 if($blog->{"TwitterUsername"});
	for my $post (@{$blog->{"Posts"}}) {
		$post->{"Submission"}=1 if($post->{"Submitter"});

		#TumblTool::TumblrTags::wrangleVars($post);
		if($post->{"PostType"}) {
			if(!$post->{ucfirst($post->{"PostType"})}) { #only if the post's variable named after the post type isn't truthy. for example: Answer
				$post->{ucfirst($post->{"PostType"})}=1;
			}
			$post->{"PostType"}=~s/^(?:panorama|photoset)$/photo/g;
		}
		if($post->{"Caption"} and !($post->{"PhotoAlt"})) {
			my $alt=stripHTML($post->{"Caption"});
			$post->{"PhotoAlt"}=$alt;
		}
		$post->{"HasTags"}=1 if($post->{"Tags"});
	}
	TumblTool::TumblrGroup::processContent($content);
	TumblTool::TumblrChat::processContent($content);
	TumblTool::TumblrLink::processContent($content);
	TumblTool::TumblrReblog::processContent($content);
	TumblTool::TumblrSource::processContent($content);
	TumblTool::TumblrPostId::processContent($content);
	return $content->{"blog"};
}
1;
