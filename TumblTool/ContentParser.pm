use strict;
#use warnings;
package TumblTool::ContentParser;
use JSON;
use TumblTool::Slurp;
use TumblTool::PathUtils;
use base 'Exporter';
our @EXPORT=('parseContent');

sub parseContent
{
	(my $contentName)=@_;
	my $content=decode_json(slurp(getContentFile($contentName)));
	if($content->{"GroupMembers"}) {
		my $group=$content->{"GroupMembers"};
		$content->{"GroupMembers"}=1;
		$content->{"GroupMember"}=$group;
	}
	$content->{"Following"}=1 if($content->{"Followed"});
	$content->{"Twitter"}=1 if($content->{"TwitterUsername"});
	return $content;
}
1;
