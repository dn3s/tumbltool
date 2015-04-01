use strict;
#use warnings;
package TumblTool::TumblrTags;
use TumblTool::TextTransforms;
use Data::Dumper;
sub wrangleVars
{
	(my $content)=@_;
	my $tags=$content->{"Tags"};
	if($tags and !(ref(@{$tags}[0]) eq "HASH")) {
		my $structuredTags=[];
		my $tagsAsClasses="";
		foreach my $tag (@{$tags}) {
			#TODO: properly sanitize tags for URLs and class names
			my $hash={"Tag"=>$tag, "TagURL"=>"http://example.com/$tag"};
			push($structuredTags,$hash);
		}
		$content->{"Tags"}=$structuredTags;
		$content->{"TagsAsClasses"}=join(" ", $tags);
	}
	return $content;
}
1;
