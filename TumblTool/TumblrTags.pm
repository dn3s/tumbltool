use strict;
#use warnings;
package TumblTool::TumblrTags;
use TumblTool::TextTransforms;
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
