use strict;
#use warnings;
package TumblTool::TumblrTags;
use TumblTool::TextTransforms;
use Data::Dumper;
sub wrangleVars #TODO: fit this into the standard interface
{
	(my $content)=@_;
	my $tags=$content->{"Tags"};
	if($tags and !(ref(@{$tags}[0]) eq "HASH")) {
		my $structuredTags=[];
		my $classSafeTags=[];
		foreach my $tag (@{$tags}) {
			my $urlSafeTag=encodeURIComponent($tag);
			my $hash={"Tag"=>$tag, "TagURL"=>"http://example.com/$urlSafeTag"};
			push(@{$structuredTags}, $hash);
			push(@{$classSafeTags}, HTMLAttributeSafe($tag));
		}
		$content->{"Tags"}=$structuredTags;
		$content->{"TagsAsClasses"}=join(" ", @{$classSafeTags});
		$content->{"HasTags"}=1;
	}
	return $content;
}
1;
