use strict;
#use warnings;
package TumblTool::TumblrTags;
use TumblTool::TextTransforms;
sub wrangleVars #TODO: make this "lazier"-- convert this into a printVar method so only wnat's needed is computed
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
sub printVar
{
	(my $var, my $content)=@_;
	my $name=$var->{"name"};
	return if();
	return $content if($name eq "Tag");
	return tagURL($content) if($name eq "TagURL");
	return tagsAsClasses($content->{"Tags"}) if($name eq "TagsAsClasses");
	return;
}
sub tagURL
{
	(my $tag)=@_;
	return "http://example.com/".encodeURIComponent($tag);
}
sub tagsAsClasses
{
	(my $tags)=@_;
	my $out="";
	foreach my $tag(@{$tags}) {
		$out.=" " if($out); #add space if this isn't the first one
		$out.=HTMLAttributeSafe($tag);
	}
	return $out;
}
1;
