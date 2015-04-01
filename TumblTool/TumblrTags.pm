use strict;
#use warnings;
package TumblTool::TumblrTags;
use TumblTool::TextTransforms;
use Data::Dumper;
sub printVar
{
	(my $var, my $content)=@_;
	if(0 and $var->{""} eq "TagsAsClasses") {
		return join(" ", $content->{"Tags"}); #todo: make this safe
	}
	return;
}
sub wrangleVars
{
	(my $content)=@_;
	my $tags=$content->{"Tags"};
	if($tags and !(ref(@{$tags}[0]) eq "HASH")) {
		my $structuredTags=[];
		my $tagsAsClasses="";
		foreach my $tag (@{$tags}) {
			my $hash={"Tag"=>$tag, "TagURL"=>"http://example.com/$tag"};
			push($structuredTags,$hash);
			$tagsAsClasses.=" $tag";
		}
		$content->{"Tags"}=$structuredTags;
		$content->{"TagsAsClasses"}=$tagsAsClasses;
	}
	return $content;
}
1;
