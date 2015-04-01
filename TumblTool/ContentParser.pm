use strict;
#use warnings;
package TumblTool::ContentParser;
use JSON;
use TumblTool::Slurp;
use TumblTool::PathUtils;
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
	return $content;
}
1;
